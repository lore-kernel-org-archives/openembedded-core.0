Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnAjS-0000TZ-JJ for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:13:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HF6Hk4006030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:06:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04011-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:06:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HF69QT006024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:06:10 GMT
Message-ID: <1326812774.2933.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 15:06:14 +0000
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/62] Major set of Changes
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
X-List-Received-Date: Tue, 17 Jan 2012 15:13:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On Tue, 2012-01-17 at 00:31 -0800, Saul Wold wrote:

> The following changes since commit 91e17c0c0ac2330f826b95e762542cd0d0c82385:
> 
>   pango: Use gnomebase class, not gnome (2012-01-16 18:01:31 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrei Gherzan (1):
>   wpa-supplicant: Compile without CONFIG_GNUTLS_EXTRA (PR BUMP)
> 
> Aneesh Bansal (1):
>   add mfatbu/mfatbl instructions support in Valgrind

I've commented on the mailing list about the commit message and patch
headers in this. I've taken it and fixed up the issues.

> Bruce Ashfield (1):
>   linux-yocto: consolidated fix SRCREV updates
> 
> Christopher Larson (5):
>   ncurses-native: install to libdir, not base_libdir
>   copyleft_compliance: add control of recipe types to include
>   copyleft_compliance: add debug message with the reason for exclusion
>   oe.license: add is_included convenience function
>   oe.license: avoid the need to catch SyntaxError
> 
> Colin Walters (1):
>   libtool: Put all libltdl headers in the correct libltdl-dev package
> 
> Darren Hart (1):
>   bootimg: Account for FAT filesystem overhead in image size
> 
> Denis 'GNUtoo' Carikli (1):
>   alsa-utils: depend on libsamplerate0
> 
> Enrico Scholz (2):
>   package.bbclass: quote pathname given to objdump
>   bitbake.conf: search /lib for -native builds
> 
> James Limbouris (1):
>   ghostscript: build cups filters
> 
> Joshua Lock (4):
>   task-base: move default definition of VIRTUAL-RUNTIME_apm
>   alsa-state: add alsa-state from oe classic
>   alsa-state: move state files to localstatedir
>   task-base: add VIRTUAL-RUNTIME_alsa-state to task-base-alsa
> 
> Liming Wang (4):
>   qemuppc: replace emulation of qemuppc from prep to mac99
>   qemuppc: add pointercal file
>   qemuppc: add machconfig
>   tslib: enable big endian support for qemuppc
> 
> Mark Hatle (1):
>   prelink: Update to latest version
> 
> Martin Jansa (2):
>   xorg-*: disable xmlto where it was failing
>   dbus-1.4.16: use INC_PR from dbus.inc to fix PR bump after
>     dbus-launch-helper permission change
> 
> Matthew McClintock (2):
>   image_types.bbclass: Fix generating uncompressed ext2 images
>   image_types_uboot.bbclass: Add uncompressed ext2 image option
> 
> Nitin A Kamble (7):
>   locale: fix package's "provides" tag
>   diffstat: upgrade from 1.54 to 1.55
>   insane.bbclass: fix elf.arch not matching error for x32 kernel
>   libpcre: upgrade from 8.20 to 8.21
>   btrfs-tools: upgrade to newer git commit
>   distro_tracking: update manual_check_date fields
>   grub-efi-native: fix errors with automake 1.11.2
> 
> Paul Eggleton (4):
>   classes/base: note variable name in COMPATIBLE_* skip messages
>   conf/bitbake.conf: allow wget to output error messages
>   classes/package: remove out-of-date notice referring to the OE
>     bugtracker
>   classes/packagehistory: remove now obsolete class
> 
> Saul Wold (7):
>   m4: refactor .bb and .inc files
>   valgrind: Update for eglibc 2.15
>  openssl-0.9.8: Update to 0.9.8s
>   openssl-1.0.0: Update to 1.0.0e and fix QA Warning

I took all the above. 

>  tcmode-eglibc: Fix PREFERRED_VERSION of eglibc
>   python: PR bump for eglibc update
>   tcl: PR bump for eglibc update

I didn't take these since I'd like to make a more concious decision
about our eglibc version. (I left the valgrind 2.15 patch since its
acceptable now).

> Scott Garman (3):
>   libpam: upgrade to 1.1.5
>   e2fsprogs: upgrade to 1.42
>   distro_tracking: recipe upgrades and manual check info
> 
> Shane Wang (2):
>   stat: add recipe stat with version 3.3
>   hdparm: upgrade to 9.37

I took the above.

> Tom Zanussi (5):
>   base.bbclass: add support for LICENSE_FLAGS
>   Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
>   base.bbclass: remove COMMERCIAL_LICENSE code
>   default-distrovars.inc: remove COMMERCIAL_LICENSE et al
>   documentation-audit.sh: remove COMMERCIAL_LICENSE warning

I've held on these as I want to give it a little more thought. I do
approve of sorting this out, I'm just wondering if we there are any
tweaks we can give the mechanism.

> Xiaofeng Yan (1):
>   distro_tracking_fields.inc: Modify the status of eds-tools and
>     mingetty
> 
> Zhai Edwin (2):
>   distro-tracking: Update info for webkit-gtk, web-webkit
>   runqemu: Fix the wrong path of libGL.so in 64b Ubuntu 11.10
> 
> Zumeng Chen (4):
>   lttng-ust: Update to 2.0
>   lttng-tools: Update to 2.0-pre16
>   lttng-modules: Update to 2.0
>   babeltrace: Integrated from version 0.8

I took the above.

Cheers,

Richard



