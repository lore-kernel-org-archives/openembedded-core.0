Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvVWO-0006UE-4K
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:07:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 07:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="191826605"
Received: from unknown (HELO helios.localnet) ([10.252.123.117])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2013 07:52:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 15:51:59 +0000
Message-ID: <3318326.b3DB6CrXXm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CABcZANn7NKY2zQa2trx4DfGQuJCN9KokxK+Vnh80o=5ve2gkqg@mail.gmail.com>
References: <cover.1358350661.git.paul.eggleton@linux.intel.com>
	<d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
	<CABcZANn7NKY2zQa2trx4DfGQuJCN9KokxK+Vnh80o=5ve2gkqg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 16 Jan 2013 16:07:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 January 2013 08:48:05 Chris Larson wrote:
> On Wed, Jan 16, 2013 at 8:38 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > +
> > +       if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> > +               echo 'DROPBEAR_EXTRA_ARGS="-B"' >
> > ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
> > +       fi
> > 
> >  }
> 
> Slightly concerned with this, in the potential case where a layer provides
> its own /etc/default/dropbear, this will blow it away entirely.

I already considered this, but interacting nicely with that situation given 
that the provided /etc/default/dropbear would likely be setting its own value 
of DROPBEAR_EXTRA_ARGS isn't going to be straightforward from a shell 
script...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


