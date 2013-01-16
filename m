Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvWGd-0007cS-S0
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:55:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2013 08:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="272836765"
Received: from unknown (HELO helios.localnet) ([10.252.123.117])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2013 08:39:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:39:45 +0000
Message-ID: <2945435.zNsC9RGq7I@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <3318326.b3DB6CrXXm@helios>
References: <cover.1358350661.git.paul.eggleton@linux.intel.com>
	<CABcZANn7NKY2zQa2trx4DfGQuJCN9KokxK+Vnh80o=5ve2gkqg@mail.gmail.com>
	<3318326.b3DB6CrXXm@helios>
MIME-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH v2 2/2] classes/image: improve debug-tweaks ssh server configuration
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
X-List-Received-Date: Wed, 16 Jan 2013 16:55:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 January 2013 15:51:59 Paul Eggleton wrote:
> On Wednesday 16 January 2013 08:48:05 Chris Larson wrote:
> > On Wed, Jan 16, 2013 at 8:38 AM, Paul Eggleton <
> > 
> > paul.eggleton@linux.intel.com> wrote:
> > > +
> > > +       if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> > > +               echo 'DROPBEAR_EXTRA_ARGS="-B"' >
> > > ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
> > > +       fi
> > > 
> > >  }
> > 
> > Slightly concerned with this, in the potential case where a layer provides
> > its own /etc/default/dropbear, this will blow it away entirely.
> 
> I already considered this, but interacting nicely with that situation given
> that the provided /etc/default/dropbear would likely be setting its own
> value of DROPBEAR_EXTRA_ARGS isn't going to be straightforward from a shell
> script...

Scratch that, it's not too difficult. v3 on the way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


