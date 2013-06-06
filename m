Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D98D96A8BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 17:37:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2013 10:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,816,1363158000"; d="scan'208";a="325352173"
Received: from unknown (HELO envy.home) ([10.7.199.77])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2013 10:37:02 -0700
Message-ID: <51B0C8BD.2070605@linux.intel.com>
Date: Thu, 06 Jun 2013 10:37:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1370534726.git.sgw@linux.intel.com>
	<51B0BF5F.4040305@linux.intel.com>
In-Reply-To: <51B0BF5F.4040305@linux.intel.com>
X-Enigmail-Version: 1.5.1
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/37] Post M1 Updates and Fixes
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
X-List-Received-Date: Thu, 06 Jun 2013 17:37:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Nitin, are we fixed with 9.0.2 for emgd? Will we need to carry that
recipe in meta-intel now?

On 06/06/2013 09:57 AM, Saul Wold wrote:
> 
> Otavio, Darren, Nitin:
> 
> Your BSPs may need .bbappends for mesa, see below
> 
> Sau!
> 
> 
> On 06/06/2013 09:08 AM, Saul Wold wrote:
>> Richard,
>>
>> Here is a set of patches that I have tested and reviewed.
>>
>> Robert's changes for insane/package checks look good, but could your eyes
>> as a final check.
>>
>> Thanks
>> 	Sau!
>>
>>
>> Mostly Updates
>> The following changes since commit 8a2ac668d99f7d64c2acffc3a39cedb2d152be6e:
>>
>>    lrzsz: check locale.h in configure (2013-06-04 15:53:45 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>> Andrea Adami (1):
>>    image_types.bbclass: add ubifs to IMAGE_TYPES
>>
>> Andrei Dinu (2):
>>    linuxdoc-tools-native : upgrade to 0.9.69
>>    libpng : upgrade to 1.6.2
>>
>> Andy Voltz (2):
>>    tune-cortexa.inc: create a common include for cortex-a armv7a tuning
>>    tune-cortexa5.inc: Add tune file for cortex-a5
>>
>> Bogdan Marinescu (4):
>>    diffstat: upgraded to 1.57
>>    libpcre: upgraded to 8.33
>>    subversion: upgraded to 1.7.10
>>    bdwgc: enable full version name in recipe name
>>
>> Cristian Iorga (2):
>>    iptables: upgrade to 1.4.19.1
>>    libpcap: upgrade to 1.4.0
>>
>> Dan McGregor (1):
>>    python: enable IPv6 based on DISTRO_FEATURES
>>
>> Ionut Radu (1):
>>    matchbox-terminal: Update to git HEAD
>>      452bca253492a97a587f440289b9ab27d217353e
>>
>> Jack Mitchell (1):
>>    connman: update to 1.15
>>
>> Jackie Huang (1):
>>    grub-0.97: fix the objcopy error in configure
>>
>> Marko Lindqvist (3):
>>    icu: update to upstream version 51.2
>>    pixman: update to upstream version 0.30.0
>>    zlib: update to upstream version 1.2.8
>>
>> Robert Yang (4):
>>    insane/package: let package.bbclass inherit insane.bbclass
>>    defaultsetup.conf: remove INHERIT_INSANE
>>    insane/package: refactor packaging sanity tests
>>    multilib.bbclass: fix the PACKAGEFUNCS_append
>>
>> Ross Burton (12):
>>    weston-init: basic init script to start Weston on KMS/DRM
>>    core-image-weston: basic image that boots directly to Weston
>>    weston: install the examples into weston-examples
>>    weston: add a weston-launch group
>>    weston: clean up and add comments
>>    gdk-pixbuf: upgrade to 2.28.1
>>    test-utils: handle import bb failing and skip the test
>>    test_utils: import functions directly for conciseness
>>    mesa: upgrade to 9.1.3
>>    mesa: update git recipe to 9.1.3 release
>>    wayland: update to 1.1.0
>>    weston: update to 1.1.0
>>
> 
> HEADS up to BSP Maintainers, this may require .bbappend bumps in your BSPS.
> 
>> Saul Wold (2):
>>    self-hosted: Add libssp libraries to packagegroup/image
>>    libxi: Add libxfixes as dependency
>>
>> Yi Zhao (1):
>>    kernel.bbclass: Fix link for modules-${MACHINE}.tgz
>>
>>   meta/classes/image_types.bbclass                   |   2 +-
>>   meta/classes/insane.bbclass                        |  39 +-
>>   meta/classes/kernel.bbclass                        |   2 +-
>>   meta/classes/multilib.bbclass                      |   2 +-
>>   meta/classes/package.bbclass                       |  41 +-
>>   meta/conf/distro/defaultsetup.conf                 |   3 +-
>>   meta/conf/machine/include/arm/README               |   3 +
>>   meta/conf/machine/include/tune-cortexa.inc         |  35 ++
>>   meta/conf/machine/include/tune-cortexa15.inc       |  35 +-
>>   meta/conf/machine/include/tune-cortexa5.inc        |   5 +
>>   meta/conf/machine/include/tune-cortexa7.inc        |  35 +-
>>   meta/conf/machine/include/tune-cortexa8.inc        |  35 +-
>>   meta/conf/machine/include/tune-cortexa9.inc        |  35 +-
>>   meta/lib/oe/tests/test_utils.py                    |  14 +-
>>   .../grub/grub-0.97/objcopy-absolute.patch          |  40 ++
>>   meta/recipes-bsp/grub/grub_0.97.bb                 |   1 +
>>   .../connman/{connman_1.14.bb => connman_1.15.bb}   |   4 +-
>>   .../libpcap-1.3.0/0001-Fix-disable-canusb.patch    |  30 -
>>   ...-The-leading-comma-looked-weird-remove-it.patch |  54 --
>>   .../libpcap-1.3.0/0001-canusb-needs-lpthread.patch |  32 --
>>   .../{libpcap-1.3.0 => libpcap}/aclocal.patch       |   0
>>   .../ieee80215-arphrd.patch                         |   0
>>   .../libpcap/{libpcap_1.3.0.bb => libpcap_1.4.0.bb} |  13 +-
>>   .../packagegroups/packagegroup-self-hosted.bb      |   3 +
>>   .../remove.ldconfig.call.patch                     |   0
>>   .../zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb}          |  11 +-
>>   .../diffstat/diffstat/aclocal.patch                |  37 ++
>>   .../{diffstat_1.55.bb => diffstat_1.57.bb}         |   8 +-
>>   .../linuxdoc-tools-native/disable_sgml2rtf.patch   |  47 +-
>>   ...e_0.9.66.bb => linuxdoc-tools-native_0.9.69.bb} |  10 +-
>>   meta/recipes-devtools/python/python.inc            |   1 +
>>   .../fix-install-depends.patch                      |   0
>>   .../libtool2.patch                                 |   0
>>   .../{subversion_1.7.9.bb => subversion_1.7.10.bb}  |   4 +-
>>   .../fix-iptables-extensions-build-error.patch      |  44 --
>>   .../{iptables_1.4.18.bb => iptables_1.4.19.1.bb}   |   5 +-
>>   .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |  23 -
>>   .../configure_fix.patch                            |   0
>>   .../extending-libinstall-dependencies.patch        |   0
>>   .../hardcoded_libtool.patch                        |   0
>>   .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |  11 +-
>>   meta/recipes-graphics/images/core-image-weston.bb  |   9 +
>>   meta/recipes-graphics/mesa/mesa-9.0.2.inc          |  13 -
>>   meta/recipes-graphics/mesa/mesa-git.inc            |   9 +-
>>   .../mesa/mesa/0002-cross-compile.patch             |  94 ---
>>   ...ate-NativeDisplayType-depending-on-config.patch | 358 ++++++++++++
>>   meta/recipes-graphics/mesa/mesa/cross-glsl.patch   | 632 ---------------------
>>   .../mesa/dont-fail-if-libX11-isnt-installed.patch  |  36 --
>>   .../fix-egl-compilation-without-x11-headers.patch  |  32 --
>>   .../mesa/mesa/fix-glsl-cross.patch                 |  43 ++
>>   meta/recipes-graphics/mesa/mesa_9.0.2.bb           |   4 -
>>   meta/recipes-graphics/mesa/mesa_9.1.3.bb           |  14 +
>>   .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} |   6 +-
>>   meta/recipes-graphics/wayland/weston-init.bb       |  17 +
>>   meta/recipes-graphics/wayland/weston-init/init     |  56 ++
>>   .../wayland/weston/install-examples.patch          |  18 +
>>   .../wayland/{weston_1.0.6.bb => weston_1.1.0.bb}   |  38 +-
>>   meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb      |   2 +-
>>   .../{pixman_0.29.4.bb => pixman_0.30.0.bb}         |   4 +-
>>   .../libpng/libpng/transform.patch                  |  46 --
>>   .../libpng/{libpng_1.6.1.bb => libpng_1.6.2.bb}    |   9 +-
>>   .../matchbox-terminal/matchbox-terminal_git.bb     |   3 +-
>>   .../bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb}          |   9 +-
>>   meta/recipes-support/icu/icu.inc                   |   1 +
>>   meta/recipes-support/icu/icu_50.1.2.bb             |  11 -
>>   meta/recipes-support/icu/icu_51.2.bb               |  11 +
>>   .../libpcre/{libpcre_8.32.bb => libpcre_8.33.bb}   |   7 +-
>>   67 files changed, 841 insertions(+), 1305 deletions(-)
>>   create mode 100644 meta/conf/machine/include/tune-cortexa.inc
>>   create mode 100644 meta/conf/machine/include/tune-cortexa5.inc
>>   create mode 100644 meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch
>>   rename meta/recipes-connectivity/connman/{connman_1.14.bb => connman_1.15.bb} (73%)
>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-Fix-disable-canusb.patch
>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-The-leading-comma-looked-weird-remove-it.patch
>>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap-1.3.0/0001-canusb-needs-lpthread.patch
>>   rename meta/recipes-connectivity/libpcap/{libpcap-1.3.0 => libpcap}/aclocal.patch (100%)
>>   rename meta/recipes-connectivity/libpcap/{libpcap-1.3.0 => libpcap}/ieee80215-arphrd.patch (100%)
>>   rename meta/recipes-connectivity/libpcap/{libpcap_1.3.0.bb => libpcap_1.4.0.bb} (56%)
>>   rename meta/recipes-core/zlib/{zlib-1.2.7 => zlib-1.2.8}/remove.ldconfig.call.patch (100%)
>>   rename meta/recipes-core/zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb} (73%)
>>   create mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal.patch
>>   rename meta/recipes-devtools/diffstat/{diffstat_1.55.bb => diffstat_1.57.bb} (76%)
>>   rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native_0.9.66.bb => linuxdoc-tools-native_0.9.69.bb} (70%)
>>   rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/fix-install-depends.patch (100%)
>>   rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/libtool2.patch (100%)
>>   rename meta/recipes-devtools/subversion/{subversion_1.7.9.bb => subversion_1.7.10.bb} (88%)
>>   delete mode 100644 meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
>>   rename meta/recipes-extended/iptables/{iptables_1.4.18.bb => iptables_1.4.19.1.bb} (90%)
>>   delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
>>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
>>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
>>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
>>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
>>   create mode 100644 meta/recipes-graphics/images/core-image-weston.bb
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
>>   create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
>>   create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
>>   create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.3.bb
>>   rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)
>>   create mode 100644 meta/recipes-graphics/wayland/weston-init.bb
>>   create mode 100644 meta/recipes-graphics/wayland/weston-init/init
>>   create mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
>>   rename meta/recipes-graphics/wayland/{weston_1.0.6.bb => weston_1.1.0.bb} (63%)
>>   rename meta/recipes-graphics/xorg-lib/{pixman_0.29.4.bb => pixman_0.30.0.bb} (89%)
>>   delete mode 100644 meta/recipes-multimedia/libpng/libpng/transform.patch
>>   rename meta/recipes-multimedia/libpng/{libpng_1.6.1.bb => libpng_1.6.2.bb} (61%)
>>   rename meta/recipes-support/bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb} (92%)
>>   delete mode 100644 meta/recipes-support/icu/icu_50.1.2.bb
>>   create mode 100644 meta/recipes-support/icu/icu_51.2.bb
>>   rename meta/recipes-support/libpcre/{libpcre_8.32.bb => libpcre_8.33.bb} (90%)
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

