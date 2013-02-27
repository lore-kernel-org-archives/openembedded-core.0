Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@linux.intel.com>) id 1UAnKC-0005zj-Ds
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 21:10:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Feb 2013 11:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,750,1355126400"; d="scan'208";a="262267455"
Received: from unknown (HELO [10.255.12.240]) ([10.255.12.240])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2013 11:53:37 -0800
Message-ID: <1361994816.2588.0.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 27 Feb 2013 13:53:36 -0600
In-Reply-To: <CAHUNapSHx-HAK86oQQWG9hYwa_zV11ccqs-i5GxUA+ztjvBNAA@mail.gmail.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<CAHUNapSHx-HAK86oQQWG9hYwa_zV11ccqs-i5GxUA+ztjvBNAA@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Wed, 27 Feb 2013 20:10:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 13:00 -0500, Trevor Woerner wrote:
> On Wed, Feb 27, 2013 at 10:00 AM,  <tom.zanussi@linux.intel.com> wrote:
> > From: Tom Zanussi <tom.zanussi@linux.intel.com>
> >
> > 'perf-trace' is a new perf subcommand available in the 3.8 kernel -
> > this patchset enables it.  'perf trace' requires libaudit, which
> > is added as a new recipe.
> 
> (I'm just getting used to this workflow, so sorry if I've messed
> something up on my end)
> 
> When I try to build with just the following added to my conf/local.conf
> 
>     IMAGE_INSTALL_append = " perf"
> 
> I get the following error:
> 
> Build Configuration:
> BB_VERSION        = "1.17.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "SUSE-LINUX-12.2"
> TARGET_SYS        = "i586-poky-linux"
> MACHINE           = "qemux86"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20130227"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    =
> "tzanussi/perf-trace-v1:9f91a3a29701218dd756380ebcd2a1a32ad40615"
> 
> Computing transaction...error: Can't install perf-3.4-r9@qemux86: no
> package provides /bin/bash
> ERROR: Function failed: do_rootfs
> 

Hmm, I didn't realize perf required 'bash' to build.  I always build
core-image-sato with tools-profile or the sdk image, and haven't seen
this.

Which image are you building?  I'm guessing core-image-minimal?

I think if perf doesn't build without bash, it should be considered a
bug - core-image-minimal should be able to use perf.

Tom 


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




