Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3NUD-00010n-UP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:37:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 01:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206202150"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 01:25:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 09:25:21 +0100
Message-ID: <8627395.gapg0V4nHB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345450697.24626.67.camel@x121e.pbcl.net>
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<1345450697.24626.67.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 08:37:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 09:18:17 Phil Blundell wrote:
> On Mon, 2012-08-20 at 10:46 +0300, Radu Moisan wrote:
> > @@ -97,6 +97,8 @@ do_prepare_config () {
> > 
> >  		< ${WORKDIR}/defconfig > ${S}/.config
> >  	
> >  	sed -i -e '/CONFIG_STATIC/d' .config
> >  	echo "# CONFIG_STATIC is not set" >> .config
> > 
> > +	sed -i -e '/CONFIG_LSOF/d' .config
> > +	echo "# CONFIG_LSOF is not set" >> .config
> > 
> >  	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
> >  	
> >  		${S}/.config
> >  	
> >  	sed -i -e '${configmangle}' ${S}/.config
> 
> Why is this desirable?

Well, the more appropriate question would be: could we not just update the 
defconfig and then make that change to it directly?

(In case it isn't clear - lsof is being disabled because it was not enabled in 
the previous 1.19.4 version.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


