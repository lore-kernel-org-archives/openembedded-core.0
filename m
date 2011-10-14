Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REgQt-0007F0-B6 for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:00:11 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EC16A9011333 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:01:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6FxpcHLpGFc5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:01:06 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EC102I011259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:01:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:54:17 +0100
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318593265.2342.0.camel@ted>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/28] Catching up & Upgrades
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
X-List-Received-Date: Fri, 14 Oct 2011 12:00:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 22:32 -0700, Saul Wold wrote:
> Richard,
> 
> This is a batch of pull requests that have been pending for a bit
> and seem to be clean, I have also included some updates that have 
> been built.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 4d5c0f9838a3e96d1cfb4ca2fb27161d6cf0de8f:
> 
>   xf86-video-intel_2.16.0: fix buildfix.patch to apply (2011-10-14 00:46:53 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (1):
>   linux-yocto: config cleanup and streamlining
> 
> Christopher Larson (2):
>   autoconf: no need to hardcode the full path to m4
>   autotools: fix multi-word arguments for EXTRA_OECONF
> 
> Khem Raj (4):
>   farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the
>     fields
>   qemu-0.15: Add recipe and forward port patches from 0.14
>   glib-2.0: Extend to provide nativesdk recipe
>   qemu.inc: Add glib-2.0-nativesdk to qemu-nativesdk DEPENDS
> 
> Klaus Kurzmann (1):
>   eglibc-2.14: add patch to fix libdl crash
> 
> Noor Ahsan (1):
>   bluez4: Add ending quote of FILES_${PN}-dbg
> 
> Otavio Salvador (2):
>   image-live.bbclass: allow override of initrd image
>   initramfs-live-boot: make it more generic and easy to use
> 
> Saul Wold (11):
>   shadow-native: Bump PR for patch update
>   distro_tracking_fields: Updates
>   v86d: update to 0.1.10
>   libaio: Update to 0.3.109
>   libtiff: Update to 3.9.5
>   augeas: Update to 0.9.0
>   libgcrypt: Update to 1.5.0
>   rxvt-unicode: Update to 9.12
>   rsync: Update to 3.0.9
>   bash: update to 4.2
>   qemu.inc: qemu-native also needs glib-2.0 native
> 
> Tom Rini (1):
>   libnl2: Fix a race on route/pktloc_syntax.h
> 
> Wenzong Fan (1):
>   qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
> 
> Xiaofeng Yan (2):
>   lsb: Change link of ${baselib} to lib64 for 64bits system
>   distro_tracking_fields.inc: Add maintainer for some packages without
>     maintainer
> 
> Zhai Edwin (2):
>   libfm: Upgrade to 0.1.16
>   pcmanfm: Upgrade to 0.9.9

Merged to master, thanks apart from the lsb change which I'll reply to.

Cheers,

Richard



