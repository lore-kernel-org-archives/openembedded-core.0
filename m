Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3rhu-0004c0-Pi
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 17:49:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2011 08:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48389388"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2011 08:43:51 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpo=03auDk6kmjiQguKh5UCPpU8be0capTbsgkgmG9u3g@mail.gmail.com>
References: <1315978772.26879.1860.camel@elmorro>
	<CAP9ODKpo=03auDk6kmjiQguKh5UCPpU8be0capTbsgkgmG9u3g@mail.gmail.com>
Date: Wed, 14 Sep 2011 10:43:42 -0500
Message-ID: <1316015022.26879.2465.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 2/2] initramfs-live-install: add a version for use with grub2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2011 15:49:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 05:29 -0700, Otavio Salvador wrote:
> On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > grub2 uses a completely different set of install steps.  These are
> > contained in a 2.0 version of init-install.sh, which is tied to grub2
> > (1.98) and a 2.0 version of the initramfs-live-install recipe.
> 
> Please avoid Poky, OE-Core and like while interacting with user since
> this will force people to fork the script. Try to avoid branding as
> possible.
> 

Yeah, I thought I had caught all those - will remove in the new
patchset.

Thanks,

Tom



