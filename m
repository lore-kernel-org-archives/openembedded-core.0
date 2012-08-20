Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3OUO-0002WQ-89
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:41:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 02:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="188646650"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2012 02:29:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 20 Aug 2012 10:29:35 +0100
Message-ID: <3497397.SJjDv0zund@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <50320338.8090203@intel.com>
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<1754598.kxQRJyreg5@helios> <50320338.8090203@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 20 Aug 2012 09:41:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 12:28:24 Radu Moisan wrote:
> On 08/20/2012 11:31 AM, Paul Eggleton wrote:
> > On Monday 20 August 2012 09:28:41 Phil Blundell wrote:
> >> On Mon, 2012-08-20 at 09:25 +0100, Paul Eggleton wrote:
> >>> On Monday 20 August 2012 09:18:17 Phil Blundell wrote:
> >>>> On Mon, 2012-08-20 at 10:46 +0300, Radu Moisan wrote:
> >>>>> @@ -97,6 +97,8 @@ do_prepare_config () {
> >>>>> 
> >>>>>   		< ${WORKDIR}/defconfig > ${S}/.config
> >>>>>   	
> >>>>>   	sed -i -e '/CONFIG_STATIC/d' .config
> >>>>>   	echo "# CONFIG_STATIC is not set" >> .config
> >>>>> 
> >>>>> +	sed -i -e '/CONFIG_LSOF/d' .config
> >>>>> +	echo "# CONFIG_LSOF is not set" >> .config
> >>>>> 
> >>>>>   	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
> >>>>>   	
> >>>>>   		${S}/.config
> >>>>>   	
> >>>>>   	sed -i -e '${configmangle}' ${S}/.config
> >>>> 
> >>>> Why is this desirable?
> >>> 
> >>> Well, the more appropriate question would be: could we not just update
> >>> the
> >>> defconfig and then make that change to it directly?
> >>> 
> >>> (In case it isn't clear - lsof is being disabled because it was not
> >>> enabled in the previous 1.19.4 version.)
> >> 
> >> Ah, I see.  In that case, yes, just updating the defconfig is the right
> >> thing to do.  The patch above will, if I am understanding it correctly,
> >> make it impossible (or at least quite hard) for any other layer to turn
> >> CONFIG_LSOF back on.
> > 
> > Good point, that would be undesirable.
> 
> Any suggestions on how to do that?

Build the new version of busybox once (actually, just running -c configure 
ought to be enough), copy the generated .config over the top of defconfig in the 
metadata, then edit it as desired.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


