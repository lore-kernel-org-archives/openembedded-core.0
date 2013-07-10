Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E2E5A6ADB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:42:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6A8nuPn020552; Wed, 10 Jul 2013 09:49:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WChM0_gb3FwH; Wed, 10 Jul 2013 09:49:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6A8npvD020544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 10 Jul 2013 09:49:52 +0100
Message-ID: <1373445702.12401.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 10 Jul 2013 09:41:42 +0100
In-Reply-To: <cover.1373384160.git.sgw@linux.intel.com>
References: <cover.1373384160.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/59] Ready for Pull
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
X-List-Received-Date: Wed, 10 Jul 2013 08:42:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-09 at 08:38 -0700, Saul Wold wrote:
> Paul, Ross:
> 
> This is the updated version with some additional patches dropped
> Please ACK for RP
> 
> 
> Richard:
> 
> There is an additional patch from Bruce pending on Poky for the kenrel.
> 
> I have included Robert's DESCRIPTION changes, along with the Image Test
> code.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit ccbce75335971abf5098a492755e92ca60cf67bd:
> 
>   lib/oeqa/runtime: add gcc test (2013-07-09 10:49:20 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrei Dinu (1):
>   e2fsprogs: upgrade to 1.42.8
> 
> Bernhard Guillon (1):
>   populate_sdk_base.bbclass: allow $OECORE_NATIVE_SYSROOT in
>     sdk_env_script
> 
> Bruce Ashfield (1):
>   linux-yocto/3.4: update to v3.4.52
> 
> Cristian Iorga (1):
>   glib-2.0: upgrade to 2.36.3
> 
> Felipe F. Tonello (1):
>   pulseaudio: Added consolekit dependency for
>     pulseaudio-module-console-kit package

We go around in circles on this one :(. At the very least, as far as I
know this is only a runtime dependency, not a build time one.

> Ionut Radu (8):
>   libassuan: Updated from 2.1.0 to 2.1.1
>   augeas: Update from 1.0.0 to 1.1.0
>   libxvmc: Update from 1.0.7 to 1.0.8
>   libxi: Update from 1.7.1 to 1.7.2
>   libgpg-error: Updated from 1.11 to 1.12
>   libxrender: Updated from 0.9.7 to 0.9.8
>   libxv: Updated from 1.0.8 to 1.0.9
>   ethtool: Updated from 3.9 to 3.10
> 
> Jackie Huang (3):
>   initscripts: overwrite default hostname.sh
>   initscripts: add dmesg file to /var/log
>   glib-2.0: add -march=i486 into CFLAGS automatically when needed.
> 
> Jonathan Liu (1):
>   qt4: add upstream QTBUG-31579 patch to fix polyline drawing regression
> 
> Kang Kai (2):
>   webkit: set COMPATIBLE_HOST for mips64
>   packagegroup-core-lsb: set COMPATIBLE_HOST to mips64
> 
> Khem Raj (1):
>   eglibc: Update 2.18 recipes to fix ppc/e500 failures
> 
> Laurentiu Palcu (6):
>   populate_sdk_base: fix bashism
>   sysvinit: allow users in shutdown group to perform halt/reboot
>   xuser-account: create separate recipe for xuser creation
>   connman: remove xuser creation, RDEPEND on xuser-account
>   xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
>   shutdown-desktop: give entire path in Exec field
> 
> Martin Jansa (8):
>   (lib)telepathy*: add missing dependency on libxslt-native
>   gst-plugins-bad: inherit gsettings
>   gst-plugins-base: add missing dependency on glib-2.0-native
>   taglib: add missing dependency on zlib
>   quota: inherit pkgconfig
>   libpam: inherit pkgconfig
>   systemtap: inherit pkgconfig
>   eglibc-locale: add missing dependency on
>     virtual/${TARGET_PREFIX}binutils
> 
> Mihaela Sendrea (1):
>   libxml2: Add ptest
> 
> Nathan Rossi (2):
>   scripts/runqemu: Add support for 'qemuzynq' machine
>   scripts/runqemu: Add support for 'qemumicroblaze' machine

I've taken these however I'd like to be clear that we need a way for
layers to extend this script ultimately rather than adding code for
every possible qemu machine.

> Paul Eggleton (1):
>   cmake: fix configure error if system Qt installation is broken
> 
> Radu Moisan (7):
>   elfutils: Upgrade to v0.155
>   rxvt-unicode: Upgrade to v9.18

I've taken this but that do_configure needs to read:

if [ ! -e ${S}/acinclude.m4 ]; then
    cp ${S}/aclocal.m4 ${S}/acinclude.m4
fi

since the copy should only happen if acinclude.m4 doesn't exist.

>   ed: Upgrade to v1.8
>   libdmx: Upgrade to v1.1.3
>   apr: Upgrade to v1.4.8
>   apr-util: Upgrade to v1.5.2
>   usbutils: Upgrade to v007
> 
> Randy Witt (1):
>   systemd: Don't enable systemd services when native.
> 
> Robert Yang (3):
>   package_rpm.bbclass: make DESCRIPTION support newline
>   package_ipk.bbclass: make DESCRIPTION support newline
>   package_deb.bbclass: make DESCRIPTION support newline
> 
> Ross Burton (2):
>   gtkdoc: set the default docdir to ${S}, not ${B}
>   pango: drop unexplainable elfutils dependency
> 
> Saul Wold (7):
>   packagegroup-core-basic: remove libpam
>   util-linux: Use PACKAGECONFIG to control pam and system config options
>   man-pages: Update to 3.52
>   cmake: Update to 2.8.11.2
>   tzcode-native: Update to 2013d
>   kconfig-frontends: Update to 3.10
>   security_flags: Add addition recipes to the non pie list
> 
> Ting Liu (1):
>   qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies

Cheers,

Richard


