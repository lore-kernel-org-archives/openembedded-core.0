Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5053D60886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 08:46:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2013 01:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,825,1367996400"; d="scan'208";a="358254193"
Received: from unknown (HELO helios.localnet) ([10.252.122.203])
	by orsmga001.jf.intel.com with ESMTP; 06 Aug 2013 01:46:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 06 Aug 2013 09:46:16 +0100
Message-ID: <4829913.jVRc2DKv5Q@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375772719.git.sgw@linux.intel.com>
References: <cover.1375772719.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, dvhart@linux.intel.com, zhenhua.luo@freescale.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/35] Review and ACK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Aug 2013 08:46:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 August 2013 00:13:40 Saul Wold wrote:
> Ross, Paul:
> 
> Here is a batch of AB tested and initially reviewed by me set of
> updates and other patches.  I did provide a setp patches for some
> overlooked issues in the last master
> 
> There is also a bashism fix for poky-tiny on the Poky list.
> 
> *** BSP Maintainers, this includes a Mesa Update, please be prepared to
> *** Update your mesa bbappend.
> 
> Sau!
> 
> The following changes since commit bc6258f88705b0e7989089a8666ac5e5d2355823:
> 
>   grep: Add patch for texinfo 5.1 (2013-08-02 08:21:17 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Chen Qi (5):
>   scripts/contrib/mkefidisk.sh: fix bashism
>   qtdemo-init: fix bashism
>   xtscal: fix bashism
>   initramfs-framework: fix bashism
>   buildtools-tarball: do not export OECORE_NATIVE_SYSROOT
> 
> Cristian Iorga (10):
>   telepathy-mission-control: upgrade to v5.15.0
>   telepathy-idle: upgrade to v0.1.16
>   gstreamer1.0: upgrade to v1.0.9
>   gstreamer1.0-plugins-base: upgrade to v1.0.9
>   gstreamer1.0-plugins-good: upgrade to v1.0.9
>   gstreamer1.0-libav: upgrade to v1.0.9
>   gstreamer1.0-plugins-bad: upgrade to v1.0.9
>   neon: upgrade to v0.30.0
>   gstreamer1.0-plugins-ugly: upgrade to v1.0.9
>   telepathy-glib: upgrade to v0.20.4
> 
> Cristiana Voicu (2):
>   liburcu: upgrade to 0.7.7
>   curl: upgrade to 7.31.0
> 
> Fathi Boudra (1):
>   libc-package.bbclass: Add armeb architecture to locale_arch_options
> 
> Hongxu Jia (1):
>   list-packageconfig-flags.py: add a script to list all PACKAGECONFIG
>     flags
> 
> Ionut Radu (1):
>   gdk-pixbuf: upgrade to 2.28.2
> 
> Javier Viguera (1):
>   kernel.bbclass: fix typo
> 
> Jonathan Liu (2):
>   mesa: update to 9.1.6
>   qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload
>     corruption
> 
> Otavio Salvador (1):
>   base.bbclass: Fix PACKAGECONFIG usage comment
> 
> Ross Burton (1):
>   buildhistory: add a note when committing to buildhistory
> 
> Saul Wold (8):
>   apt-native: fix SRC_URI Checksum for update
>   grub-efi-native: add flex patch to efi-native version also
>   packagegroup-core-boot: correct runtime dependencies for non-sysvinit
>     system
>   texinfo: Fix path to perl for scripts
>   libpng: package new tools into a libpng-tools package
>   mc: upgrade to 4.8.10
>   util-linux: upgrade to 2.23.2
>   man-pages: upgrade to 3.53
> 
> Stefan Stanacar (1):
>   oeqa/utils/qemurunner: fix wrong var in message
> 
> Yevhen Kyriukha (1):
>   btrfs-tools: upgrade to upstream revision.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

