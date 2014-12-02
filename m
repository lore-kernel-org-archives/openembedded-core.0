Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84AA960030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 14:50:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 02 Dec 2014 06:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,501,1413270000"; 
	d="log'?scan'208";a="617301191"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.148])
	([10.219.4.148])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2014 06:50:12 -0800
Message-ID: <547DD1A8.6040006@linux.intel.com>
Date: Tue, 02 Dec 2014 08:50:16 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<434556f7b955c934a5eabbd8125d46aab0ffbde2.1417466738.git.anibal.limon@linux.intel.com>
	<CAP71WjzO2sg-RbY=51Nu89=hcahNqP0NhVYUCCJX3=eTYz87Hg@mail.gmail.com>
In-Reply-To: <CAP71WjzO2sg-RbY=51Nu89=hcahNqP0NhVYUCCJX3=eTYz87Hg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] xorg-xserver: Upgrade to 1.16.2
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
X-List-Received-Date: Tue, 02 Dec 2014 14:50:24 -0000
X-Groupsio-MsgNum: 60071
Content-Type: multipart/mixed; boundary="------------040908000800020807080002"

--------------040908000800020807080002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/14 08:28, Nicolas Dechesne wrote:
> On Mon, Dec 1, 2014 at 11:36 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> Remove crosscompile, mips64-compile and present-module because are already in
>> upstream.
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>   .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
>>   .../xserver-xorg/mips64-compiler.patch             | 29 ----------
>>   .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------------
>>   ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} |  9 +--
>>   4 files changed, 3 insertions(+), 123 deletions(-)
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
>>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} (75%)
>
> I am seeing the following warning when building this patch:
I don't see this warning, i ran with (log attached),

$ bitbake xserver-xorg -v -D

>
> WARNING: QA Issue: xserver-xorg rdepends on dbus-lib, but it isn't a
> build dependency? [build-deps]


--------------040908000800020807080002
Content-Type: text/x-log;
 name="xserver-xorg_1.16.2.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="xserver-xorg_1.16.2.log"

DEBUG: Removed the following variables from the environment: LC_NUMERIC, MD=
MSESSION, _JAVA_AWT_WM_NONREPARENTING, XTERM_SHELL, LC_MEASUREMENT, LC_PAPE=
R, MDM_LANG, WINDOWID, XDG_VTNR, GNOME_KEYRING_CONTROL, WINDOWPATH, LANG, X=
DG_SESSION_COOKIE, LC_MONETARY, MANDATORY_PATH, DISPLAY, TEXTDOMAIN, EDITOR=
, USERNAME, XDG_SESSION_DESKTOP, GDM_XSERVER_LOCATION, XDG_RUNTIME_DIR, XTE=
RM_VERSION, LC_ADDRESS, GDMSESSION, TEXTDOMAINDIR, XTERM_LOCALE, socks_prox=
y, XDG_SESSION_ID, DBUS_SESSION_BUS_ADDRESS, _, DEFAULTS_PATH, LC_IDENTIFIC=
ATION, DESKTOP_SESSION, XDG_CONFIG_DIRS, GNOME_KEYRING_PID, OLDPWD, MDM_XSE=
RVER_LOCATION, XAUTHORITY, SHLVL, BUILDDIR, LC_NAME, LC_TELEPHONE, LC_TIME,=
 LS_COLORS, XDG_DATA_DIRS, XDG_SEAT
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/base.bbclass (f=
rom configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/patch.bbclass (=
from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:4)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/terminal.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/patch.bbclass:8)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/staging.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:5)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/mirrors.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:7)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/utils.bbclass (=
from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:8)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/utility-tasks.b=
bclass (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:9)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/metadata_scm.bb=
class (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:10)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/logging.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:11)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta-yocto/classes/poky-sani=
ty.bbclass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/package_rpm.bbc=
lass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/package.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/package_rpm.bbclass:1)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/packagedata.bbc=
lass (from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:41)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/prserv.bbclass =
(from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:42)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/chrpath.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:43)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/insane.bbclass =
(from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:46)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/buildstats.bbcl=
ass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/image-mklibs.bb=
class (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/image-prelink.b=
bclass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/debian.bbclass =
(from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/devshell.bbclas=
s (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/sstate.bbclass =
(from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/license.bbclass=
 (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/blacklist.bbcla=
ss (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/sanity.bbclass =
(from configuration INHERITs:0)
DEBUG: Clearing SRCREV cache due to cache policy of: clear
DEBUG: Using cache in '/home/alimon/repos/poky-bugs/build/cache/local_file_=
checksum_cache.dat'
DEBUG: Using cache in '/home/alimon/repos/poky-bugs/build/cache/bb_codepars=
er.dat'
DEBUG: Features set [3] (was [3])
WARNING: Host distribution "LinuxMint-17" has not been validated with this =
version of the build system; you may possibly experience unexpected failure=
s. It is recommended that you use a tested distribution.
DEBUG: collecting .bb files
DEBUG: Using cache in '/home/alimon/repos/poky-bugs/build/tmp/cache/default=
-glibc/qemux86'
Loading cache...done.
Loaded 1312 entries from dependency cache.
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/gnome/gconf_3.2.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/gnome/gnome-common_3.14.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-gnome/libffi/libffi_3.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/libffi/libffi_3.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-gnome/=
gtk+/gtk-update-icon-cache-native_3.4.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/librsvg/librsvg_2.40.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/desktop-file-utils/desktop-file-utils-native_0.22.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/orc/orc_0.4.18.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/orc/orc_0.4.18.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/autogen/autogen-native_5.18.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/mtd/mtd-utils_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/patchelf/patchelf_0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/patchelf/patchelf_0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/strace/strace_4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/bootchart2/bootchart2_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/bison/bison_2.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/bison/bison_2.7.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/bison/bison_2.7.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/dpkg/dpkg_1.17.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/unifdef/unifdef_2.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/remake/remake_git.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/icecc-create-env/icecc-create-env-native_0.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-crosssdk-initial_4.9.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross_4.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-crosssdk-initial_4.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross-canadian_4.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/libgcc_4.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/libgcc-initial_4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/gcc-runtime_4.9.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross-canadian_4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/libgcc-initial_4.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross-initial_4.9.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross-initial_4.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-crosssdk_4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/gcc-runtime_4.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gcc/libgcc_4.9.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-crosssdk_4.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gcc/gcc-cross_4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/insserv/insserv_1.14.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/docbook-utils/docbook-utils-native_0.6.14.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/chrpath/chrpath_0.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/chrpath/chrpath_0.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/mtools/mtools_3.9.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/mtools/mtools_3.9.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/mtools/mtools_4.0.18.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/mtools/mtools_4.0.18.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/subversion/subversion_1.6.15.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/subversion/subversion_1.8.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-nose_1.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-nose_1.2.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/python/python-scons-native_2.3.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/python/python3-native_3.3.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-git_0.3.2.RC1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/python/python-native_2.7.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-pycairo_1.10.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-distribute_0.6.32.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-distribute_0.6.32.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-async_0.6.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-argparse_1.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-smmap_0.8.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-numpy_1.7.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-numpy_1.7.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/python/python-pyrex-native_0.9.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-smartpm_1.4.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-smartpm_1.4.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-docutils_0.12.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python3-distribute_0.6.32.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-pygobject_2.28.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-pycurl_7.19.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python_2.7.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python3_3.3.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-gitdb_0.5.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/python/python-mako_0.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python-mako_0.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/file/file_5.18.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/file/file_5.18.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/opkg/opkg_0.2.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/opkg/opkg_0.2.4.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/help2man/help2man-native_1.46.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/opkg-utils/opkg-utils_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/opkg-utils/opkg-utils_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/automake/automake_1.14.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/automake/automake_1.14.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/openjade/openjade-native_1.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/mkelfimage/mkelfimage_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/perl/liburi-perl_1.60.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/perl/libxml-simple-perl_2.20.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/perl/perl-native_5.20.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/perl/perl_5.20.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/perl/libxml-parser-perl_2.41.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/perl/liberror-perl_0.17022.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/opensp/opensp_1.5.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/cdrtools/cdrtools-native_3.01a20.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/elfutils/elfutils_0.148.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/elfutils/elfutils_0.148.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/elfutils/elfutils_0.160.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/elfutils/elfutils_0.160.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/guile/guile_2.0.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/nasm/nasm_2.11.06.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/flex/flex_2.5.39.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/flex/flex_2.5.39.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/xmlto/xmlto_0.0.25.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/qemu/qemu_2.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/qemu/qemu_2.1.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/qemu/nativesdk-qemu-helper_1.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/qemu/qemu-helper-native_1.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/qemu/qemu_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/qemu/qemu_git.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/swabber/swabber-native_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/gnu-config/gnu-config_20120814.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/gnu-config/gnu-config_20120814.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/gnu-config/gnu-config_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/makedevs/makedevs_1.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/makedevs/makedevs_1.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/binutils/binutils_2.24.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/binutils/binutils-cross-canadian_2.24.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/binutils/binutils-crosssdk_2.24.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/binutils/binutils-cross_2.24.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/tcltk/tcl_8.6.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/make/make_4.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/make/make_4.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/pkgconfig/pkgconfig_git.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/mklibs/mklibs-native_0.1.39.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/git/git_2.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/git/git_2.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/vala/vala_0.26.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/zisofs-tools/zisofs-tools-native_1.0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/prelink/prelink_git.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/sgmlspl/sgmlspl-native_1.03ii.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/intltool/intltool_0.50.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/cmake/cmake-native_2.8.12.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/cmake/cmake_2.8.12.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gdb/gdb-cross-canadian_7.8.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/gdb/gdb-cross_7.8.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/sgml-common/sgml-common-native_0.6.3.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/quilt/quilt-native_0.63.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/rpm/rpm_5.4.14.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/rpm/rpm_5.4.14.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/rpm/rpm_4.11.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/rpm/rpm_5.4+cvs.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/rpm/rpm_5.4+cvs.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/rpm/rpmresolve_1.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/rpm/rpmresolve_1.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/apt/apt-native_0.9.9.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/pseudo/pseudo_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/pseudo/pseudo_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/pseudo/pseudo_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/pseudo/pseudo_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/pseudo/pseudo_1.5.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/pseudo/pseudo_1.5.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/fdisk/gptfdisk_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/fdisk/gptfdisk_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/yasm/yasm_1.2.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/libtool/nativesdk-libtool_2.4.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/libtool/libtool-native_2.4.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/dosfstools/dosfstools_2.11.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/guilt/guilt-native_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/autoconf/autoconf_2.69.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/autoconf/autoconf_2.69.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/m4/m4_1.4.17.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/m4/m4-native_1.4.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/m4/m4_1.4.9.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-devtoo=
ls/m4/m4-native_1.4.17.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/ccache/ccache_3.1.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/syslinux/syslinux_6.01.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/syslinux/syslinux_6.01.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libenv-perl_1.04.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-kernel=
/kern-tools/kern-tools-native_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-kernel/dtc/dtc_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-kernel/dtc/dtc_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-kernel=
/kmod/kmod-native_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-kernel/systemtap/systemtap_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-kernel/systemtap/systemtap_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-multimedia/libpng/libpng_1.6.13.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-multimedia/libpng/libpng_1.6.13.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-multimedia/libtiff/tiff_4.0.3.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-connec=
tivity/bluez5/bluez5_5.25.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-connec=
tivity/bluez/gst-plugin-bluetooth_4.101.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-connec=
tivity/bluez/bluez4_4.101.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-connectivity/openssl/openssl_1.0.1j.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-connectivity/openssl/openssl_1.0.1j.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-util/makedepend_1.0.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-util/util-macros_1.19.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/libsdl/libsdl_1.2.15.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/xorg-lib/libx11-diet_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libice_1.0.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxcb_1.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxcb_1.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxpm_3.5.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxt_1.1.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/xtrans_1.3.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/xtrans_1.3.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libsm_1.2.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxext_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxext_1.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxext_1.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxft_2.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/pixman_0.32.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxcb_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxcb_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libx11_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/xorg-lib/libx11_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxau_1.0.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/freetype/freetype_2.5.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-font/font-util_1.3.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/cairo/cairo_1.12.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xcb-proto_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xcb-proto_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/inputproto_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/inputproto_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/presentproto_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/fixesproto_5.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xproto_7.0.26.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xproto_7.0.26.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/harfbuzz/harfbuzz_0.9.35.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/mesa/mesa-gl_10.3.3.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/mesa/mesa_10.3.3.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/mesa/mesa_git.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/pango/pango_1.36.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/wayland/wayland_1.6.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/images/core-image-clutter.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/images/core-image-weston.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-graphi=
cs/images/core-image-x11.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/pac=
kagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/pac=
kagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/qt4=
/nativesdk-qt4-tools_4.8.6.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/qt4=
/qt4-native_4.8.6.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/met=
a/meta-toolchain-qt.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/met=
a/meta-toolchain-qte.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-qt/ima=
ges/qt4e-demo-image.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-sato/i=
mages/core-image-sato.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-sato/i=
mages/core-image-sato-dev.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-sato/i=
mages/core-image-sato-sdk.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-rt/ima=
ges/core-image-rt-sdk.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-rt/ima=
ges/core-image-rt.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-bsp/grub/grub-efi_2.00.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/gzip/gzip_1.3.12.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/gzip/gzip_1.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/wget/wget_1.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/bc/bc_1.06.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/groff/groff_1.22.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/ghostscript/ghostscript_9.15.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/shadow/shadow_4.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/shadow/shadow_4.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/byacc/byacc_20141006.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/pam/libpam_1.1.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/pam/libpam_1.1.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/perl/libtimedate-perl_2.30.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/perl/libxml-sax-perl_0.99.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/cwautomacros/cwautomacros_20110201.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/parted/parted_3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/bash/bash_4.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/stat/stat_3.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/texinfo/texinfo_4.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/texinfo/texinfo_5.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/cracklib/cracklib_2.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/cracklib/cracklib_2.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/findutils/findutils_4.2.31.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/findutils/findutils_4.2.31.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/findutils/findutils_4.5.14.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/findutils/findutils_4.5.14.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/texinfo-dummy-native/texinfo-dummy-native.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/gperf/gperf_3.0.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/gperf/gperf_3.0.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/bzip2/bzip2_1.0.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/bzip2/bzip2_1.0.6.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/pigz/pigz_2.3.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/pigz/pigz_2.3.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/sed/sed_4.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/sed/sed_4.2.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/tar/tar-replacement-native_1.27.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/tar/tar-replacement-native_1.27.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/tar/tar_1.27.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/tar/tar_1.17.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/xz/xz_5.1.3alpha.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/xz/xz_5.1.3alpha.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-extended/libarchive/libarchive_3.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/libarchive/libarchive_3.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/zip/zip_3.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/chkconfig/chkconfig-alternatives-native_1.3.59.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/tzcode/tzcode-native_2014j.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/images/core-image-full-cmdline.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/images/core-image-testmaster.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-extend=
ed/images/core-image-testmaster-initramfs.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-extended/unzip/unzip_6.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libcroco/libcroco_0.6.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libpcre/libpcre_8.36.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libpcre/libpcre_8.36.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/beecrypt/beecrypt_4.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/beecrypt/beecrypt_4.2.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/gdbm/gdbm_1.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/gdbm/gdbm_1.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/gdbm/gdbm_1.8.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/gdbm/gdbm_1.8.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/createrepo/createrepo_0.4.11.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/curl/curl_7.37.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/curl/curl_7.37.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/lz4/lz4_svn.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/lz4/lz4_svn.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libmpc/libmpc_1.0.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libmpc/libmpc_1.0.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/apr/apr_1.5.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/apr/apr-util_1.5.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/nss/nss_3.17.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/nss/nss_3.17.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/ca-certificates/ca-certificates_20140325.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/ca-certificates/ca-certificates_20140325.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/lzo/lzo_2.08.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/lzo/lzo_2.08.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/gmp/gmp_6.0.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/gmp/gmp_6.0.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libcap/libcap_2.24.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libcap/libcap_2.24.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/bdwgc/bdwgc_7.4.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/bdwgc/bdwgc_7.4.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-suppor=
t/boost/bjam-native_1.56.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/boost/boost_1.56.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libunistring/libunistring_0.9.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libunistring/libunistring_0.9.4.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libusb/libusb-compat_0.1.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libusb/libusb-compat_0.1.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libusb/libusb1_1.0.19.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libusb/libusb1_1.0.19.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/neon/neon_0.30.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/icu/icu_53.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/icu/icu_53.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/attr/acl_2.2.52.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/attr/acl_2.2.52.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/attr/attr_2.4.47.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/attr/attr_2.4.47.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/sqlite/sqlite3_3.8.6.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/gnutls/gnutls_3.3.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/gnutls/gnutls_3.3.5.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/gnutls/libtasn1_4.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/serf/serf_1.3.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/atk/atk_2.12.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libgpg-error/libgpg-error_1.12.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/lzop/lzop_1.03.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/lzop/lzop_1.03.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/mpfr/mpfr_3.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/mpfr/mpfr_3.1.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/nspr/nspr_4.10.7.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/nspr/nspr_4.10.7.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libunwind/libunwind_1.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/db/db_5.3.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/db/db_5.3.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/db/db_6.0.30.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/db/db_6.0.30.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/nettle/nettle_2.7.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/nettle/nettle_2.7.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-support/popt/popt_1.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/popt/popt_1.16.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libxslt/libxslt_1.1.28.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-support/libcheck/libcheck_0.9.14.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/p=
ackagegroups/packagegroup-cross-canadian.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/p=
ackagegroups/nativesdk-packagegroup-sdk-host.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/util-linux/util-linux_2.24.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/util-linux/util-linux_2.24.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/expat/expat_2.1.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/expat/expat_2.1.0.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/ncurses/ncurses_5.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/ncurses/ncurses_5.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/dbus/dbus_1.8.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/dbus/dbus_1.8.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/dbus/dbus-glib_0.100.2.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/m=
eta/uninative-tarball.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/m=
eta/package-index.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/m=
eta/buildtools-tarball.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/m=
eta/meta-environment.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/m=
eta/meta-toolchain.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/s=
ystemd/systemd-systemctl-native.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/gettext/gettext_0.18.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/gettext/gettext_0.18.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/gettext/gettext_0.16.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/gettext/gettext_0.16.1.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/g=
ettext/gettext-minimal-native_0.18.3.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/kbd/kbd_2.0.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/readline/readline_5.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/readline/readline_5.2.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/readline/readline_6.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/readline/readline_6.3.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/jpeg/jpeg_8d.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/update-rc.d/update-rc.d_0.7.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/coreutils/coreutils_8.22.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/coreutils/coreutils_8.22.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/coreutils/coreutils_6.9.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/libxml/libxml2_2.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/libxml/libxml2_2.9.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/zlib/zlib_1.2.8.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
/recipes-core/zlib/zlib_1.2.8.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/core-image-base.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/core-image-minimal-mtdutils.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/core-image-minimal-dev.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/build-appliance-image_8.0.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/core-image-minimal-initramfs.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/i=
mages/core-image-minimal.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/g=
libc/cross-localedef-native_2.20.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/glibc/glibc-initial_2.20.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/glibc/glibc-locale_2.20.bb
DEBUG: EXCLUDE FROM WORLD: virtual:nativesdk:/home/alimon/repos/poky-bugs/m=
eta/recipes-core/glibc/glibc_2.20.bb
DEBUG: EXCLUDE FROM WORLD: /home/alimon/repos/poky-bugs/meta/recipes-core/g=
libc/ldconfig-native_2.12.1.bb
DEBUG: EXCLUDE FROM WORLD: virtual:native:/home/alimon/repos/poky-bugs/meta=
-intel/common/recipes-core/microcode/iucode-tool_1.0.2.bb
DEBUG: parsing complete
DEBUG: providers for xserver-xorg are: ['xserver-xorg']
DEBUG: sorted providers for xserver-xorg are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb']
NOTE: Resolving any missing task queue dependencies
DEBUG: providers for quilt-native are: ['quilt-native']
DEBUG: sorted providers for quilt-native are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-devtools/quilt/quilt-native_0.63.bb']
DEBUG: providers for virtual/fakeroot-native are: ['pseudo-native']
NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due to PRE=
FERRED_PROVIDERS
DEBUG: sorted providers for virtual/fakeroot-native are: ['virtual:native:/=
home/alimon/repos/poky-bugs/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb']
DEBUG: providers for prelink-native are: ['prelink-native']
DEBUG: sorted providers for prelink-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/prelink/prelink_git.bb']
DEBUG: providers for rpm-native are: ['rpm-native']
DEBUG: sorted providers for rpm-native are: ['virtual:native:/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/rpm/rpm_5.4.14.bb']
DEBUG: providers for file-native are: ['file-native']
DEBUG: sorted providers for file-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/file/file_5.18.bb']
DEBUG: providers for pkgconfig-native are: ['pkgconfig-native']
DEBUG: sorted providers for pkgconfig-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb']
DEBUG: providers for autoconf-native are: ['autoconf-native']
DEBUG: sorted providers for autoconf-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/autoconf/autoconf_2.69.bb']
DEBUG: providers for automake-native are: ['automake-native']
DEBUG: sorted providers for automake-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/automake/automake_1.14.1.bb']
DEBUG: providers for libtool-native are: ['libtool-native']
DEBUG: sorted providers for libtool-native are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb']
DEBUG: providers for libtool-cross are: ['libtool-cross']
DEBUG: sorted providers for libtool-cross are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb']
DEBUG: providers for gnu-config-native are: ['gnu-config-native']
DEBUG: sorted providers for gnu-config-native are: ['virtual:native:/home/a=
limon/repos/poky-bugs/meta/recipes-devtools/gnu-config/gnu-config_20120814.=
bb']
DEBUG: providers for virtual/i586-poky-linux-gcc are: ['gcc-cross-i586']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc=
-cross_4.9.bb as PREFERRED_VERSION 4.9% of package gcc-cross-i586 (for item=
 virtual/i586-poky-linux-gcc)
NOTE: selecting gcc-cross-i586 to satisfy virtual/i586-poky-linux-gcc due t=
o PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-gcc are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/gcc/gcc-cross_4.9.bb']
DEBUG: providers for virtual/i586-poky-linux-compilerlibs are: ['gcc-runtim=
e']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc=
-runtime_4.9.bb as PREFERRED_VERSION 4.9% of package gcc-runtime (for item =
virtual/i586-poky-linux-compilerlibs)
NOTE: selecting gcc-runtime to satisfy virtual/i586-poky-linux-compilerlibs=
 due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-compilerlibs are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc-runtime_4.9.bb']
DEBUG: providers for virtual/libc are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item virtual/libc)
NOTE: selecting glibc to satisfy virtual/libc due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/libc are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for randrproto are: ['randrproto']
DEBUG: sorted providers for randrproto are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb']
DEBUG: providers for renderproto are: ['renderproto']
DEBUG: sorted providers for renderproto are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb']
DEBUG: providers for fixesproto are: ['fixesproto']
DEBUG: sorted providers for fixesproto are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb']
DEBUG: providers for damageproto are: ['damageproto']
DEBUG: sorted providers for damageproto are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb']
DEBUG: providers for xextproto are: ['xextproto']
DEBUG: sorted providers for xextproto are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb']
DEBUG: providers for xproto are: ['xproto']
DEBUG: sorted providers for xproto are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-proto/xproto_7.0.26.bb']
DEBUG: providers for xf86dgaproto are: ['xf86dgaproto']
DEBUG: sorted providers for xf86dgaproto are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb']
DEBUG: providers for xf86miscproto are: ['xf86miscproto']
DEBUG: sorted providers for xf86miscproto are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb']
DEBUG: providers for xf86vidmodeproto are: ['xf86vidmodeproto']
DEBUG: sorted providers for xf86vidmodeproto are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb']
DEBUG: providers for compositeproto are: ['compositeproto']
DEBUG: sorted providers for compositeproto are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb']
DEBUG: providers for recordproto are: ['recordproto']
DEBUG: sorted providers for recordproto are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb']
DEBUG: providers for resourceproto are: ['resourceproto']
DEBUG: sorted providers for resourceproto are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb']
DEBUG: providers for videoproto are: ['videoproto']
DEBUG: sorted providers for videoproto are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb']
DEBUG: providers for scrnsaverproto are: ['scrnsaverproto']
DEBUG: sorted providers for scrnsaverproto are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb']
DEBUG: providers for xineramaproto are: ['xineramaproto']
DEBUG: sorted providers for xineramaproto are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb']
DEBUG: providers for fontsproto are: ['fontsproto']
DEBUG: sorted providers for fontsproto are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb']
DEBUG: providers for kbproto are: ['kbproto']
DEBUG: sorted providers for kbproto are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-graphics/xorg-proto/kbproto_1.0.6.bb']
DEBUG: providers for inputproto are: ['inputproto']
DEBUG: sorted providers for inputproto are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb']
DEBUG: providers for bigreqsproto are: ['bigreqsproto']
DEBUG: sorted providers for bigreqsproto are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb']
DEBUG: providers for xcmiscproto are: ['xcmiscproto']
DEBUG: sorted providers for xcmiscproto are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb']
DEBUG: providers for presentproto are: ['presentproto']
DEBUG: sorted providers for presentproto are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-proto/presentproto_git.bb']
DEBUG: providers for pixman are: ['pixman']
DEBUG: sorted providers for pixman are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/pixman_0.32.6.bb']
DEBUG: providers for libxfont are: ['libxfont']
DEBUG: sorted providers for libxfont are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb']
DEBUG: providers for xtrans are: ['xtrans']
DEBUG: sorted providers for xtrans are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/xtrans_1.3.4.bb']
DEBUG: providers for libxau are: ['libxau']
DEBUG: sorted providers for libxau are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxau_1.0.8.bb']
DEBUG: providers for libxext are: ['libxext']
DEBUG: sorted providers for libxext are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-graphics/xorg-lib/libxext_1.3.2.bb']
DEBUG: providers for libxdmcp are: ['libxdmcp']
DEBUG: sorted providers for libxdmcp are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb']
DEBUG: providers for libdrm are: ['libdrm']
DEBUG: sorted providers for libdrm are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libxkbfile are: ['libxkbfile']
DEBUG: sorted providers for libxkbfile are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb']
DEBUG: providers for libpciaccess are: ['libpciaccess']
DEBUG: sorted providers for libpciaccess are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb']
DEBUG: providers for openssl are: ['openssl']
DEBUG: sorted providers for openssl are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for libgcrypt are: ['libgcrypt']
DEBUG: sorted providers for libgcrypt are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb']
DEBUG: providers for font-util are: ['font-util']
DEBUG: sorted providers for font-util are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-font/font-util_1.3.0.bb']
DEBUG: providers for glproto are: ['glproto']
DEBUG: sorted providers for glproto are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-graphics/xorg-proto/glproto_1.4.17.bb']
DEBUG: providers for virtual/mesa are: ['mesa', 'mesa-gl']
NOTE: selecting mesa to satisfy virtual/mesa due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/mesa are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/mesa/mesa_10.3.3.bb', '/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/mesa/mesa-gl_10.3.3.bb']
DEBUG: providers for xf86driproto are: ['xf86driproto']
DEBUG: sorted providers for xf86driproto are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb']
DEBUG: providers for dri2proto are: ['dri2proto']
DEBUG: sorted providers for dri2proto are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/dri2proto_2.8.bb']
DEBUG: providers for virtual/libgl are: ['mesa', 'mesa-gl']
NOTE: selecting mesa to satisfy virtual/libgl due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/libgl are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-graphics/mesa/mesa_10.3.3.bb', '/home/alimon/repos/poky-bug=
s/meta/recipes-graphics/mesa/mesa-gl_10.3.3.bb']
DEBUG: providers for virtual/libx11 are: ['libx11', 'libx11-diet']
NOTE: selecting libx11 to satisfy virtual/libx11 due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/libx11 are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb', '/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb']
DEBUG: providers for udev are: ['udev']
NOTE: selecting udev to satisfy udev due to PREFERRED_PROVIDERS
DEBUG: sorted providers for udev are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/udev/udev_182.bb']
DEBUG: providers for xserver-xorg-dev are: ['xserver-xorg']
NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg-dev due to PRE=
FERRED_PROVIDER_virtual/xserver-xf86 =3D xserver-xorg
DEBUG: sorted runtime providers for xserver-xorg-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb']
DEBUG: providers for xkeyboard-config are: ['xkeyboard-config']
DEBUG: sorted runtime providers for xkeyboard-config are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb']
DEBUG: providers for xserver-xorg are: ['xserver-xorg']
NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg due to PREFERR=
ED_PROVIDER_virtual/xserver-xf86 =3D xserver-xorg
DEBUG: sorted runtime providers for xserver-xorg are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb']
DEBUG: providers for xserver-xorg-security-policy are: ['xserver-xorg']
NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg-security-polic=
y due to PREFERRED_PROVIDER_virtual/xserver-xf86 =3D xserver-xorg
DEBUG: sorted runtime providers for xserver-xorg-security-policy are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xserver-xorg_1=
.16.2.bb']
DEBUG: providers for rgb are: ['rgb']
DEBUG: sorted runtime providers for rgb are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb']
DEBUG: providers for xserver-xf86-config are: ['xserver-xf86-config']
DEBUG: sorted runtime providers for xserver-xf86-config are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1=
.bb']
DEBUG: providers for xkbcomp are: ['xkbcomp']
DEBUG: sorted runtime providers for xkbcomp are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb']
DEBUG: providers for util-linux-native are: ['util-linux-native']
DEBUG: sorted runtime providers for util-linux-native are: ['virtual:native=
:/home/alimon/repos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.=
2.bb']
DEBUG: providers for m4-native are: ['m4-native']
DEBUG: sorted runtime providers for m4-native are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/m4/m4-native_1.4.17.bb']
DEBUG: providers for gnu-config-native are: ['gnu-config-native']
DEBUG: sorted runtime providers for gnu-config-native are: ['virtual:native=
:/home/alimon/repos/poky-bugs/meta/recipes-devtools/gnu-config/gnu-config_2=
0120814.bb']
DEBUG: providers for autoconf-native are: ['autoconf-native']
DEBUG: sorted runtime providers for autoconf-native are: ['virtual:native:/=
home/alimon/repos/poky-bugs/meta/recipes-devtools/autoconf/autoconf_2.69.bb=
']
DEBUG: providers for libsegfault are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item libsegfault)
NOTE: selecting glibc to satisfy runtime libsegfault due to PREFERRED_PROVI=
DER_virtual/libc =3D glibc
DEBUG: sorted runtime providers for libsegfault are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for glibc-dev are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item glibc-dev)
NOTE: selecting glibc to satisfy runtime glibc-dev due to PREFERRED_PROVIDE=
R_virtual/libc =3D glibc
DEBUG: sorted runtime providers for glibc-dev are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for glibc are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item glibc)
NOTE: selecting glibc to satisfy runtime glibc due to PREFERRED_PROVIDER_vi=
rtual/libc =3D glibc
DEBUG: sorted runtime providers for glibc are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for randrproto-dev are: ['randrproto']
DEBUG: sorted runtime providers for randrproto-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb']
DEBUG: providers for renderproto-dev are: ['renderproto']
DEBUG: sorted runtime providers for renderproto-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb']
DEBUG: providers for fixesproto-dev are: ['fixesproto']
DEBUG: sorted runtime providers for fixesproto-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb']
DEBUG: providers for damageproto-dev are: ['damageproto']
DEBUG: sorted runtime providers for damageproto-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb']
DEBUG: providers for xextproto-dev are: ['xextproto']
DEBUG: sorted runtime providers for xextproto-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb']
DEBUG: providers for xproto-dev are: ['xproto']
DEBUG: sorted runtime providers for xproto-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb']
DEBUG: providers for xf86dgaproto-dev are: ['xf86dgaproto']
DEBUG: sorted runtime providers for xf86dgaproto-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb']
DEBUG: providers for xf86miscproto-dev are: ['xf86miscproto']
DEBUG: sorted runtime providers for xf86miscproto-dev are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb']
DEBUG: providers for xf86vidmodeproto-dev are: ['xf86vidmodeproto']
DEBUG: sorted runtime providers for xf86vidmodeproto-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.b=
b']
DEBUG: providers for compositeproto-dev are: ['compositeproto']
DEBUG: sorted runtime providers for compositeproto-dev are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb']
DEBUG: providers for recordproto-dev are: ['recordproto']
DEBUG: sorted runtime providers for recordproto-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb']
DEBUG: providers for resourceproto-dev are: ['resourceproto']
DEBUG: sorted runtime providers for resourceproto-dev are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb']
DEBUG: providers for videoproto-dev are: ['videoproto']
DEBUG: sorted runtime providers for videoproto-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb']
DEBUG: providers for scrnsaverproto-dev are: ['scrnsaverproto']
DEBUG: sorted runtime providers for scrnsaverproto-dev are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb']
DEBUG: providers for xineramaproto-dev are: ['xineramaproto']
DEBUG: sorted runtime providers for xineramaproto-dev are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb']
DEBUG: providers for fontsproto-dev are: ['fontsproto']
DEBUG: sorted runtime providers for fontsproto-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb']
DEBUG: providers for kbproto-dev are: ['kbproto']
DEBUG: sorted runtime providers for kbproto-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb']
DEBUG: providers for inputproto-dev are: ['inputproto']
DEBUG: sorted runtime providers for inputproto-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb']
DEBUG: providers for bigreqsproto-dev are: ['bigreqsproto']
DEBUG: sorted runtime providers for bigreqsproto-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb']
DEBUG: providers for xcmiscproto-dev are: ['xcmiscproto']
DEBUG: sorted runtime providers for xcmiscproto-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb']
DEBUG: providers for presentproto-dev are: ['presentproto']
DEBUG: sorted runtime providers for presentproto-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-proto/presentproto_git.bb']
DEBUG: providers for pixman are: ['pixman']
DEBUG: sorted runtime providers for pixman are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb']
DEBUG: providers for pixman-dev are: ['pixman']
DEBUG: sorted runtime providers for pixman-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb']
DEBUG: providers for libxfont-dev are: ['libxfont']
DEBUG: sorted runtime providers for libxfont-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb']
DEBUG: providers for libxfont are: ['libxfont']
DEBUG: sorted runtime providers for libxfont are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb']
DEBUG: providers for xtrans-dev are: ['xtrans']
DEBUG: sorted runtime providers for xtrans-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/xtrans_1.3.4.bb']
DEBUG: providers for libxau are: ['libxau']
DEBUG: sorted runtime providers for libxau are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb']
DEBUG: providers for libxau-dev are: ['libxau']
DEBUG: sorted runtime providers for libxau-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb']
DEBUG: providers for libxext are: ['libxext']
DEBUG: sorted runtime providers for libxext are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-graphics/xorg-lib/libxext_1.3.2.bb']
DEBUG: providers for libxext-dev are: ['libxext']
DEBUG: sorted runtime providers for libxext-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-lib/libxext_1.3.2.bb']
DEBUG: providers for libxdmcp-dev are: ['libxdmcp']
DEBUG: sorted runtime providers for libxdmcp-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb']
DEBUG: providers for libxdmcp are: ['libxdmcp']
DEBUG: sorted runtime providers for libxdmcp are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb']
DEBUG: providers for libdrm-dev are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm are: ['libdrm']
DEBUG: sorted runtime providers for libdrm are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-radeon are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-radeon are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-nouveau are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-nouveau are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-omap are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-omap are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-intel are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-intel are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-exynos are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-exynos are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libdrm-freedreno are: ['libdrm']
DEBUG: sorted runtime providers for libdrm-freedreno are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/drm/libdrm_2.4.58.bb']
DEBUG: providers for libxkbfile-dev are: ['libxkbfile']
DEBUG: sorted runtime providers for libxkbfile-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb']
DEBUG: providers for libxkbfile are: ['libxkbfile']
DEBUG: sorted runtime providers for libxkbfile are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb']
DEBUG: providers for libpciaccess-dev are: ['libpciaccess']
DEBUG: sorted runtime providers for libpciaccess-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb']
DEBUG: providers for libpciaccess are: ['libpciaccess']
DEBUG: sorted runtime providers for libpciaccess are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb']
DEBUG: providers for openssl are: ['openssl']
DEBUG: sorted runtime providers for openssl are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for openssl-misc are: ['openssl']
DEBUG: sorted runtime providers for openssl-misc are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for make are: ['make']
NOTE: selecting make to satisfy runtime make due to PREFERRED_PROVIDER_make=
 =3D make
DEBUG: sorted runtime providers for make are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-devtools/make/make_4.0.bb']
DEBUG: providers for perl are: ['perl']
DEBUG: sorted runtime providers for perl are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-filehandle is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-filehandle are: ['perl']
DEBUG: sorted runtime providers for perl-module-filehandle are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for bc are: ['bc']
DEBUG: sorted runtime providers for bc are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-extended/bc/bc_1.06.bb']
DEBUG: providers for openssl-dev are: ['openssl']
DEBUG: sorted runtime providers for openssl-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for openssl-conf are: ['openssl']
DEBUG: sorted runtime providers for openssl-conf are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for libgcrypt-dev are: ['libgcrypt']
DEBUG: sorted runtime providers for libgcrypt-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb']
DEBUG: providers for libgcrypt are: ['libgcrypt']
DEBUG: sorted runtime providers for libgcrypt are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb']
DEBUG: providers for font-util are: ['font-util']
DEBUG: sorted runtime providers for font-util are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb']
DEBUG: providers for mkfontdir are: ['mkfontdir']
DEBUG: sorted runtime providers for mkfontdir are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb']
DEBUG: providers for mkfontscale are: ['mkfontscale']
DEBUG: sorted runtime providers for mkfontscale are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb']
DEBUG: providers for encodings are: ['encodings']
DEBUG: sorted runtime providers for encodings are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb']
DEBUG: providers for font-util-dev are: ['font-util']
DEBUG: sorted runtime providers for font-util-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb']
DEBUG: providers for glproto-dev are: ['glproto']
DEBUG: sorted runtime providers for glproto-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb']
DEBUG: providers for mesa-dev are: ['mesa']
NOTE: selecting mesa to satisfy runtime mesa-dev due to PREFERRED_PROVIDER_=
virtual/libgl =3D mesa
DEBUG: sorted runtime providers for mesa-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/mesa/mesa_10.3.3.bb']
DEBUG: providers for mesa-gl-dev are: ['mesa-gl']
DEBUG: sorted runtime providers for mesa-gl-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/mesa/mesa-gl_10.3.3.bb']
DEBUG: providers for xf86driproto-dev are: ['xf86driproto']
DEBUG: sorted runtime providers for xf86driproto-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb']
DEBUG: providers for dri2proto-dev are: ['dri2proto']
DEBUG: sorted runtime providers for dri2proto-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb']
DEBUG: providers for libx11-dev are: ['libx11', 'libx11-diet']
NOTE: selecting libx11 to satisfy runtime libx11-dev due to PREFERRED_PROVI=
DER_virtual/libx11 =3D libx11
DEBUG: sorted runtime providers for libx11-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb', '/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb']
DEBUG: providers for libx11 are: ['libx11']
NOTE: selecting libx11 to satisfy runtime libx11 due to PREFERRED_PROVIDER_=
virtual/libx11 =3D libx11
DEBUG: sorted runtime providers for libx11 are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb']
DEBUG: providers for libx11-diet are: ['libx11-diet']
DEBUG: sorted runtime providers for libx11-diet are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb']
DEBUG: providers for libx11-diet-dev are: ['libx11-diet']
DEBUG: sorted runtime providers for libx11-diet-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb']
DEBUG: providers for udev-dev are: ['udev']
NOTE: selecting udev to satisfy runtime udev-dev due to PREFERRED_PROVIDER_=
udev =3D udev
DEBUG: sorted runtime providers for udev-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/udev/udev_182.bb']
DEBUG: providers for udev are: ['udev']
NOTE: selecting udev to satisfy runtime udev due to PREFERRED_PROVIDER_udev=
 =3D udev
DEBUG: sorted runtime providers for udev are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-core/udev/udev_182.bb']
DEBUG: providers for udev-cache are: ['udev']
NOTE: selecting udev to satisfy runtime udev-cache due to PREFERRED_PROVIDE=
R_udev =3D udev
DEBUG: sorted runtime providers for udev-cache are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-core/udev/udev_182.bb']
DEBUG: providers for update-rc.d are: ['update-rc.d']
DEBUG: sorted runtime providers for update-rc.d are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb']
DEBUG: Resolved 140 extra dependencies
DEBUG: providers for sqlite3-native are: ['sqlite3-native']
DEBUG: sorted providers for sqlite3-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb']
DEBUG: providers for attr-native are: ['attr-native']
DEBUG: sorted providers for attr-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-support/attr/attr_2.4.47.bb']
DEBUG: providers for elfutils-native are: ['elfutils-native']
DEBUG: sorted providers for elfutils-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/elfutils/elfutils_0.160.bb']
DEBUG: providers for binutils-native are: ['binutils-native']
DEBUG: selecting virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-d=
evtools/binutils/binutils_2.24.bb as PREFERRED_VERSION 2.24 of package binu=
tils-native (for item binutils-native)
DEBUG: sorted providers for binutils-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/binutils/binutils_2.24.bb']
DEBUG: providers for gettext-minimal-native are: ['gettext-minimal-native']
DEBUG: sorted providers for gettext-minimal-native are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb']
DEBUG: providers for libpcre-native are: ['libpcre-native']
DEBUG: sorted providers for libpcre-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-support/libpcre/libpcre_8.36.bb']
DEBUG: providers for acl-native are: ['acl-native']
DEBUG: sorted providers for acl-native are: ['virtual:native:/home/alimon/r=
epos/poky-bugs/meta/recipes-support/attr/acl_2.2.52.bb']
DEBUG: providers for popt-native are: ['popt-native']
DEBUG: sorted providers for popt-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-support/popt/popt_1.16.bb']
DEBUG: providers for ossp-uuid-native are: ['ossp-uuid-native']
DEBUG: sorted providers for ossp-uuid-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb']
DEBUG: providers for byacc-native are: ['byacc-native']
DEBUG: sorted providers for byacc-native are: ['virtual:native:/home/alimon=
/repos/poky-bugs/meta/recipes-extended/byacc/byacc_20141006.bb']
DEBUG: providers for beecrypt-native are: ['beecrypt-native']
DEBUG: sorted providers for beecrypt-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb']
DEBUG: providers for db-native are: ['db-native']
DEBUG: selecting virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-s=
upport/db/db_6.0.30.bb as PREFERRED_VERSION 6.% of package db-native (for i=
tem db-native)
DEBUG: sorted providers for db-native are: ['virtual:native:/home/alimon/re=
pos/poky-bugs/meta/recipes-support/db/db_6.0.30.bb']
DEBUG: providers for openssl-native are: ['openssl-native']
DEBUG: sorted providers for openssl-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb']
DEBUG: providers for python-native are: ['python-native']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python-native_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python-native =
(for item python-native)
DEBUG: sorted providers for python-native are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-devtools/python/python-native_2.7.3.bb']
DEBUG: providers for zlib-native are: ['zlib-native']
DEBUG: sorted providers for zlib-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-core/zlib/zlib_1.2.8.bb']
DEBUG: providers for m4-native are: ['m4-native']
DEBUG: sorted providers for m4-native are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/m4/m4-native_1.4.17.bb']
DEBUG: providers for texinfo-dummy-native are: ['texinfo-dummy-native']
DEBUG: sorted providers for texinfo-dummy-native are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.b=
b']
DEBUG: providers for virtual/i586-poky-linux-binutils are: ['binutils-cross=
-i586']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/binutil=
s/binutils-cross_2.24.bb as PREFERRED_VERSION 2.24 of package binutils-cros=
s-i586 (for item virtual/i586-poky-linux-binutils)
NOTE: selecting binutils-cross-i586 to satisfy virtual/i586-poky-linux-binu=
tils due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-binutils are: ['/home/a=
limon/repos/poky-bugs/meta/recipes-devtools/binutils/binutils-cross_2.24.bb=
']
DEBUG: providers for virtual/i586-poky-linux-libc-for-gcc are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item virtual/i586-=
poky-linux-libc-for-gcc)
NOTE: selecting glibc to satisfy virtual/i586-poky-linux-libc-for-gcc due t=
o PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-libc-for-gcc are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for linux-libc-headers are: ['linux-libc-headers']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-lib=
c-headers/linux-libc-headers_3.16.bb as PREFERRED_VERSION 3.16 of package l=
inux-libc-headers (for item linux-libc-headers)
NOTE: selecting linux-libc-headers to satisfy linux-libc-headers due to PRE=
FERRED_PROVIDERS
DEBUG: sorted providers for linux-libc-headers are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb']
DEBUG: providers for mpfr-native are: ['mpfr-native']
DEBUG: sorted providers for mpfr-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-support/mpfr/mpfr_3.1.2.bb']
DEBUG: providers for gmp-native are: ['gmp-native']
DEBUG: sorted providers for gmp-native are: ['virtual:native:/home/alimon/r=
epos/poky-bugs/meta/recipes-support/gmp/gmp_6.0.0.bb']
DEBUG: providers for libmpc-native are: ['libmpc-native']
DEBUG: sorted providers for libmpc-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-support/libmpc/libmpc_1.0.2.bb']
DEBUG: providers for virtual/i586-poky-linux-g++ are: ['gcc-cross-i586']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc=
-cross_4.9.bb as PREFERRED_VERSION 4.9% of package gcc-cross-i586 (for item=
 virtual/i586-poky-linux-g++)
NOTE: selecting gcc-cross-i586 to satisfy virtual/i586-poky-linux-g++ due t=
o PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-g++ are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/gcc/gcc-cross_4.9.bb']
DEBUG: providers for libgcc are: ['libgcc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/lib=
gcc_4.9.bb as PREFERRED_VERSION 4.9% of package libgcc (for item libgcc)
NOTE: selecting libgcc to satisfy libgcc due to PREFERRED_PROVIDERS
DEBUG: sorted providers for libgcc are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/gcc/libgcc_4.9.bb']
DEBUG: providers for virtual/i586-poky-linux-gcc-initial are: ['gcc-cross-i=
nitial-i586']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc=
-cross-initial_4.9.bb as PREFERRED_VERSION 4.9% of package gcc-cross-initia=
l-i586 (for item virtual/i586-poky-linux-gcc-initial)
NOTE: selecting gcc-cross-initial-i586 to satisfy virtual/i586-poky-linux-g=
cc-initial due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-gcc-initial are: ['/hom=
e/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb=
']
DEBUG: providers for libgcc-initial are: ['libgcc-initial']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/lib=
gcc-initial_4.9.bb as PREFERRED_VERSION 4.9% of package libgcc-initial (for=
 item libgcc-initial)
DEBUG: sorted providers for libgcc-initial are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-devtools/gcc/libgcc-initial_4.9.bb']
DEBUG: providers for virtual/i586-poky-linux-libc-initial are: ['glibc-init=
ial']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-initial_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-initial (for it=
em virtual/i586-poky-linux-libc-initial)
NOTE: selecting glibc-initial to satisfy virtual/i586-poky-linux-libc-initi=
al due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/i586-poky-linux-libc-initial are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc-initial_2.20.bb']
DEBUG: providers for gperf-native are: ['gperf-native']
DEBUG: sorted providers for gperf-native are: ['virtual:native:/home/alimon=
/repos/poky-bugs/meta/recipes-extended/gperf/gperf_3.0.4.bb']
DEBUG: providers for kconfig-frontends-native are: ['kconfig-frontends-nati=
ve']
DEBUG: sorted providers for kconfig-frontends-native are: ['virtual:native:=
/home/alimon/repos/poky-bugs/meta/recipes-devtools/kconfig-frontends/kconfi=
g-frontends_3.12.0.0.bb']
DEBUG: providers for util-macros are: ['util-macros']
DEBUG: sorted providers for util-macros are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb']
DEBUG: providers for virtual/gettext are: ['gettext']
NOTE: selecting gettext to satisfy virtual/gettext due to PREFERRED_PROVIDE=
RS
DEBUG: sorted providers for virtual/gettext are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-core/gettext/gettext_0.18.3.2.bb']
DEBUG: providers for gettext-native are: ['gettext-native']
DEBUG: sorted providers for gettext-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-core/gettext/gettext_0.18.3.2.bb']
DEBUG: providers for zlib are: ['zlib']
DEBUG: sorted providers for zlib are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb']
DEBUG: providers for libpng are: ['libpng']
DEBUG: sorted providers for libpng are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-multimedia/libpng/libpng_1.6.13.bb']
DEBUG: providers for freetype are: ['freetype']
DEBUG: sorted providers for freetype are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-graphics/freetype/freetype_2.5.3.bb']
DEBUG: providers for libfontenc are: ['libfontenc']
DEBUG: sorted providers for libfontenc are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb']
DEBUG: providers for libpthread-stubs are: ['libpthread-stubs']
DEBUG: sorted providers for libpthread-stubs are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb']
DEBUG: providers for cryptodev-linux are: ['cryptodev-linux']
DEBUG: sorted providers for cryptodev-linux are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb']
DEBUG: providers for libgpg-error are: ['libgpg-error']
DEBUG: sorted providers for libgpg-error are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb']
DEBUG: providers for libcap are: ['libcap']
DEBUG: sorted providers for libcap are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-support/libcap/libcap_2.24.bb']
DEBUG: providers for encodings are: ['encodings']
DEBUG: sorted providers for encodings are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-font/encodings_1.0.4.bb']
DEBUG: providers for expat are: ['expat']
DEBUG: sorted providers for expat are: ['/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb']
DEBUG: providers for makedepend-native are: ['makedepend-native']
DEBUG: sorted providers for makedepend-native are: ['virtual:native:/home/a=
limon/repos/poky-bugs/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb']
DEBUG: providers for flex-native are: ['flex-native']
DEBUG: sorted providers for flex-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/flex/flex_2.5.39.bb']
DEBUG: providers for bison-native are: ['bison-native']
DEBUG: sorted providers for bison-native are: ['virtual:native:/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/bison/bison_2.7.1.bb']
DEBUG: providers for libxml2-native are: ['libxml2-native']
DEBUG: sorted providers for libxml2-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-core/libxml/libxml2_2.9.1.bb']
DEBUG: providers for wayland are: ['wayland']
DEBUG: sorted providers for wayland are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-graphics/wayland/wayland_1.6.0.bb']
DEBUG: providers for libxxf86vm are: ['libxxf86vm']
DEBUG: sorted providers for libxxf86vm are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb']
DEBUG: providers for libxdamage are: ['libxdamage']
DEBUG: sorted providers for libxdamage are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb']
DEBUG: providers for libxfixes are: ['libxfixes']
DEBUG: sorted providers for libxfixes are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb']
DEBUG: providers for libxcb are: ['libxcb']
DEBUG: sorted providers for libxcb are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libxcb_1.10.bb']
DEBUG: providers for xproto-native are: ['xproto-native']
DEBUG: sorted providers for xproto-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-proto/xproto_7.0.26.bb']
DEBUG: providers for acl are: ['acl']
DEBUG: sorted providers for acl are: ['/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb']
DEBUG: providers for glib-2.0 are: ['glib-2.0']
DEBUG: sorted providers for glib-2.0 are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb']
DEBUG: providers for libusb are: ['libusb-compat']
DEBUG: sorted providers for libusb are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-support/libusb/libusb-compat_0.1.5.bb']
DEBUG: providers for usbutils are: ['usbutils']
DEBUG: sorted providers for usbutils are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-bsp/usbutils/usbutils_007.bb']
DEBUG: providers for pciutils are: ['pciutils']
DEBUG: sorted providers for pciutils are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-bsp/pciutils/pciutils_3.2.1.bb']
DEBUG: providers for libxslt-native are: ['libxslt-native']
DEBUG: sorted providers for libxslt-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-support/libxslt/libxslt_1.1.28.bb']
DEBUG: providers for util-linux are: ['util-linux']
DEBUG: sorted providers for util-linux are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for module-init-tools are: ['kmod']
DEBUG: sorted providers for module-init-tools are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-kernel/kmod/kmod_git.bb']
DEBUG: providers for update-rc.d-native are: ['update-rc.d-native']
DEBUG: sorted providers for update-rc.d-native are: ['virtual:native:/home/=
alimon/repos/poky-bugs/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb']
DEBUG: providers for initscripts are: ['initscripts']
DEBUG: sorted providers for initscripts are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-core/initscripts/initscripts_1.0.bb']
DEBUG: providers for intltool-native are: ['intltool-native']
DEBUG: sorted providers for intltool-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/intltool/intltool_0.50.2.bb']
DEBUG: providers for util-macros-native are: ['util-macros-native']
DEBUG: sorted providers for util-macros-native are: ['virtual:native:/home/=
alimon/repos/poky-bugs/meta/recipes-graphics/xorg-util/util-macros_1.19.0.b=
b']
DEBUG: providers for xz-native are: ['xz-native']
DEBUG: sorted providers for xz-native are: ['virtual:native:/home/alimon/re=
pos/poky-bugs/meta/recipes-extended/xz/xz_5.1.3alpha.bb']
DEBUG: providers for ncurses-native are: ['ncurses-native']
DEBUG: sorted providers for ncurses-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-core/ncurses/ncurses_5.9.bb']
DEBUG: providers for lzo-native are: ['lzo-native']
DEBUG: sorted providers for lzo-native are: ['virtual:native:/home/alimon/r=
epos/poky-bugs/meta/recipes-support/lzo/lzo_2.08.bb']
DEBUG: providers for virtual/db are: ['db']
NOTE: selecting db to satisfy virtual/db due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/db are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-support/db/db_6.0.30.bb']
DEBUG: providers for gdbm are: ['gdbm']
DEBUG: sorted providers for gdbm are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gdbm/gdbm_1.11.bb']
DEBUG: providers for perl-native are: ['perl-native']
DEBUG: sorted providers for perl-native are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-devtools/perl/perl-native_5.20.0.bb']
DEBUG: providers for flex are: ['flex']
DEBUG: sorted providers for flex are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb']
DEBUG: providers for virtual/update-alternatives are: ['opkg-utils', 'chkco=
nfig', 'chkconfig-alternatives-native', 'dpkg']
NOTE: selecting opkg-utils to satisfy virtual/update-alternatives due to PR=
EFERRED_PROVIDERS
DEBUG: sorted providers for virtual/update-alternatives are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb', '/hom=
e/alimon/repos/poky-bugs/meta/recipes-extended/chkconfig/chkconfig_1.3.58.b=
b', '/home/alimon/repos/poky-bugs/meta/recipes-extended/chkconfig/chkconfig=
-alternatives-native_1.3.59.bb', '/home/alimon/repos/poky-bugs/meta/recipes=
-devtools/dpkg/dpkg_1.17.4.bb']
DEBUG: providers for mkfontscale-native are: ['mkfontscale-native']
DEBUG: sorted providers for mkfontscale-native are: ['virtual:native:/home/=
alimon/repos/poky-bugs/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb'=
]
DEBUG: providers for font-util-native are: ['font-util-native']
DEBUG: sorted providers for font-util-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb']
DEBUG: providers for xkeyboard-config-dev are: ['xkeyboard-config']
DEBUG: sorted runtime providers for xkeyboard-config-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb']
DEBUG: providers for rgb-dev are: ['rgb']
DEBUG: sorted runtime providers for rgb-dev are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb']
DEBUG: providers for xserver-xf86-config-dev are: ['xserver-xf86-config']
DEBUG: sorted runtime providers for xserver-xf86-config-dev are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xserver-xf86-config=
_0.1.bb']
DEBUG: providers for xkbcomp-dev are: ['xkbcomp']
DEBUG: sorted runtime providers for xkbcomp-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb']
DEBUG: providers for make-dev are: ['make']
NOTE: selecting make to satisfy runtime make-dev due to PREFERRED_PROVIDER_=
make =3D make
DEBUG: sorted runtime providers for make-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-devtools/make/make_4.0.bb']
DEBUG: providers for perl-modules are: ['perl']
DEBUG: sorted runtime providers for perl-modules are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-doc are: ['perl']
DEBUG: sorted runtime providers for perl-doc are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-misc are: ['perl']
DEBUG: sorted runtime providers for perl-misc are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for sed are: ['sed']
DEBUG: sorted runtime providers for sed are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-extended/sed/sed_4.2.2.bb']
DEBUG: Assuming perl-module-integer is a dynamic package, but it may not ex=
ist
DEBUG: providers for perl-module-integer are: ['perl']
DEBUG: sorted runtime providers for perl-module-integer are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-archive-tar is a dynamic package, but it may no=
t exist
DEBUG: providers for perl-module-archive-tar are: ['perl']
DEBUG: sorted runtime providers for perl-module-archive-tar are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-b is a dynamic package, but it may not exist
DEBUG: providers for perl-module-b are: ['perl']
DEBUG: sorted runtime providers for perl-module-b are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-build is a dynamic package, but it may not exis=
t
DEBUG: providers for perl-module-build are: ['perl']
DEBUG: sorted runtime providers for perl-module-build are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-carp is a dynamic package, but it may not exist
DEBUG: providers for perl-module-carp are: ['perl']
DEBUG: sorted runtime providers for perl-module-carp are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-config are: ['perl']
DEBUG: sorted runtime providers for perl-module-config are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-config-git is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-config-git are: ['perl']
DEBUG: sorted runtime providers for perl-module-config-git are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-compress-zlib is a dynamic package, but it may =
not exist
DEBUG: providers for perl-module-compress-zlib are: ['perl']
DEBUG: sorted runtime providers for perl-module-compress-zlib are: ['/home/=
alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-cpan are: ['perl']
DEBUG: sorted runtime providers for perl-module-cpan are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-cwd is a dynamic package, but it may not exist
DEBUG: providers for perl-module-cwd are: ['perl']
DEBUG: sorted runtime providers for perl-module-cwd are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-data-dumper is a dynamic package, but it may no=
t exist
DEBUG: providers for perl-module-data-dumper are: ['perl']
DEBUG: sorted runtime providers for perl-module-data-dumper are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-digest-md5 is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-digest-md5 are: ['perl']
DEBUG: sorted runtime providers for perl-module-digest-md5 are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-digest-sha is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-digest-sha are: ['perl']
DEBUG: sorted runtime providers for perl-module-digest-sha are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-dirhandle is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-dirhandle are: ['perl']
DEBUG: sorted runtime providers for perl-module-dirhandle are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-exporter is a dynamic package, but it may not e=
xist
DEBUG: providers for perl-module-exporter are: ['perl']
DEBUG: sorted runtime providers for perl-module-exporter are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-extutils-cbuilder is a dynamic package, but it =
may not exist
DEBUG: providers for perl-module-extutils-cbuilder are: ['perl']
DEBUG: sorted runtime providers for perl-module-extutils-cbuilder are: ['/h=
ome/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-extutils-makemaker is a dynamic package, but it=
 may not exist
DEBUG: providers for perl-module-extutils-makemaker are: ['perl']
DEBUG: sorted runtime providers for perl-module-extutils-makemaker are: ['/=
home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-extutils-manifest is a dynamic package, but it =
may not exist
DEBUG: providers for perl-module-extutils-manifest are: ['perl']
DEBUG: sorted runtime providers for perl-module-extutils-manifest are: ['/h=
ome/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-extutils-mm is a dynamic package, but it may no=
t exist
DEBUG: providers for perl-module-extutils-mm are: ['perl']
DEBUG: sorted runtime providers for perl-module-extutils-mm are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-extutils-mm-unix is a dynamic package, but it m=
ay not exist
DEBUG: providers for perl-module-extutils-mm-unix are: ['perl']
DEBUG: sorted runtime providers for perl-module-extutils-mm-unix are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-fcntl is a dynamic package, but it may not exis=
t
DEBUG: providers for perl-module-fcntl are: ['perl']
DEBUG: sorted runtime providers for perl-module-fcntl are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-basename is a dynamic package, but it may =
not exist
DEBUG: providers for perl-module-file-basename are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-basename are: ['/home/=
alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-copy is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-copy are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-copy are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-find is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-find are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-find are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-glob is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-glob are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-glob are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-path is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-path are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-path are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-spec is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-spec are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-spec are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-file-temp is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-file-temp are: ['perl']
DEBUG: sorted runtime providers for perl-module-file-temp are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-http-tiny is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-http-tiny are: ['perl']
DEBUG: sorted runtime providers for perl-module-http-tiny are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-io-compress-base is a dynamic package, but it m=
ay not exist
DEBUG: providers for perl-module-io-compress-base are: ['perl']
DEBUG: sorted runtime providers for perl-module-io-compress-base are: ['/ho=
me/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-json-pp is a dynamic package, but it may not ex=
ist
DEBUG: providers for perl-module-json-pp are: ['perl']
DEBUG: sorted runtime providers for perl-module-json-pp are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-lib is a dynamic package, but it may not exist
DEBUG: providers for perl-module-lib are: ['perl']
DEBUG: sorted runtime providers for perl-module-lib are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-list-util is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-list-util are: ['perl']
DEBUG: sorted runtime providers for perl-module-list-util are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-mime-base64 is a dynamic package, but it may no=
t exist
DEBUG: providers for perl-module-mime-base64 are: ['perl']
DEBUG: sorted runtime providers for perl-module-mime-base64 are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-net-ftp is a dynamic package, but it may not ex=
ist
DEBUG: providers for perl-module-net-ftp are: ['perl']
DEBUG: sorted runtime providers for perl-module-net-ftp are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-net-ping is a dynamic package, but it may not e=
xist
DEBUG: providers for perl-module-net-ping are: ['perl']
DEBUG: sorted runtime providers for perl-module-net-ping are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-overload is a dynamic package, but it may not e=
xist
DEBUG: providers for perl-module-overload are: ['perl']
DEBUG: sorted runtime providers for perl-module-overload are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-parse-cpan-meta is a dynamic package, but it ma=
y not exist
DEBUG: providers for perl-module-parse-cpan-meta are: ['perl']
DEBUG: sorted runtime providers for perl-module-parse-cpan-meta are: ['/hom=
e/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-posix is a dynamic package, but it may not exis=
t
DEBUG: providers for perl-module-posix are: ['perl']
DEBUG: sorted runtime providers for perl-module-posix are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-safe is a dynamic package, but it may not exist
DEBUG: providers for perl-module-safe are: ['perl']
DEBUG: sorted runtime providers for perl-module-safe are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-scalar-util is a dynamic package, but it may no=
t exist
DEBUG: providers for perl-module-scalar-util are: ['perl']
DEBUG: sorted runtime providers for perl-module-scalar-util are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-strict are: ['perl']
DEBUG: sorted runtime providers for perl-module-strict are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-sys-hostname is a dynamic package, but it may n=
ot exist
DEBUG: providers for perl-module-sys-hostname are: ['perl']
DEBUG: sorted runtime providers for perl-module-sys-hostname are: ['/home/a=
limon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-term-readline is a dynamic package, but it may =
not exist
DEBUG: providers for perl-module-term-readline are: ['perl']
DEBUG: sorted runtime providers for perl-module-term-readline are: ['/home/=
alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-test-harness is a dynamic package, but it may n=
ot exist
DEBUG: providers for perl-module-test-harness are: ['perl']
DEBUG: sorted runtime providers for perl-module-test-harness are: ['/home/a=
limon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-test-more is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-test-more are: ['perl']
DEBUG: sorted runtime providers for perl-module-test-more are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-text-parsewords is a dynamic package, but it ma=
y not exist
DEBUG: providers for perl-module-text-parsewords are: ['perl']
DEBUG: sorted runtime providers for perl-module-text-parsewords are: ['/hom=
e/alimon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-text-wrap is a dynamic package, but it may not =
exist
DEBUG: providers for perl-module-text-wrap are: ['perl']
DEBUG: sorted runtime providers for perl-module-text-wrap are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-time-local is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-time-local are: ['perl']
DEBUG: sorted runtime providers for perl-module-time-local are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-unicore are: ['perl']
DEBUG: sorted runtime providers for perl-module-unicore are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-vars are: ['perl']
DEBUG: sorted runtime providers for perl-module-vars are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: Assuming perl-module-version is a dynamic package, but it may not ex=
ist
DEBUG: providers for perl-module-version are: ['perl']
DEBUG: sorted runtime providers for perl-module-version are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for perl-module-warnings are: ['perl']
DEBUG: sorted runtime providers for perl-module-warnings are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for bc-dev are: ['bc']
DEBUG: sorted runtime providers for bc-dev are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/bc/bc_1.06.bb']
DEBUG: providers for mkfontdir-dev are: ['mkfontdir']
DEBUG: sorted runtime providers for mkfontdir-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb']
DEBUG: providers for mkfontscale-dev are: ['mkfontscale']
DEBUG: sorted runtime providers for mkfontscale-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb']
DEBUG: providers for encodings-dev are: ['encodings']
DEBUG: sorted runtime providers for encodings-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb']
DEBUG: providers for update-rc.d-dev are: ['update-rc.d']
DEBUG: sorted runtime providers for update-rc.d-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb']
DEBUG: providers for linux-libc-headers-dev are: ['linux-libc-headers']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-lib=
c-headers/linux-libc-headers_3.16.bb as PREFERRED_VERSION 3.16 of package l=
inux-libc-headers (for item linux-libc-headers-dev)
NOTE: selecting linux-libc-headers to satisfy runtime linux-libc-headers-de=
v due to PREFERRED_PROVIDER_linux-libc-headers =3D linux-libc-headers
DEBUG: sorted runtime providers for linux-libc-headers-dev are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_3.16.bb']
DEBUG: providers for libgcc are: ['libgcc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/lib=
gcc_4.9.bb as PREFERRED_VERSION 4.9% of package libgcc (for item libgcc)
NOTE: selecting libgcc to satisfy runtime libgcc due to PREFERRED_PROVIDER_=
libgcc =3D libgcc
DEBUG: sorted runtime providers for libgcc are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-devtools/gcc/libgcc_4.9.bb']
DEBUG: providers for python-native are: ['python-native']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python-native_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python-native =
(for item python-native)
DEBUG: sorted runtime providers for python-native are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python-native_2.7.3.bb']
DEBUG: providers for util-macros-dev are: ['util-macros']
DEBUG: sorted runtime providers for util-macros-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb']
DEBUG: providers for gettext-dev are: ['gettext']
NOTE: selecting gettext to satisfy runtime gettext-dev due to PREFERRED_PRO=
VIDER_virtual/gettext =3D gettext
DEBUG: sorted runtime providers for gettext-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/gettext/gettext_0.18.3.2.bb']
DEBUG: providers for gettext are: ['gettext']
NOTE: selecting gettext to satisfy runtime gettext due to PREFERRED_PROVIDE=
R_virtual/gettext =3D gettext
DEBUG: sorted runtime providers for gettext are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-core/gettext/gettext_0.18.3.2.bb']
DEBUG: providers for zlib-dev are: ['zlib']
DEBUG: sorted runtime providers for zlib-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/zlib/zlib_1.2.8.bb']
DEBUG: providers for zlib are: ['zlib']
DEBUG: sorted runtime providers for zlib are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-core/zlib/zlib_1.2.8.bb']
DEBUG: providers for libpng are: ['libpng']
DEBUG: sorted runtime providers for libpng are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-multimedia/libpng/libpng_1.6.13.bb']
DEBUG: providers for libpng-dev are: ['libpng']
DEBUG: sorted runtime providers for libpng-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-multimedia/libpng/libpng_1.6.13.bb']
DEBUG: providers for freetype are: ['freetype']
DEBUG: sorted runtime providers for freetype are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-graphics/freetype/freetype_2.5.3.bb']
DEBUG: providers for freetype-dev are: ['freetype']
DEBUG: sorted runtime providers for freetype-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-graphics/freetype/freetype_2.5.3.bb']
DEBUG: providers for libfontenc are: ['libfontenc']
DEBUG: sorted runtime providers for libfontenc are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb']
DEBUG: providers for libfontenc-dev are: ['libfontenc']
DEBUG: sorted runtime providers for libfontenc-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb']
DEBUG: providers for libpthread-stubs-dev are: ['libpthread-stubs']
DEBUG: sorted runtime providers for libpthread-stubs-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb']
DEBUG: providers for cryptodev-linux-dev are: ['cryptodev-linux']
DEBUG: sorted runtime providers for cryptodev-linux-dev are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb']
DEBUG: providers for cryptodev-linux are: ['cryptodev-linux']
DEBUG: sorted runtime providers for cryptodev-linux are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb']
DEBUG: providers for libgpg-error-dev are: ['libgpg-error']
DEBUG: sorted runtime providers for libgpg-error-dev are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb']
DEBUG: providers for libgpg-error are: ['libgpg-error']
DEBUG: sorted runtime providers for libgpg-error are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb']
DEBUG: providers for libcap-dev are: ['libcap']
DEBUG: sorted runtime providers for libcap-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-support/libcap/libcap_2.24.bb']
DEBUG: providers for libcap are: ['libcap']
DEBUG: sorted runtime providers for libcap are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-support/libcap/libcap_2.24.bb']
DEBUG: providers for expat are: ['expat']
DEBUG: sorted runtime providers for expat are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-core/expat/expat_2.1.0.bb']
DEBUG: providers for expat-dev are: ['expat']
DEBUG: sorted runtime providers for expat-dev are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-core/expat/expat_2.1.0.bb']
DEBUG: providers for wayland are: ['wayland']
DEBUG: sorted runtime providers for wayland are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-graphics/wayland/wayland_1.6.0.bb']
DEBUG: providers for wayland-dev are: ['wayland']
DEBUG: sorted runtime providers for wayland-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-graphics/wayland/wayland_1.6.0.bb']
DEBUG: providers for libxxf86vm-dev are: ['libxxf86vm']
DEBUG: sorted runtime providers for libxxf86vm-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb']
DEBUG: providers for libxxf86vm are: ['libxxf86vm']
DEBUG: sorted runtime providers for libxxf86vm are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb']
DEBUG: providers for libxdamage are: ['libxdamage']
DEBUG: sorted runtime providers for libxdamage are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb']
DEBUG: providers for libxdamage-dev are: ['libxdamage']
DEBUG: sorted runtime providers for libxdamage-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb']
DEBUG: providers for libxfixes-dev are: ['libxfixes']
DEBUG: sorted runtime providers for libxfixes-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb']
DEBUG: providers for libxfixes are: ['libxfixes']
DEBUG: sorted runtime providers for libxfixes are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb']
DEBUG: providers for libxcb are: ['libxcb']
DEBUG: sorted runtime providers for libxcb are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb']
DEBUG: providers for libxcb-dev are: ['libxcb']
DEBUG: sorted runtime providers for libxcb-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb']
DEBUG: providers for acl-dev are: ['acl']
DEBUG: sorted runtime providers for acl-dev are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-support/attr/acl_2.2.52.bb']
DEBUG: providers for acl are: ['acl']
DEBUG: sorted runtime providers for acl are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-support/attr/acl_2.2.52.bb']
DEBUG: providers for bash are: ['bash']
DEBUG: sorted runtime providers for bash are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-extended/bash/bash_4.3.bb']
DEBUG: providers for coreutils are: ['coreutils']
DEBUG: sorted runtime providers for coreutils are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-core/coreutils/coreutils_8.22.bb']
DEBUG: Assuming perl-module-getopt-std is a dynamic package, but it may not=
 exist
DEBUG: providers for perl-module-getopt-std are: ['perl']
DEBUG: sorted runtime providers for perl-module-getopt-std are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for shadow are: ['shadow']
DEBUG: sorted runtime providers for shadow are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/shadow/shadow_4.2.1.bb']
DEBUG: providers for glib-2.0-dev are: ['glib-2.0']
DEBUG: sorted runtime providers for glib-2.0-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb']
DEBUG: providers for glib-2.0 are: ['glib-2.0']
DEBUG: sorted runtime providers for glib-2.0 are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb']
DEBUG: providers for gnome-desktop-testing are: ['gnome-desktop-testing']
DEBUG: sorted runtime providers for gnome-desktop-testing are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-support/gnome-desktop-testing/gnome-desktop=
-testing_2014.1.bb']
DEBUG: providers for tzdata are: ['tzdata']
DEBUG: sorted runtime providers for tzdata are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/tzdata/tzdata_2014j.bb']
DEBUG: providers for tzdata-americas are: ['tzdata']
DEBUG: sorted runtime providers for tzdata-americas are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-extended/tzdata/tzdata_2014j.bb']
DEBUG: providers for tzdata-asia are: ['tzdata']
DEBUG: sorted runtime providers for tzdata-asia are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-extended/tzdata/tzdata_2014j.bb']
DEBUG: providers for tzdata-europe are: ['tzdata']
DEBUG: sorted runtime providers for tzdata-europe are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-extended/tzdata/tzdata_2014j.bb']
DEBUG: providers for tzdata-posix are: ['tzdata']
DEBUG: sorted runtime providers for tzdata-posix are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-extended/tzdata/tzdata_2014j.bb']
DEBUG: providers for python-pygobject are: ['python-pygobject']
DEBUG: sorted runtime providers for python-pygobject are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python-pygobject_2.28.3.bb']
DEBUG: providers for python-dbus are: ['python-dbus']
DEBUG: sorted runtime providers for python-dbus are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python-dbus_1.2.0.bb']
DEBUG: providers for shared-mime-info are: ['shared-mime-info']
DEBUG: sorted runtime providers for shared-mime-info are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb=
']
DEBUG: Assuming glibc-gconv-utf-16 is a dynamic package, but it may not exi=
st
DEBUG: providers for glibc-gconv-utf-16 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-utf-16)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-16 due to P=
REFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-utf-16 are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-charmap-utf-8 is a dynamic package, but it may not ex=
ist
DEBUG: providers for glibc-charmap-utf-8 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-charmap-utf-8)
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-utf-8 due to =
PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-charmap-utf-8 are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-cp1255 is a dynamic package, but it may not exi=
st
DEBUG: providers for glibc-gconv-cp1255 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-cp1255)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-cp1255 due to P=
REFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-cp1255 are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-charmap-cp1255 is a dynamic package, but it may not e=
xist
DEBUG: providers for glibc-charmap-cp1255 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-charmap-cp1255)
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-cp1255 due to=
 PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-charmap-cp1255 are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-utf-32 is a dynamic package, but it may not exi=
st
DEBUG: providers for glibc-gconv-utf-32 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-utf-32)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-32 due to P=
REFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-utf-32 are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-utf-7 is a dynamic package, but it may not exis=
t
DEBUG: providers for glibc-gconv-utf-7 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-utf-7)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-7 due to PR=
EFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-utf-7 are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-euc-jp is a dynamic package, but it may not exi=
st
DEBUG: providers for glibc-gconv-euc-jp are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-euc-jp)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-euc-jp due to P=
REFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-euc-jp are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-iso8859-1 is a dynamic package, but it may not =
exist
DEBUG: providers for glibc-gconv-iso8859-1 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-iso8859-1)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-iso8859-1 due t=
o PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-iso8859-1 are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-iso8859-15 is a dynamic package, but it may not=
 exist
DEBUG: providers for glibc-gconv-iso8859-15 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-iso8859-15)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-iso8859-15 due =
to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-iso8859-15 are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-charmap-invariant is a dynamic package, but it may no=
t exist
DEBUG: providers for glibc-charmap-invariant are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-charmap-invariant)
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-invariant due=
 to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-charmap-invariant are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-localedata-translit-cjk-variants is a dynamic package=
, but it may not exist
DEBUG: providers for glibc-localedata-translit-cjk-variants are: ['glibc-lo=
cale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-localedata-translit-cjk-variants)
NOTE: selecting glibc-locale to satisfy runtime glibc-localedata-translit-c=
jk-variants due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-localedata-translit-cjk-variants =
are: ['/home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.=
20.bb']
DEBUG: providers for libusb-compat-dev are: ['libusb-compat']
DEBUG: sorted runtime providers for libusb-compat-dev are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-support/libusb/libusb-compat_0.1.5.bb']
DEBUG: providers for libusb-compat are: ['libusb-compat']
DEBUG: sorted runtime providers for libusb-compat are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-support/libusb/libusb-compat_0.1.5.bb']
DEBUG: providers for usbutils-ids are: ['usbutils']
DEBUG: sorted runtime providers for usbutils-ids are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-bsp/usbutils/usbutils_007.bb']
DEBUG: providers for usbutils are: ['usbutils']
DEBUG: sorted runtime providers for usbutils are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-bsp/usbutils/usbutils_007.bb']
DEBUG: providers for usbutils-dev are: ['usbutils']
DEBUG: sorted runtime providers for usbutils-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-bsp/usbutils/usbutils_007.bb']
DEBUG: providers for pciutils are: ['pciutils']
DEBUG: sorted runtime providers for pciutils are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb']
DEBUG: providers for pciutils-dev are: ['pciutils']
DEBUG: sorted runtime providers for pciutils-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb']
DEBUG: providers for pciutils-ids are: ['pciutils']
DEBUG: sorted runtime providers for pciutils-ids are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb']
DEBUG: providers for util-linux are: ['util-linux']
DEBUG: sorted runtime providers for util-linux are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-dev are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-umount are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-umount are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-swaponoff are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-swaponoff are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-losetup are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-losetup are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for ncurses are: ['ncurses']
DEBUG: sorted runtime providers for ncurses are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-core/ncurses/ncurses_5.9.bb']
DEBUG: providers for util-linux-fdisk are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-fdisk are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-cfdisk are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-cfdisk are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-sfdisk are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-sfdisk are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-mount are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-mount are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-readprofile are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-readprofile are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for util-linux-mkfs are: ['util-linux']
DEBUG: sorted runtime providers for util-linux-mkfs are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-core/util-linux/util-linux_2.24.2.bb']
DEBUG: providers for kmod-dev are: ['kmod']
DEBUG: sorted runtime providers for kmod-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-kernel/kmod/kmod_git.bb']
DEBUG: providers for kmod are: ['kmod']
DEBUG: sorted runtime providers for kmod are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-kernel/kmod/kmod_git.bb']
DEBUG: providers for initscripts-dev are: ['initscripts']
DEBUG: sorted runtime providers for initscripts-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-core/initscripts/initscripts_1.0.bb']
DEBUG: providers for initscripts-functions are: ['initscripts']
DEBUG: sorted runtime providers for initscripts-functions are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-core/initscripts/initscripts_1.0.bb']
DEBUG: providers for initscripts are: ['initscripts']
DEBUG: sorted runtime providers for initscripts are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/initscripts/initscripts_1.0.bb']
DEBUG: providers for libxml-parser-perl-native are: ['libxml-parser-perl-na=
tive']
DEBUG: sorted runtime providers for libxml-parser-perl-native are: ['virtua=
l:native:/home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/libxml-par=
ser-perl_2.41.bb']
DEBUG: providers for db-dev are: ['db']
NOTE: selecting db to satisfy runtime db-dev due to PREFERRED_PROVIDER_virt=
ual/db =3D db
DEBUG: sorted runtime providers for db-dev are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-support/db/db_6.0.30.bb']
DEBUG: providers for db are: ['db']
NOTE: selecting db to satisfy runtime db due to PREFERRED_PROVIDER_virtual/=
db =3D db
DEBUG: sorted runtime providers for db are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-support/db/db_6.0.30.bb']
DEBUG: providers for gdbm-dev are: ['gdbm']
DEBUG: sorted runtime providers for gdbm-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-support/gdbm/gdbm_1.11.bb']
DEBUG: providers for diffutils are: ['diffutils']
DEBUG: sorted runtime providers for diffutils are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-extended/diffutils/diffutils_3.3.bb']
DEBUG: providers for gdbm are: ['gdbm']
DEBUG: sorted runtime providers for gdbm are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-support/gdbm/gdbm_1.11.bb']
DEBUG: providers for m4 are: ['m4']
DEBUG: sorted runtime providers for m4 are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-devtools/m4/m4_1.4.17.bb']
DEBUG: providers for flex-dev are: ['flex']
DEBUG: sorted runtime providers for flex-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-devtools/flex/flex_2.5.39.bb']
DEBUG: providers for flex are: ['flex']
DEBUG: sorted runtime providers for flex are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-devtools/flex/flex_2.5.39.bb']
DEBUG: providers for opkg-utils-dev are: ['opkg-utils']
NOTE: selecting opkg-utils to satisfy runtime opkg-utils-dev due to PREFERR=
ED_PROVIDER_virtual/update-alternatives =3D opkg-utils
DEBUG: sorted runtime providers for opkg-utils-dev are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb']
DEBUG: providers for python are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on)
DEBUG: sorted runtime providers for python are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-shell are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-shell)
DEBUG: sorted runtime providers for python-shell are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-io are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-io)
DEBUG: sorted runtime providers for python-io are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-math are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-math)
DEBUG: sorted runtime providers for python-math are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-crypt are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-crypt)
DEBUG: sorted runtime providers for python-crypt are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-logging are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-logging)
DEBUG: sorted runtime providers for python-logging are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-fcntl are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-fcntl)
DEBUG: sorted runtime providers for python-fcntl are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-subprocess are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-subprocess)
DEBUG: sorted runtime providers for python-subprocess are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pickle are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-pickle)
DEBUG: sorted runtime providers for python-pickle are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-compression are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-compression)
DEBUG: sorted runtime providers for python-compression are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-textutils are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-textutils)
DEBUG: sorted runtime providers for python-textutils are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-stringold are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-stringold)
DEBUG: sorted runtime providers for python-stringold are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for opkg-utils are: ['opkg-utils']
NOTE: selecting opkg-utils to satisfy runtime opkg-utils due to PREFERRED_P=
ROVIDER_virtual/update-alternatives =3D opkg-utils
DEBUG: sorted runtime providers for opkg-utils are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb']
DEBUG: providers for chkconfig-dev are: ['chkconfig']
DEBUG: sorted runtime providers for chkconfig-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb']
DEBUG: providers for chkconfig are: ['chkconfig']
DEBUG: sorted runtime providers for chkconfig are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb']
DEBUG: providers for dpkg-dev are: ['dpkg']
DEBUG: sorted runtime providers for dpkg-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb']
DEBUG: providers for dpkg are: ['dpkg']
DEBUG: sorted runtime providers for dpkg are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb']
DEBUG: providers for update-alternatives-opkg are: ['opkg-utils']
NOTE: selecting opkg-utils to satisfy runtime update-alternatives-opkg due =
to PREFERRED_PROVIDER_virtual/update-alternatives =3D opkg-utils
DEBUG: sorted runtime providers for update-alternatives-opkg are: ['/home/a=
limon/repos/poky-bugs/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb']
DEBUG: providers for xz are: ['xz']
DEBUG: sorted runtime providers for xz are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-extended/xz/xz_5.1.3alpha.bb']
DEBUG: providers for run-postinsts are: ['run-postinsts']
DEBUG: sorted runtime providers for run-postinsts are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb']
DEBUG: providers for mkfontdir-native are: ['mkfontdir-native']
DEBUG: sorted runtime providers for mkfontdir-native are: ['virtual:native:=
/home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7=
.bb']
DEBUG: providers for mkfontscale-native are: ['mkfontscale-native']
DEBUG: sorted runtime providers for mkfontscale-native are: ['virtual:nativ=
e:/home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-app/mkfontscale_1=
.1.1.bb']
DEBUG: Resolved 260 extra dependencies
DEBUG: providers for cryptodev-linux-native are: ['cryptodev-linux-native']
DEBUG: sorted providers for cryptodev-linux-native are: ['virtual:native:/h=
ome/alimon/repos/poky-bugs/meta/recipes-kernel/cryptodev/cryptodev-linux_1.=
6.bb']
DEBUG: providers for bzip2-replacement-native are: ['bzip2-native']
DEBUG: sorted providers for bzip2-replacement-native are: ['virtual:native:=
/home/alimon/repos/poky-bugs/meta/recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for readline-native are: ['readline-native']
DEBUG: sorted providers for readline-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-core/readline/readline_6.3.bb']
DEBUG: providers for unifdef-native are: ['unifdef-native']
DEBUG: sorted providers for unifdef-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-devtools/unifdef/unifdef_2.10.bb']
DEBUG: providers for virtual/libiconv are: ['glibc']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item virtual/libic=
onv)
NOTE: selecting glibc to satisfy virtual/libiconv due to PREFERRED_PROVIDER=
S
DEBUG: sorted providers for virtual/libiconv are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/glibc/glibc_2.20.bb']
DEBUG: providers for attr are: ['attr']
DEBUG: sorted providers for attr are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb']
DEBUG: providers for gzip-native are: ['gzip-native', 'pigz-native']
DEBUG: selecting virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-e=
xtended/gzip/gzip_1.6.bb as PREFERRED_VERSION 1.6 of package gzip-native (f=
or item gzip-native)
NOTE: selecting pigz-native to satisfy gzip-native due to PREFERRED_PROVIDE=
RS
DEBUG: sorted providers for gzip-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-extended/pigz/pigz_2.3.1.bb', 'virtual:native:=
/home/alimon/repos/poky-bugs/meta/recipes-extended/gzip/gzip_1.6.bb']
DEBUG: providers for libffi are: ['libffi']
DEBUG: sorted providers for libffi are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-gnome/libffi/libffi_3.1.bb']
DEBUG: providers for wayland-native are: ['wayland-native']
DEBUG: sorted providers for wayland-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-graphics/wayland/wayland_1.6.0.bb']
DEBUG: providers for xcb-proto are: ['xcb-proto']
DEBUG: sorted providers for xcb-proto are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb']
DEBUG: providers for xcb-proto-native are: ['xcb-proto-native']
DEBUG: sorted providers for xcb-proto-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb']
DEBUG: providers for glib-2.0-native are: ['glib-2.0-native']
DEBUG: sorted providers for glib-2.0-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb']
DEBUG: providers for dbus are: ['dbus']
DEBUG: sorted providers for dbus are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb']
DEBUG: providers for gtk-doc-stub-native are: ['gtk-doc-stub-native']
DEBUG: sorted providers for gtk-doc-stub-native are: ['virtual:native:/home=
/alimon/repos/poky-bugs/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb=
']
DEBUG: providers for libusb1 are: ['libusb1']
DEBUG: sorted providers for libusb1 are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-support/libusb/libusb1_1.0.19.bb']
DEBUG: providers for kmod are: ['kmod']
DEBUG: sorted providers for kmod are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/kmod/kmod_git.bb']
DEBUG: providers for ncurses are: ['ncurses']
DEBUG: sorted providers for ncurses are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-core/ncurses/ncurses_5.9.bb']
DEBUG: providers for libxml-parser-perl-native are: ['libxml-parser-perl-na=
tive']
DEBUG: sorted providers for libxml-parser-perl-native are: ['virtual:native=
:/home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/libxml-parser-perl=
_2.41.bb']
DEBUG: providers for libnewt are: ['libnewt']
DEBUG: sorted providers for libnewt are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-extended/newt/libnewt_0.52.17.bb']
DEBUG: providers for popt are: ['popt']
DEBUG: sorted providers for popt are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb']
DEBUG: providers for bzip2 are: ['bzip2']
DEBUG: sorted providers for bzip2 are: ['/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for perl are: ['perl']
DEBUG: sorted providers for perl are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/perl_5.20.0.bb']
DEBUG: providers for libfontenc-native are: ['libfontenc-native']
DEBUG: sorted providers for libfontenc-native are: ['virtual:native:/home/a=
limon/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb']
DEBUG: providers for freetype-native are: ['freetype-native']
DEBUG: sorted providers for freetype-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-graphics/freetype/freetype_2.5.3.bb']
DEBUG: providers for gmp are: ['gmp']
DEBUG: sorted providers for gmp are: ['/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb']
DEBUG: providers for shadow-native are: ['shadow-native']
DEBUG: sorted providers for shadow-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-extended/shadow/shadow_4.2.1.bb']
DEBUG: providers for tzcode-native are: ['tzcode-native']
DEBUG: sorted providers for tzcode-native are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-extended/tzcode/tzcode-native_2014j.bb']
DEBUG: providers for python are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on)
DEBUG: sorted providers for python are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pygobject-native are: ['python-pygobject-native=
']
DEBUG: sorted providers for python-pygobject-native are: ['virtual:native:/=
home/alimon/repos/poky-bugs/meta/recipes-devtools/python/python-pygobject_2=
.28.3.bb']
DEBUG: providers for dbus-glib are: ['dbus-glib']
NOTE: selecting dbus-glib to satisfy dbus-glib due to PREFERRED_PROVIDERS
DEBUG: sorted providers for dbus-glib are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-core/dbus/dbus-glib_0.100.2.bb']
DEBUG: providers for virtual/libintl are: ['glibc', 'gettext']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
_2.20.bb as PREFERRED_VERSION 2.20 of package glibc (for item virtual/libin=
tl)
NOTE: selecting glibc to satisfy virtual/libintl due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/libintl are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-core/glibc/glibc_2.20.bb', '/home/alimon/repos/poky-bugs/=
meta/recipes-core/gettext/gettext_0.18.3.2.bb']
DEBUG: providers for python-pyrex-native are: ['python-pyrex-native']
DEBUG: sorted providers for python-pyrex-native are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb']
DEBUG: providers for libxml2 are: ['libxml2']
DEBUG: sorted providers for libxml2 are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-core/libxml/libxml2_2.9.1.bb']
DEBUG: providers for shared-mime-info-native are: ['shared-mime-info-native=
']
DEBUG: sorted providers for shared-mime-info-native are: ['virtual:native:/=
home/alimon/repos/poky-bugs/meta/recipes-support/shared-mime-info/shared-mi=
me-info_1.3.bb']
DEBUG: providers for cross-localedef-native are: ['cross-localedef-native']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/cross=
-localedef-native_2.20.bb as PREFERRED_VERSION 2.20 of package cross-locale=
def-native (for item cross-localedef-native)
DEBUG: sorted providers for cross-localedef-native are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-core/glibc/cross-localedef-native_2.20.bb']
DEBUG: providers for expat-native are: ['expat-native']
DEBUG: sorted providers for expat-native are: ['virtual:native:/home/alimon=
/repos/poky-bugs/meta/recipes-core/expat/expat_2.1.0.bb']
DEBUG: providers for db are: ['db']
DEBUG: sorted providers for db are: ['/home/alimon/repos/poky-bugs/meta/rec=
ipes-support/db/db_6.0.30.bb']
DEBUG: providers for readline are: ['readline']
DEBUG: sorted providers for readline are: ['/home/alimon/repos/poky-bugs/me=
ta/recipes-core/readline/readline_6.3.bb']
DEBUG: providers for sqlite3 are: ['sqlite3']
DEBUG: sorted providers for sqlite3 are: ['/home/alimon/repos/poky-bugs/met=
a/recipes-support/sqlite/sqlite3_3.8.6.0.bb']
DEBUG: providers for virtual/libx11-native are: ['libx11-native']
DEBUG: sorted providers for virtual/libx11-native are: ['virtual:native:/ho=
me/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb']
DEBUG: providers for sed-dev are: ['sed']
DEBUG: sorted runtime providers for sed-dev are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-extended/sed/sed_4.2.2.bb']
DEBUG: Assuming locale-base-ru-ru is a dynamic package, but it may not exis=
t
DEBUG: providers for locale-base-ru-ru are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 locale-base-ru-ru)
NOTE: selecting glibc-locale to satisfy runtime locale-base-ru-ru due to PR=
EFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for locale-base-ru-ru are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: providers for bash-dev are: ['bash']
DEBUG: sorted runtime providers for bash-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-extended/bash/bash_4.3.bb']
DEBUG: providers for base-files are: ['base-files']
DEBUG: sorted runtime providers for base-files are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-core/base-files/base-files_3.0.14.bb']
DEBUG: providers for coreutils-dev are: ['coreutils']
DEBUG: sorted runtime providers for coreutils-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-core/coreutils/coreutils_8.22.bb']
DEBUG: providers for shadow-dev are: ['shadow']
DEBUG: sorted runtime providers for shadow-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-extended/shadow/shadow_4.2.1.bb']
DEBUG: providers for shadow-securetty are: ['shadow-securetty']
DEBUG: sorted runtime providers for shadow-securetty are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb']
DEBUG: providers for base-passwd are: ['base-passwd']
DEBUG: sorted runtime providers for base-passwd are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb']
DEBUG: providers for gnome-desktop-testing-dev are: ['gnome-desktop-testing=
']
DEBUG: sorted runtime providers for gnome-desktop-testing-dev are: ['/home/=
alimon/repos/poky-bugs/meta/recipes-support/gnome-desktop-testing/gnome-des=
ktop-testing_2014.1.bb']
DEBUG: providers for python-core are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-core)
DEBUG: sorted runtime providers for python-core are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pygobject-dev are: ['python-pygobject']
DEBUG: sorted runtime providers for python-pygobject-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/python/python-pygobject_2.28.3.bb']
DEBUG: providers for python-dbus-dev are: ['python-dbus']
DEBUG: sorted runtime providers for python-dbus-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python-dbus_1.2.0.bb']
DEBUG: providers for python-threading are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-threading)
DEBUG: sorted runtime providers for python-threading are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-xml are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-xml)
DEBUG: sorted runtime providers for python-xml are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for shared-mime-info-dev are: ['shared-mime-info']
DEBUG: sorted runtime providers for shared-mime-info-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-support/shared-mime-info/shared-mime-info_1.=
3.bb']
DEBUG: providers for glibc-charmaps are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-charmaps)
NOTE: selecting glibc-locale to satisfy runtime glibc-charmaps due to PREFE=
RRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-charmaps are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: providers for glibc-localedatas are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-localedatas)
NOTE: selecting glibc-locale to satisfy runtime glibc-localedatas due to PR=
EFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-localedatas are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: providers for glibc-gconvs are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconvs)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconvs due to PREFERR=
ED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconvs are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: providers for ncurses-dev are: ['ncurses']
DEBUG: sorted runtime providers for ncurses-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/ncurses/ncurses_5.9.bb']
DEBUG: providers for diffutils-dev are: ['diffutils']
DEBUG: sorted runtime providers for diffutils-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-extended/diffutils/diffutils_3.3.bb']
DEBUG: providers for m4-dev are: ['m4']
DEBUG: sorted runtime providers for m4-dev are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-devtools/m4/m4_1.4.17.bb']
DEBUG: providers for python-2to3 are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-2to3)
DEBUG: sorted runtime providers for python-2to3 are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-audio are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-audio)
DEBUG: sorted runtime providers for python-audio are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-bsddb are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-bsddb)
DEBUG: sorted runtime providers for python-bsddb are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-codecs are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-codecs)
DEBUG: sorted runtime providers for python-codecs are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-compile are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-compile)
DEBUG: sorted runtime providers for python-compile are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-compiler are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-compiler)
DEBUG: sorted runtime providers for python-compiler are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-ctypes are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-ctypes)
DEBUG: sorted runtime providers for python-ctypes are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-curses are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-curses)
DEBUG: sorted runtime providers for python-curses are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-datetime are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-datetime)
DEBUG: sorted runtime providers for python-datetime are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-db are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-db)
DEBUG: sorted runtime providers for python-db are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-debugger are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-debugger)
DEBUG: sorted runtime providers for python-debugger are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-difflib are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-difflib)
DEBUG: sorted runtime providers for python-difflib are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-distutils are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-distutils)
DEBUG: sorted runtime providers for python-distutils are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-doctest are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-doctest)
DEBUG: sorted runtime providers for python-doctest are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-elementtree are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-elementtree)
DEBUG: sorted runtime providers for python-elementtree are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-email are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-email)
DEBUG: sorted runtime providers for python-email are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-gdbm are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-gdbm)
DEBUG: sorted runtime providers for python-gdbm are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-hotshot are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-hotshot)
DEBUG: sorted runtime providers for python-hotshot are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-html are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-html)
DEBUG: sorted runtime providers for python-html are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-idle are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-idle)
DEBUG: sorted runtime providers for python-idle are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-image are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-image)
DEBUG: sorted runtime providers for python-image are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-importlib are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-importlib)
DEBUG: sorted runtime providers for python-importlib are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-json are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-json)
DEBUG: sorted runtime providers for python-json are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-lang are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-lang)
DEBUG: sorted runtime providers for python-lang are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-mailbox are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-mailbox)
DEBUG: sorted runtime providers for python-mailbox are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-mime are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-mime)
DEBUG: sorted runtime providers for python-mime are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-mmap are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-mmap)
DEBUG: sorted runtime providers for python-mmap are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-multiprocessing are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-multiprocessing)
DEBUG: sorted runtime providers for python-multiprocessing are: ['/home/ali=
mon/repos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-netclient are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-netclient)
DEBUG: sorted runtime providers for python-netclient are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-netserver are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-netserver)
DEBUG: sorted runtime providers for python-netserver are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-numbers are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-numbers)
DEBUG: sorted runtime providers for python-numbers are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pkgutil are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-pkgutil)
DEBUG: sorted runtime providers for python-pkgutil are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pprint are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-pprint)
DEBUG: sorted runtime providers for python-pprint are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-profile are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-profile)
DEBUG: sorted runtime providers for python-profile are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-pydoc are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-pydoc)
DEBUG: sorted runtime providers for python-pydoc are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-re are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-re)
DEBUG: sorted runtime providers for python-re are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-readline are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-readline)
DEBUG: sorted runtime providers for python-readline are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-resource are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-resource)
DEBUG: sorted runtime providers for python-resource are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-robotparser are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-robotparser)
DEBUG: sorted runtime providers for python-robotparser are: ['/home/alimon/=
repos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-smtpd are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-smtpd)
DEBUG: sorted runtime providers for python-smtpd are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-sqlite3 are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-sqlite3)
DEBUG: sorted runtime providers for python-sqlite3 are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-sqlite3-tests are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-sqlite3-tests)
DEBUG: sorted runtime providers for python-sqlite3-tests are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-syslog are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-syslog)
DEBUG: sorted runtime providers for python-syslog are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-terminal are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-terminal)
DEBUG: sorted runtime providers for python-terminal are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-tests are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-tests)
DEBUG: sorted runtime providers for python-tests are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-tkinter are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-tkinter)
DEBUG: sorted runtime providers for python-tkinter are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-unittest are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-unittest)
DEBUG: sorted runtime providers for python-unittest are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-unixadmin are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-unixadmin)
DEBUG: sorted runtime providers for python-unixadmin are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-xmlrpc are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-xmlrpc)
DEBUG: sorted runtime providers for python-xmlrpc are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-zlib are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-zlib)
DEBUG: sorted runtime providers for python-zlib are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-modules are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-modules)
DEBUG: sorted runtime providers for python-modules are: ['/home/alimon/repo=
s/poky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for python-misc are: ['python']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python (for item pyth=
on-misc)
DEBUG: sorted runtime providers for python-misc are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-devtools/python/python_2.7.3.bb']
DEBUG: providers for xz-dev are: ['xz']
DEBUG: sorted runtime providers for xz-dev are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/xz/xz_5.1.3alpha.bb']
DEBUG: providers for run-postinsts-dev are: ['run-postinsts']
DEBUG: sorted runtime providers for run-postinsts-dev are: ['/home/alimon/r=
epos/poky-bugs/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb']
DEBUG: providers for attr are: ['attr']
DEBUG: sorted runtime providers for attr are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-support/attr/attr_2.4.47.bb']
DEBUG: providers for attr-dev are: ['attr']
DEBUG: sorted runtime providers for attr-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-support/attr/attr_2.4.47.bb']
DEBUG: providers for libffi are: ['libffi']
DEBUG: sorted runtime providers for libffi are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-gnome/libffi/libffi_3.1.bb']
DEBUG: providers for libffi-dev are: ['libffi']
DEBUG: sorted runtime providers for libffi-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-gnome/libffi/libffi_3.1.bb']
DEBUG: providers for xcb-proto-dev are: ['xcb-proto']
DEBUG: sorted runtime providers for xcb-proto-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb']
DEBUG: providers for dbus are: ['dbus']
DEBUG: sorted runtime providers for dbus are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-core/dbus/dbus_1.8.2.bb']
DEBUG: providers for dbus-dev are: ['dbus']
DEBUG: sorted runtime providers for dbus-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/dbus/dbus_1.8.2.bb']
DEBUG: providers for libusb1-dev are: ['libusb1']
DEBUG: sorted runtime providers for libusb1-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-support/libusb/libusb1_1.0.19.bb']
DEBUG: providers for libusb1 are: ['libusb1']
DEBUG: sorted runtime providers for libusb1 are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-support/libusb/libusb1_1.0.19.bb']
DEBUG: providers for libnewt are: ['libnewt']
DEBUG: sorted runtime providers for libnewt are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-extended/newt/libnewt_0.52.17.bb']
DEBUG: providers for libnewt-dev are: ['libnewt']
DEBUG: sorted runtime providers for libnewt-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-extended/newt/libnewt_0.52.17.bb']
DEBUG: providers for popt-dev are: ['popt']
DEBUG: sorted runtime providers for popt-dev are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-support/popt/popt_1.16.bb']
DEBUG: providers for popt are: ['popt']
DEBUG: sorted runtime providers for popt are: ['/home/alimon/repos/poky-bug=
s/meta/recipes-support/popt/popt_1.16.bb']
DEBUG: providers for bzip2-dev are: ['bzip2']
DEBUG: sorted runtime providers for bzip2-dev are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for bzip2 are: ['bzip2']
DEBUG: sorted runtime providers for bzip2 are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for libbz2 are: ['bzip2']
DEBUG: sorted runtime providers for libbz2 are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for libbz2-dev are: ['bzip2']
DEBUG: sorted runtime providers for libbz2-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-extended/bzip2/bzip2_1.0.6.bb']
DEBUG: providers for gmp-dev are: ['gmp']
DEBUG: sorted runtime providers for gmp-dev are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-support/gmp/gmp_6.0.0.bb']
DEBUG: providers for gmp are: ['gmp']
DEBUG: sorted runtime providers for gmp are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-support/gmp/gmp_6.0.0.bb']
DEBUG: providers for python-textutils-native are: ['python-native']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-devtools/python/=
python-native_2.7.3.bb as PREFERRED_VERSION 2.7.3 of package python-native =
(for item python-textutils-native)
DEBUG: sorted runtime providers for python-textutils-native are: ['/home/al=
imon/repos/poky-bugs/meta/recipes-devtools/python/python-native_2.7.3.bb']
DEBUG: providers for dbus-glib-dev are: ['dbus-glib']
NOTE: selecting dbus-glib to satisfy runtime dbus-glib-dev due to PREFERRED=
_PROVIDER_dbus-glib =3D dbus-glib
DEBUG: sorted runtime providers for dbus-glib-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-core/dbus/dbus-glib_0.100.2.bb']
DEBUG: providers for dbus-x11 are: ['dbus']
DEBUG: sorted runtime providers for dbus-x11 are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/dbus/dbus_1.8.2.bb']
DEBUG: providers for dbus-glib are: ['dbus-glib']
NOTE: selecting dbus-glib to satisfy runtime dbus-glib due to PREFERRED_PRO=
VIDER_dbus-glib =3D dbus-glib
DEBUG: sorted runtime providers for dbus-glib are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-core/dbus/dbus-glib_0.100.2.bb']
DEBUG: providers for libxml2-dev are: ['libxml2']
DEBUG: sorted runtime providers for libxml2-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-core/libxml/libxml2_2.9.1.bb']
DEBUG: Assuming glibc-gconv-ebcdic-us is a dynamic package, but it may not =
exist
DEBUG: providers for glibc-gconv-ebcdic-us are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-ebcdic-us)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-ebcdic-us due t=
o PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-ebcdic-us are: ['/home/alim=
on/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: Assuming glibc-gconv-ibm1141 is a dynamic package, but it may not ex=
ist
DEBUG: providers for glibc-gconv-ibm1141 are: ['glibc-locale']
DEBUG: selecting /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glibc=
-locale_2.20.bb as PREFERRED_VERSION 2.20 of package glibc-locale (for item=
 glibc-gconv-ibm1141)
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-ibm1141 due to =
PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale
DEBUG: sorted runtime providers for glibc-gconv-ibm1141 are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-core/glibc/glibc-locale_2.20.bb']
DEBUG: providers for libxml2 are: ['libxml2']
DEBUG: sorted runtime providers for libxml2 are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-core/libxml/libxml2_2.9.1.bb']
DEBUG: providers for readline-dev are: ['readline']
DEBUG: sorted runtime providers for readline-dev are: ['/home/alimon/repos/=
poky-bugs/meta/recipes-core/readline/readline_6.3.bb']
DEBUG: providers for readline are: ['readline']
DEBUG: sorted runtime providers for readline are: ['/home/alimon/repos/poky=
-bugs/meta/recipes-core/readline/readline_6.3.bb']
DEBUG: Resolved 144 extra dependencies
DEBUG: providers for libffi-native are: ['libffi-native']
DEBUG: sorted providers for libffi-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-gnome/libffi/libffi_3.1.bb']
DEBUG: providers for base-passwd are: ['base-passwd']
DEBUG: sorted providers for base-passwd are: ['/home/alimon/repos/poky-bugs=
/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb']
DEBUG: providers for pseudo-native are: ['pseudo-native']
DEBUG: sorted providers for pseudo-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb']
DEBUG: providers for shadow-sysroot are: ['shadow-sysroot']
DEBUG: sorted providers for shadow-sysroot are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb']
DEBUG: providers for base-files are: ['base-files']
DEBUG: sorted providers for base-files are: ['/home/alimon/repos/poky-bugs/=
meta/recipes-core/base-files/base-files_3.0.14.bb']
DEBUG: providers for shadow are: ['shadow']
DEBUG: sorted providers for shadow are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-extended/shadow/shadow_4.2.1.bb']
DEBUG: providers for libsm are: ['libsm']
DEBUG: sorted providers for libsm are: ['/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libsm_1.2.2.bb']
DEBUG: providers for slang are: ['slang']
DEBUG: sorted providers for slang are: ['/home/alimon/repos/poky-bugs/meta/=
recipes-extended/slang/slang_2.2.4.bb']
DEBUG: providers for dbus-glib-native are: ['dbus-glib-native']
NOTE: selecting dbus-glib-native to satisfy dbus-glib-native due to PREFERR=
ED_PROVIDERS
DEBUG: sorted providers for dbus-glib-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-core/dbus/dbus-glib_0.100.2.bb']
DEBUG: providers for xextproto-native are: ['xextproto-native']
DEBUG: sorted providers for xextproto-native are: ['virtual:native:/home/al=
imon/repos/poky-bugs/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb']
DEBUG: providers for xtrans-native are: ['xtrans-native']
DEBUG: sorted providers for xtrans-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-lib/xtrans_1.3.4.bb']
DEBUG: providers for libxcb-native are: ['libxcb-native']
DEBUG: sorted providers for libxcb-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb']
DEBUG: providers for kbproto-native are: ['kbproto-native']
DEBUG: sorted providers for kbproto-native are: ['virtual:native:/home/alim=
on/repos/poky-bugs/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb']
DEBUG: providers for inputproto-native are: ['inputproto-native']
DEBUG: sorted providers for inputproto-native are: ['virtual:native:/home/a=
limon/repos/poky-bugs/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb'=
]
DEBUG: providers for shadow-securetty-dev are: ['shadow-securetty']
DEBUG: sorted runtime providers for shadow-securetty-dev are: ['/home/alimo=
n/repos/poky-bugs/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb']
DEBUG: providers for base-passwd-dev are: ['base-passwd']
DEBUG: sorted runtime providers for base-passwd-dev are: ['/home/alimon/rep=
os/poky-bugs/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb']
DEBUG: providers for libsm-dev are: ['libsm']
DEBUG: sorted runtime providers for libsm-dev are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb']
DEBUG: providers for libsm are: ['libsm']
DEBUG: sorted runtime providers for libsm are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb']
DEBUG: providers for slang are: ['slang']
DEBUG: sorted runtime providers for slang are: ['/home/alimon/repos/poky-bu=
gs/meta/recipes-extended/slang/slang_2.2.4.bb']
DEBUG: providers for slang-dev are: ['slang']
DEBUG: sorted runtime providers for slang-dev are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-extended/slang/slang_2.2.4.bb']
DEBUG: Resolved 20 extra dependencies
DEBUG: providers for libice are: ['libice']
DEBUG: sorted providers for libice are: ['/home/alimon/repos/poky-bugs/meta=
/recipes-graphics/xorg-lib/libice_1.0.9.bb']
DEBUG: providers for e2fsprogs are: ['e2fsprogs']
DEBUG: sorted providers for e2fsprogs are: ['/home/alimon/repos/poky-bugs/m=
eta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for pcre are: ['libpcre']
DEBUG: sorted providers for pcre are: ['/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb']
DEBUG: providers for dbus-native are: ['dbus-native']
DEBUG: sorted providers for dbus-native are: ['virtual:native:/home/alimon/=
repos/poky-bugs/meta/recipes-core/dbus/dbus_1.8.2.bb']
DEBUG: providers for libxau-native are: ['libxau-native']
DEBUG: sorted providers for libxau-native are: ['virtual:native:/home/alimo=
n/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb']
DEBUG: providers for libpthread-stubs-native are: ['libpthread-stubs-native=
']
DEBUG: sorted providers for libpthread-stubs-native are: ['virtual:native:/=
home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libpthread-stubs=
_0.3.bb']
DEBUG: providers for libxdmcp-native are: ['libxdmcp-native']
DEBUG: sorted providers for libxdmcp-native are: ['virtual:native:/home/ali=
mon/repos/poky-bugs/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb']
DEBUG: providers for libice are: ['libice']
DEBUG: sorted runtime providers for libice are: ['/home/alimon/repos/poky-b=
ugs/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb']
DEBUG: providers for libice-dev are: ['libice']
DEBUG: sorted runtime providers for libice-dev are: ['/home/alimon/repos/po=
ky-bugs/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb']
DEBUG: providers for e2fsprogs are: ['e2fsprogs']
DEBUG: sorted runtime providers for e2fsprogs are: ['/home/alimon/repos/pok=
y-bugs/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for e2fsprogs-dev are: ['e2fsprogs']
DEBUG: sorted runtime providers for e2fsprogs-dev are: ['/home/alimon/repos=
/poky-bugs/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for e2fsprogs-badblocks are: ['e2fsprogs']
DEBUG: sorted runtime providers for e2fsprogs-badblocks are: ['/home/alimon=
/repos/poky-bugs/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for e2fsprogs-mke2fs are: ['e2fsprogs']
DEBUG: sorted runtime providers for e2fsprogs-mke2fs are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for e2fsprogs-e2fsck are: ['e2fsprogs']
DEBUG: sorted runtime providers for e2fsprogs-e2fsck are: ['/home/alimon/re=
pos/poky-bugs/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb']
DEBUG: providers for libpcre are: ['libpcre']
DEBUG: sorted runtime providers for libpcre are: ['/home/alimon/repos/poky-=
bugs/meta/recipes-support/libpcre/libpcre_8.36.bb']
DEBUG: providers for libpcre-dev are: ['libpcre']
DEBUG: sorted runtime providers for libpcre-dev are: ['/home/alimon/repos/p=
oky-bugs/meta/recipes-support/libpcre/libpcre_8.36.bb']
DEBUG: Resolved 16 extra dependencies
DEBUG: Resolved 0 extra dependencies

Build Configuration:
BB_VERSION        =3D "1.24.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "LinuxMint-17"
TARGET_SYS        =3D "i586-poky-linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.7"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "alimon/linux_intel_graphics_2014q3:434556f7b955c934a=
5eabbd8125d46aab0ffbde2"
meta-intel       =20
meta-nuc          =3D "alimon/meta-intel_linux_intel_graphics_2014q3:815c99=
7bf65fdc52152dc4a69ae3c0e84b520830"

NOTE: Preparing RunQueue
NOTE: Marking Active Tasks
NOTE: Pruned 3989 inactive tasks, 1728 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
DEBUG: Starting bitbake-worker
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/quilt/=
quilt-native_0.63.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/pseudo/pseudo_1.6.2.bb, do_populate_sysroot which could be acceler=
ated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/prelink/prelink_git.bb, do_populate_sysroot which could be acceler=
ated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/rpm/rpm_5.4.14.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/file/file_5.18.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/pkgconfig/pkgconfig_0.28.bb, do_populate_sysroot which could be ac=
celerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/autoconf/autoconf_2.69.bb, do_populate_sysroot which could be acce=
lerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/automake/automake_1.14.1.bb, do_populate_sysroot which could be ac=
celerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/libtoo=
l/libtool-native_2.4.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/libtoo=
l/libtool-cross_2.4.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/libtoo=
l/libtool-cross_2.4.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/libtoo=
l/libtool-cross_2.4.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/libtoo=
l/libtool-cross_2.4.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/gnu-config/gnu-config_20120814.bb, do_populate_sysroot which could=
 be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-cross_4.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-runtime_4.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-runtime_4.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-runtime_4.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-runtime_4.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c_2.20.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c_2.20.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c_2.20.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c_2.20.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/randrproto_1.4.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/randrproto_1.4.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/randrproto_1.4.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/randrproto_1.4.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/renderproto_0.11.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/renderproto_0.11.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/renderproto_0.11.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/renderproto_0.11.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fixesproto_5.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fixesproto_5.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fixesproto_5.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fixesproto_5.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/damageproto_1.2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/damageproto_1.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/damageproto_1.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/damageproto_1.2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xextproto_7.3.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xextproto_7.3.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xextproto_7.3.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xextproto_7.3.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xproto_7.0.26.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xproto_7.0.26.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xproto_7.0.26.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xproto_7.0.26.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86dgaproto_2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86dgaproto_2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86dgaproto_2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86dgaproto_2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86miscproto_0.9.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86miscproto_0.9.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86miscproto_0.9.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86miscproto_0.9.3.bb, do_package_write_rpm which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86vidmodeproto_2.3.1.bb, do_populate_sysroot which could be accelera=
ted
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86vidmodeproto_2.3.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86vidmodeproto_2.3.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86vidmodeproto_2.3.1.bb, do_package_write_rpm which could be acceler=
ated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/compositeproto_0.4.2.bb, do_populate_sysroot which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/compositeproto_0.4.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/compositeproto_0.4.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/compositeproto_0.4.2.bb, do_package_write_rpm which could be accelerat=
ed
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/recordproto_1.14.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/recordproto_1.14.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/recordproto_1.14.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/recordproto_1.14.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/resourceproto_1.2.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/resourceproto_1.2.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/resourceproto_1.2.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/resourceproto_1.2.0.bb, do_package_write_rpm which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/videoproto_2.3.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/videoproto_2.3.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/videoproto_2.3.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/videoproto_2.3.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/scrnsaverproto_1.2.2.bb, do_populate_sysroot which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/scrnsaverproto_1.2.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/scrnsaverproto_1.2.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/scrnsaverproto_1.2.2.bb, do_package_write_rpm which could be accelerat=
ed
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xineramaproto_1.2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xineramaproto_1.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xineramaproto_1.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xineramaproto_1.2.1.bb, do_package_write_rpm which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fontsproto_2.1.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fontsproto_2.1.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fontsproto_2.1.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/fontsproto_2.1.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/kbproto_1.0.6.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/kbproto_1.0.6.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/kbproto_1.0.6.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/kbproto_1.0.6.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/inputproto_2.3.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/inputproto_2.3.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/inputproto_2.3.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/inputproto_2.3.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/bigreqsproto_1.1.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/bigreqsproto_1.1.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/bigreqsproto_1.1.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/bigreqsproto_1.1.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcmiscproto_1.2.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcmiscproto_1.2.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcmiscproto_1.2.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcmiscproto_1.2.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/presentproto_git.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/presentproto_git.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/presentproto_git.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/presentproto_git.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/pixman_0.32.6.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/pixman_0.32.6.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/pixman_0.32.6.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/pixman_0.32.6.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfont_1.5.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfont_1.5.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfont_1.5.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfont_1.5.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xtrans_1.3.4.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xtrans_1.3.4.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xtrans_1.3.4.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xtrans_1.3.4.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxau_1.0.8.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxau_1.0.8.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxau_1.0.8.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxau_1.0.8.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxext_1.3.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxext_1.3.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxext_1.3.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxext_1.3.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdmcp_1.1.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdmcp_1.1.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdmcp_1.1.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdmcp_1.1.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/drm/li=
bdrm_2.4.58.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/drm/li=
bdrm_2.4.58.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/drm/li=
bdrm_2.4.58.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/drm/li=
bdrm_2.4.58.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxkbfile_1.0.8.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxkbfile_1.0.8.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxkbfile_1.0.8.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxkbfile_1.0.8.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpciaccess_0.13.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpciaccess_0.13.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpciaccess_0.13.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpciaccess_0.13.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-connectivity/op=
enssl/openssl_1.0.1j.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-connectivity/op=
enssl/openssl_1.0.1j.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-connectivity/op=
enssl/openssl_1.0.1j.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-connectivity/op=
enssl/openssl_1.0.1j.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgcry=
pt/libgcrypt_1.6.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgcry=
pt/libgcrypt_1.6.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgcry=
pt/libgcrypt_1.6.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgcry=
pt/libgcrypt_1.6.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/font-util_1.3.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/font-util_1.3.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/font-util_1.3.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/font-util_1.3.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/glproto_1.4.17.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/glproto_1.4.17.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/glproto_1.4.17.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/glproto_1.4.17.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/mesa/m=
esa_10.3.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/mesa/m=
esa_10.3.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/mesa/m=
esa_10.3.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/mesa/m=
esa_10.3.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86driproto_2.1.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86driproto_2.1.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86driproto_2.1.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xf86driproto_2.1.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/dri2proto_2.8.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/dri2proto_2.8.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/dri2proto_2.8.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/dri2proto_2.8.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libx11_1.6.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libx11_1.6.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libx11_1.6.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libx11_1.6.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/udev/udev_=
182.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/udev/udev_=
182.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/udev/udev_=
182.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/udev/udev_=
182.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xkeyboard-config_2.12.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xkeyboard-config_2.12.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/xkeyboard-config_2.12.bb, do_package_write_rpm which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/rgb_1.0.5.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/rgb_1.0.5.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/rgb_1.0.5.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xf86-config_0.1.bb, do_packagedata which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xf86-config_0.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xf86-config_0.1.bb, do_package_write_rpm which could be acce=
lerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/xkbcomp_1.2.4.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/xkbcomp_1.2.4.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/xkbcomp_1.2.4.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/m4/m4-=
native_1.4.17.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/make/m=
ake_4.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/make/m=
ake_4.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/make/m=
ake_4.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/p=
erl_5.20.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/p=
erl_5.20.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/p=
erl_5.20.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bc/bc_=
1.06.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bc/bc_=
1.06.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bc/bc_=
1.06.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontdir_1.0.7.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontdir_1.0.7.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontdir_1.0.7.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontscale_1.1.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontscale_1.1.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-a=
pp/mkfontscale_1.1.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/encodings_1.0.4.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/encodings_1.0.4.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/encodings_1.0.4.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-f=
ont/encodings_1.0.4.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/update-rc.=
d/update-rc.d_0.7.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/update-rc.=
d/update-rc.d_0.7.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/update-rc.=
d/update-rc.d_0.7.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/sqlite/sqlite3_3.8.6.0.bb, do_populate_sysroot which could be accel=
erated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/attr/attr_2.4.47.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/elfutils/elfutils_0.160.bb, do_populate_sysroot which could be acc=
elerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/binutils/binutils_2.24.bb, do_populate_sysroot which could be acce=
lerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/gettext/ge=
ttext-minimal-native_0.18.3.2.bb, do_populate_sysroot which could be accele=
rated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/libpcre/libpcre_8.36.bb, do_populate_sysroot which could be acceler=
ated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/attr/acl_2.2.52.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/popt/popt_1.16.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_populate_sysroot which could be a=
ccelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/byacc/byacc_20141006.bb, do_populate_sysroot which could be accele=
rated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/beecrypt/beecrypt_4.2.1.bb, do_populate_sysroot which could be acce=
lerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/db/db_6.0.30.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
connectivity/openssl/openssl_1.0.1j.bb, do_populate_sysroot which could be =
accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-native_2.7.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/zlib/zlib_1.2.8.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/texinf=
o-dummy-native/texinfo-dummy-native.bb, do_populate_sysroot which could be =
accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/binuti=
ls/binutils-cross_2.24.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-li=
bc-headers/linux-libc-headers_3.16.bb, do_populate_sysroot which could be a=
ccelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-li=
bc-headers/linux-libc-headers_3.16.bb, do_packagedata which could be accele=
rated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-li=
bc-headers/linux-libc-headers_3.16.bb, do_package which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/linux-li=
bc-headers/linux-libc-headers_3.16.bb, do_package_write_rpm which could be =
accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/mpfr/mpfr_3.1.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/gmp/gmp_6.0.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/libmpc/libmpc_1.0.2.bb, do_populate_sysroot which could be accelera=
ted
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc_4.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc_4.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc_4.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc_4.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/gc=
c-cross-initial_4.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc-initial_4.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc-initial_4.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc-initial_4.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/gcc/li=
bgcc-initial_4.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-initial_2.20.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-initial_2.20.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-initial_2.20.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-initial_2.20.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/gperf/gperf_3.0.4.bb, do_populate_sysroot which could be accelerat=
ed
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_populate_sysro=
ot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-u=
til/util-macros_1.19.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-u=
til/util-macros_1.19.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-u=
til/util-macros_1.19.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-u=
til/util-macros_1.19.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/gettext/ge=
ttext_0.18.3.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/gettext/ge=
ttext_0.18.3.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/gettext/ge=
ttext_0.18.3.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/gettext/ge=
ttext_0.18.3.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/gettext/gettext_0.18.3.2.bb, do_populate_sysroot which could be accele=
rated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/zlib/zlib_=
1.2.8.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/zlib/zlib_=
1.2.8.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/zlib/zlib_=
1.2.8.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/zlib/zlib_=
1.2.8.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-multimedia/libp=
ng/libpng_1.6.13.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-multimedia/libp=
ng/libpng_1.6.13.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-multimedia/libp=
ng/libpng_1.6.13.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-multimedia/libp=
ng/libpng_1.6.13.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/freety=
pe/freetype_2.5.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/freety=
pe/freetype_2.5.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/freety=
pe/freetype_2.5.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/freety=
pe/freetype_2.5.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libfontenc_1.1.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libfontenc_1.1.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libfontenc_1.1.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libfontenc_1.1.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpthread-stubs_0.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpthread-stubs_0.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpthread-stubs_0.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libpthread-stubs_0.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/cryptode=
v/cryptodev-linux_1.6.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/cryptode=
v/cryptodev-linux_1.6.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/cryptode=
v/cryptodev-linux_1.6.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/cryptode=
v/cryptodev-linux_1.6.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgpg-=
error/libgpg-error_1.12.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgpg-=
error/libgpg-error_1.12.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgpg-=
error/libgpg-error_1.12.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libgpg-=
error/libgpg-error_1.12.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libcap/=
libcap_2.24.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libcap/=
libcap_2.24.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libcap/=
libcap_2.24.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libcap/=
libcap_2.24.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/expat/expa=
t_2.1.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/expat/expa=
t_2.1.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/expat/expa=
t_2.1.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/expat/expa=
t_2.1.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-util/makedepend_1.0.5.bb, do_populate_sysroot which could be =
accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/flex/flex_2.5.39.bb, do_populate_sysroot which could be accelerate=
d
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/bison/bison_2.7.1.bb, do_populate_sysroot which could be accelerat=
ed
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/libxml/libxml2_2.9.1.bb, do_populate_sysroot which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/waylan=
d/wayland_1.6.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/waylan=
d/wayland_1.6.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/waylan=
d/wayland_1.6.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/waylan=
d/wayland_1.6.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxxf86vm_1.1.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxxf86vm_1.1.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxxf86vm_1.1.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxxf86vm_1.1.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdamage_1.1.4.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdamage_1.1.4.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdamage_1.1.4.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxdamage_1.1.4.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfixes_5.0.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfixes_5.0.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfixes_5.0.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxfixes_5.0.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxcb_1.10.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxcb_1.10.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxcb_1.10.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libxcb_1.10.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-proto/xproto_7.0.26.bb, do_populate_sysroot which could be ac=
celerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/ac=
l_2.2.52.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/ac=
l_2.2.52.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/ac=
l_2.2.52.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/ac=
l_2.2.52.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glib-2.0/g=
lib-2.0_2.40.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glib-2.0/g=
lib-2.0_2.40.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glib-2.0/g=
lib-2.0_2.40.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glib-2.0/g=
lib-2.0_2.40.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb-compat_0.1.5.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb-compat_0.1.5.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb-compat_0.1.5.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb-compat_0.1.5.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/usbutils/us=
butils_007.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/usbutils/us=
butils_007.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/usbutils/us=
butils_007.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/usbutils/us=
butils_007.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/pciutils/pc=
iutils_3.2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/pciutils/pc=
iutils_3.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/pciutils/pc=
iutils_3.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-bsp/pciutils/pc=
iutils_3.2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/libxslt/libxslt_1.1.28.bb, do_populate_sysroot which could be accel=
erated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/util-linux=
/util-linux_2.24.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/util-linux=
/util-linux_2.24.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/util-linux=
/util-linux_2.24.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/util-linux=
/util-linux_2.24.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/kmod/kmo=
d_git.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/kmod/kmo=
d_git.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/kmod/kmo=
d_git.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-kernel/kmod/kmo=
d_git.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/update-rc.d/update-rc.d_0.7.bb, do_populate_sysroot which could be acc=
elerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/initscript=
s/initscripts_1.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/initscript=
s/initscripts_1.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/initscript=
s/initscripts_1.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/initscript=
s/initscripts_1.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/intltool/intltool_0.50.2.bb, do_populate_sysroot which could be ac=
celerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-util/util-macros_1.19.0.bb, do_populate_sysroot which could b=
e accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/xz/xz_5.1.3alpha.bb, do_populate_sysroot which could be accelerate=
d
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/ncurses/ncurses_5.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/db/db_6=
.0.30.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/db/db_6=
.0.30.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/db/db_6=
.0.30.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/db/db_6=
.0.30.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gdbm/gd=
bm_1.11.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gdbm/gd=
bm_1.11.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gdbm/gd=
bm_1.11.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gdbm/gd=
bm_1.11.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/perl/p=
erl-native_5.20.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/flex/f=
lex_2.5.39.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/flex/f=
lex_2.5.39.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/flex/f=
lex_2.5.39.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/flex/f=
lex_2.5.39.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/opkg-u=
tils/opkg-utils_git.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/opkg-u=
tils/opkg-utils_git.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/opkg-u=
tils/opkg-utils_git.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/opkg-u=
tils/opkg-utils_git.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-app/mkfontscale_1.1.1.bb, do_populate_sysroot which could be =
accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-font/font-util_1.3.0.bb, do_populate_sysroot which could be a=
ccelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/sed/se=
d_4.2.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/sed/se=
d_4.2.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/sed/se=
d_4.2.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bash/b=
ash_4.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bash/b=
ash_4.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bash/b=
ash_4.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/coreutils/=
coreutils_8.22.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/coreutils/=
coreutils_8.22.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/coreutils/=
coreutils_8.22.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow_4.2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow_4.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow_4.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow_4.2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gnome-d=
esktop-testing/gnome-desktop-testing_2014.1.bb, do_packagedata which could =
be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gnome-d=
esktop-testing/gnome-desktop-testing_2014.1.bb, do_package which could be a=
ccelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gnome-d=
esktop-testing/gnome-desktop-testing_2014.1.bb, do_package_write_rpm which =
could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/tzdata=
/tzdata_2014j.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/tzdata=
/tzdata_2014j.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/tzdata=
/tzdata_2014j.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-pygobject_2.28.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-pygobject_2.28.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-pygobject_2.28.3.bb, do_package_write_rpm which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-dbus_1.2.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-dbus_1.2.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-dbus_1.2.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/shared-=
mime-info/shared-mime-info_1.3.bb, do_packagedata which could be accelerate=
d
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/shared-=
mime-info/shared-mime-info_1.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/shared-=
mime-info/shared-mime-info_1.3.bb, do_package_write_rpm which could be acce=
lerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-locale_2.20.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-locale_2.20.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/glib=
c-locale_2.20.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/ncurses/nc=
urses_5.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/ncurses/nc=
urses_5.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/ncurses/nc=
urses_5.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/ncurses/nc=
urses_5.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/perl/libxml-parser-perl_2.41.bb, do_populate_sysroot which could b=
e accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/diffut=
ils/diffutils_3.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/diffut=
ils/diffutils_3.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/diffut=
ils/diffutils_3.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/m4/m4_=
1.4.17.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/m4/m4_=
1.4.17.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/m4/m4_=
1.4.17.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python_2.7.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python_2.7.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python_2.7.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python_2.7.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
kernel/cryptodev/cryptodev-linux_1.6.bb, do_populate_sysroot which could be=
 accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/bzip2/bzip2_1.0.6.bb, do_populate_sysroot which could be accelerat=
ed
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/readline/readline_6.3.bb, do_populate_sysroot which could be accelerat=
ed
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/unifdef/unifdef_2.10.bb, do_populate_sysroot which could be accele=
rated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/at=
tr_2.4.47.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/at=
tr_2.4.47.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/at=
tr_2.4.47.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/attr/at=
tr_2.4.47.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/pigz/pigz_2.3.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-gnome/libffi/li=
bffi_3.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-gnome/libffi/li=
bffi_3.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-gnome/libffi/li=
bffi_3.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-gnome/libffi/li=
bffi_3.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/wayland/wayland_1.6.0.bb, do_populate_sysroot which could be accel=
erated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcb-proto_1.10.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcb-proto_1.10.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcb-proto_1.10.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-p=
roto/xcb-proto_1.10.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-proto/xcb-proto_1.10.bb, do_populate_sysroot which could be a=
ccelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/glib-2.0/glib-2.0_2.40.0.bb, do_populate_sysroot which could be accele=
rated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus_=
1.8.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus_=
1.8.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus_=
1.8.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus_=
1.8.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_populate_sysroot which could be =
accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb1_1.0.19.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb1_1.0.19.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb1_1.0.19.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/libusb/=
libusb1_1.0.19.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bzip2/=
bzip2_1.0.6.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bzip2/=
bzip2_1.0.6.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bzip2/=
bzip2_1.0.6.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/bzip2/=
bzip2_1.0.6.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/xorg-lib/libfontenc_1.1.2.bb, do_populate_sysroot which could be a=
ccelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
graphics/freetype/freetype_2.5.3.bb, do_populate_sysroot which could be acc=
elerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gmp/gmp=
_6.0.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gmp/gmp=
_6.0.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gmp/gmp=
_6.0.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/gmp/gmp=
_6.0.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
extended/shadow/shadow_4.2.1.bb, do_populate_sysroot which could be acceler=
ated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/tzcode=
/tzcode-native_2014j.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
devtools/python/python-pygobject_2.28.3.bb, do_populate_sysroot which could=
 be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus-=
glib_0.100.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus-=
glib_0.100.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus-=
glib_0.100.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/dbus/dbus-=
glib_0.100.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/python=
/python-pyrex-native_0.9.9.bb, do_populate_sysroot which could be accelerat=
ed
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/libxml/lib=
xml2_2.9.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/libxml/lib=
xml2_2.9.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/libxml/lib=
xml2_2.9.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/libxml/lib=
xml2_2.9.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
support/shared-mime-info/shared-mime-info_1.3.bb, do_populate_sysroot which=
 could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/glibc/cros=
s-localedef-native_2.20.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/expat/expat_2.1.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/readline/r=
eadline_6.3.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/readline/r=
eadline_6.3.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/readline/r=
eadline_6.3.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/readline/r=
eadline_6.3.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/sqlite/=
sqlite3_3.8.6.0.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/sqlite/=
sqlite3_3.8.6.0.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/sqlite/=
sqlite3_3.8.6.0.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-support/sqlite/=
sqlite3_3.8.6.0.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-files=
/base-files_3.0.14.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-files=
/base-files_3.0.14.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-files=
/base-files_3.0.14.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-files=
/base-files_3.0.14.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-securetty_4.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-securetty_4.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-securetty_4.2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-passw=
d/base-passwd_3.5.29.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-passw=
d/base-passwd_3.5.29.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-passw=
d/base-passwd_3.5.29.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-core/base-passw=
d/base-passwd_3.5.29.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
gnome/libffi/libffi_3.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-sysroot_4.2.1.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-sysroot_4.2.1.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-sysroot_4.2.1.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-extended/shadow=
/shadow-sysroot_4.2.1.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libsm_1.2.2.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libsm_1.2.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libsm_1.2.2.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libsm_1.2.2.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/dbus/dbus-glib_0.100.2.bb, do_populate_sysroot which could be accelera=
ted
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libice_1.0.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libice_1.0.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libice_1.0.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-l=
ib/libice_1.0.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/e2fspr=
ogs/e2fsprogs_1.42.9.bb, do_populate_sysroot which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/e2fspr=
ogs/e2fsprogs_1.42.9.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/e2fspr=
ogs/e2fsprogs_1.42.9.bb, do_package which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-devtools/e2fspr=
ogs/e2fsprogs_1.42.9.bb, do_package_write_rpm which could be accelerated
DEBUG: Found task virtual:native:/home/alimon/repos/poky-bugs/meta/recipes-=
core/dbus/dbus_1.8.2.bb, do_populate_sysroot which could be accelerated
NOTE: Executing SetScene Tasks
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/base.bbclass (f=
rom configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/patch.bbclass (=
from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:4)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/terminal.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/patch.bbclass:8)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/staging.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:5)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/mirrors.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:7)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/utils.bbclass (=
from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:8)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/utility-tasks.b=
bclass (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:9)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/metadata_scm.bb=
class (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:10)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/logging.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/base.bbclass:11)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta-yocto/classes/poky-sani=
ty.bbclass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/package_rpm.bbc=
lass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/package.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/package_rpm.bbclass:1)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/packagedata.bbc=
lass (from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:41)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/prserv.bbclass =
(from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:42)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/chrpath.bbclass=
 (from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:43)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/insane.bbclass =
(from /home/alimon/repos/poky-bugs/meta/classes/package.bbclass:46)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/buildstats.bbcl=
ass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/image-mklibs.bb=
class (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/image-prelink.b=
bclass (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/debian.bbclass =
(from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/devshell.bbclas=
s (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/sstate.bbclass =
(from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/license.bbclass=
 (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/blacklist.bbcla=
ss (from configuration INHERITs:0)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/sanity.bbclass =
(from configuration INHERITs:0)
DEBUG: Using cache in '/home/alimon/repos/poky-bugs/build/cache/bb_codepars=
er.dat'
NOTE: Running setscene task 519 of 524 (/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_populate_sysroot_se=
tscene)
NOTE: Running setscene task 520 of 524 (/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_populate_lic_setsce=
ne)
NOTE: Running setscene task 521 of 524 (/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_package_qa_setscene=
)
NOTE: Running setscene task 522 of 524 (/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_package_write_rpm_s=
etscene)
DEBUG: Parsing /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xser=
ver/xserver-xorg_1.16.2.bb (full)
DEBUG: Parsing /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xser=
ver/xserver-xorg_1.16.2.bb (full)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/autotools.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteinfo.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:26)
DEBUG: Parsing /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xser=
ver/xserver-xorg_1.16.2.bb (full)
DEBUG: Parsing /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xser=
ver/xserver-xorg_1.16.2.bb (full)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/autotools.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteinfo.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:26)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteconfig.bbcl=
ass (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:302)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/pkgconfig.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/autotools.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/autotools.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteconfig.bbcl=
ass (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:302)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteinfo.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:26)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteinfo.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:26)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/pkgconfig.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteconfig.bbcl=
ass (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:302)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteconfig.bbcl=
ass (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:302)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/pkgconfig.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/pkgconfig.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: Executing task do_populate_sysroot_setscene
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: Executing task do_populate_lic_setscene
NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_populate_sysroot_setscene: S=
tarted
NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_populate_lic_setscene: Start=
ed
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-populate_sysroot/
+ sstate_unpack_package
+ mkdir -p /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xser=
ver-xorg/2_1.16.2-r0/sstate-install-populate_sysroot/

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-populate_sysroot/
+ tar -xmvzf /home/alimon/repos/poky-bugs/build/sstate-cache/6f/sstate:xser=
ver-xorg:i586-poky-linux:1.16.2:r0:i586:3:6f5a8a308230196abf7c3a16a690ee0c_=
populate_sysroot.tgz

sysroot-destdir/

sysroot-destdir/sysroot-providers/
sysroot-destdir/sysroot-providers/xserver-xorg
sysroot-destdir/sysroot-providers/virtual_xserver-xf86
sysroot-destdir/usr/
sysroot-destdir/usr/share/
sysroot-destdir/usr/share/aclocal/
sysroot-destdir/usr/share/aclocal/xorg-server.m4
sysroot-destdir/usr/share/X11/
sysroot-destdir/usr/share/X11/xorg.conf.d/
sysroot-destdir/usr/share/X11/xorg.conf.d/10-evdev.conf

sysroot-destdir/usr/share/X11/xorg.conf.d/10-quirks.conf
sysroot-destdir/usr/lib/
sysroot-destdir/usr/lib/pkgconfig/
sysroot-destdir/usr/lib/pkgconfig/xorg-server.pc
sysroot-destdir/usr/lib/xorg/
sysroot-destdir/usr/lib/xorg/protocol.txt

sysroot-destdir/usr/lib/xorg/modules/
sysroot-destdir/usr/lib/xorg/modules/libwfb.la
sysroot-destdir/usr/lib/xorg/modules/extensions/
sysroot-destdir/usr/lib/xorg/modules/extensions/libglx.la
sysroot-destdir/usr/lib/xorg/modules/extensions/libglx.so

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-populate_lic/
+ sstate_unpack_package
+ mkdir -p /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xser=
ver-xorg/2_1.16.2-r0/sstate-install-populate_lic/

DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-populate_lic/
+ tar -xmvzf /home/alimon/repos/poky-bugs/build/sstate-cache/31/sstate:xser=
ver-xorg::1.16.2:r0::3:317f6d992c3ea79c6b118ae7f2029d68_populate_lic.tgz

license-destdir/

license-destdir/xserver-xorg/
license-destdir/xserver-xorg/COPYING
license-destdir/xserver-xorg/generic_MIT-X

+ [ ! -w /home/alimon/repos/poky-bugs/build/sstate-cache/31/sstate:xserver-=
xorg::1.16.2:r0::3:317f6d992c3ea79c6b118ae7f2029d68_populate_lic.tgz ]
+ touch --no-dereference /home/alimon/repos/poky-bugs/build/sstate-cache/31=
/sstate:xserver-xorg::1.16.2:r0::3:317f6d992c3ea79c6b118ae7f2029d68_populat=
e_lic.tgz

DEBUG: Executing task do_package_write_rpm_setscene
+ ret=3D0
+ trap  0
+ exit 0

DEBUG: Executing task do_package_qa_setscene
sysroot-destdir/usr/lib/xorg/modules/libshadow.la

sysroot-destdir/usr/lib/xorg/modules/libfb.so

sysroot-destdir/usr/lib/xorg/modules/libvbe.la
sysroot-destdir/usr/lib/xorg/modules/libvgahw.la

sysroot-destdir/usr/lib/xorg/modules/multimedia/
sysroot-destdir/usr/lib/xorg/modules/multimedia/fi1236_drv.so

sysroot-destdir/usr/lib/xorg/modules/multimedia/bt829_drv.so

sysroot-destdir/usr/lib/xorg/modules/multimedia/tda9885_drv.so

sysroot-destdir/usr/lib/xorg/modules/multimedia/tda9850_drv.so

sysroot-destdir/usr/lib/xorg/modules/multimedia/msp3430_drv.la

sysroot-destdir/usr/lib/xorg/modules/multimedia/msp3430_drv.so

sysroot-destdir/usr/lib/xorg/modules/multimedia/uda1380_drv.la

sysroot-destdir/usr/lib/xorg/modules/multimedia/tda9850_drv.la
sysroot-destdir/usr/lib/xorg/modules/multimedia/tda9885_drv.la
sysroot-destdir/usr/lib/xorg/modules/multimedia/tda8425_drv.la
sysroot-destdir/usr/lib/xorg/modules/multimedia/tda8425_drv.so
sysroot-destdir/usr/lib/xorg/modules/multimedia/bt829_drv.la
sysroot-destdir/usr/lib/xorg/modules/multimedia/fi1236_drv.la
sysroot-destdir/usr/lib/xorg/modules/multimedia/uda1380_drv.so

sysroot-destdir/usr/lib/xorg/modules/libint10.la
sysroot-destdir/usr/lib/xorg/modules/libfbdevhw.so

sysroot-destdir/usr/lib/xorg/modules/libshadowfb.so

NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_package_write_rpm_setscene: =
Started
NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_package_qa_setscene: Started
sysroot-destdir/usr/lib/xorg/modules/libshadowfb.la

sysroot-destdir/usr/lib/xorg/modules/libexa.la

sysroot-destdir/usr/lib/xorg/modules/libshadow.so

NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_populate_lic_setscene: Succe=
eded
sysroot-destdir/usr/lib/xorg/modules/libvgahw.so

sysroot-destdir/usr/lib/xorg/modules/libfb.la

sysroot-destdir/usr/lib/xorg/modules/libexa.so

DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_populate_lic which could be accelerated
sysroot-destdir/usr/lib/xorg/modules/libfbdevhw.la

sysroot-destdir/usr/lib/xorg/modules/libint10.so

sysroot-destdir/usr/lib/xorg/modules/libwfb.so

DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
sysroot-destdir/usr/lib/xorg/modules/libvbe.so

sysroot-destdir/usr/include/

sysroot-destdir/usr/include/xorg/
sysroot-destdir/usr/include/xorg/xisb.h
sysroot-destdir/usr/include/xorg/xf86.h
sysroot-destdir/usr/include/xorg/vbeModes.h
sysroot-destdir/usr/include/xorg/dix.h

sysroot-destdir/usr/include/xorg/xorgVersion.h

sysroot-destdir/usr/include/xorg/swaprep.h
sysroot-destdir/usr/include/xorg/xf86Xinput.h
sysroot-destdir/usr/include/xorg/xf86_OSproc.h

sysroot-destdir/usr/include/xorg/tda9850.h
sysroot-destdir/usr/include/xorg/dgaproc.h
sysroot-destdir/usr/include/xorg/picturestr.h
sysroot-destdir/usr/include/xorg/dristruct.h
sysroot-destdir/usr/include/xorg/present.h

sysroot-destdir/usr/include/xorg/dixaccess.h
sysroot-destdir/usr/include/xorg/tda9885.h

sysroot-destdir/usr/include/xorg/validate.h
sysroot-destdir/usr/include/xorg/registry.h
sysroot-destdir/usr/include/xorg/dri2.h
sysroot-destdir/usr/include/xorg/xf86VGAarbiter.h

sysroot-destdir/usr/include/xorg/xkbfile.h
sysroot-destdir/usr/include/xorg/xf86Optrec.h
sysroot-destdir/usr/include/xorg/dixfont.h

sysroot-destdir/usr/include/xorg/xf86RandR12.h
sysroot-destdir/usr/include/xorg/xfixes.h
sysroot-destdir/usr/include/xorg/mifillarc.h

sysroot-destdir/usr/include/xorg/xf86Optionstr.h
sysroot-destdir/usr/include/xorg/xf86xvpriv.h
sysroot-destdir/usr/include/xorg/xf86Pci.h
sysroot-destdir/usr/include/xorg/extinit.h

sysroot-destdir/usr/include/xorg/hotplug.h

sysroot-destdir/usr/include/xorg/xf86Cursor.h
sysroot-destdir/usr/include/xorg/exa.h

sysroot-destdir/usr/include/xorg/xvmcext.h

sysroot-destdir/usr/include/xorg/xf86Privstr.h

sysroot-destdir/usr/include/xorg/geint.h

sysroot-destdir/usr/include/xorg/misync.h
sysroot-destdir/usr/include/xorg/geext.h
sysroot-destdir/usr/include/xorg/Xprintf.h
sysroot-destdir/usr/include/xorg/IBM.h
sysroot-destdir/usr/include/xorg/miwideline.h
sysroot-destdir/usr/include/xorg/site.h
sysroot-destdir/usr/include/xorg/privates.h
sysroot-destdir/usr/include/xorg/cursorstr.h

sysroot-destdir/usr/include/xorg/misc.h

sysroot-destdir/usr/include/xorg/rgb.h

sysroot-destdir/usr/include/xorg/compiler.h
sysroot-destdir/usr/include/xorg/fbdevhw.h
sysroot-destdir/usr/include/xorg/bt829.h
sysroot-destdir/usr/include/xorg/dri.h

sysroot-destdir/usr/include/xorg/xf86RamDac.h

sysroot-destdir/usr/include/xorg/msp3430.h

sysroot-destdir/usr/include/xorg/xf86DDC.h
sysroot-destdir/usr/include/xorg/mipict.h

sysroot-destdir/usr/include/xorg/propertyst.h
sysroot-destdir/usr/include/xorg/xkbstr.h
sysroot-destdir/usr/include/xorg/dixevents.h
sysroot-destdir/usr/include/xorg/xf86str.h
sysroot-destdir/usr/include/xorg/xacestr.h
sysroot-destdir/usr/include/xorg/xf86Parser.h
sysroot-destdir/usr/include/xorg/mipointer.h

sysroot-destdir/usr/include/xorg/dixfontstr.h
sysroot-destdir/usr/include/xorg/servermd.h
sysroot-destdir/usr/include/xorg/damagestr.h

sysroot-destdir/usr/include/xorg/dbestruct.h

sysroot-destdir/usr/include/xorg/fbrop.h
sysroot-destdir/usr/include/xorg/xaarop.h

sysroot-destdir/usr/include/xorg/vidmodeproc.h
sysroot-destdir/usr/include/xorg/extension.h
sysroot-destdir/usr/include/xorg/inputstr.h

sysroot-destdir/usr/include/xorg/xf86PciInfo.h

sysroot-destdir/usr/include/xorg/misyncstr.h

sysroot-destdir/usr/include/xorg/xf86sbusBus.h
sysroot-destdir/usr/include/xorg/opaque.h
sysroot-destdir/usr/include/xorg/dixstruct.h
sysroot-destdir/usr/include/xorg/fb.h

sysroot-destdir/usr/include/xorg/miline.h

sysroot-destdir/usr/include/xorg/list.h

sysroot-destdir/usr/include/xorg/os.h
sysroot-destdir/usr/include/xorg/closure.h
sysroot-destdir/usr/include/xorg/regionstr.h
sysroot-destdir/usr/include/xorg/misyncshm.h
sysroot-destdir/usr/include/xorg/uda1380.h
sysroot-destdir/usr/include/xorg/xf86Opt.h

sysroot-destdir/usr/include/xorg/colormap.h
sysroot-destdir/usr/include/xorg/vgaHW.h
sysroot-destdir/usr/include/xorg/mizerarc.h
sysroot-destdir/usr/include/xorg/gcstruct.h
sysroot-destdir/usr/include/xorg/shmint.h
sysroot-destdir/usr/include/xorg/property.h
sysroot-destdir/usr/include/xorg/resource.h

sysroot-destdir/usr/include/xorg/xorg-server.h
sysroot-destdir/usr/include/xorg/selection.h
sysroot-destdir/usr/include/xorg/exevents.h
sysroot-destdir/usr/include/xorg/xf86Crtc.h

sysroot-destdir/usr/include/xorg/migc.h

sysroot-destdir/usr/include/xorg/xf86cmap.h
sysroot-destdir/usr/include/xorg/events.h
sysroot-destdir/usr/include/xorg/window.h
sysroot-destdir/usr/include/xorg/mipointrst.h
sysroot-destdir/usr/include/xorg/optionstr.h
sysroot-destdir/usr/include/xorg/vbe.h

sysroot-destdir/usr/include/xorg/fbpict.h
sysroot-destdir/usr/include/xorg/fi1236.h
sysroot-destdir/usr/include/xorg/mispans.h
sysroot-destdir/usr/include/xorg/xf86_OSlib.h

sysroot-destdir/usr/include/xorg/pixmapstr.h
sysroot-destdir/usr/include/xorg/extnsionst.h
sysroot-destdir/usr/include/xorg/fourcc.h
sysroot-destdir/usr/include/xorg/mioverlay.h
sysroot-destdir/usr/include/xorg/xf86i2c.h
sysroot-destdir/usr/include/xorg/xf86int10.h
sysroot-destdir/usr/include/xorg/rrtransform.h

sysroot-destdir/usr/include/xorg/gc.h
sysroot-destdir/usr/include/xorg/ptrveloc.h
sysroot-destdir/usr/include/xorg/xkbsrv.h

sysroot-destdir/usr/include/xorg/mi.h
sysroot-destdir/usr/include/xorg/TI.h
sysroot-destdir/usr/include/xorg/input.h

sysroot-destdir/usr/include/xorg/cursor.h

sysroot-destdir/usr/include/xorg/xf86xv.h
sysroot-destdir/usr/include/xorg/dixgrabs.h
sysroot-destdir/usr/include/xorg/xf86Priv.h
sysroot-destdir/usr/include/xorg/misyncfd.h
sysroot-destdir/usr/include/xorg/xf86fbman.h
sysroot-destdir/usr/include/xorg/colormapst.h
sysroot-destdir/usr/include/xorg/randrstr.h

sysroot-destdir/usr/include/xorg/syncsdk.h

sysroot-destdir/usr/include/xorg/xvdix.h
sysroot-destdir/usr/include/xorg/tda8425.h
sysroot-destdir/usr/include/xorg/glyphstr.h
sysroot-destdir/usr/include/xorg/micoord.h
sysroot-destdir/usr/include/xorg/xf86Module.h

sysroot-destdir/usr/include/xorg/picture.h
sysroot-destdir/usr/include/xorg/xf86Modes.h
sysroot-destdir/usr/include/xorg/globals.h
sysroot-destdir/usr/include/xorg/xf86xvmc.h
sysroot-destdir/usr/include/xorg/BT.h
sysroot-destdir/usr/include/xorg/presentext.h

sysroot-destdir/usr/include/xorg/swapreq.h
sysroot-destdir/usr/include/xorg/miscstruct.h
sysroot-destdir/usr/include/xorg/glx_extinit.h
sysroot-destdir/usr/include/xorg/client.h
sysroot-destdir/usr/include/xorg/xkbrules.h
sysroot-destdir/usr/include/xorg/damage.h
sysroot-destdir/usr/include/xorg/xace.h

sysroot-destdir/usr/include/xorg/mistruct.h
sysroot-destdir/usr/include/xorg/edid.h
sysroot-destdir/usr/include/xorg/shadow.h
sysroot-destdir/usr/include/xorg/xf86platformBus.h

sysroot-destdir/usr/include/xorg/shadowfb.h
sysroot-destdir/usr/include/xorg/pixmap.h
sysroot-destdir/usr/include/xorg/sarea.h
sysroot-destdir/usr/include/xorg/compositeext.h
sysroot-destdir/usr/include/xorg/screenint.h
sysroot-destdir/usr/include/xorg/callback.h
sysroot-destdir/usr/include/xorg/wfbrename.h
sysroot-destdir/usr/include/xorg/mifpoly.h

sysroot-destdir/usr/include/xorg/XIstubs.h
sysroot-destdir/usr/include/xorg/region.h
sysroot-destdir/usr/include/xorg/scrnintstr.h
sysroot-destdir/usr/include/xorg/i2c_def.h
sysroot-destdir/usr/include/xorg/micmap.h
sysroot-destdir/usr/include/xorg/closestr.h
sysroot-destdir/usr/include/xorg/windowstr.h
sysroot-destdir/usr/include/xorg/fboverlay.h

sysroot-destdir/usr/include/xorg/xserver-properties.h

+ [ ! -w /home/alimon/repos/poky-bugs/build/sstate-cache/6f/sstate:xserver-=
xorg:i586-poky-linux:1.16.2:r0:i586:3:6f5a8a308230196abf7c3a16a690ee0c_popu=
late_sysroot.tgz ]
+ touch --no-dereference /home/alimon/repos/poky-bugs/build/sstate-cache/6f=
/sstate:xserver-xorg:i586-poky-linux:1.16.2:r0:i586:3:6f5a8a308230196abf7c3=
a16a690ee0c_populate_sysroot.tgz

+ ret=3D0
+ trap  0
+ exit 0

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-package_write_rpm/
+ sstate_unpack_package
+ mkdir -p /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xser=
ver-xorg/2_1.16.2-r0/sstate-install-package_write_rpm/

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-package_qa/
+ sstate_unpack_package
+ mkdir -p /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xser=
ver-xorg/2_1.16.2-r0/sstate-install-package_qa/

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-package_write_rpm/
+ tar -xmvzf /home/alimon/repos/poky-bugs/build/sstate-cache/c0/sstate:xser=
ver-xorg:i586-poky-linux:1.16.2:r0:i586:3:c023ccb17f7970a4d57f63858882a035_=
package_write_rpm.tgz

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-package_qa/
+ tar -xmvzf /home/alimon/repos/poky-bugs/build/sstate-cache/65/sstate:xser=
ver-xorg:i586-poky-linux:1.16.2:r0:i586:3:65f9afdb8ef84a8ee9ef493fc2bef027_=
package_qa.tgz

+ [ ! -w /home/alimon/repos/poky-bugs/build/sstate-cache/65/sstate:xserver-=
xorg:i586-poky-linux:1.16.2:r0:i586:3:65f9afdb8ef84a8ee9ef493fc2bef027_pack=
age_qa.tgz ]
+ touch --no-dereference /home/alimon/repos/poky-bugs/build/sstate-cache/65=
/sstate:xserver-xorg:i586-poky-linux:1.16.2:r0:i586:3:65f9afdb8ef84a8ee9ef4=
93fc2bef027_package_qa.tgz

+ ret=3D0
+ trap  0
+ exit 0

deploy-rpms/

deploy-rpms/i586/
deploy-rpms/i586/xserver-xorg-multimedia-modules-1.16.2-r0.i586.rpm
deploy-rpms/i586/xserver-xorg-dbg-1.16.2-r0.i586.rpm

NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_package_qa_setscene: Succeed=
ed
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_package_qa which could be accelerated
NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_populate_sysroot_setscene: S=
ucceeded
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_populate_sysroot which could be accelerat=
ed
deploy-rpms/i586/xserver-xorg-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-xvfb-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-utils-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-doc-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-extension-glx-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-dev-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-module-libwfb-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-module-libint10-1.16.2-r0.i586.rpm

deploy-rpms/i586/xserver-xorg-module-exa-1.16.2-r0.i586.rpm

+ [ ! -w /home/alimon/repos/poky-bugs/build/sstate-cache/c0/sstate:xserver-=
xorg:i586-poky-linux:1.16.2:r0:i586:3:c023ccb17f7970a4d57f63858882a035_pack=
age_write_rpm.tgz ]
+ touch --no-dereference /home/alimon/repos/poky-bugs/build/sstate-cache/c0=
/sstate:xserver-xorg:i586-poky-linux:1.16.2:r0:i586:3:c023ccb17f7970a4d57f6=
3858882a035_package_write_rpm.tgz

+ ret=3D0
+ trap  0

NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_package_write_rpm_setscene: =
Succeeded
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_package_write_rpm which could be accelera=
ted
NOTE: Running setscene task 523 of 524 (/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_packagedata_setscen=
e)
DEBUG: Parsing /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xser=
ver/xserver-xorg_1.16.2.bb (full)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/autotools.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteinfo.bbclas=
s (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:26)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/siteconfig.bbcl=
ass (from /home/alimon/repos/poky-bugs/meta/classes/autotools.bbclass:302)
DEBUG: Inheriting /home/alimon/repos/poky-bugs/meta/classes/pkgconfig.bbcla=
ss (from /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg.inc:24)
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
DEBUG: Executing task do_packagedata_setscene
NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_packagedata_setscene: Starte=
d
DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux'=
, 'common-glibc', 'i586-linux', 'common']
+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-packagedata/
+ sstate_unpack_package
+ mkdir -p /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xser=
ver-xorg/2_1.16.2-r0/sstate-install-packagedata/

+ cd /home/alimon/repos/poky-bugs/build/tmp/work/i586-poky-linux/xserver-xo=
rg/2_1.16.2-r0/sstate-install-packagedata/
+ tar -xmvzf /home/alimon/repos/poky-bugs/build/sstate-cache/b9/sstate:xser=
ver-xorg:i586-poky-linux:1.16.2:r0:i586:3:b9c8f9c785c2d622289feeef42cdb391_=
packagedata.tgz

pkgdata/

pkgdata/runtime-rprovides/
pkgdata/runtime-rprovides/xserver-xorg-extension-record/
pkgdata/runtime-rprovides/xserver-xorg-extension-record/xserver-xorg
pkgdata/runtime-rprovides/xorg-abi-input-21/
pkgdata/runtime-rprovides/xorg-abi-input-21/xserver-xorg
pkgdata/runtime-rprovides/xserver-xorg-extension-dri2/
pkgdata/runtime-rprovides/xserver-xorg-extension-dri2/xserver-xorg
pkgdata/runtime-rprovides/xorg-abi-video-18/
pkgdata/runtime-rprovides/xorg-abi-video-18/xserver-xorg

pkgdata/runtime-rprovides/xserver-xorg-extension-extmod/
pkgdata/runtime-rprovides/xserver-xorg-extension-extmod/xserver-xorg
pkgdata/runtime-rprovides/xserver-xorg-extension-dri/
pkgdata/runtime-rprovides/xserver-xorg-extension-dri/xserver-xorg
pkgdata/runtime-rprovides/xserver-xorg-extension-dbe/
pkgdata/runtime-rprovides/xserver-xorg-extension-dbe/xserver-xorg
pkgdata/xserver-xorg

pkgdata/runtime-reverse/
pkgdata/runtime-reverse/xserver-xorg-doc
pkgdata/runtime-reverse/xserver-xorg
pkgdata/runtime-reverse/xserver-xorg-module-libint10
pkgdata/runtime-reverse/xserver-xorg-dev
pkgdata/runtime-reverse/xserver-xorg-module-libwfb

pkgdata/runtime-reverse/xserver-xorg-extension-glx
pkgdata/runtime-reverse/xserver-xorg-dbg
pkgdata/runtime-reverse/xserver-xorg-xvfb
pkgdata/runtime-reverse/xserver-xorg-module-exa
pkgdata/runtime-reverse/xserver-xorg-utils
pkgdata/runtime-reverse/xserver-xorg-multimedia-modules
pkgdata/runtime/
pkgdata/runtime/xserver-xorg-doc

pkgdata/runtime/xserver-xorg-module-libwfb.packaged
pkgdata/runtime/xserver-xorg-staticdev
pkgdata/runtime/xserver-xorg
pkgdata/runtime/xserver-xorg-extension-record
pkgdata/runtime/xserver-xorg-module-libxf4bpp
pkgdata/runtime/xserver-xorg-extension-dri2
pkgdata/runtime/xserver-xorg-module-libint10

pkgdata/runtime/xserver-xorg-sdl
pkgdata/runtime/xserver-xorg-extension-glx.packaged
pkgdata/runtime/xserver-xorg-module-libint10.packaged
pkgdata/runtime/xserver-xorg-xephyr
pkgdata/runtime/xserver-xorg-module-libmfb
pkgdata/runtime/xserver-xorg-dev

pkgdata/runtime/xserver-xorg-extension-extmod
pkgdata/runtime/xserver-xorg-locale
pkgdata/runtime/xserver-xorg-multimedia-modules.packaged
pkgdata/runtime/xserver-xorg-module-libwfb
pkgdata/runtime/xserver-xorg-extension-glx
pkgdata/runtime/xserver-xorg-dbg

pkgdata/runtime/xserver-xorg-extension-dri
pkgdata/runtime/xserver-xorg-module-xaa
pkgdata/runtime/xserver-xorg-utils.packaged
pkgdata/runtime/xserver-xorg-xvfb
pkgdata/runtime/xserver-xorg-xvfb.packaged
pkgdata/runtime/xserver-xorg-dbg.packaged
pkgdata/runtime/xserver-xorg-module-exa

pkgdata/runtime/xserver-xorg-utils
pkgdata/runtime/xserver-xorg-module-libafb
pkgdata/runtime/xserver-xorg-doc.packaged
pkgdata/runtime/xserver-xorg-module-libcfb
pkgdata/runtime/xserver-xorg-multimedia-modules
pkgdata/runtime/xserver-xorg-module-exa.packaged
pkgdata/runtime/xserver-xorg.packaged
pkgdata/runtime/xserver-xorg-fbdev

pkgdata/runtime/xserver-xorg-module-libxf1bpp
pkgdata/runtime/xserver-xorg-security-policy
pkgdata/runtime/xserver-xorg-extension-dbe
pkgdata/runtime/xserver-xorg-dev.packaged
pkgdata/shlibs2/
pkgdata/shlibs2/xserver-xorg.list
pkgdata/shlibs2/xserver-xorg-module-exa.list

pkgdata/shlibs2/xserver-xorg-module-libint10.list
pkgdata/shlibs2/xserver-xorg-module-libwfb.list
pkgdata/shlibs2/xserver-xorg-dev.pclist
pkgdata/shlibs2/xserver-xorg-extension-glx.list
pkgdata/shlibs2/xserver-xorg-multimedia-modules.list

+ [ ! -w /home/alimon/repos/poky-bugs/build/sstate-cache/b9/sstate:xserver-=
xorg:i586-poky-linux:1.16.2:r0:i586:3:b9c8f9c785c2d622289feeef42cdb391_pack=
agedata.tgz ]
+ touch --no-dereference /home/alimon/repos/poky-bugs/build/sstate-cache/b9=
/sstate:xserver-xorg:i586-poky-linux:1.16.2:r0:i586:3:b9c8f9c785c2d622289fe=
eef42cdb391_packagedata.tgz

+ ret=3D0
+ trap  0
+ exit 0

NOTE: recipe xserver-xorg-2_1.16.2-r0: task do_packagedata_setscene: Succee=
ded
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_packagedata which could be accelerated
DEBUG: Found task /home/alimon/repos/poky-bugs/meta/recipes-graphics/xorg-x=
server/xserver-xorg_1.16.2.bb, do_package which could be accelerated
DEBUG: We can skip tasks [3, 7, 8, 9, 11, 12, 16, 23, 30, 37, 44, 51, 58, 6=
5, 72, 79, 83, 84, 85, 89, 96, 104, 109, 110, 111, 117, 121, 122, 123, 127,=
 131, 132, 133, 137, 141, 142, 143, 147, 151, 152, 153, 157, 161, 162, 163,=
 167, 171, 172, 173, 177, 181, 182, 183, 187, 191, 192, 193, 197, 201, 202,=
 203, 207, 211, 212, 213, 217, 221, 222, 223, 227, 231, 232, 233, 237, 241,=
 242, 243, 247, 251, 252, 253, 257, 261, 262, 263, 267, 271, 272, 273, 277,=
 281, 282, 283, 287, 291, 292, 293, 297, 301, 302, 303, 307, 311, 312, 313,=
 317, 321, 322, 323, 327, 331, 332, 333, 337, 341, 342, 343, 347, 351, 352,=
 353, 357, 361, 362, 363, 367, 371, 372, 373, 377, 381, 382, 383, 387, 391,=
 392, 393, 397, 401, 402, 403, 407, 411, 412, 413, 417, 421, 422, 423, 428,=
 434, 435, 436, 440, 444, 445, 446, 450, 454, 455, 456, 460, 464, 465, 466,=
 470, 474, 475, 476, 480, 484, 485, 486, 490, 494, 495, 496, 500, 504, 505,=
 506, 511, 517, 518, 519, 526, 527, 528, 535, 536, 537, 544, 545, 546, 553,=
 554, 555, 559, 569, 570, 571, 581, 582, 583, 590, 591, 592, 599, 600, 601,=
 608, 609, 610, 614, 618, 619, 620, 627, 628, 629, 633, 640, 647, 654, 661,=
 668, 675, 682, 689, 696, 703, 710, 717, 724, 731, 738, 745, 752, 756, 757,=
 758, 762, 769, 776, 785, 790, 791, 792, 796, 806, 811, 812, 813, 819, 823,=
 824, 825, 829, 836, 843, 847, 848, 849, 853, 857, 858, 859, 863, 871, 877,=
 878, 879, 883, 887, 888, 889, 893, 897, 898, 899, 903, 907, 908, 909, 913,=
 917, 918, 919, 923, 927, 928, 929, 933, 937, 938, 939, 943, 947, 948, 949,=
 953, 957, 958, 959, 963, 970, 977, 984, 991, 995, 996, 997, 1001, 1005, 10=
06, 1007, 1011, 1015, 1016, 1017, 1021, 1025, 1026, 1027, 1031, 1035, 1036,=
 1037, 1041, 1049, 1055, 1056, 1057, 1062, 1068, 1069, 1070, 1074, 1078, 10=
79, 1080, 1084, 1088, 1089, 1090, 1094, 1098, 1099, 1100, 1104, 1111, 1115,=
 1116, 1117, 1122, 1128, 1129, 1130, 1134, 1141, 1145, 1146, 1147, 1151, 11=
58, 1165, 1172, 1179, 1183, 1184, 1185, 1190, 1196, 1197, 1198, 1202, 1210,=
 1216, 1217, 1218, 1222, 1226, 1227, 1228, 1232, 1239, 1252, 1253, 1254, 12=
64, 1265, 1266, 1273, 1274, 1275, 1279, 1283, 1284, 1285, 1292, 1293, 1294,=
 1301, 1302, 1303, 1310, 1311, 1312, 1319, 1320, 1321, 1328, 1329, 1330, 13=
37, 1338, 1339, 1343, 1347, 1348, 1349, 1353, 1366, 1367, 1368, 1375, 1376,=
 1377, 1382, 1388, 1389, 1390, 1394, 1402, 1409, 1416, 1424, 1430, 1431, 14=
32, 1436, 1443, 1447, 1448, 1449, 1453, 1460, 1464, 1465, 1466, 1470, 1477,=
 1484, 1488, 1489, 1490, 1494, 1501, 1505, 1506, 1507, 1513, 1519, 1520, 15=
21, 1525, 1532, 1539, 1543, 1544, 1545, 1549, 1556, 1563, 1570, 1574, 1575,=
 1576, 1580, 1588, 1594, 1595, 1596, 1600, 1607, 1614, 1621, 1625, 1626, 16=
27, 1631, 1635, 1636, 1637, 1641, 1645, 1646, 1647, 1654, 1655, 1656, 1660,=
 1664, 1665, 1666, 1670, 1677, 1681, 1682, 1683, 1687, 1691, 1692, 1693, 16=
97, 1704, 1708, 1709, 1710, 1714, 1718, 1719, 1720, 1724]
NOTE: Executing RunQueue Tasks
DEBUG: Considering 0 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_unpack): set([1])
DEBUG: Considering 1 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_patch): set([5, 7])
DEBUG: Considering 4 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_fetch): set([0])
DEBUG: Considering 5 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_configure): set([6])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Considering 13 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_unpack): set([14])
DEBUG: Considering 14 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_patch): set([18])
DEBUG: Considering 17 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_fetch): set([13])
DEBUG: Considering 18 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_configure): set([19])
DEBUG: Considering 20 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_unpack): set([21])
DEBUG: Considering 21 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_patch): set([25])
DEBUG: Considering 24 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_fetch): set([20])
DEBUG: Considering 25 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_configure): set([26])
DEBUG: Considering 27 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_unpack): set([28])
DEBUG: Considering 28 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_patch): set([32])
DEBUG: Considering 31 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_fetch): set([27])
DEBUG: Considering 32 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_configure): set([33])
DEBUG: Considering 34 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_unpack): set([35])
DEBUG: Considering 35 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_patch): set([39])
DEBUG: Considering 38 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_fetch): set([34])
DEBUG: Considering 39 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_configure): set([40])
DEBUG: Considering 41 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_unpack): set([42])
DEBUG: Considering 42 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_patch): set([46])
DEBUG: Considering 45 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_fetch): set([41])
DEBUG: Considering 46 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_configure): set([47])
DEBUG: Considering 48 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_unpack): set([49])
DEBUG: Considering 49 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_patch): set([53])
DEBUG: Considering 52 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_fetch): set([48])
DEBUG: Considering 53 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_configure): set([54])
DEBUG: Considering 55 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_unpack): set([56])
DEBUG: Considering 56 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_patch): set([60])
DEBUG: Considering 59 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_fetch): set([55])
DEBUG: Considering 60 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_configure): set([61])
DEBUG: Considering 62 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_unpack): set([63])
DEBUG: Considering 63 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_patch): set([67])
DEBUG: Considering 66 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_fetch): set([62])
DEBUG: Considering 67 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_configure): set([68])
DEBUG: Considering 69 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_unpack): set([70])
DEBUG: Considering 70 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_patch): set([74])
DEBUG: Considering 73 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_fetch): set([69])
DEBUG: Considering 74 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_configure): set([75])
DEBUG: Considering 76 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_unpack): set([77])
DEBUG: Considering 77 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_patch): set([81])
DEBUG: Considering 80 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_fetch): set([76])
DEBUG: Considering 81 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_configure): set([82])
DEBUG: Considering 86 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_unpack): set([87])
DEBUG: Considering 87 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_patch): set([91])
DEBUG: Considering 90 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_fetch): set([86])
DEBUG: Considering 91 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_configure): set([92])
DEBUG: Considering 93 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_unpack): set([94])
DEBUG: Considering 94 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_patch): set([98, 99])
DEBUG: Considering 97 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_fetch): set([93])
DEBUG: Considering 98 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_preconfigure): set([99])
DEBUG: Considering 99 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_configure): set([100])
DEBUG: Considering 101 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_unpack): set([102])
DEBUG: Considering 102 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_patch): set([106, 107])
DEBUG: Considering 105 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_fetch): set([101])
DEBUG: Considering 106 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_preconfigure): set([107])
DEBUG: Considering 107 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_configure): set([108])
DEBUG: Considering 112 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_unpack): set([113])
DEBUG: Considering 113 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_patch): set([119])
DEBUG: Considering 118 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_fetch): set([112])
DEBUG: Considering 119 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_configure): set([120])
DEBUG: Considering 124 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_unpack): set([125])
DEBUG: Considering 125 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_patch): set([129])
DEBUG: Considering 128 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_fetch): set([124])
DEBUG: Considering 129 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_configure): set([130])
DEBUG: Considering 134 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_unpack): set([135])
DEBUG: Considering 135 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_patch): set([139])
DEBUG: Considering 138 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_fetch): set([134])
DEBUG: Considering 139 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_configure): set([140])
DEBUG: Considering 144 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_unpack): set([145])
DEBUG: Considering 145 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_patch): set([149])
DEBUG: Considering 148 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_fetch): set([144])
DEBUG: Considering 149 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_configure): set([150])
DEBUG: Considering 154 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_unpack): set([155])
DEBUG: Considering 155 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_patch): set([159])
DEBUG: Considering 158 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_fetch): set([154])
DEBUG: Considering 159 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_configure): set([160])
DEBUG: Considering 164 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_unpack): set([165])
DEBUG: Considering 165 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_patch): set([169])
DEBUG: Considering 168 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_fetch): set([164])
DEBUG: Considering 169 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_configure): set([170])
DEBUG: Considering 174 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_unpack): set([175])
DEBUG: Considering 175 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_patch): set([179])
DEBUG: Considering 178 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_fetch): set([174])
DEBUG: Considering 179 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_configure): set([180])
DEBUG: Considering 184 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_unpack): set([185])
DEBUG: Considering 185 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_patch): set([189])
DEBUG: Considering 188 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_fetch): set([184])
DEBUG: Considering 189 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_configure): set([190])
DEBUG: Considering 194 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_unpack): set([195])
DEBUG: Considering 195 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_patch): set([199])
DEBUG: Considering 198 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_fetch): set([194])
DEBUG: Considering 199 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_configure): set([200])
DEBUG: Considering 204 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_unpack): set([205])
DEBUG: Considering 205 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_patch): set([209])
DEBUG: Considering 208 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_fetch): set([204])
DEBUG: Considering 209 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_configure): set([210])
DEBUG: Considering 214 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_unpack): set([215])
DEBUG: Considering 215 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_patch): set([219])
DEBUG: Considering 218 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_fetch): set([214])
DEBUG: Considering 219 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_configure): set([220])
DEBUG: Considering 224 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_unpack): set([225])
DEBUG: Considering 225 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_patch): set([229])
DEBUG: Considering 228 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_fetch): set([224])
DEBUG: Considering 229 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_configure): set([230])
DEBUG: Considering 234 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_unpack): set([235])
DEBUG: Considering 235 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_patch): set([239])
DEBUG: Considering 238 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_fetch): set([234])
DEBUG: Considering 239 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_configure): set([240])
DEBUG: Considering 244 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_unpack): set([245])
DEBUG: Considering 245 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_patch): set([249])
DEBUG: Considering 248 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_fetch): set([244])
DEBUG: Considering 249 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_configure): set([250])
DEBUG: Considering 254 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_unpack): set([255])
DEBUG: Considering 255 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_patch): set([259])
DEBUG: Considering 258 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_fetch): set([254])
DEBUG: Considering 259 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_configure): set([260])
DEBUG: Considering 264 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_unpack): set([265])
DEBUG: Considering 265 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_patch): set([269])
DEBUG: Considering 268 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_fetch): set([264])
DEBUG: Considering 269 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_configure): set([270])
DEBUG: Considering 274 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_unpack): set([275])
DEBUG: Considering 275 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_patch): set([279])
DEBUG: Considering 278 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_fetch): set([274])
DEBUG: Considering 279 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_configure): set([280])
DEBUG: Considering 284 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_unpack): set([285])
DEBUG: Considering 285 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_patch): set([289])
DEBUG: Considering 288 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_fetch): set([284])
DEBUG: Considering 289 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_configure): set([290])
DEBUG: Considering 294 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_unpack): set([295])
DEBUG: Considering 295 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_patch): set([299])
DEBUG: Considering 298 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_fetch): set([294])
DEBUG: Considering 299 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_configure): set([300])
DEBUG: Considering 304 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_unpack): set([305])
DEBUG: Considering 305 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_patch): set([309])
DEBUG: Considering 308 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_fetch): set([304])
DEBUG: Considering 309 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_configure): set([310])
DEBUG: Considering 314 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_unpack): set([315])
DEBUG: Considering 315 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_patch): set([319])
DEBUG: Considering 318 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_fetch): set([314])
DEBUG: Considering 319 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_configure): set([320])
DEBUG: Considering 324 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_unpack): set([325])
DEBUG: Considering 325 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_patch): set([329])
DEBUG: Considering 328 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_fetch): set([324])
DEBUG: Considering 329 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_configure): set([330])
DEBUG: Considering 334 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_unpack): set([335])
DEBUG: Considering 335 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_patch): set([339])
DEBUG: Considering 338 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_fetch): set([334])
DEBUG: Considering 339 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_configure): set([340])
DEBUG: Considering 344 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_unpack): set([345])
DEBUG: Considering 345 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_patch): set([349])
DEBUG: Considering 348 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_fetch): set([344])
DEBUG: Considering 349 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_configure): set([350])
DEBUG: Considering 354 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_unpack): set([355])
DEBUG: Considering 355 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_patch): set([359])
DEBUG: Considering 358 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_fetch): set([354])
DEBUG: Considering 359 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_configure): set([360])
DEBUG: Considering 364 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_unpack): set([365])
DEBUG: Considering 365 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_patch): set([369])
DEBUG: Considering 368 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_fetch): set([364])
DEBUG: Considering 369 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_configure): set([370])
DEBUG: Considering 374 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_unpack): set([375])
DEBUG: Considering 375 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_patch): set([379])
DEBUG: Considering 378 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_fetch): set([374])
DEBUG: Considering 379 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_configure): set([380])
DEBUG: Considering 384 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_unpack): set([385])
DEBUG: Considering 385 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_patch): set([389])
DEBUG: Considering 388 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_fetch): set([384])
DEBUG: Considering 389 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_configure): set([390])
DEBUG: Considering 394 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_unpack): set([395])
DEBUG: Considering 395 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_patch): set([399])
DEBUG: Considering 398 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_fetch): set([394])
DEBUG: Considering 399 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_configure): set([400])
DEBUG: Considering 404 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_unpack): set([405])
DEBUG: Considering 405 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_patch): set([409])
DEBUG: Considering 408 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_fetch): set([404])
DEBUG: Considering 409 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_configure): set([410])
DEBUG: Considering 414 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_unpack): set([415])
DEBUG: Considering 415 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_patch): set([419])
DEBUG: Considering 418 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_fetch): set([414])
DEBUG: Considering 419 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_configure): set([420])
DEBUG: Considering 424 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_unpack): set([425])
DEBUG: Considering 425 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_patch): set([430])
DEBUG: Considering 429 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_fetch): set([424])
DEBUG: Considering 430 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_configure): set([432, 431])
DEBUG: Considering 431 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_configure_ptest_base): set([432])
DEBUG: Considering 432 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_compile): set([433, 427])
DEBUG: Considering 437 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_unpack): set([438])
DEBUG: Considering 438 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_patch): set([442])
DEBUG: Considering 441 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_fetch): set([437])
DEBUG: Considering 442 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_configure): set([443])
DEBUG: Considering 447 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_unpack): set([448])
DEBUG: Considering 448 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_patch): set([452])
DEBUG: Considering 451 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_fetch): set([447])
DEBUG: Considering 452 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_configure): set([453])
DEBUG: Considering 457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_unpack): set([458])
DEBUG: Considering 458 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_patch): set([462])
DEBUG: Considering 461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_fetch): set([457])
DEBUG: Considering 462 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_configure): set([463])
DEBUG: Considering 467 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_unpack): set([468])
DEBUG: Considering 468 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_patch): set([472])
DEBUG: Considering 471 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_fetch): set([467])
DEBUG: Considering 472 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_configure): set([473])
DEBUG: Considering 477 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_unpack): set([478])
DEBUG: Considering 478 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_patch): set([482])
DEBUG: Considering 481 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_fetch): set([477])
DEBUG: Considering 482 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_configure): set([483])
DEBUG: Considering 487 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_unpack): set([488])
DEBUG: Considering 488 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_patch): set([492])
DEBUG: Considering 491 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_fetch): set([487])
DEBUG: Considering 492 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_configure): set([493])
DEBUG: Considering 497 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_unpack): set([498])
DEBUG: Considering 498 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_patch): set([502])
DEBUG: Considering 501 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_fetch): set([497])
DEBUG: Considering 502 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_configure): set([503])
DEBUG: Considering 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_unpack): set([508])
DEBUG: Considering 508 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_patch): set([513])
DEBUG: Considering 512 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_fetch): set([507])
DEBUG: Considering 513 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_configure): set([514, 515])
DEBUG: Considering 514 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_configure_ptest_base): set([515])
DEBUG: Considering 515 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_compile): set([516, 510])
DEBUG: Considering 520 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_unpack): set([521])
DEBUG: Considering 521 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_patch): set([524])
DEBUG: Considering 523 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_fetch): set([520])
DEBUG: Considering 524 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_configure): set([525])
DEBUG: Considering 529 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_unpack): set([530])
DEBUG: Considering 530 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_patch): set([533])
DEBUG: Considering 532 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_fetch): set([529])
DEBUG: Considering 533 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_configure): set([534])
DEBUG: Considering 538 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_unpack): set([539])
DEBUG: Considering 539 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_patch): set([542])
DEBUG: Considering 541 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_fetch): set([538])
DEBUG: Considering 542 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_configure): set([543])
DEBUG: Considering 547 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_unpack): set([548])
DEBUG: Considering 548 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_patch): set([551])
DEBUG: Considering 550 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_fetch): set([547])
DEBUG: Considering 551 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_configure): set([552])
DEBUG: Considering 556 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_unpack): set([557])
DEBUG: Considering 557 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_patch): set([561])
DEBUG: Considering 560 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_fetch): set([556])
DEBUG: Considering 561 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_configure): set([562])
DEBUG: Considering 563 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_unpack): set([564])
DEBUG: Considering 564 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_patch): set([567])
DEBUG: Considering 566 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_fetch): set([563])
DEBUG: Considering 567 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_configure): set([568])
DEBUG: Considering 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_unpack): set([573])
DEBUG: Considering 573 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_patch): set([577])
DEBUG: Considering 576 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_fetch): set([572])
DEBUG: Considering 577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_configure): set([578, 579])
DEBUG: Considering 578 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_configure_ptest_base): set([579])
DEBUG: Considering 579 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_compile): set([580, 575])
DEBUG: Considering 584 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_unpack): set([585])
DEBUG: Considering 585 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_patch): set([588])
DEBUG: Considering 587 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_fetch): set([584])
DEBUG: Considering 588 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_configure): set([589])
DEBUG: Considering 593 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_unpack): set([594])
DEBUG: Considering 594 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_patch): set([597])
DEBUG: Considering 596 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_fetch): set([593])
DEBUG: Considering 597 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_configure): set([598])
DEBUG: Considering 602 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([603])
DEBUG: Considering 603 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_patch): set([606])
DEBUG: Considering 605 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([602])
DEBUG: Considering 606 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_configure): set([607])
DEBUG: Considering 611 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_unpack): set([612])
DEBUG: Considering 612 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_patch): set([616])
DEBUG: Considering 615 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_fetch): set([611])
DEBUG: Considering 616 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_configure): set([617])
DEBUG: Considering 621 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_unpack): set([622])
DEBUG: Considering 622 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_patch): set([625])
DEBUG: Considering 624 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_fetch): set([621])
DEBUG: Considering 625 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_configure): set([626])
DEBUG: Considering 630 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([631])
DEBUG: Considering 631 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_patch): set([635])
DEBUG: Considering 634 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([630])
DEBUG: Considering 635 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_configure): set([636])
DEBUG: Considering 637 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_unpack): set([638])
DEBUG: Considering 638 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_patch): set([642])
DEBUG: Considering 641 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_fetch): set([637])
DEBUG: Considering 642 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_configure): set([643])
DEBUG: Considering 644 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_unpack): set([645])
DEBUG: Considering 645 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_patch): set([649])
DEBUG: Considering 648 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_fetch): set([644])
DEBUG: Considering 649 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_configure): set([650])
DEBUG: Considering 651 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_unpack): set([652])
DEBUG: Considering 652 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_patch): set([656])
DEBUG: Considering 655 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_fetch): set([651])
DEBUG: Considering 656 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_configure): set([657])
DEBUG: Considering 658 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_unpack): set([659])
DEBUG: Considering 659 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_patch): set([663])
DEBUG: Considering 662 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_fetch): set([658])
DEBUG: Considering 663 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_configure): set([664])
DEBUG: Considering 665 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_unpack): set([666])
DEBUG: Considering 666 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_patch): set([670])
DEBUG: Considering 669 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_fetch): set([665])
DEBUG: Considering 670 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_configure): set([671])
DEBUG: Considering 672 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_unpack): set([673])
DEBUG: Considering 673 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_patch): set([677])
DEBUG: Considering 676 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_fetch): set([672])
DEBUG: Considering 677 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_configure): set([678])
DEBUG: Considering 679 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_unpack): set([680])
DEBUG: Considering 680 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_patch): set([684])
DEBUG: Considering 683 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_fetch): set([679])
DEBUG: Considering 684 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_configure): set([685])
DEBUG: Considering 686 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_unpack): set([687])
DEBUG: Considering 687 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_patch): set([691])
DEBUG: Considering 690 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_fetch): set([686])
DEBUG: Considering 691 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_configure): set([692])
DEBUG: Considering 693 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_unpack): set([694])
DEBUG: Considering 694 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_patch): set([698])
DEBUG: Considering 697 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_fetch): set([693])
DEBUG: Considering 698 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_configure): set([699])
DEBUG: Considering 700 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_unpack): set([701])
DEBUG: Considering 701 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_patch): set([705])
DEBUG: Considering 704 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_fetch): set([700])
DEBUG: Considering 705 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_configure): set([706])
DEBUG: Considering 707 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_unpack): set([708])
DEBUG: Considering 708 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_patch): set([712])
DEBUG: Considering 711 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_fetch): set([707])
DEBUG: Considering 712 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_configure): set([713])
DEBUG: Considering 714 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_unpack): set([715])
DEBUG: Considering 715 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_patch): set([719])
DEBUG: Considering 718 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_fetch): set([714])
DEBUG: Considering 719 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_configure): set([720])
DEBUG: Considering 721 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_unpack): set([722])
DEBUG: Considering 722 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_patch): set([726])
DEBUG: Considering 725 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_fetch): set([721])
DEBUG: Considering 726 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_configure): set([727])
DEBUG: Considering 728 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_unpack): set([729])
DEBUG: Considering 729 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_patch): set([733])
DEBUG: Considering 732 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_fetch): set([728])
DEBUG: Considering 733 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_configure): set([734])
DEBUG: Considering 735 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_unpack): set([736])
DEBUG: Considering 736 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_patch): set([740])
DEBUG: Considering 739 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_fetch): set([735])
DEBUG: Considering 740 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_configure): set([741])
DEBUG: Considering 742 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_unpack): set([743])
DEBUG: Considering 743 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_patch): set([747])
DEBUG: Considering 746 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_fetch): set([742])
DEBUG: Considering 747 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_configure): set([748])
DEBUG: Considering 749 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_unpack): set([750])
DEBUG: Considering 750 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_patch): set([754])
DEBUG: Considering 753 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_fetch): set([749])
DEBUG: Considering 754 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_configure): set([755])
DEBUG: Considering 759 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_unpack): set([760])
DEBUG: Considering 760 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_patch): set([764])
DEBUG: Considering 763 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_fetch): set([759])
DEBUG: Considering 764 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_configure): set([765])
DEBUG: Considering 766 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_unpack): set([767])
DEBUG: Considering 767 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_patch): set([771])
DEBUG: Considering 770 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_fetch): set([766])
DEBUG: Considering 771 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_configure): set([772])
DEBUG: Considering 773 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_unpack): set([774])
DEBUG: Considering 774 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_patch): set([778])
DEBUG: Considering 777 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_fetch): set([773])
DEBUG: Considering 778 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_configure): set([779])
DEBUG: Considering 780 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_unpack): set([781])
DEBUG: Considering 781 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_patch): set([787, 788])
DEBUG: Considering 786 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_fetch): set([780])
DEBUG: Considering 787 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_preconfigure): set([788])
DEBUG: Considering 788 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_configure): set([789])
DEBUG: Considering 793 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_unpack): set([794])
DEBUG: Considering 794 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_patch): set([798, 799])
DEBUG: Considering 797 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_fetch): set([793])
DEBUG: Considering 798 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_preconfigure): set([799])
DEBUG: Considering 799 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_configure): set([800])
DEBUG: Considering 801 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_unpack): set([802])
DEBUG: Considering 802 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_patch): set([808, 809])
DEBUG: Considering 807 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_fetch): set([801])
DEBUG: Considering 808 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_preconfigure): set([809])
DEBUG: Considering 809 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_configure): set([810])
DEBUG: Considering 814 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_unpack): set([815])
DEBUG: Considering 815 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_patch): set([821])
DEBUG: Considering 820 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_fetch): set([814])
DEBUG: Considering 821 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_configure): set([822])
DEBUG: Considering 826 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_unpack): set([827])
DEBUG: Considering 827 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_patch): set([831])
DEBUG: Considering 830 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_fetch): set([826])
DEBUG: Considering 831 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_configure): set([832])
DEBUG: Considering 833 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_unpack):=
 set([834])
DEBUG: Considering 834 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_patch): =
set([838])
DEBUG: Considering 837 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_fetch): =
set([833])
DEBUG: Considering 838 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_configur=
e): set([839])
DEBUG: Considering 840 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_unpack): set([841])
DEBUG: Considering 841 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_patch): set([845])
DEBUG: Considering 844 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_fetch): set([840])
DEBUG: Considering 845 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_configure): set([846])
DEBUG: Considering 850 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_unpack): set([851])
DEBUG: Considering 851 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_patch): set([855])
DEBUG: Considering 854 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_fetch): set([850])
DEBUG: Considering 855 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_configure): set([856])
DEBUG: Considering 860 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_unpack): set([861])
DEBUG: Considering 861 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_patch): set([865])
DEBUG: Considering 864 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_fetch): set([860])
DEBUG: Considering 865 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_configure): set([866])
DEBUG: Considering 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_unpack): set([868])
DEBUG: Considering 868 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_patch): set([873])
DEBUG: Considering 872 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_fetch): set([867])
DEBUG: Considering 873 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_configure): set([874, 875])
DEBUG: Considering 874 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_configure_ptest_base): set([875])
DEBUG: Considering 875 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_compile): set([876, 870])
DEBUG: Considering 880 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_unpack): set([881])
DEBUG: Considering 881 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_patch): set([885])
DEBUG: Considering 884 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_fetch): set([880])
DEBUG: Considering 885 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_configure): set([886])
DEBUG: Considering 890 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_unpack): set([891])
DEBUG: Considering 891 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_patch): set([895])
DEBUG: Considering 894 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_fetch): set([890])
DEBUG: Considering 895 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_configure): set([896])
DEBUG: Considering 900 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([901])
DEBUG: Considering 901 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_patch): set([905])
DEBUG: Considering 904 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([900])
DEBUG: Considering 905 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_configure): set([906])
DEBUG: Considering 910 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_unpack): set([911])
DEBUG: Considering 911 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_patch): set([915])
DEBUG: Considering 914 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_fetch): set([910])
DEBUG: Considering 915 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_configure): set([916])
DEBUG: Considering 920 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_unpack): set([921])
DEBUG: Considering 921 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_patch): set([925])
DEBUG: Considering 924 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_fetch): set([920])
DEBUG: Considering 925 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_configure): set([926])
DEBUG: Considering 930 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_unpack): set([931])
DEBUG: Considering 931 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_patch): set([935])
DEBUG: Considering 934 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_fetch): set([930])
DEBUG: Considering 935 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_configure): set([936])
DEBUG: Considering 940 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_unpack): set([941])
DEBUG: Considering 941 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_patch): set([945])
DEBUG: Considering 944 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_fetch): set([940])
DEBUG: Considering 945 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_configure): set([946])
DEBUG: Considering 950 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_unpack): set([951])
DEBUG: Considering 951 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_patch): set([955])
DEBUG: Considering 954 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_fetch): set([950])
DEBUG: Considering 955 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_configure): set([956])
DEBUG: Considering 960 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_unpack): set([961])
DEBUG: Considering 961 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_patch): set([965])
DEBUG: Considering 964 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_fetch): set([960])
DEBUG: Considering 965 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_configure): set([966])
DEBUG: Considering 967 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_unpack): set([968])
DEBUG: Considering 968 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_patch): set([972])
DEBUG: Considering 971 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_fetch): set([967])
DEBUG: Considering 972 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_configure): set([973])
DEBUG: Considering 974 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_unpack): set([975])
DEBUG: Considering 975 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_patch): set([979])
DEBUG: Considering 978 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_fetch): set([974])
DEBUG: Considering 979 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_configure): set([980])
DEBUG: Considering 981 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_unpack): set([982])
DEBUG: Considering 982 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_patch): set([986])
DEBUG: Considering 985 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_fetch): set([981])
DEBUG: Considering 986 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_configure): set([987])
DEBUG: Considering 988 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_unpack): set([989])
DEBUG: Considering 989 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_patch): set([993])
DEBUG: Considering 992 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_fetch): set([988])
DEBUG: Considering 993 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_configure): set([994])
DEBUG: Considering 998 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxxf86vm_1.1.3.bb, do_unpack): set([999])
DEBUG: Considering 999 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxxf86vm_1.1.3.bb, do_patch): set([1003])
DEBUG: Considering 1002 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_fetch): set([998])
DEBUG: Considering 1003 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_configure): set([1004])
DEBUG: Considering 1008 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_unpack): set([1009])
DEBUG: Considering 1009 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_patch): set([1013])
DEBUG: Considering 1012 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_fetch): set([1008])
DEBUG: Considering 1013 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_configure): set([1014])
DEBUG: Considering 1018 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_unpack): set([1019])
DEBUG: Considering 1019 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_patch): set([1023])
DEBUG: Considering 1022 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_fetch): set([1018])
DEBUG: Considering 1023 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_configure): set([1024])
DEBUG: Considering 1028 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_unpack): set([1029])
DEBUG: Considering 1029 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_patch): set([1033])
DEBUG: Considering 1032 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_fetch): set([1028])
DEBUG: Considering 1033 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_configure): set([1034])
DEBUG: Considering 1038 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_unpack): set([1039])
DEBUG: Considering 1039 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_patch): set([1043])
DEBUG: Considering 1042 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_fetch): set([1038])
DEBUG: Considering 1043 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_configure): set([1044])
DEBUG: Considering 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_unpack): set([1046])
DEBUG: Considering 1046 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_patch): set([1051])
DEBUG: Considering 1050 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_fetch): set([1045])
DEBUG: Considering 1051 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_configure): set([1052, 1053])
DEBUG: Considering 1052 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_configure_ptest_base): set([1053])
DEBUG: Considering 1053 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_compile): set([1048, 1054])
DEBUG: Considering 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1059])
DEBUG: Considering 1059 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_patch): set([1064])
DEBUG: Considering 1063 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1058])
DEBUG: Considering 1064 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_configure): set([1065, 1066])
DEBUG: Considering 1065 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_configure_ptest_base): set([1066])
DEBUG: Considering 1066 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_compile): set([1067, 1061])
DEBUG: Considering 1071 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_unpack): set([1072])
DEBUG: Considering 1072 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_patch): set([1076])
DEBUG: Considering 1075 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_fetch): set([1071])
DEBUG: Considering 1076 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_configure): set([1077])
DEBUG: Considering 1081 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_unpack): set([1082])
DEBUG: Considering 1082 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_patch): set([1086])
DEBUG: Considering 1085 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_fetch): set([1081])
DEBUG: Considering 1086 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_configure): set([1087])
DEBUG: Considering 1091 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_unpack): set([1092])
DEBUG: Considering 1092 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_patch): set([1096])
DEBUG: Considering 1095 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_fetch): set([1091])
DEBUG: Considering 1096 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_configure): set([1097])
DEBUG: Considering 1101 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_unpack): set([1102])
DEBUG: Considering 1102 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_patch): set([1106])
DEBUG: Considering 1105 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_fetch): set([1101])
DEBUG: Considering 1106 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_configure): set([1107])
DEBUG: Considering 1108 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_unpack): set([1109])
DEBUG: Considering 1109 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_patch): set([1113])
DEBUG: Considering 1112 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_fetch): set([1108])
DEBUG: Considering 1113 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_configure): set([1114])
DEBUG: Considering 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_unpack): set([1119])
DEBUG: Considering 1119 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_patch): set([1124])
DEBUG: Considering 1123 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_fetch): set([1118])
DEBUG: Considering 1124 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_configure): set([1125, 1126])
DEBUG: Considering 1125 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_configure_ptest_base): set([1126])
DEBUG: Considering 1126 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_compile): set([1121, 1127])
DEBUG: Considering 1131 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack): set([1132])
DEBUG: Considering 1132 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_patch): set([1136])
DEBUG: Considering 1135 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_fetch): set([1131])
DEBUG: Considering 1136 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_configure): set([1137])
DEBUG: Considering 1138 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_unpack): set([1139])
DEBUG: Considering 1139 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_patch): set([1143])
DEBUG: Considering 1142 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_fetch): set([1138])
DEBUG: Considering 1143 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_configure): set([1144])
DEBUG: Considering 1148 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_unpack): set([1149])
DEBUG: Considering 1149 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_patch): set([1153])
DEBUG: Considering 1152 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_fetch): set([1148])
DEBUG: Considering 1153 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_configure): set([1154])
DEBUG: Considering 1155 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_unpack): set([1156])
DEBUG: Considering 1156 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_patch): set([1160])
DEBUG: Considering 1159 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_fetch): set([1155])
DEBUG: Considering 1160 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_configure): set([1161])
DEBUG: Considering 1162 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_unpack): set([1163])
DEBUG: Considering 1163 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_patch): set([1167])
DEBUG: Considering 1166 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_fetch): set([1162])
DEBUG: Considering 1167 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_configure): set([1168])
DEBUG: Considering 1169 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_unpack): set([1170])
DEBUG: Considering 1170 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_patch): set([1174])
DEBUG: Considering 1173 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_fetch): set([1169])
DEBUG: Considering 1174 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_configure): set([1175])
DEBUG: Considering 1176 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_unpack): set([1177])
DEBUG: Considering 1177 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_patch): set([1181])
DEBUG: Considering 1180 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_fetch): set([1176])
DEBUG: Considering 1181 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_configure): set([1182])
DEBUG: Considering 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_unpack): set([1187])
DEBUG: Considering 1187 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_patch): set([1192])
DEBUG: Considering 1191 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_fetch): set([1186])
DEBUG: Considering 1192 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_configure): set([1193, 1194])
DEBUG: Considering 1193 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_configure_ptest_base): set([1194])
DEBUG: Considering 1194 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_compile): set([1195, 1189])
DEBUG: Considering 1199 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_unpack): set([1200])
DEBUG: Considering 1200 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_patch): set([1204])
DEBUG: Considering 1203 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_fetch): set([1199])
DEBUG: Considering 1204 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_configure): set([1205])
DEBUG: Considering 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_unpack): set([1207])
DEBUG: Considering 1207 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_patch): set([1212])
DEBUG: Considering 1211 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_fetch): set([1206])
DEBUG: Considering 1212 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_configure): set([1213, 1214])
DEBUG: Considering 1213 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_configure_ptest_base): set([1214])
DEBUG: Considering 1214 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_compile): set([1209, 1215])
DEBUG: Considering 1219 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_unpack): set([1220])
DEBUG: Considering 1220 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_patch): set([1224])
DEBUG: Considering 1223 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_fetch): set([1219])
DEBUG: Considering 1224 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_configure): set([1225])
DEBUG: Considering 1229 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([1230])
DEBUG: Considering 1230 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_patch): set([1234])
DEBUG: Considering 1233 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([1229])
DEBUG: Considering 1234 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_configure): set([1235])
DEBUG: Considering 1236 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_unpack): set([1237])
DEBUG: Considering 1237 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_patch): set([1241])
DEBUG: Considering 1240 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_fetch): set([1236])
DEBUG: Considering 1241 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_configure): set([1242])
DEBUG: Considering 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_unpack): set([1244])
DEBUG: Considering 1244 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_patch): set([1248])
DEBUG: Considering 1247 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_fetch): set([1243])
DEBUG: Considering 1248 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_configure): set([1249, 1250])
DEBUG: Considering 1249 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_configure_ptest_base): set([1250])
DEBUG: Considering 1250 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_compile): set([1251, 1246])
DEBUG: Considering 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_unpack): set([1256])
DEBUG: Considering 1256 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_patch): set([1260])
DEBUG: Considering 1259 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_fetch): set([1255])
DEBUG: Considering 1260 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_configure): set([1261, 1262])
DEBUG: Considering 1261 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_configure_ptest_base): set([1262])
DEBUG: Considering 1262 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_compile): set([1258, 1263])
DEBUG: Considering 1267 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_unpack): set([1268])
DEBUG: Considering 1268 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_patch): set([1271])
DEBUG: Considering 1270 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_fetch): set([1267])
DEBUG: Considering 1271 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_configure): set([1272])
DEBUG: Considering 1276 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_unpack): set([1277])
DEBUG: Considering 1277 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_patch): set([1281])
DEBUG: Considering 1280 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_fetch): set([1276])
DEBUG: Considering 1281 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_configure): set([1282])
DEBUG: Considering 1286 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_unpack): set([128=
7])
DEBUG: Considering 1287 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_patch): set([1290=
])
DEBUG: Considering 1289 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_fetch): set([1286=
])
DEBUG: Considering 1290 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_configure): set([=
1291])
DEBUG: Considering 1295 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_unpack): set([1296])
DEBUG: Considering 1296 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_patch): set([1299])
DEBUG: Considering 1298 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_fetch): set([1295])
DEBUG: Considering 1299 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_configure): set([1300])
DEBUG: Considering 1304 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_unpack): set([1305])
DEBUG: Considering 1305 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_patch): set([1308])
DEBUG: Considering 1307 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_fetch): set([1304])
DEBUG: Considering 1308 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_configure): set([1309])
DEBUG: Considering 1313 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_unpack): set([1314])
DEBUG: Considering 1314 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_patch): set([1317])
DEBUG: Considering 1316 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_fetch): set([1313])
DEBUG: Considering 1317 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_configure): set([1318])
DEBUG: Considering 1322 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1323])
DEBUG: Considering 1323 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_patch): set([1326])
DEBUG: Considering 1325 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([1322])
DEBUG: Considering 1326 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_configure): set([1327])
DEBUG: Considering 1331 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_unpack): set([1332])
DEBUG: Considering 1332 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_patch): set([1335])
DEBUG: Considering 1334 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_fetch): set([1331])
DEBUG: Considering 1335 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_configure): set([1336])
DEBUG: Considering 1340 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_unpack): set([1341])
DEBUG: Considering 1341 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_patch): set([1345])
DEBUG: Considering 1344 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_fetch): set([1340])
DEBUG: Considering 1345 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_configure): set([1346])
DEBUG: Considering 1350 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_unpack): set([1351])
DEBUG: Considering 1351 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_patch): set([1355])
DEBUG: Considering 1354 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_fetch): set([1350])
DEBUG: Considering 1355 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_configure): set([1356])
DEBUG: Considering 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_unpack): set([1358])
DEBUG: Considering 1358 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_patch): set([1362])
DEBUG: Considering 1361 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_fetch): set([1357])
DEBUG: Considering 1362 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_configure): set([1363, 1364])
DEBUG: Considering 1363 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_configure_ptest_base): set([1364])
DEBUG: Considering 1364 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_compile): set([1360, 1365])
DEBUG: Considering 1369 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_unpack): set([1370])
DEBUG: Considering 1370 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_patch): set([1373])
DEBUG: Considering 1372 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_fetch): set([1369])
DEBUG: Considering 1373 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_configure): set([1374])
DEBUG: Considering 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_unpack): set([1379])
DEBUG: Considering 1379 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_patch): set([1384])
DEBUG: Considering 1383 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_fetch): set([1378])
DEBUG: Considering 1384 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_configure): set([1385, 1386])
DEBUG: Considering 1385 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_configure_ptest_base): set([1386])
DEBUG: Considering 1386 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_compile): set([1387, 1381])
DEBUG: Considering 1391 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_unpack): set([1392])
DEBUG: Considering 1392 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_patch): set([1396])
DEBUG: Considering 1395 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_fetch): set([1391])
DEBUG: Considering 1396 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_configure): set([1397])
DEBUG: Considering 1398 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1400])
DEBUG: Considering 1399 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack): set([1400, 1398])
DEBUG: Considering 1400 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_patch): set([1404])
DEBUG: Considering 1403 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_fetch): set([1399])
DEBUG: Considering 1404 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_configure): set([1405])
DEBUG: Considering 1406 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_unpack): set([1407])
DEBUG: Considering 1407 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_patch): set([1411])
DEBUG: Considering 1410 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_fetch): set([1406])
DEBUG: Considering 1411 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_configure): set([1412])
DEBUG: Considering 1413 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_unpack): set([1414])
DEBUG: Considering 1414 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_patch): set([1418])
DEBUG: Considering 1417 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_fetch): set([1413])
DEBUG: Considering 1418 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_configure): set([1419])
DEBUG: Considering 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_unpack): set([1421])
DEBUG: Considering 1421 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_patch): set([1426])
DEBUG: Considering 1425 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_fetch): set([1420])
DEBUG: Considering 1426 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_configure): set([1427, 1428])
DEBUG: Considering 1427 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_configure_ptest_base): set([1428])
DEBUG: Considering 1428 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_compile): set([1429, 1423])
DEBUG: Considering 1433 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_unpack): set([1434])
DEBUG: Considering 1434 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_patch): set([1438])
DEBUG: Considering 1437 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_fetch): set([1433])
DEBUG: Considering 1438 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_configure): set([1439])
DEBUG: Considering 1440 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_unpack): set([1441])
DEBUG: Considering 1441 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_patch): set([1445])
DEBUG: Considering 1444 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_fetch): set([1440])
DEBUG: Considering 1445 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_configure): set([1446])
DEBUG: Considering 1450 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_unpack): set([1451])
DEBUG: Considering 1451 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_patch): set([1455])
DEBUG: Considering 1454 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_fetch): set([1450])
DEBUG: Considering 1455 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_configure): set([1456])
DEBUG: Considering 1457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1458])
DEBUG: Considering 1458 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_patch): set([1462])
DEBUG: Considering 1461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1457])
DEBUG: Considering 1462 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_configure): set([1463])
DEBUG: Considering 1467 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1468])
DEBUG: Considering 1468 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_patch): set([1472])
DEBUG: Considering 1471 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1467])
DEBUG: Considering 1472 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_configure): set([1473])
DEBUG: Considering 1474 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1475])
DEBUG: Considering 1475 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_patch): set([1479])
DEBUG: Considering 1478 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1474])
DEBUG: Considering 1479 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_configure): set([1480])
DEBUG: Considering 1481 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_unpack): set([1482])
DEBUG: Considering 1482 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_patch): set([1486])
DEBUG: Considering 1485 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_fetch): set([1481])
DEBUG: Considering 1486 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_configure): set([1487])
DEBUG: Considering 1491 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_unpack): set([1492])
DEBUG: Considering 1492 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_patch): set([1496])
DEBUG: Considering 1495 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_fetch): set([1491])
DEBUG: Considering 1496 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_configure): set([1497])
DEBUG: Considering 1498 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_unpack): set([1499])
DEBUG: Considering 1499 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_patch): set([1503])
DEBUG: Considering 1502 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_fetch): set([1498])
DEBUG: Considering 1503 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_configure): set([1504])
DEBUG: Considering 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1510])
DEBUG: Considering 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_unpack): set([1508, 1510])
DEBUG: Considering 1510 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_patch): set([1515])
DEBUG: Considering 1514 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_fetch): set([1509])
DEBUG: Considering 1515 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_configure): set([1516, 1517])
DEBUG: Considering 1516 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_configure_ptest_base): set([1517])
DEBUG: Considering 1517 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_compile): set([1512, 1518])
DEBUG: Considering 1522 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([1523])
DEBUG: Considering 1523 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_patch): set([1527])
DEBUG: Considering 1526 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([1522])
DEBUG: Considering 1527 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_configure): set([1528])
DEBUG: Considering 1529 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_unpack): set([1530])
DEBUG: Considering 1530 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_patch): set([1534])
DEBUG: Considering 1533 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_fetch): set([1529])
DEBUG: Considering 1534 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_configure): set([1535])
DEBUG: Considering 1536 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_unpack): set([1537])
DEBUG: Considering 1537 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_patch): set([1541])
DEBUG: Considering 1540 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_fetch): set([1536])
DEBUG: Considering 1541 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_configure): set([1542])
DEBUG: Considering 1546 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_unpack): set([1547])
DEBUG: Considering 1547 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_patch): set([1551])
DEBUG: Considering 1550 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_fetch): set([1546])
DEBUG: Considering 1551 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_configure): set([1552])
DEBUG: Considering 1553 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_unpack): set([1554])
DEBUG: Considering 1554 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_patch): set([1558])
DEBUG: Considering 1557 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_fetch): set([1553])
DEBUG: Considering 1558 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_configure): set([1559])
DEBUG: Considering 1560 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_unpack): set([1561])
DEBUG: Considering 1561 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_patch): set([1565])
DEBUG: Considering 1564 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_fetch): set([1560])
DEBUG: Considering 1565 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_configure): set([1566=
])
DEBUG: Considering 1567 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_unpack): set([1568])
DEBUG: Considering 1568 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_patch): set([1572])
DEBUG: Considering 1571 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_fetch): set([1567])
DEBUG: Considering 1572 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_configure): set([1573])
DEBUG: Considering 1577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_unpack): set([1578])
DEBUG: Considering 1578 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_patch): set([1582])
DEBUG: Considering 1581 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_fetch): set([1577])
DEBUG: Considering 1582 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_configure): set([1583])
DEBUG: Considering 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_unpack): set([1585])
DEBUG: Considering 1585 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_patch): set([1590])
DEBUG: Considering 1589 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_fetch): set([1584])
DEBUG: Considering 1590 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_configure): set([1592, 1591])
DEBUG: Considering 1591 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_configure_ptest_base): set([1592])
DEBUG: Considering 1592 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_compile): set([1593, 1587])
DEBUG: Considering 1597 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1=
598])
DEBUG: Considering 1598 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_patch): set([16=
02])
DEBUG: Considering 1601 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([15=
97])
DEBUG: Considering 1602 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_configure): set=
([1603])
DEBUG: Considering 1604 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_unpack): set([1605])
DEBUG: Considering 1605 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_patch): set([1609])
DEBUG: Considering 1608 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_fetch): set([1604])
DEBUG: Considering 1609 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_configure): set([1610])
DEBUG: Considering 1611 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_unpack): set([1612])
DEBUG: Considering 1612 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_patch): set([1616])
DEBUG: Considering 1615 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_fetch): set([1611])
DEBUG: Considering 1616 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_configure): set([1617])
DEBUG: Considering 1618 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_unpack): set([1619])
DEBUG: Considering 1619 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_patch): set([1623])
DEBUG: Considering 1622 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_fetch): set([1618])
DEBUG: Considering 1623 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_configure): set([1624])
DEBUG: Considering 1628 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([1629])
DEBUG: Considering 1629 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_patch): set([1633])
DEBUG: Considering 1632 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([1628])
DEBUG: Considering 1633 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_configure): set([1634])
DEBUG: Considering 1638 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_unpack): set([1639])
DEBUG: Considering 1639 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_patch): set([1643])
DEBUG: Considering 1642 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_fetch): set([1638])
DEBUG: Considering 1643 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_configure): set([1644])
DEBUG: Considering 1648 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_unpack): set([1649])
DEBUG: Considering 1649 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_patch): set([1652])
DEBUG: Considering 1651 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_fetch): set([1648])
DEBUG: Considering 1652 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_configure): set([1653])
DEBUG: Considering 1657 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_unpack): set([1658])
DEBUG: Considering 1658 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_patch): set([1662])
DEBUG: Considering 1661 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_fetch): set([1657])
DEBUG: Considering 1662 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_configure): set([1663])
DEBUG: Considering 1667 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_unpack): set([1668])
DEBUG: Considering 1668 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_patch): set([1672])
DEBUG: Considering 1671 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_fetch): set([1667])
DEBUG: Considering 1672 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_configure): set([1673])
DEBUG: Considering 1674 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_unpack): set([1675])
DEBUG: Considering 1675 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_patch): set([1679])
DEBUG: Considering 1678 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_fetch): set([1674])
DEBUG: Considering 1679 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_configure): set([1680])
DEBUG: Considering 1684 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_unpack): set([1685])
DEBUG: Considering 1685 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_patch): set([1689])
DEBUG: Considering 1688 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_fetch): set([1684])
DEBUG: Considering 1689 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_configure): set([1690])
DEBUG: Considering 1694 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_unpack): set([1695])
DEBUG: Considering 1695 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_patch): set([1699])
DEBUG: Considering 1698 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_fetch): set([1694])
DEBUG: Considering 1699 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_configure): set([1700])
DEBUG: Considering 1701 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_unpack): set([1702])
DEBUG: Considering 1702 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_patch): set([1706])
DEBUG: Considering 1705 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_fetch): set([1701])
DEBUG: Considering 1706 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_configure): set([1707])
DEBUG: Considering 1711 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_unpack): set([1712])
DEBUG: Considering 1712 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_patch): set([1716])
DEBUG: Considering 1715 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_fetch): set([1711])
DEBUG: Considering 1716 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_configure): set([1717])
DEBUG: Considering 1721 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_unpack): set([1722])
DEBUG: Considering 1722 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_patch): set([1726])
DEBUG: Considering 1725 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_fetch): set([1721])
DEBUG: Considering 1726 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_configure): set([1727])
DEBUG: Considering 0 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_unpack): set([1])
DEBUG: Considering 1 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_patch): set([5, 7])
DEBUG: Considering 4 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_fetch): set([0])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Considering 13 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_unpack): set([14])
DEBUG: Considering 14 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_patch): set([18])
DEBUG: Considering 17 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_fetch): set([13])
DEBUG: Considering 20 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_unpack): set([21])
DEBUG: Considering 21 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_patch): set([25])
DEBUG: Considering 24 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_fetch): set([20])
DEBUG: Considering 27 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_unpack): set([28])
DEBUG: Considering 28 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_patch): set([32])
DEBUG: Considering 31 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_fetch): set([27])
DEBUG: Considering 34 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_unpack): set([35])
DEBUG: Considering 35 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_patch): set([39])
DEBUG: Considering 38 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_fetch): set([34])
DEBUG: Considering 41 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_unpack): set([42])
DEBUG: Considering 42 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_patch): set([46])
DEBUG: Considering 45 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_fetch): set([41])
DEBUG: Considering 48 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_unpack): set([49])
DEBUG: Considering 49 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_patch): set([53])
DEBUG: Considering 52 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_fetch): set([48])
DEBUG: Considering 55 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_unpack): set([56])
DEBUG: Considering 56 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_patch): set([60])
DEBUG: Considering 59 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_fetch): set([55])
DEBUG: Considering 62 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_unpack): set([63])
DEBUG: Considering 63 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_patch): set([67])
DEBUG: Considering 66 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_fetch): set([62])
DEBUG: Considering 69 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_unpack): set([70])
DEBUG: Considering 70 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_patch): set([74])
DEBUG: Considering 73 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_fetch): set([69])
DEBUG: Considering 76 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_unpack): set([77])
DEBUG: Considering 77 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_patch): set([81])
DEBUG: Considering 80 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_fetch): set([76])
DEBUG: Considering 86 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_unpack): set([87])
DEBUG: Considering 87 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_patch): set([91])
DEBUG: Considering 90 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_fetch): set([86])
DEBUG: Considering 93 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_unpack): set([94])
DEBUG: Considering 94 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_patch): set([98, 99])
DEBUG: Considering 97 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_fetch): set([93])
DEBUG: Considering 98 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_preconfigure): set([99])
DEBUG: Considering 101 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_unpack): set([102])
DEBUG: Considering 102 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_patch): set([106, 107])
DEBUG: Considering 105 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_fetch): set([101])
DEBUG: Considering 106 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_preconfigure): set([107])
DEBUG: Considering 112 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_unpack): set([113])
DEBUG: Considering 113 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_patch): set([119])
DEBUG: Considering 118 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_fetch): set([112])
DEBUG: Considering 124 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_unpack): set([125])
DEBUG: Considering 125 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_patch): set([129])
DEBUG: Considering 128 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_fetch): set([124])
DEBUG: Considering 134 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_unpack): set([135])
DEBUG: Considering 135 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_patch): set([139])
DEBUG: Considering 138 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_fetch): set([134])
DEBUG: Considering 144 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_unpack): set([145])
DEBUG: Considering 145 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_patch): set([149])
DEBUG: Considering 148 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_fetch): set([144])
DEBUG: Considering 154 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_unpack): set([155])
DEBUG: Considering 155 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_patch): set([159])
DEBUG: Considering 158 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_fetch): set([154])
DEBUG: Considering 164 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_unpack): set([165])
DEBUG: Considering 165 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_patch): set([169])
DEBUG: Considering 168 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_fetch): set([164])
DEBUG: Considering 174 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_unpack): set([175])
DEBUG: Considering 175 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_patch): set([179])
DEBUG: Considering 178 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_fetch): set([174])
DEBUG: Considering 184 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_unpack): set([185])
DEBUG: Considering 185 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_patch): set([189])
DEBUG: Considering 188 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_fetch): set([184])
DEBUG: Considering 194 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_unpack): set([195])
DEBUG: Considering 195 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_patch): set([199])
DEBUG: Considering 198 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_fetch): set([194])
DEBUG: Considering 204 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_unpack): set([205])
DEBUG: Considering 205 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_patch): set([209])
DEBUG: Considering 208 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_fetch): set([204])
DEBUG: Considering 214 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_unpack): set([215])
DEBUG: Considering 215 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_patch): set([219])
DEBUG: Considering 218 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_fetch): set([214])
DEBUG: Considering 224 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_unpack): set([225])
DEBUG: Considering 225 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_patch): set([229])
DEBUG: Considering 228 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_fetch): set([224])
DEBUG: Considering 234 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_unpack): set([235])
DEBUG: Considering 235 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_patch): set([239])
DEBUG: Considering 238 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_fetch): set([234])
DEBUG: Considering 244 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_unpack): set([245])
DEBUG: Considering 245 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_patch): set([249])
DEBUG: Considering 248 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_fetch): set([244])
DEBUG: Considering 254 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_unpack): set([255])
DEBUG: Considering 255 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_patch): set([259])
DEBUG: Considering 258 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_fetch): set([254])
DEBUG: Considering 264 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_unpack): set([265])
DEBUG: Considering 265 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_patch): set([269])
DEBUG: Considering 268 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_fetch): set([264])
DEBUG: Considering 274 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_unpack): set([275])
DEBUG: Considering 275 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_patch): set([279])
DEBUG: Considering 278 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_fetch): set([274])
DEBUG: Considering 284 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_unpack): set([285])
DEBUG: Considering 285 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_patch): set([289])
DEBUG: Considering 288 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_fetch): set([284])
DEBUG: Considering 294 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_unpack): set([295])
DEBUG: Considering 295 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_patch): set([299])
DEBUG: Considering 298 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_fetch): set([294])
DEBUG: Considering 304 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_unpack): set([305])
DEBUG: Considering 305 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_patch): set([309])
DEBUG: Considering 308 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_fetch): set([304])
DEBUG: Considering 314 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_unpack): set([315])
DEBUG: Considering 315 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_patch): set([319])
DEBUG: Considering 318 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_fetch): set([314])
DEBUG: Considering 324 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_unpack): set([325])
DEBUG: Considering 325 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_patch): set([329])
DEBUG: Considering 328 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_fetch): set([324])
DEBUG: Considering 334 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_unpack): set([335])
DEBUG: Considering 335 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_patch): set([339])
DEBUG: Considering 338 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_fetch): set([334])
DEBUG: Considering 344 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_unpack): set([345])
DEBUG: Considering 345 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_patch): set([349])
DEBUG: Considering 348 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_fetch): set([344])
DEBUG: Considering 354 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_unpack): set([355])
DEBUG: Considering 355 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_patch): set([359])
DEBUG: Considering 358 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_fetch): set([354])
DEBUG: Considering 364 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_unpack): set([365])
DEBUG: Considering 365 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_patch): set([369])
DEBUG: Considering 368 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_fetch): set([364])
DEBUG: Considering 374 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_unpack): set([375])
DEBUG: Considering 375 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_patch): set([379])
DEBUG: Considering 378 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_fetch): set([374])
DEBUG: Considering 384 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_unpack): set([385])
DEBUG: Considering 385 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_patch): set([389])
DEBUG: Considering 388 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_fetch): set([384])
DEBUG: Considering 394 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_unpack): set([395])
DEBUG: Considering 395 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_patch): set([399])
DEBUG: Considering 398 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_fetch): set([394])
DEBUG: Considering 404 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_unpack): set([405])
DEBUG: Considering 405 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_patch): set([409])
DEBUG: Considering 408 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_fetch): set([404])
DEBUG: Considering 414 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_unpack): set([415])
DEBUG: Considering 415 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_patch): set([419])
DEBUG: Considering 418 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_fetch): set([414])
DEBUG: Considering 424 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_unpack): set([425])
DEBUG: Considering 425 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_patch): set([430])
DEBUG: Considering 429 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_fetch): set([424])
DEBUG: Considering 430 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_configure): set([432, 431])
DEBUG: Considering 431 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_configure_ptest_base): set([432])
DEBUG: Considering 437 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_unpack): set([438])
DEBUG: Considering 438 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_patch): set([442])
DEBUG: Considering 441 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_fetch): set([437])
DEBUG: Considering 447 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_unpack): set([448])
DEBUG: Considering 448 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_patch): set([452])
DEBUG: Considering 451 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_fetch): set([447])
DEBUG: Considering 457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_unpack): set([458])
DEBUG: Considering 458 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_patch): set([462])
DEBUG: Considering 461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_fetch): set([457])
DEBUG: Considering 467 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_unpack): set([468])
DEBUG: Considering 468 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_patch): set([472])
DEBUG: Considering 471 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_fetch): set([467])
DEBUG: Considering 477 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_unpack): set([478])
DEBUG: Considering 478 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_patch): set([482])
DEBUG: Considering 481 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_fetch): set([477])
DEBUG: Considering 487 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_unpack): set([488])
DEBUG: Considering 488 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_patch): set([492])
DEBUG: Considering 491 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_fetch): set([487])
DEBUG: Considering 497 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_unpack): set([498])
DEBUG: Considering 498 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_patch): set([502])
DEBUG: Considering 501 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_fetch): set([497])
DEBUG: Considering 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_unpack): set([508])
DEBUG: Considering 508 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_patch): set([513])
DEBUG: Considering 512 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_fetch): set([507])
DEBUG: Considering 513 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_configure): set([514, 515])
DEBUG: Considering 514 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_configure_ptest_base): set([515])
DEBUG: Considering 520 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_unpack): set([521])
DEBUG: Considering 521 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_patch): set([524])
DEBUG: Considering 523 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_fetch): set([520])
DEBUG: Considering 529 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_unpack): set([530])
DEBUG: Considering 530 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_patch): set([533])
DEBUG: Considering 532 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_fetch): set([529])
DEBUG: Considering 538 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_unpack): set([539])
DEBUG: Considering 539 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_patch): set([542])
DEBUG: Considering 541 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_fetch): set([538])
DEBUG: Considering 547 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_unpack): set([548])
DEBUG: Considering 548 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_patch): set([551])
DEBUG: Considering 550 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_fetch): set([547])
DEBUG: Considering 556 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_unpack): set([557])
DEBUG: Considering 557 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_patch): set([561])
DEBUG: Considering 560 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_fetch): set([556])
DEBUG: Considering 563 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_unpack): set([564])
DEBUG: Considering 564 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_patch): set([567])
DEBUG: Considering 566 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_fetch): set([563])
DEBUG: Considering 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_unpack): set([573])
DEBUG: Considering 573 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_patch): set([577])
DEBUG: Considering 576 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_fetch): set([572])
DEBUG: Considering 577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_configure): set([578, 579])
DEBUG: Considering 578 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_configure_ptest_base): set([579])
DEBUG: Considering 584 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_unpack): set([585])
DEBUG: Considering 585 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_patch): set([588])
DEBUG: Considering 587 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_fetch): set([584])
DEBUG: Considering 593 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_unpack): set([594])
DEBUG: Considering 594 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_patch): set([597])
DEBUG: Considering 596 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_fetch): set([593])
DEBUG: Considering 602 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([603])
DEBUG: Considering 603 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_patch): set([606])
DEBUG: Considering 605 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([602])
DEBUG: Considering 611 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_unpack): set([612])
DEBUG: Considering 612 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_patch): set([616])
DEBUG: Considering 615 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_fetch): set([611])
DEBUG: Considering 621 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_unpack): set([622])
DEBUG: Considering 622 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_patch): set([625])
DEBUG: Considering 624 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_fetch): set([621])
DEBUG: Considering 630 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([631])
DEBUG: Considering 631 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_patch): set([635])
DEBUG: Considering 634 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([630])
DEBUG: Considering 637 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_unpack): set([638])
DEBUG: Considering 638 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_patch): set([642])
DEBUG: Considering 641 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_fetch): set([637])
DEBUG: Considering 644 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_unpack): set([645])
DEBUG: Considering 645 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_patch): set([649])
DEBUG: Considering 648 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_fetch): set([644])
DEBUG: Considering 651 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_unpack): set([652])
DEBUG: Considering 652 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_patch): set([656])
DEBUG: Considering 655 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_fetch): set([651])
DEBUG: Considering 658 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_unpack): set([659])
DEBUG: Considering 659 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_patch): set([663])
DEBUG: Considering 662 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_fetch): set([658])
DEBUG: Considering 665 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_unpack): set([666])
DEBUG: Considering 666 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_patch): set([670])
DEBUG: Considering 669 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_fetch): set([665])
DEBUG: Considering 672 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_unpack): set([673])
DEBUG: Considering 673 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_patch): set([677])
DEBUG: Considering 676 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_fetch): set([672])
DEBUG: Considering 679 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_unpack): set([680])
DEBUG: Considering 680 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_patch): set([684])
DEBUG: Considering 683 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_fetch): set([679])
DEBUG: Considering 686 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_unpack): set([687])
DEBUG: Considering 687 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_patch): set([691])
DEBUG: Considering 690 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_fetch): set([686])
DEBUG: Considering 693 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_unpack): set([694])
DEBUG: Considering 694 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_patch): set([698])
DEBUG: Considering 697 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_fetch): set([693])
DEBUG: Considering 700 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_unpack): set([701])
DEBUG: Considering 701 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_patch): set([705])
DEBUG: Considering 704 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_fetch): set([700])
DEBUG: Considering 707 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_unpack): set([708])
DEBUG: Considering 708 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_patch): set([712])
DEBUG: Considering 711 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_fetch): set([707])
DEBUG: Considering 714 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_unpack): set([715])
DEBUG: Considering 715 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_patch): set([719])
DEBUG: Considering 718 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_fetch): set([714])
DEBUG: Considering 721 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_unpack): set([722])
DEBUG: Considering 722 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_patch): set([726])
DEBUG: Considering 725 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_fetch): set([721])
DEBUG: Considering 728 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_unpack): set([729])
DEBUG: Considering 729 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_patch): set([733])
DEBUG: Considering 732 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_fetch): set([728])
DEBUG: Considering 735 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_unpack): set([736])
DEBUG: Considering 736 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_patch): set([740])
DEBUG: Considering 739 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_fetch): set([735])
DEBUG: Considering 742 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_unpack): set([743])
DEBUG: Considering 743 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_patch): set([747])
DEBUG: Considering 746 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_fetch): set([742])
DEBUG: Considering 749 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_unpack): set([750])
DEBUG: Considering 750 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_patch): set([754])
DEBUG: Considering 753 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_fetch): set([749])
DEBUG: Considering 759 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_unpack): set([760])
DEBUG: Considering 760 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_patch): set([764])
DEBUG: Considering 763 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_fetch): set([759])
DEBUG: Considering 766 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_unpack): set([767])
DEBUG: Considering 767 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_patch): set([771])
DEBUG: Considering 770 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_fetch): set([766])
DEBUG: Considering 773 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_unpack): set([774])
DEBUG: Considering 774 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_patch): set([778])
DEBUG: Considering 777 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_fetch): set([773])
DEBUG: Considering 780 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_unpack): set([781])
DEBUG: Considering 781 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_patch): set([787, 788])
DEBUG: Considering 786 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_fetch): set([780])
DEBUG: Considering 787 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_preconfigure): set([788])
DEBUG: Considering 793 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_unpack): set([794])
DEBUG: Considering 794 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_patch): set([798, 799])
DEBUG: Considering 797 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_fetch): set([793])
DEBUG: Considering 798 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_preconfigure): set([799])
DEBUG: Considering 801 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_unpack): set([802])
DEBUG: Considering 802 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_patch): set([808, 809])
DEBUG: Considering 807 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_fetch): set([801])
DEBUG: Considering 808 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_preconfigure): set([809])
DEBUG: Considering 814 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_unpack): set([815])
DEBUG: Considering 815 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_patch): set([821])
DEBUG: Considering 820 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_fetch): set([814])
DEBUG: Considering 826 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_unpack): set([827])
DEBUG: Considering 827 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_patch): set([831])
DEBUG: Considering 830 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_fetch): set([826])
DEBUG: Considering 833 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_unpack):=
 set([834])
DEBUG: Considering 834 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_patch): =
set([838])
DEBUG: Considering 837 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_fetch): =
set([833])
DEBUG: Considering 840 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_unpack): set([841])
DEBUG: Considering 841 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_patch): set([845])
DEBUG: Considering 844 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_fetch): set([840])
DEBUG: Considering 850 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_unpack): set([851])
DEBUG: Considering 851 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_patch): set([855])
DEBUG: Considering 854 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_fetch): set([850])
DEBUG: Considering 860 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_unpack): set([861])
DEBUG: Considering 861 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_patch): set([865])
DEBUG: Considering 864 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_fetch): set([860])
DEBUG: Considering 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_unpack): set([868])
DEBUG: Considering 868 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_patch): set([873])
DEBUG: Considering 872 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_fetch): set([867])
DEBUG: Considering 873 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_configure): set([874, 875])
DEBUG: Considering 874 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_configure_ptest_base): set([875])
DEBUG: Considering 880 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_unpack): set([881])
DEBUG: Considering 881 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_patch): set([885])
DEBUG: Considering 884 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_fetch): set([880])
DEBUG: Considering 890 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_unpack): set([891])
DEBUG: Considering 891 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_patch): set([895])
DEBUG: Considering 894 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_fetch): set([890])
DEBUG: Considering 900 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([901])
DEBUG: Considering 901 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_patch): set([905])
DEBUG: Considering 904 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([900])
DEBUG: Considering 910 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_unpack): set([911])
DEBUG: Considering 911 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_patch): set([915])
DEBUG: Considering 914 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_fetch): set([910])
DEBUG: Considering 920 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_unpack): set([921])
DEBUG: Considering 921 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_patch): set([925])
DEBUG: Considering 924 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_fetch): set([920])
DEBUG: Considering 930 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_unpack): set([931])
DEBUG: Considering 931 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_patch): set([935])
DEBUG: Considering 934 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_fetch): set([930])
DEBUG: Considering 940 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_unpack): set([941])
DEBUG: Considering 941 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_patch): set([945])
DEBUG: Considering 944 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_fetch): set([940])
DEBUG: Considering 950 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_unpack): set([951])
DEBUG: Considering 951 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_patch): set([955])
DEBUG: Considering 954 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_fetch): set([950])
DEBUG: Considering 960 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_unpack): set([961])
DEBUG: Considering 961 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_patch): set([965])
DEBUG: Considering 964 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_fetch): set([960])
DEBUG: Considering 967 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_unpack): set([968])
DEBUG: Considering 968 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_patch): set([972])
DEBUG: Considering 971 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_fetch): set([967])
DEBUG: Considering 974 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_unpack): set([975])
DEBUG: Considering 975 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_patch): set([979])
DEBUG: Considering 978 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_fetch): set([974])
DEBUG: Considering 981 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_unpack): set([982])
DEBUG: Considering 982 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_patch): set([986])
DEBUG: Considering 985 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_fetch): set([981])
DEBUG: Considering 988 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_unpack): set([989])
DEBUG: Considering 989 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_patch): set([993])
DEBUG: Considering 992 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_fetch): set([988])
DEBUG: Considering 998 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxxf86vm_1.1.3.bb, do_unpack): set([999])
DEBUG: Considering 999 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxxf86vm_1.1.3.bb, do_patch): set([1003])
DEBUG: Considering 1002 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_fetch): set([998])
DEBUG: Considering 1008 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_unpack): set([1009])
DEBUG: Considering 1009 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_patch): set([1013])
DEBUG: Considering 1012 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_fetch): set([1008])
DEBUG: Considering 1018 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_unpack): set([1019])
DEBUG: Considering 1019 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_patch): set([1023])
DEBUG: Considering 1022 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_fetch): set([1018])
DEBUG: Considering 1028 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_unpack): set([1029])
DEBUG: Considering 1029 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_patch): set([1033])
DEBUG: Considering 1032 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_fetch): set([1028])
DEBUG: Considering 1038 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_unpack): set([1039])
DEBUG: Considering 1039 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_patch): set([1043])
DEBUG: Considering 1042 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_fetch): set([1038])
DEBUG: Considering 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_unpack): set([1046])
DEBUG: Considering 1046 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_patch): set([1051])
DEBUG: Considering 1050 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_fetch): set([1045])
DEBUG: Considering 1051 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_configure): set([1052, 1053])
DEBUG: Considering 1052 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_configure_ptest_base): set([1053])
DEBUG: Considering 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1059])
DEBUG: Considering 1059 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_patch): set([1064])
DEBUG: Considering 1063 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1058])
DEBUG: Considering 1064 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_configure): set([1065, 1066])
DEBUG: Considering 1065 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_configure_ptest_base): set([1066])
DEBUG: Considering 1071 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_unpack): set([1072])
DEBUG: Considering 1072 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_patch): set([1076])
DEBUG: Considering 1075 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_fetch): set([1071])
DEBUG: Considering 1081 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_unpack): set([1082])
DEBUG: Considering 1082 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_patch): set([1086])
DEBUG: Considering 1085 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_fetch): set([1081])
DEBUG: Considering 1091 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_unpack): set([1092])
DEBUG: Considering 1092 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_patch): set([1096])
DEBUG: Considering 1095 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_fetch): set([1091])
DEBUG: Considering 1101 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_unpack): set([1102])
DEBUG: Considering 1102 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_patch): set([1106])
DEBUG: Considering 1105 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_fetch): set([1101])
DEBUG: Considering 1108 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_unpack): set([1109])
DEBUG: Considering 1109 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_patch): set([1113])
DEBUG: Considering 1112 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_fetch): set([1108])
DEBUG: Considering 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_unpack): set([1119])
DEBUG: Considering 1119 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_patch): set([1124])
DEBUG: Considering 1123 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_fetch): set([1118])
DEBUG: Considering 1124 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_configure): set([1125, 1126])
DEBUG: Considering 1125 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_configure_ptest_base): set([1126])
DEBUG: Considering 1131 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack): set([1132])
DEBUG: Considering 1132 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_patch): set([1136])
DEBUG: Considering 1135 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_fetch): set([1131])
DEBUG: Considering 1138 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_unpack): set([1139])
DEBUG: Considering 1139 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_patch): set([1143])
DEBUG: Considering 1142 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_fetch): set([1138])
DEBUG: Considering 1148 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_unpack): set([1149])
DEBUG: Considering 1149 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_patch): set([1153])
DEBUG: Considering 1152 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_fetch): set([1148])
DEBUG: Considering 1155 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_unpack): set([1156])
DEBUG: Considering 1156 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_patch): set([1160])
DEBUG: Considering 1159 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_fetch): set([1155])
DEBUG: Considering 1162 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_unpack): set([1163])
DEBUG: Considering 1163 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_patch): set([1167])
DEBUG: Considering 1166 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_fetch): set([1162])
DEBUG: Considering 1169 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_unpack): set([1170])
DEBUG: Considering 1170 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_patch): set([1174])
DEBUG: Considering 1173 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_fetch): set([1169])
DEBUG: Considering 1176 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_unpack): set([1177])
DEBUG: Considering 1177 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_patch): set([1181])
DEBUG: Considering 1180 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_fetch): set([1176])
DEBUG: Considering 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_unpack): set([1187])
DEBUG: Considering 1187 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_patch): set([1192])
DEBUG: Considering 1191 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_fetch): set([1186])
DEBUG: Considering 1192 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_configure): set([1193, 1194])
DEBUG: Considering 1193 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_configure_ptest_base): set([1194])
DEBUG: Considering 1199 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_unpack): set([1200])
DEBUG: Considering 1200 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_patch): set([1204])
DEBUG: Considering 1203 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_fetch): set([1199])
DEBUG: Considering 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_unpack): set([1207])
DEBUG: Considering 1207 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_patch): set([1212])
DEBUG: Considering 1211 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_fetch): set([1206])
DEBUG: Considering 1212 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_configure): set([1213, 1214])
DEBUG: Considering 1213 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_configure_ptest_base): set([1214])
DEBUG: Considering 1219 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_unpack): set([1220])
DEBUG: Considering 1220 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_patch): set([1224])
DEBUG: Considering 1223 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_fetch): set([1219])
DEBUG: Considering 1229 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([1230])
DEBUG: Considering 1230 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_patch): set([1234])
DEBUG: Considering 1233 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([1229])
DEBUG: Considering 1236 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_unpack): set([1237])
DEBUG: Considering 1237 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_patch): set([1241])
DEBUG: Considering 1240 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_fetch): set([1236])
DEBUG: Considering 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_unpack): set([1244])
DEBUG: Considering 1244 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_patch): set([1248])
DEBUG: Considering 1247 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_fetch): set([1243])
DEBUG: Considering 1248 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_configure): set([1249, 1250])
DEBUG: Considering 1249 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_configure_ptest_base): set([1250])
DEBUG: Considering 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_unpack): set([1256])
DEBUG: Considering 1256 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_patch): set([1260])
DEBUG: Considering 1259 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_fetch): set([1255])
DEBUG: Considering 1260 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_configure): set([1261, 1262])
DEBUG: Considering 1261 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_configure_ptest_base): set([1262])
DEBUG: Considering 1267 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_unpack): set([1268])
DEBUG: Considering 1268 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_patch): set([1271])
DEBUG: Considering 1270 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_fetch): set([1267])
DEBUG: Considering 1276 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_unpack): set([1277])
DEBUG: Considering 1277 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_patch): set([1281])
DEBUG: Considering 1280 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_fetch): set([1276])
DEBUG: Considering 1286 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_unpack): set([128=
7])
DEBUG: Considering 1287 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_patch): set([1290=
])
DEBUG: Considering 1289 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_fetch): set([1286=
])
DEBUG: Considering 1295 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_unpack): set([1296])
DEBUG: Considering 1296 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_patch): set([1299])
DEBUG: Considering 1298 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_fetch): set([1295])
DEBUG: Considering 1304 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_unpack): set([1305])
DEBUG: Considering 1305 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_patch): set([1308])
DEBUG: Considering 1307 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_fetch): set([1304])
DEBUG: Considering 1313 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_unpack): set([1314])
DEBUG: Considering 1314 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_patch): set([1317])
DEBUG: Considering 1316 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_fetch): set([1313])
DEBUG: Considering 1322 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1323])
DEBUG: Considering 1323 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_patch): set([1326])
DEBUG: Considering 1325 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([1322])
DEBUG: Considering 1331 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_unpack): set([1332])
DEBUG: Considering 1332 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_patch): set([1335])
DEBUG: Considering 1334 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_fetch): set([1331])
DEBUG: Considering 1340 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_unpack): set([1341])
DEBUG: Considering 1341 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_patch): set([1345])
DEBUG: Considering 1344 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_fetch): set([1340])
DEBUG: Considering 1350 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_unpack): set([1351])
DEBUG: Considering 1351 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_patch): set([1355])
DEBUG: Considering 1354 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_fetch): set([1350])
DEBUG: Considering 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_unpack): set([1358])
DEBUG: Considering 1358 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_patch): set([1362])
DEBUG: Considering 1361 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_fetch): set([1357])
DEBUG: Considering 1362 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_configure): set([1363, 1364])
DEBUG: Considering 1363 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_configure_ptest_base): set([1364])
DEBUG: Considering 1369 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_unpack): set([1370])
DEBUG: Considering 1370 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_patch): set([1373])
DEBUG: Considering 1372 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_fetch): set([1369])
DEBUG: Considering 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_unpack): set([1379])
DEBUG: Considering 1379 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_patch): set([1384])
DEBUG: Considering 1383 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_fetch): set([1378])
DEBUG: Considering 1384 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_configure): set([1385, 1386])
DEBUG: Considering 1385 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_configure_ptest_base): set([1386])
DEBUG: Considering 1391 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_unpack): set([1392])
DEBUG: Considering 1392 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_patch): set([1396])
DEBUG: Considering 1395 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_fetch): set([1391])
DEBUG: Considering 1398 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1400])
DEBUG: Considering 1399 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack): set([1400, 1398])
DEBUG: Considering 1400 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_patch): set([1404])
DEBUG: Considering 1403 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_fetch): set([1399])
DEBUG: Considering 1406 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_unpack): set([1407])
DEBUG: Considering 1407 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_patch): set([1411])
DEBUG: Considering 1410 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_fetch): set([1406])
DEBUG: Considering 1413 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_unpack): set([1414])
DEBUG: Considering 1414 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_patch): set([1418])
DEBUG: Considering 1417 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_fetch): set([1413])
DEBUG: Considering 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_unpack): set([1421])
DEBUG: Considering 1421 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_patch): set([1426])
DEBUG: Considering 1425 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_fetch): set([1420])
DEBUG: Considering 1426 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_configure): set([1427, 1428])
DEBUG: Considering 1427 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_configure_ptest_base): set([1428])
DEBUG: Considering 1433 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_unpack): set([1434])
DEBUG: Considering 1434 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_patch): set([1438])
DEBUG: Considering 1437 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_fetch): set([1433])
DEBUG: Considering 1440 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_unpack): set([1441])
DEBUG: Considering 1441 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_patch): set([1445])
DEBUG: Considering 1444 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_fetch): set([1440])
DEBUG: Considering 1450 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_unpack): set([1451])
DEBUG: Considering 1451 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_patch): set([1455])
DEBUG: Considering 1454 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_fetch): set([1450])
DEBUG: Considering 1457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1458])
DEBUG: Considering 1458 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_patch): set([1462])
DEBUG: Considering 1461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1457])
DEBUG: Considering 1467 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1468])
DEBUG: Considering 1468 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_patch): set([1472])
DEBUG: Considering 1471 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1467])
DEBUG: Considering 1474 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1475])
DEBUG: Considering 1475 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_patch): set([1479])
DEBUG: Considering 1478 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1474])
DEBUG: Considering 1481 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_unpack): set([1482])
DEBUG: Considering 1482 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_patch): set([1486])
DEBUG: Considering 1485 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_fetch): set([1481])
DEBUG: Considering 1491 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_unpack): set([1492])
DEBUG: Considering 1492 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_patch): set([1496])
DEBUG: Considering 1495 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_fetch): set([1491])
DEBUG: Considering 1498 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_unpack): set([1499])
DEBUG: Considering 1499 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_patch): set([1503])
DEBUG: Considering 1502 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_fetch): set([1498])
DEBUG: Considering 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1510])
DEBUG: Considering 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_unpack): set([1508, 1510])
DEBUG: Considering 1510 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_patch): set([1515])
DEBUG: Considering 1514 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_fetch): set([1509])
DEBUG: Considering 1515 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_configure): set([1516, 1517])
DEBUG: Considering 1516 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_configure_ptest_base): set([1517])
DEBUG: Considering 1522 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([1523])
DEBUG: Considering 1523 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_patch): set([1527])
DEBUG: Considering 1526 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([1522])
DEBUG: Considering 1529 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_unpack): set([1530])
DEBUG: Considering 1530 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_patch): set([1534])
DEBUG: Considering 1533 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_fetch): set([1529])
DEBUG: Considering 1536 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_unpack): set([1537])
DEBUG: Considering 1537 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_patch): set([1541])
DEBUG: Considering 1540 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_fetch): set([1536])
DEBUG: Considering 1546 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_unpack): set([1547])
DEBUG: Considering 1547 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_patch): set([1551])
DEBUG: Considering 1550 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_fetch): set([1546])
DEBUG: Considering 1553 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_unpack): set([1554])
DEBUG: Considering 1554 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_patch): set([1558])
DEBUG: Considering 1557 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_fetch): set([1553])
DEBUG: Considering 1560 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_unpack): set([1561])
DEBUG: Considering 1561 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_patch): set([1565])
DEBUG: Considering 1564 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_fetch): set([1560])
DEBUG: Considering 1567 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_unpack): set([1568])
DEBUG: Considering 1568 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_patch): set([1572])
DEBUG: Considering 1571 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_fetch): set([1567])
DEBUG: Considering 1577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_unpack): set([1578])
DEBUG: Considering 1578 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_patch): set([1582])
DEBUG: Considering 1581 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_fetch): set([1577])
DEBUG: Considering 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_unpack): set([1585])
DEBUG: Considering 1585 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_patch): set([1590])
DEBUG: Considering 1589 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_fetch): set([1584])
DEBUG: Considering 1590 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_configure): set([1592, 1591])
DEBUG: Considering 1591 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_configure_ptest_base): set([1592])
DEBUG: Considering 1597 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1=
598])
DEBUG: Considering 1598 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_patch): set([16=
02])
DEBUG: Considering 1601 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([15=
97])
DEBUG: Considering 1604 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_unpack): set([1605])
DEBUG: Considering 1605 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_patch): set([1609])
DEBUG: Considering 1608 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_fetch): set([1604])
DEBUG: Considering 1611 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_unpack): set([1612])
DEBUG: Considering 1612 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_patch): set([1616])
DEBUG: Considering 1615 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_fetch): set([1611])
DEBUG: Considering 1618 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_unpack): set([1619])
DEBUG: Considering 1619 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_patch): set([1623])
DEBUG: Considering 1622 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_fetch): set([1618])
DEBUG: Considering 1628 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([1629])
DEBUG: Considering 1629 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_patch): set([1633])
DEBUG: Considering 1632 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([1628])
DEBUG: Considering 1638 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_unpack): set([1639])
DEBUG: Considering 1639 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_patch): set([1643])
DEBUG: Considering 1642 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_fetch): set([1638])
DEBUG: Considering 1648 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_unpack): set([1649])
DEBUG: Considering 1649 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_patch): set([1652])
DEBUG: Considering 1651 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_fetch): set([1648])
DEBUG: Considering 1657 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_unpack): set([1658])
DEBUG: Considering 1658 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_patch): set([1662])
DEBUG: Considering 1661 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_fetch): set([1657])
DEBUG: Considering 1667 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_unpack): set([1668])
DEBUG: Considering 1668 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_patch): set([1672])
DEBUG: Considering 1671 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_fetch): set([1667])
DEBUG: Considering 1674 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_unpack): set([1675])
DEBUG: Considering 1675 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_patch): set([1679])
DEBUG: Considering 1678 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_fetch): set([1674])
DEBUG: Considering 1684 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_unpack): set([1685])
DEBUG: Considering 1685 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_patch): set([1689])
DEBUG: Considering 1688 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_fetch): set([1684])
DEBUG: Considering 1694 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_unpack): set([1695])
DEBUG: Considering 1695 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_patch): set([1699])
DEBUG: Considering 1698 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_fetch): set([1694])
DEBUG: Considering 1701 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_unpack): set([1702])
DEBUG: Considering 1702 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_patch): set([1706])
DEBUG: Considering 1705 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_fetch): set([1701])
DEBUG: Considering 1711 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_unpack): set([1712])
DEBUG: Considering 1712 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_patch): set([1716])
DEBUG: Considering 1715 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_fetch): set([1711])
DEBUG: Considering 1721 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_unpack): set([1722])
DEBUG: Considering 1722 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_patch): set([1726])
DEBUG: Considering 1725 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_fetch): set([1721])
DEBUG: Considering 0 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_unpack): set([1])
DEBUG: Considering 4 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.16.2.bb, do_fetch): set([0])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Considering 13 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_unpack): set([14])
DEBUG: Considering 17 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/q=
uilt/quilt-native_0.63.bb, do_fetch): set([13])
DEBUG: Considering 20 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_unpack): set([21])
DEBUG: Considering 24 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pseudo/pseudo_1.6.2.bb, do_fetch): set([20])
DEBUG: Considering 27 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_unpack): set([28])
DEBUG: Considering 31 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/prelink/prelink_git.bb, do_fetch): set([27])
DEBUG: Considering 34 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_unpack): set([35])
DEBUG: Considering 38 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/rpm/rpm_5.4.14.bb, do_fetch): set([34])
DEBUG: Considering 41 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_unpack): set([42])
DEBUG: Considering 45 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/file/file_5.18.bb, do_fetch): set([41])
DEBUG: Considering 48 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_unpack): set([49])
DEBUG: Considering 52 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_fetch): set([48])
DEBUG: Considering 55 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_unpack): set([56])
DEBUG: Considering 59 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb, do_fetch): set([55])
DEBUG: Considering 62 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_unpack): set([63])
DEBUG: Considering 66 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/automake/automake_1.14.1.bb, do_fetch): set([62])
DEBUG: Considering 69 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_unpack): set([70])
DEBUG: Considering 73 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-native_2.4.2.bb, do_fetch): set([69])
DEBUG: Considering 76 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_unpack): set([77])
DEBUG: Considering 80 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_fetch): set([76])
DEBUG: Considering 86 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_unpack): set([87])
DEBUG: Considering 90 (virtual:native:/home/alimon/repos/poky-bugs/meta/rec=
ipes-devtools/gnu-config/gnu-config_20120814.bb, do_fetch): set([86])
DEBUG: Considering 93 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_unpack): set([94])
DEBUG: Considering 94 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_patch): set([98, 99])
DEBUG: Considering 97 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_fetch): set([93])
DEBUG: Considering 101 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_unpack): set([102])
DEBUG: Considering 102 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_patch): set([106, 107])
DEBUG: Considering 105 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_fetch): set([101])
DEBUG: Considering 112 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_unpack): set([113])
DEBUG: Considering 118 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc_2.20.bb, do_fetch): set([112])
DEBUG: Considering 124 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_unpack): set([125])
DEBUG: Considering 128 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/randrproto_1.4.0.bb, do_fetch): set([124])
DEBUG: Considering 134 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_unpack): set([135])
DEBUG: Considering 138 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/renderproto_0.11.1.bb, do_fetch): set([134])
DEBUG: Considering 144 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_unpack): set([145])
DEBUG: Considering 148 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fixesproto_5.0.bb, do_fetch): set([144])
DEBUG: Considering 154 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_unpack): set([155])
DEBUG: Considering 158 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/damageproto_1.2.1.bb, do_fetch): set([154])
DEBUG: Considering 164 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_unpack): set([165])
DEBUG: Considering 168 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xextproto_7.3.0.bb, do_fetch): set([164])
DEBUG: Considering 174 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_unpack): set([175])
DEBUG: Considering 178 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xproto_7.0.26.bb, do_fetch): set([174])
DEBUG: Considering 184 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_unpack): set([185])
DEBUG: Considering 188 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86dgaproto_2.1.bb, do_fetch): set([184])
DEBUG: Considering 194 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_unpack): set([195])
DEBUG: Considering 198 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86miscproto_0.9.3.bb, do_fetch): set([194])
DEBUG: Considering 204 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_unpack): set([205])
DEBUG: Considering 208 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86vidmodeproto_2.3.1.bb, do_fetch): set([204])
DEBUG: Considering 214 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_unpack): set([215])
DEBUG: Considering 218 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/compositeproto_0.4.2.bb, do_fetch): set([214])
DEBUG: Considering 224 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_unpack): set([225])
DEBUG: Considering 228 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/recordproto_1.14.2.bb, do_fetch): set([224])
DEBUG: Considering 234 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_unpack): set([235])
DEBUG: Considering 238 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/resourceproto_1.2.0.bb, do_fetch): set([234])
DEBUG: Considering 244 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_unpack): set([245])
DEBUG: Considering 248 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/videoproto_2.3.2.bb, do_fetch): set([244])
DEBUG: Considering 254 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_unpack): set([255])
DEBUG: Considering 258 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/scrnsaverproto_1.2.2.bb, do_fetch): set([254])
DEBUG: Considering 264 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_unpack): set([265])
DEBUG: Considering 268 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xineramaproto_1.2.1.bb, do_fetch): set([264])
DEBUG: Considering 274 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_unpack): set([275])
DEBUG: Considering 278 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/fontsproto_2.1.3.bb, do_fetch): set([274])
DEBUG: Considering 284 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_unpack): set([285])
DEBUG: Considering 288 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/kbproto_1.0.6.bb, do_fetch): set([284])
DEBUG: Considering 294 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_unpack): set([295])
DEBUG: Considering 298 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/inputproto_2.3.1.bb, do_fetch): set([294])
DEBUG: Considering 304 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_unpack): set([305])
DEBUG: Considering 308 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/bigreqsproto_1.1.2.bb, do_fetch): set([304])
DEBUG: Considering 314 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_unpack): set([315])
DEBUG: Considering 318 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xcmiscproto_1.2.2.bb, do_fetch): set([314])
DEBUG: Considering 324 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_unpack): set([325])
DEBUG: Considering 328 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/presentproto_git.bb, do_fetch): set([324])
DEBUG: Considering 334 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_unpack): set([335])
DEBUG: Considering 338 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/pixman_0.32.6.bb, do_fetch): set([334])
DEBUG: Considering 344 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_unpack): set([345])
DEBUG: Considering 348 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxfont_1.5.0.bb, do_fetch): set([344])
DEBUG: Considering 354 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_unpack): set([355])
DEBUG: Considering 358 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xtrans_1.3.4.bb, do_fetch): set([354])
DEBUG: Considering 364 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_unpack): set([365])
DEBUG: Considering 368 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxau_1.0.8.bb, do_fetch): set([364])
DEBUG: Considering 374 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_unpack): set([375])
DEBUG: Considering 378 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxext_1.3.2.bb, do_fetch): set([374])
DEBUG: Considering 384 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_unpack): set([385])
DEBUG: Considering 388 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxdmcp_1.1.1.bb, do_fetch): set([384])
DEBUG: Considering 394 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_unpack): set([395])
DEBUG: Considering 398 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
drm/libdrm_2.4.58.bb, do_fetch): set([394])
DEBUG: Considering 404 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_unpack): set([405])
DEBUG: Considering 408 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxkbfile_1.0.8.bb, do_fetch): set([404])
DEBUG: Considering 414 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_unpack): set([415])
DEBUG: Considering 418 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpciaccess_0.13.2.bb, do_fetch): set([414])
DEBUG: Considering 424 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_unpack): set([425])
DEBUG: Considering 425 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_patch): set([430])
DEBUG: Considering 429 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_fetch): set([424])
DEBUG: Considering 430 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_configure): set([432, 431])
DEBUG: Considering 437 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_unpack): set([438])
DEBUG: Considering 441 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgcrypt/libgcrypt_1.6.2.bb, do_fetch): set([437])
DEBUG: Considering 447 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_unpack): set([448])
DEBUG: Considering 451 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/font-util_1.3.0.bb, do_fetch): set([447])
DEBUG: Considering 457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_unpack): set([458])
DEBUG: Considering 461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/glproto_1.4.17.bb, do_fetch): set([457])
DEBUG: Considering 467 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_unpack): set([468])
DEBUG: Considering 471 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
mesa/mesa_10.3.3.bb, do_fetch): set([467])
DEBUG: Considering 477 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_unpack): set([478])
DEBUG: Considering 481 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/xf86driproto_2.1.1.bb, do_fetch): set([477])
DEBUG: Considering 487 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_unpack): set([488])
DEBUG: Considering 491 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-proto/dri2proto_2.8.bb, do_fetch): set([487])
DEBUG: Considering 497 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_unpack): set([498])
DEBUG: Considering 501 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libx11_1.6.2.bb, do_fetch): set([497])
DEBUG: Considering 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_unpack): set([508])
DEBUG: Considering 508 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_patch): set([513])
DEBUG: Considering 512 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_fetch): set([507])
DEBUG: Considering 513 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_configure): set([514, 515])
DEBUG: Considering 520 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_unpack): set([521])
DEBUG: Considering 523 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/xkeyboard-config_2.12.bb, do_fetch): set([520])
DEBUG: Considering 529 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_unpack): set([530])
DEBUG: Considering 532 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/rgb_1.0.5.bb, do_fetch): set([529])
DEBUG: Considering 538 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_unpack): set([539])
DEBUG: Considering 541 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xf86-config_0.1.bb, do_fetch): set([538])
DEBUG: Considering 547 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_unpack): set([548])
DEBUG: Considering 550 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/xkbcomp_1.2.4.bb, do_fetch): set([547])
DEBUG: Considering 556 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_unpack): set([557])
DEBUG: Considering 560 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
m4/m4-native_1.4.17.bb, do_fetch): set([556])
DEBUG: Considering 563 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_unpack): set([564])
DEBUG: Considering 566 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
make/make_4.0.bb, do_fetch): set([563])
DEBUG: Considering 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_unpack): set([573])
DEBUG: Considering 573 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_patch): set([577])
DEBUG: Considering 576 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_fetch): set([572])
DEBUG: Considering 577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_configure): set([578, 579])
DEBUG: Considering 584 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_unpack): set([585])
DEBUG: Considering 587 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
bc/bc_1.06.bb, do_fetch): set([584])
DEBUG: Considering 593 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_unpack): set([594])
DEBUG: Considering 596 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontdir_1.0.7.bb, do_fetch): set([593])
DEBUG: Considering 602 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([603])
DEBUG: Considering 605 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([602])
DEBUG: Considering 611 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_unpack): set([612])
DEBUG: Considering 615 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-font/encodings_1.0.4.bb, do_fetch): set([611])
DEBUG: Considering 621 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_unpack): set([622])
DEBUG: Considering 624 (/home/alimon/repos/poky-bugs/meta/recipes-core/upda=
te-rc.d/update-rc.d_0.7.bb, do_fetch): set([621])
DEBUG: Considering 630 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([631])
DEBUG: Considering 634 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([630])
DEBUG: Considering 637 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_unpack): set([638])
DEBUG: Considering 641 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/attr_2.4.47.bb, do_fetch): set([637])
DEBUG: Considering 644 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_unpack): set([645])
DEBUG: Considering 648 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/elfutils/elfutils_0.160.bb, do_fetch): set([644])
DEBUG: Considering 651 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_unpack): set([652])
DEBUG: Considering 655 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/binutils/binutils_2.24.bb, do_fetch): set([651])
DEBUG: Considering 658 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_unpack): set([659])
DEBUG: Considering 662 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext-minimal-native_0.18.3.2.bb, do_fetch): set([658])
DEBUG: Considering 665 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_unpack): set([666])
DEBUG: Considering 669 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libpcre/libpcre_8.36.bb, do_fetch): set([665])
DEBUG: Considering 672 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_unpack): set([673])
DEBUG: Considering 676 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/attr/acl_2.2.52.bb, do_fetch): set([672])
DEBUG: Considering 679 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_unpack): set([680])
DEBUG: Considering 683 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/popt/popt_1.16.bb, do_fetch): set([679])
DEBUG: Considering 686 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_unpack): set([687])
DEBUG: Considering 690 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_fetch): set([686])
DEBUG: Considering 693 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_unpack): set([694])
DEBUG: Considering 697 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/byacc/byacc_20141006.bb, do_fetch): set([693])
DEBUG: Considering 700 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_unpack): set([701])
DEBUG: Considering 704 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/beecrypt/beecrypt_4.2.1.bb, do_fetch): set([700])
DEBUG: Considering 707 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_unpack): set([708])
DEBUG: Considering 711 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/db/db_6.0.30.bb, do_fetch): set([707])
DEBUG: Considering 714 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_unpack): set([715])
DEBUG: Considering 718 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-connectivity/openssl/openssl_1.0.1j.bb, do_fetch): set([714])
DEBUG: Considering 721 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_unpack): set([722])
DEBUG: Considering 725 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
python/python-native_2.7.3.bb, do_fetch): set([721])
DEBUG: Considering 728 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_unpack): set([729])
DEBUG: Considering 732 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/zlib/zlib_1.2.8.bb, do_fetch): set([728])
DEBUG: Considering 735 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_unpack): set([736])
DEBUG: Considering 739 (/home/alimon/repos/poky-bugs/meta/recipes-extended/=
texinfo-dummy-native/texinfo-dummy-native.bb, do_fetch): set([735])
DEBUG: Considering 742 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_unpack): set([743])
DEBUG: Considering 746 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
binutils/binutils-cross_2.24.bb, do_fetch): set([742])
DEBUG: Considering 749 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_unpack): set([750])
DEBUG: Considering 753 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/li=
nux-libc-headers/linux-libc-headers_3.16.bb, do_fetch): set([749])
DEBUG: Considering 759 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_unpack): set([760])
DEBUG: Considering 763 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/mpfr/mpfr_3.1.2.bb, do_fetch): set([759])
DEBUG: Considering 766 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_unpack): set([767])
DEBUG: Considering 770 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/gmp/gmp_6.0.0.bb, do_fetch): set([766])
DEBUG: Considering 773 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_unpack): set([774])
DEBUG: Considering 777 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-support/libmpc/libmpc_1.0.2.bb, do_fetch): set([773])
DEBUG: Considering 780 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_unpack): set([781])
DEBUG: Considering 781 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_patch): set([787, 788])
DEBUG: Considering 786 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_fetch): set([780])
DEBUG: Considering 793 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_unpack): set([794])
DEBUG: Considering 794 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_patch): set([798, 799])
DEBUG: Considering 797 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_fetch): set([793])
DEBUG: Considering 801 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_unpack): set([802])
DEBUG: Considering 802 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_patch): set([808, 809])
DEBUG: Considering 807 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_fetch): set([801])
DEBUG: Considering 814 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_unpack): set([815])
DEBUG: Considering 820 (/home/alimon/repos/poky-bugs/meta/recipes-core/glib=
c/glibc-initial_2.20.bb, do_fetch): set([814])
DEBUG: Considering 826 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_unpack): set([827])
DEBUG: Considering 830 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-extended/gperf/gperf_3.0.4.bb, do_fetch): set([826])
DEBUG: Considering 833 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_unpack):=
 set([834])
DEBUG: Considering 837 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_fetch): =
set([833])
DEBUG: Considering 840 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_unpack): set([841])
DEBUG: Considering 844 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-util/util-macros_1.19.0.bb, do_fetch): set([840])
DEBUG: Considering 850 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_unpack): set([851])
DEBUG: Considering 854 (/home/alimon/repos/poky-bugs/meta/recipes-core/gett=
ext/gettext_0.18.3.2.bb, do_fetch): set([850])
DEBUG: Considering 860 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_unpack): set([861])
DEBUG: Considering 864 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/gettext/gettext_0.18.3.2.bb, do_fetch): set([860])
DEBUG: Considering 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_unpack): set([868])
DEBUG: Considering 868 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_patch): set([873])
DEBUG: Considering 872 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_fetch): set([867])
DEBUG: Considering 873 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_configure): set([874, 875])
DEBUG: Considering 880 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_unpack): set([881])
DEBUG: Considering 884 (/home/alimon/repos/poky-bugs/meta/recipes-multimedi=
a/libpng/libpng_1.6.13.bb, do_fetch): set([880])
DEBUG: Considering 890 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_unpack): set([891])
DEBUG: Considering 894 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
freetype/freetype_2.5.3.bb, do_fetch): set([890])
DEBUG: Considering 900 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([901])
DEBUG: Considering 904 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([900])
DEBUG: Considering 910 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_unpack): set([911])
DEBUG: Considering 914 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libpthread-stubs_0.3.bb, do_fetch): set([910])
DEBUG: Considering 920 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_unpack): set([921])
DEBUG: Considering 924 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/cr=
yptodev/cryptodev-linux_1.6.bb, do_fetch): set([920])
DEBUG: Considering 930 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_unpack): set([931])
DEBUG: Considering 934 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibgpg-error/libgpg-error_1.12.bb, do_fetch): set([930])
DEBUG: Considering 940 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_unpack): set([941])
DEBUG: Considering 944 (/home/alimon/repos/poky-bugs/meta/recipes-support/l=
ibcap/libcap_2.24.bb, do_fetch): set([940])
DEBUG: Considering 950 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_unpack): set([951])
DEBUG: Considering 954 (/home/alimon/repos/poky-bugs/meta/recipes-core/expa=
t/expat_2.1.0.bb, do_fetch): set([950])
DEBUG: Considering 960 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_unpack): set([961])
DEBUG: Considering 964 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-graphics/xorg-util/makedepend_1.0.5.bb, do_fetch): set([960])
DEBUG: Considering 967 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_unpack): set([968])
DEBUG: Considering 971 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/flex/flex_2.5.39.bb, do_fetch): set([967])
DEBUG: Considering 974 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_unpack): set([975])
DEBUG: Considering 978 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/bison/bison_2.7.1.bb, do_fetch): set([974])
DEBUG: Considering 981 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_unpack): set([982])
DEBUG: Considering 985 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-core/libxml/libxml2_2.9.1.bb, do_fetch): set([981])
DEBUG: Considering 988 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_unpack): set([989])
DEBUG: Considering 992 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
wayland/wayland_1.6.0.bb, do_fetch): set([988])
DEBUG: Considering 998 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-lib/libxxf86vm_1.1.3.bb, do_unpack): set([999])
DEBUG: Considering 1002 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_fetch): set([998])
DEBUG: Considering 1008 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_unpack): set([1009])
DEBUG: Considering 1012 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdamage_1.1.4.bb, do_fetch): set([1008])
DEBUG: Considering 1018 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_unpack): set([1019])
DEBUG: Considering 1022 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfixes_5.0.1.bb, do_fetch): set([1018])
DEBUG: Considering 1028 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_unpack): set([1029])
DEBUG: Considering 1032 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxcb_1.10.bb, do_fetch): set([1028])
DEBUG: Considering 1038 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_unpack): set([1039])
DEBUG: Considering 1042 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xproto_7.0.26.bb, do_fetch): set([1038])
DEBUG: Considering 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_unpack): set([1046])
DEBUG: Considering 1046 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_patch): set([1051])
DEBUG: Considering 1050 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_fetch): set([1045])
DEBUG: Considering 1051 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_configure): set([1052, 1053])
DEBUG: Considering 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1059])
DEBUG: Considering 1059 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_patch): set([1064])
DEBUG: Considering 1063 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1058])
DEBUG: Considering 1064 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_configure): set([1065, 1066])
DEBUG: Considering 1071 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_unpack): set([1072])
DEBUG: Considering 1075 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb-compat_0.1.5.bb, do_fetch): set([1071])
DEBUG: Considering 1081 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_unpack): set([1082])
DEBUG: Considering 1085 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usbu=
tils/usbutils_007.bb, do_fetch): set([1081])
DEBUG: Considering 1091 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_unpack): set([1092])
DEBUG: Considering 1095 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pciu=
tils/pciutils_3.2.1.bb, do_fetch): set([1091])
DEBUG: Considering 1101 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_unpack): set([1102])
DEBUG: Considering 1105 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libxslt/libxslt_1.1.28.bb, do_fetch): set([1101])
DEBUG: Considering 1108 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_unpack): set([1109])
DEBUG: Considering 1112 (/home/alimon/repos/poky-bugs/meta/recipes-core/uti=
l-linux/util-linux_2.24.2.bb, do_fetch): set([1108])
DEBUG: Considering 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_unpack): set([1119])
DEBUG: Considering 1119 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_patch): set([1124])
DEBUG: Considering 1123 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_fetch): set([1118])
DEBUG: Considering 1124 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_configure): set([1125, 1126])
DEBUG: Considering 1131 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack): set([1132])
DEBUG: Considering 1135 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/update-rc.d/update-rc.d_0.7.bb, do_fetch): set([1131])
DEBUG: Considering 1138 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_unpack): set([1139])
DEBUG: Considering 1142 (/home/alimon/repos/poky-bugs/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb, do_fetch): set([1138])
DEBUG: Considering 1148 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_unpack): set([1149])
DEBUG: Considering 1152 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/intltool/intltool_0.50.2.bb, do_fetch): set([1148])
DEBUG: Considering 1155 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_unpack): set([1156])
DEBUG: Considering 1159 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/util-macros_1.19.0.bb, do_fetch): set([1155])
DEBUG: Considering 1162 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_unpack): set([1163])
DEBUG: Considering 1166 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/xz/xz_5.1.3alpha.bb, do_fetch): set([1162])
DEBUG: Considering 1169 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_unpack): set([1170])
DEBUG: Considering 1173 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/ncurses/ncurses_5.9.bb, do_fetch): set([1169])
DEBUG: Considering 1176 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_unpack): set([1177])
DEBUG: Considering 1180 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
db/db_6.0.30.bb, do_fetch): set([1176])
DEBUG: Considering 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_unpack): set([1187])
DEBUG: Considering 1187 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_patch): set([1192])
DEBUG: Considering 1191 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_fetch): set([1186])
DEBUG: Considering 1192 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_configure): set([1193, 1194])
DEBUG: Considering 1199 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_unpack): set([1200])
DEBUG: Considering 1203 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl-native_5.20.0.bb, do_fetch): set([1199])
DEBUG: Considering 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_unpack): set([1207])
DEBUG: Considering 1207 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_patch): set([1212])
DEBUG: Considering 1211 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_fetch): set([1206])
DEBUG: Considering 1212 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_configure): set([1213, 1214])
DEBUG: Considering 1219 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_unpack): set([1220])
DEBUG: Considering 1223 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb, do_fetch): set([1219])
DEBUG: Considering 1229 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_unpack): set([1230])
DEBUG: Considering 1233 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_fetch): set([1229])
DEBUG: Considering 1236 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_unpack): set([1237])
DEBUG: Considering 1240 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-font/font-util_1.3.0.bb, do_fetch): set([1236])
DEBUG: Considering 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_unpack): set([1244])
DEBUG: Considering 1244 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_patch): set([1248])
DEBUG: Considering 1247 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_fetch): set([1243])
DEBUG: Considering 1248 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_configure): set([1249, 1250])
DEBUG: Considering 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_unpack): set([1256])
DEBUG: Considering 1256 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_patch): set([1260])
DEBUG: Considering 1259 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_fetch): set([1255])
DEBUG: Considering 1260 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_configure): set([1261, 1262])
DEBUG: Considering 1267 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_unpack): set([1268])
DEBUG: Considering 1270 (/home/alimon/repos/poky-bugs/meta/recipes-core/cor=
eutils/coreutils_8.22.bb, do_fetch): set([1267])
DEBUG: Considering 1276 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_unpack): set([1277])
DEBUG: Considering 1280 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow_4.2.1.bb, do_fetch): set([1276])
DEBUG: Considering 1286 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_unpack): set([128=
7])
DEBUG: Considering 1289 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_fetch): set([1286=
])
DEBUG: Considering 1295 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_unpack): set([1296])
DEBUG: Considering 1298 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzdata/tzdata_2014j.bb, do_fetch): set([1295])
DEBUG: Considering 1304 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_unpack): set([1305])
DEBUG: Considering 1307 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pygobject_2.28.3.bb, do_fetch): set([1304])
DEBUG: Considering 1313 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_unpack): set([1314])
DEBUG: Considering 1316 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-dbus_1.2.0.bb, do_fetch): set([1313])
DEBUG: Considering 1322 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1323])
DEBUG: Considering 1325 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([1322])
DEBUG: Considering 1331 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_unpack): set([1332])
DEBUG: Considering 1334 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-locale_2.20.bb, do_fetch): set([1331])
DEBUG: Considering 1340 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_unpack): set([1341])
DEBUG: Considering 1344 (/home/alimon/repos/poky-bugs/meta/recipes-core/ncu=
rses/ncurses_5.9.bb, do_fetch): set([1340])
DEBUG: Considering 1350 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_unpack): set([1351])
DEBUG: Considering 1354 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/perl/libxml-parser-perl_2.41.bb, do_fetch): set([1350])
DEBUG: Considering 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_unpack): set([1358])
DEBUG: Considering 1358 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_patch): set([1362])
DEBUG: Considering 1361 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_fetch): set([1357])
DEBUG: Considering 1362 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_configure): set([1363, 1364])
DEBUG: Considering 1369 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_unpack): set([1370])
DEBUG: Considering 1372 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4_1.4.17.bb, do_fetch): set([1369])
DEBUG: Considering 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_unpack): set([1379])
DEBUG: Considering 1379 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_patch): set([1384])
DEBUG: Considering 1383 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_fetch): set([1378])
DEBUG: Considering 1384 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_configure): set([1385, 1386])
DEBUG: Considering 1391 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_unpack): set([1392])
DEBUG: Considering 1395 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_fetch): set([1391])
DEBUG: Considering 1398 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1400])
DEBUG: Considering 1399 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack): set([1400, 1398])
DEBUG: Considering 1403 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/bzip2/bzip2_1.0.6.bb, do_fetch): set([1399])
DEBUG: Considering 1406 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_unpack): set([1407])
DEBUG: Considering 1410 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/readline/readline_6.3.bb, do_fetch): set([1406])
DEBUG: Considering 1413 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_unpack): set([1414])
DEBUG: Considering 1417 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/unifdef/unifdef_2.10.bb, do_fetch): set([1413])
DEBUG: Considering 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_unpack): set([1421])
DEBUG: Considering 1421 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_patch): set([1426])
DEBUG: Considering 1425 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_fetch): set([1420])
DEBUG: Considering 1426 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_configure): set([1427, 1428])
DEBUG: Considering 1433 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_unpack): set([1434])
DEBUG: Considering 1437 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/pigz/pigz_2.3.1.bb, do_fetch): set([1433])
DEBUG: Considering 1440 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_unpack): set([1441])
DEBUG: Considering 1444 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/li=
bffi/libffi_3.1.bb, do_fetch): set([1440])
DEBUG: Considering 1450 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_unpack): set([1451])
DEBUG: Considering 1454 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/wayland/wayland_1.6.0.bb, do_fetch): set([1450])
DEBUG: Considering 1457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1458])
DEBUG: Considering 1461 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1457])
DEBUG: Considering 1467 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_unpack): set([1468])
DEBUG: Considering 1471 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_fetch): set([1467])
DEBUG: Considering 1474 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1475])
DEBUG: Considering 1478 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1474])
DEBUG: Considering 1481 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_unpack): set([1482])
DEBUG: Considering 1485 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus_1.8.2.bb, do_fetch): set([1481])
DEBUG: Considering 1491 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_unpack): set([1492])
DEBUG: Considering 1495 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_fetch): set([1491])
DEBUG: Considering 1498 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_unpack): set([1499])
DEBUG: Considering 1502 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libusb/libusb1_1.0.19.bb, do_fetch): set([1498])
DEBUG: Considering 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1510])
DEBUG: Considering 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_unpack): set([1508, 1510])
DEBUG: Considering 1510 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_patch): set([1515])
DEBUG: Considering 1514 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_fetch): set([1509])
DEBUG: Considering 1515 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_configure): set([1516, 1517])
DEBUG: Considering 1522 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_unpack): set([1523])
DEBUG: Considering 1526 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_fetch): set([1522])
DEBUG: Considering 1529 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_unpack): set([1530])
DEBUG: Considering 1533 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/freetype/freetype_2.5.3.bb, do_fetch): set([1529])
DEBUG: Considering 1536 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_unpack): set([1537])
DEBUG: Considering 1540 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gmp/gmp_6.0.0.bb, do_fetch): set([1536])
DEBUG: Considering 1546 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_unpack): set([1547])
DEBUG: Considering 1550 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/shadow/shadow_4.2.1.bb, do_fetch): set([1546])
DEBUG: Considering 1553 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_unpack): set([1554])
DEBUG: Considering 1557 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/tzcode/tzcode-native_2014j.bb, do_fetch): set([1553])
DEBUG: Considering 1560 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_unpack): set([1561])
DEBUG: Considering 1564 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/python/python-pygobject_2.28.3.bb, do_fetch): set([1560])
DEBUG: Considering 1567 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_unpack): set([1568])
DEBUG: Considering 1571 (/home/alimon/repos/poky-bugs/meta/recipes-core/dbu=
s/dbus-glib_0.100.2.bb, do_fetch): set([1567])
DEBUG: Considering 1577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_unpack): set([1578])
DEBUG: Considering 1581 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-pyrex-native_0.9.9.bb, do_fetch): set([1577])
DEBUG: Considering 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_unpack): set([1585])
DEBUG: Considering 1585 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_patch): set([1590])
DEBUG: Considering 1589 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_fetch): set([1584])
DEBUG: Considering 1590 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_configure): set([1592, 1591])
DEBUG: Considering 1597 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_unpack): set([1=
598])
DEBUG: Considering 1601 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_fetch): set([15=
97])
DEBUG: Considering 1604 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_unpack): set([1605])
DEBUG: Considering 1608 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/cross-localedef-native_2.20.bb, do_fetch): set([1604])
DEBUG: Considering 1611 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_unpack): set([1612])
DEBUG: Considering 1615 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/expat/expat_2.1.0.bb, do_fetch): set([1611])
DEBUG: Considering 1618 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_unpack): set([1619])
DEBUG: Considering 1622 (/home/alimon/repos/poky-bugs/meta/recipes-core/rea=
dline/readline_6.3.bb, do_fetch): set([1618])
DEBUG: Considering 1628 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_unpack): set([1629])
DEBUG: Considering 1632 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
sqlite/sqlite3_3.8.6.0.bb, do_fetch): set([1628])
DEBUG: Considering 1638 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_unpack): set([1639])
DEBUG: Considering 1642 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-files/base-files_3.0.14.bb, do_fetch): set([1638])
DEBUG: Considering 1648 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_unpack): set([1649])
DEBUG: Considering 1651 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-securetty_4.2.1.bb, do_fetch): set([1648])
DEBUG: Considering 1657 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_unpack): set([1658])
DEBUG: Considering 1661 (/home/alimon/repos/poky-bugs/meta/recipes-core/bas=
e-passwd/base-passwd_3.5.29.bb, do_fetch): set([1657])
DEBUG: Considering 1667 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_unpack): set([1668])
DEBUG: Considering 1671 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-gnome/libffi/libffi_3.1.bb, do_fetch): set([1667])
DEBUG: Considering 1674 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_unpack): set([1675])
DEBUG: Considering 1678 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/shadow/shadow-sysroot_4.2.1.bb, do_fetch): set([1674])
DEBUG: Considering 1684 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_unpack): set([1685])
DEBUG: Considering 1688 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libsm_1.2.2.bb, do_fetch): set([1684])
DEBUG: Considering 1694 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_unpack): set([1695])
DEBUG: Considering 1698 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus-glib_0.100.2.bb, do_fetch): set([1694])
DEBUG: Considering 1701 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_unpack): set([1702])
DEBUG: Considering 1705 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libice_1.0.9.bb, do_fetch): set([1701])
DEBUG: Considering 1711 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_unpack): set([1712])
DEBUG: Considering 1715 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/e2fsprogs/e2fsprogs_1.42.9.bb, do_fetch): set([1711])
DEBUG: Considering 1721 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_unpack): set([1722])
DEBUG: Considering 1725 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/dbus/dbus_1.8.2.bb, do_fetch): set([1721])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Considering 93 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_unpack): set([94])
DEBUG: Considering 97 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/g=
cc/gcc-cross_4.9.bb, do_fetch): set([93])
DEBUG: Considering 101 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_unpack): set([102])
DEBUG: Considering 105 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-runtime_4.9.bb, do_fetch): set([101])
DEBUG: Considering 424 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_unpack): set([425])
DEBUG: Considering 425 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_patch): set([430])
DEBUG: Considering 429 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_fetch): set([424])
DEBUG: Considering 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_unpack): set([508])
DEBUG: Considering 508 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_patch): set([513])
DEBUG: Considering 512 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_fetch): set([507])
DEBUG: Considering 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_unpack): set([573])
DEBUG: Considering 573 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_patch): set([577])
DEBUG: Considering 576 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_fetch): set([572])
DEBUG: Considering 780 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_unpack): set([781])
DEBUG: Considering 786 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc_4.9.bb, do_fetch): set([780])
DEBUG: Considering 793 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_unpack): set([794])
DEBUG: Considering 797 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross-initial_4.9.bb, do_fetch): set([793])
DEBUG: Considering 801 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_unpack): set([802])
DEBUG: Considering 807 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/libgcc-initial_4.9.bb, do_fetch): set([801])
DEBUG: Considering 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_unpack): set([868])
DEBUG: Considering 868 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_patch): set([873])
DEBUG: Considering 872 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_fetch): set([867])
DEBUG: Considering 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_unpack): set([1046])
DEBUG: Considering 1046 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_patch): set([1051])
DEBUG: Considering 1050 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_fetch): set([1045])
DEBUG: Considering 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1059])
DEBUG: Considering 1059 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_patch): set([1064])
DEBUG: Considering 1063 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1058])
DEBUG: Considering 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_unpack): set([1119])
DEBUG: Considering 1119 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_patch): set([1124])
DEBUG: Considering 1123 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_fetch): set([1118])
DEBUG: Considering 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_unpack): set([1187])
DEBUG: Considering 1187 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_patch): set([1192])
DEBUG: Considering 1191 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_fetch): set([1186])
DEBUG: Considering 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_unpack): set([1207])
DEBUG: Considering 1207 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_patch): set([1212])
DEBUG: Considering 1211 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_fetch): set([1206])
DEBUG: Considering 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_unpack): set([1244])
DEBUG: Considering 1244 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_patch): set([1248])
DEBUG: Considering 1247 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_fetch): set([1243])
DEBUG: Considering 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_unpack): set([1256])
DEBUG: Considering 1256 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_patch): set([1260])
DEBUG: Considering 1259 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_fetch): set([1255])
DEBUG: Considering 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_unpack): set([1358])
DEBUG: Considering 1358 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_patch): set([1362])
DEBUG: Considering 1361 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_fetch): set([1357])
DEBUG: Considering 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_unpack): set([1379])
DEBUG: Considering 1379 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_patch): set([1384])
DEBUG: Considering 1383 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_fetch): set([1378])
DEBUG: Considering 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_unpack): set([1421])
DEBUG: Considering 1421 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_patch): set([1426])
DEBUG: Considering 1425 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_fetch): set([1420])
DEBUG: Considering 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1510])
DEBUG: Considering 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_unpack): set([1508, 1510])
DEBUG: Considering 1510 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_patch): set([1515])
DEBUG: Considering 1514 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_fetch): set([1509])
DEBUG: Considering 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_unpack): set([1585])
DEBUG: Considering 1585 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_patch): set([1590])
DEBUG: Considering 1589 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_fetch): set([1584])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Considering 424 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_unpack): set([425])
DEBUG: Considering 429 (/home/alimon/repos/poky-bugs/meta/recipes-connectiv=
ity/openssl/openssl_1.0.1j.bb, do_fetch): set([424])
DEBUG: Considering 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_unpack): set([508])
DEBUG: Considering 512 (/home/alimon/repos/poky-bugs/meta/recipes-core/udev=
/udev_182.bb, do_fetch): set([507])
DEBUG: Considering 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_unpack): set([573])
DEBUG: Considering 576 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
perl/perl_5.20.0.bb, do_fetch): set([572])
DEBUG: Considering 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_unpack): set([868])
DEBUG: Considering 872 (/home/alimon/repos/poky-bugs/meta/recipes-core/zlib=
/zlib_1.2.8.bb, do_fetch): set([867])
DEBUG: Considering 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_unpack): set([1046])
DEBUG: Considering 1050 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/acl_2.2.52.bb, do_fetch): set([1045])
DEBUG: Considering 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_unpack): set([1059])
DEBUG: Considering 1063 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
b-2.0/glib-2.0_2.40.0.bb, do_fetch): set([1058])
DEBUG: Considering 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_unpack): set([1119])
DEBUG: Considering 1123 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/k=
mod/kmod_git.bb, do_fetch): set([1118])
DEBUG: Considering 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_unpack): set([1187])
DEBUG: Considering 1191 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
gdbm/gdbm_1.11.bb, do_fetch): set([1186])
DEBUG: Considering 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_unpack): set([1207])
DEBUG: Considering 1211 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/flex/flex_2.5.39.bb, do_fetch): set([1206])
DEBUG: Considering 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_unpack): set([1244])
DEBUG: Considering 1247 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/sed/sed_4.2.2.bb, do_fetch): set([1243])
DEBUG: Considering 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_unpack): set([1256])
DEBUG: Considering 1259 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bash/bash_4.3.bb, do_fetch): set([1255])
DEBUG: Considering 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_unpack): set([1358])
DEBUG: Considering 1361 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/diffutils/diffutils_3.3.bb, do_fetch): set([1357])
DEBUG: Considering 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_unpack): set([1379])
DEBUG: Considering 1383 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python_2.7.3.bb, do_fetch): set([1378])
DEBUG: Considering 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_unpack): set([1421])
DEBUG: Considering 1425 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
attr/attr_2.4.47.bb, do_fetch): set([1420])
DEBUG: Considering 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_extraunpack): set([1510])
DEBUG: Considering 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_unpack): set([1508, 1510])
DEBUG: Considering 1514 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bzip2/bzip2_1.0.6.bb, do_fetch): set([1509])
DEBUG: Considering 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_unpack): set([1585])
DEBUG: Considering 1589 (/home/alimon/repos/poky-bugs/meta/recipes-core/lib=
xml/libxml2_2.9.1.bb, do_fetch): set([1584])
DEBUG: Considering 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_build): set([])
DEBUG: Skip list (pre setsceneverify) [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12=
, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 3=
1, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, =
50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68,=
 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87=
, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, =
105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, =
120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, =
135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, =
150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, =
165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, =
180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, =
195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, =
210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, =
225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, =
240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, =
255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, =
270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, =
285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, =
300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, =
315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, =
330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, =
345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, =
360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, =
375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, =
390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, =
405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, =
420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, =
435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, =
450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, =
465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, =
480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, =
495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, =
510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, =
525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, =
540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, =
555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, =
570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, =
585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, =
600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, =
615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, =
630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, =
645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, =
660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, =
675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, =
690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, =
705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, =
720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, =
735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, =
750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, =
765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, =
780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, =
795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, =
810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, =
825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, =
840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, =
855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, =
870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, =
885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, =
900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, =
915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, =
930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, =
945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, =
960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, =
975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, =
990, 991, 992, 993, 994, 995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1=
004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016=
, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1=
029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041=
, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1=
054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066=
, 1067, 1068, 1069, 1070, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1=
079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091=
, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1=
104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116=
, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1=
129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141=
, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152, 1153, 1=
154, 1155, 1156, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166=
, 1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1=
179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191=
, 1192, 1193, 1194, 1195, 1196, 1197, 1198, 1199, 1200, 1201, 1202, 1203, 1=
204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216=
, 1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1=
229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241=
, 1242, 1243, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1=
254, 1255, 1256, 1257, 1258, 1259, 1260, 1261, 1262, 1263, 1264, 1265, 1266=
, 1267, 1268, 1269, 1270, 1271, 1272, 1273, 1274, 1275, 1276, 1277, 1278, 1=
279, 1280, 1281, 1282, 1283, 1284, 1285, 1286, 1287, 1288, 1289, 1290, 1291=
, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1=
304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316=
, 1317, 1318, 1319, 1320, 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1=
329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341=
, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1=
354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366=
, 1367, 1368, 1369, 1370, 1371, 1372, 1373, 1374, 1375, 1376, 1377, 1378, 1=
379, 1380, 1381, 1382, 1383, 1384, 1385, 1386, 1387, 1388, 1389, 1390, 1391=
, 1392, 1393, 1394, 1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1403, 1=
404, 1405, 1406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416=
, 1417, 1418, 1419, 1420, 1421, 1422, 1423, 1424, 1425, 1426, 1427, 1428, 1=
429, 1430, 1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1441=
, 1442, 1443, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1451, 1452, 1453, 1=
454, 1455, 1456, 1457, 1458, 1459, 1460, 1461, 1462, 1463, 1464, 1465, 1466=
, 1467, 1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1=
479, 1480, 1481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1489, 1490, 1491=
, 1492, 1493, 1494, 1495, 1496, 1497, 1498, 1499, 1500, 1501, 1502, 1503, 1=
504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516=
, 1517, 1518, 1519, 1520, 1521, 1522, 1523, 1524, 1525, 1526, 1527, 1528, 1=
529, 1530, 1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541=
, 1542, 1543, 1544, 1545, 1546, 1547, 1548, 1549, 1550, 1551, 1552, 1553, 1=
554, 1555, 1556, 1557, 1558, 1559, 1560, 1561, 1562, 1563, 1564, 1565, 1566=
, 1567, 1568, 1569, 1570, 1571, 1572, 1573, 1574, 1575, 1576, 1577, 1578, 1=
579, 1580, 1581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 1589, 1590, 1591=
, 1592, 1593, 1594, 1595, 1596, 1597, 1598, 1599, 1600, 1601, 1602, 1603, 1=
604, 1605, 1606, 1607, 1608, 1609, 1610, 1611, 1612, 1613, 1614, 1615, 1616=
, 1617, 1618, 1619, 1620, 1621, 1622, 1623, 1624, 1625, 1626, 1627, 1628, 1=
629, 1630, 1631, 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641=
, 1642, 1643, 1644, 1645, 1646, 1647, 1648, 1649, 1650, 1651, 1652, 1653, 1=
654, 1655, 1656, 1657, 1658, 1659, 1660, 1661, 1662, 1663, 1664, 1665, 1666=
, 1667, 1668, 1669, 1670, 1671, 1672, 1673, 1674, 1675, 1676, 1677, 1678, 1=
679, 1680, 1681, 1682, 1683, 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691=
, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1=
704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1716=
, 1717, 1718, 1719, 1720, 1721, 1722, 1723, 1724, 1725, 1726, 1727]
DEBUG: Full skip list set([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15=
, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 3=
4, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, =
53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,=
 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90=
, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 10=
7, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 12=
2, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 13=
7, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 15=
2, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 16=
7, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 18=
2, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 19=
7, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 21=
2, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 22=
7, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 24=
2, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 25=
7, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 27=
2, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 28=
7, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 30=
2, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 31=
7, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 33=
2, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 34=
7, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 36=
2, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 37=
7, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 39=
2, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 40=
7, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 42=
2, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 43=
7, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 45=
2, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 46=
7, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 48=
2, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 49=
7, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 51=
2, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 52=
7, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 54=
2, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 55=
7, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 57=
2, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 58=
7, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 60=
2, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 61=
7, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 63=
2, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 64=
7, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 66=
2, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 67=
7, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 69=
2, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 70=
7, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 72=
2, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 73=
7, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 75=
2, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 76=
7, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 78=
2, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 79=
7, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 81=
2, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 82=
7, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 84=
2, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 85=
7, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 87=
2, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 88=
7, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 90=
2, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 91=
7, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 93=
2, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 94=
7, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 96=
2, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 97=
7, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 99=
2, 993, 994, 995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1=
006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018=
, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1=
031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043=
, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1=
056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068=
, 1069, 1070, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1=
081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093=
, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1=
106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118=
, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1=
131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143=
, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152, 1153, 1154, 1155, 1=
156, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166, 1167, 1168=
, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1=
181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193=
, 1194, 1195, 1196, 1197, 1198, 1199, 1200, 1201, 1202, 1203, 1204, 1205, 1=
206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218=
, 1219, 1220, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1229, 1230, 1=
231, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1243=
, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1254, 1255, 1=
256, 1257, 1258, 1259, 1260, 1261, 1262, 1263, 1264, 1265, 1266, 1267, 1268=
, 1269, 1270, 1271, 1272, 1273, 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1=
281, 1282, 1283, 1284, 1285, 1286, 1287, 1288, 1289, 1290, 1291, 1292, 1293=
, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1304, 1305, 1=
306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318=
, 1319, 1320, 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1329, 1330, 1=
331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343=
, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1=
356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368=
, 1369, 1370, 1371, 1372, 1373, 1374, 1375, 1376, 1377, 1378, 1379, 1380, 1=
381, 1382, 1383, 1384, 1385, 1386, 1387, 1388, 1389, 1390, 1391, 1392, 1393=
, 1394, 1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1403, 1404, 1405, 1=
406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418=
, 1419, 1420, 1421, 1422, 1423, 1424, 1425, 1426, 1427, 1428, 1429, 1430, 1=
431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1441, 1442, 1443=
, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1451, 1452, 1453, 1454, 1455, 1=
456, 1457, 1458, 1459, 1460, 1461, 1462, 1463, 1464, 1465, 1466, 1467, 1468=
, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1=
481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1489, 1490, 1491, 1492, 1493=
, 1494, 1495, 1496, 1497, 1498, 1499, 1500, 1501, 1502, 1503, 1504, 1505, 1=
506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518=
, 1519, 1520, 1521, 1522, 1523, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1=
531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541, 1542, 1543=
, 1544, 1545, 1546, 1547, 1548, 1549, 1550, 1551, 1552, 1553, 1554, 1555, 1=
556, 1557, 1558, 1559, 1560, 1561, 1562, 1563, 1564, 1565, 1566, 1567, 1568=
, 1569, 1570, 1571, 1572, 1573, 1574, 1575, 1576, 1577, 1578, 1579, 1580, 1=
581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 1589, 1590, 1591, 1592, 1593=
, 1594, 1595, 1596, 1597, 1598, 1599, 1600, 1601, 1602, 1603, 1604, 1605, 1=
606, 1607, 1608, 1609, 1610, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618=
, 1619, 1620, 1621, 1622, 1623, 1624, 1625, 1626, 1627, 1628, 1629, 1630, 1=
631, 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1642, 1643=
, 1644, 1645, 1646, 1647, 1648, 1649, 1650, 1651, 1652, 1653, 1654, 1655, 1=
656, 1657, 1658, 1659, 1660, 1661, 1662, 1663, 1664, 1665, 1666, 1667, 1668=
, 1669, 1670, 1671, 1672, 1673, 1674, 1675, 1676, 1677, 1678, 1679, 1680, 1=
681, 1682, 1683, 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693=
, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1=
706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1716, 1717, 1718=
, 1719, 1720, 1721, 1722, 1723, 1724, 1725, 1726, 1727])
DEBUG: Using runqueue scheduler 'speed'
DEBUG: Marking task 13 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_unpack) as buildable
DEBUG: Marking task 14 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_patch) as buildable
DEBUG: Marking task 18 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_configure) as buildable
DEBUG: Marking task 19 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_compile) as buildable
DEBUG: Marking task 15 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_install) as buildable
DEBUG: Marking task 16 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
quilt/quilt-native_0.63.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 735 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_unpack) as buildable
DEBUG: Marking task 736 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_patch) as buildable
DEBUG: Marking task 740 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_configure) as buildable
DEBUG: Marking task 741 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_compile) as buildable
DEBUG: Marking task 737 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_install) as buildable
DEBUG: Marking task 738 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/texinfo-dummy-native/texinfo-dummy-native.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 86 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_unpack) as buildable
DEBUG: Marking task 87 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_patch) as buildable
DEBUG: Marking task 91 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_configure) as buildabl=
e
DEBUG: Marking task 92 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_compile) as buildable
DEBUG: Marking task 88 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_install) as buildable
DEBUG: Marking task 89 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/gnu-config/gnu-config_20120814.bb, do_populate_sysroot) as b=
uildable
DEBUG: Marking task 556 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_unpack) as buildable
DEBUG: Marking task 557 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_patch) as buildable
DEBUG: Marking task 561 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_configure) as buildable
DEBUG: Marking task 562 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_compile) as buildable
DEBUG: Marking task 558 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_install) as buildable
DEBUG: Marking task 55 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_unpack) as buildable
DEBUG: Marking task 559 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/m4/m4-native_1.4.17.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 56 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_patch) as buildable
DEBUG: Marking task 60 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_configure) as buildable
DEBUG: Marking task 61 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_compile) as buildable
DEBUG: Marking task 57 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_install) as buildable
DEBUG: Marking task 58 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/autoconf/autoconf_2.69.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 62 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_unpack) as buildable
DEBUG: Marking task 63 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_patch) as buildable
DEBUG: Marking task 67 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_configure) as buildable
DEBUG: Marking task 68 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_compile) as buildable
DEBUG: Marking task 64 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_install) as buildable
DEBUG: Marking task 65 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/automake/automake_1.14.1.bb, do_populate_sysroot) as buildab=
le
DEBUG: Marking task 69 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_unpack) as buildable
DEBUG: Marking task 70 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_patch) as buildable
DEBUG: Marking task 74 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_configure) as buildable
DEBUG: Marking task 75 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_compile) as buildable
DEBUG: Marking task 71 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_install) as buildable
DEBUG: Marking task 72 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-native_2.4.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 658 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_unpack) as buildable
DEBUG: Marking task 659 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_patch) as buildable
DEBUG: Marking task 663 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_configure) as buildable
DEBUG: Marking task 664 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_compile) as buildable
DEBUG: Marking task 660 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_install) as buildable
DEBUG: Marking task 661 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext-minimal-native_0.18.3.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1162 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_unpack) as buildable
DEBUG: Marking task 1163 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_patch) as buildable
DEBUG: Marking task 1167 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_configure) as buildable
DEBUG: Marking task 1168 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_compile) as buildable
DEBUG: Marking task 1164 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_install) as buildable
DEBUG: Marking task 1165 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/xz/xz_5.1.3alpha.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 766 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_unpack) as buildable
DEBUG: Marking task 767 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_patch) as buildable
DEBUG: Marking task 771 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_configure) as buildable
DEBUG: Marking task 772 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_compile) as buildable
DEBUG: Marking task 768 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_install) as buildable
DEBUG: Marking task 769 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/gmp/gmp_6.0.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 728 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_unpack) as buildable
DEBUG: Marking task 729 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_patch) as buildable
DEBUG: Marking task 733 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_configure) as buildable
DEBUG: Marking task 734 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_compile) as buildable
DEBUG: Marking task 730 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_install) as buildable
DEBUG: Marking task 731 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/zlib/zlib_1.2.8.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 759 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_unpack) as buildable
DEBUG: Marking task 760 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_patch) as buildable
DEBUG: Marking task 764 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_configure) as buildable
DEBUG: Marking task 765 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_compile) as buildable
DEBUG: Marking task 761 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_install) as buildable
DEBUG: Marking task 762 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/mpfr/mpfr_3.1.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 793 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_unpack) as buildable
DEBUG: Marking task 794 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_patch) as buildable
DEBUG: Marking task 798 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_preconfigure) as buildable
DEBUG: Marking task 48 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_unpack) as buildable
DEBUG: Marking task 49 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_patch) as buildable
DEBUG: Marking task 53 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_configure) as buildable
DEBUG: Marking task 54 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_compile) as buildable
DEBUG: Marking task 50 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_install) as buildable
DEBUG: Marking task 51 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pkgconfig/pkgconfig_0.28.bb, do_populate_sysroot) as buildab=
le
DEBUG: Marking task 1169 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_unpack) as buildable
DEBUG: Marking task 1170 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_patch) as buildable
DEBUG: Marking task 1174 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_configure) as buildable
DEBUG: Marking task 1175 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_compile) as buildable
DEBUG: Marking task 1171 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_install) as buildable
DEBUG: Marking task 1172 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/ncurses/ncurses_5.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 801 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_unpack) as buildable
DEBUG: Marking task 802 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_patch) as buildable
DEBUG: Marking task 808 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_preconfigure) as buildable
DEBUG: Marking task 637 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_unpack) as buildable
DEBUG: Marking task 638 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_patch) as buildable
DEBUG: Marking task 642 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_configure) as buildable
DEBUG: Marking task 643 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_compile) as buildable
DEBUG: Marking task 639 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_install) as buildable
DEBUG: Marking task 640 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/attr_2.4.47.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 630 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_unpack) as buildable
DEBUG: Marking task 631 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_patch) as buildable
DEBUG: Marking task 635 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_configure) as buildable
DEBUG: Marking task 636 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_compile) as buildable
DEBUG: Marking task 632 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_install) as buildable
DEBUG: Marking task 633 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/sqlite/sqlite3_3.8.6.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 20 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_unpack) as buildable
DEBUG: Marking task 21 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_patch) as buildable
DEBUG: Marking task 25 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_configure) as buildable
DEBUG: Marking task 26 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_compile) as buildable
DEBUG: Marking task 22 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_install) as buildable
DEBUG: Marking task 23 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/pseudo/pseudo_1.6.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 974 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_unpack) as buildable
DEBUG: Marking task 975 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_patch) as buildable
DEBUG: Marking task 979 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_configure) as buildable
DEBUG: Marking task 980 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_compile) as buildable
DEBUG: Marking task 976 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_install) as buildable
DEBUG: Marking task 977 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/bison/bison_2.7.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 967 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_unpack) as buildable
DEBUG: Marking task 968 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_patch) as buildable
DEBUG: Marking task 972 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_configure) as buildable
DEBUG: Marking task 973 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_compile) as buildable
DEBUG: Marking task 969 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_install) as buildable
DEBUG: Marking task 970 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/flex/flex_2.5.39.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 742 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_unpack) as buildable
DEBUG: Marking task 743 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_patch) as buildable
DEBUG: Marking task 747 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_configure) as buildable
DEBUG: Marking task 748 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_compile) as buildable
DEBUG: Marking task 744 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_install) as buildable
DEBUG: Marking task 745 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/binutils/binutils-cross_2.24.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 773 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_unpack) as buildable
DEBUG: Marking task 774 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_patch) as buildable
DEBUG: Marking task 778 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_configure) as buildable
DEBUG: Marking task 779 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_compile) as buildable
DEBUG: Marking task 775 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_install) as buildable
DEBUG: Marking task 776 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libmpc/libmpc_1.0.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 799 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_configure) as buildable
DEBUG: Marking task 800 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_compile) as buildable
DEBUG: Marking task 795 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_install) as buildable
DEBUG: Marking task 796 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross-initial_4.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 809 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_configure) as buildable
DEBUG: Marking task 810 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_compile) as buildable
DEBUG: Marking task 805 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_install) as buildable
DEBUG: Marking task 804 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_multilib_install) as buildable
DEBUG: Marking task 803 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_extra_symlinks) as buildable
DEBUG: Marking task 826 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_unpack) as buildable
DEBUG: Marking task 827 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_patch) as buildable
DEBUG: Marking task 831 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_configure) as buildable
DEBUG: Marking task 832 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_compile) as buildable
DEBUG: Marking task 828 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_install) as buildable
DEBUG: Marking task 829 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/gperf/gperf_3.0.4.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1413 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_unpack) as buildable
DEBUG: Marking task 1414 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_patch) as buildable
DEBUG: Marking task 1418 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_configure) as buildable
DEBUG: Marking task 1419 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_compile) as buildable
DEBUG: Marking task 1415 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_install) as buildable
DEBUG: Marking task 749 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_unpack) as buildable
DEBUG: Marking task 1416 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/unifdef/unifdef_2.10.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 750 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_patch) as buildable
DEBUG: Marking task 754 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_configure) as buildable
DEBUG: Marking task 755 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_compile) as buildable
DEBUG: Marking task 751 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_install) as buildable
DEBUG: Marking task 752 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_populate_sysroot) as build=
able
DEBUG: Marking task 812 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_package) as buildable
DEBUG: Marking task 806 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 833 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_unpack)=
 as buildable
DEBUG: Marking task 834 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_patch) =
as buildable
DEBUG: Marking task 838 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_configu=
re) as buildable
DEBUG: Marking task 839 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_compile=
) as buildable
DEBUG: Marking task 835 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_install=
) as buildable
DEBUG: Marking task 836 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb, do_populat=
e_sysroot) as buildable
DEBUG: Marking task 814 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_unpack) as buildable
DEBUG: Marking task 815 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_patch) as buildable
DEBUG: Marking task 821 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_configure) as buildable
DEBUG: Marking task 822 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_compile) as buildable
DEBUG: Marking task 818 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_install) as buildable
DEBUG: Marking task 816 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_evacuate_scripts) as buildable
DEBUG: Marking task 817 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_install_locale) as buildable
DEBUG: Marking task 824 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_package) as buildable
DEBUG: Marking task 819 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 112 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_unpack) as buildable
DEBUG: Marking task 113 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_patch) as buildable
DEBUG: Marking task 119 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_configure) as buildable
DEBUG: Marking task 120 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_compile) as buildable
DEBUG: Marking task 116 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_install) as buildable
DEBUG: Marking task 114 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_evacuate_scripts) as buildable
DEBUG: Marking task 115 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_install_locale) as buildable
DEBUG: Marking task 93 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_unpack) as buildable
DEBUG: Marking task 94 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_patch) as buildable
DEBUG: Marking task 98 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_preconfigure) as buildable
DEBUG: Marking task 780 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_unpack) as buildable
DEBUG: Marking task 781 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_patch) as buildable
DEBUG: Marking task 787 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_preconfigure) as buildable
DEBUG: Marking task 117 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 99 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_configure) as buildable
DEBUG: Marking task 100 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-cross_4.9.bb, do_compile) as buildable
DEBUG: Marking task 95 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_install) as buildable
DEBUG: Marking task 96 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
gcc/gcc-cross_4.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 788 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_configure) as buildable
DEBUG: Marking task 789 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_compile) as buildable
DEBUG: Marking task 784 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_install) as buildable
DEBUG: Marking task 783 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_multilib_install) as buildable
DEBUG: Marking task 782 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_extra_symlinks) as buildable
DEBUG: Marking task 101 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_unpack) as buildable
DEBUG: Marking task 102 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_patch) as buildable
DEBUG: Marking task 106 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_preconfigure) as buildable
DEBUG: Marking task 785 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 107 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_configure) as buildable
DEBUG: Marking task 108 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_compile) as buildable
DEBUG: Marking task 103 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_install) as buildable
DEBUG: Marking task 104 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 76 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_unpack) as buildable
DEBUG: Marking task 77 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_patch) as buildable
DEBUG: Marking task 81 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_configure) as buildable
DEBUG: Marking task 82 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_compile) as buildable
DEBUG: Marking task 78 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_install) as buildable
DEBUG: Marking task 84 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_package) as buildable
DEBUG: Marking task 79 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1433 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_unpack) as buildable
DEBUG: Marking task 1434 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_patch) as buildable
DEBUG: Marking task 1438 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_configure) as buildable
DEBUG: Marking task 1439 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_compile) as buildable
DEBUG: Marking task 1435 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_install) as buildable
DEBUG: Marking task 1436 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/pigz/pigz_2.3.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 860 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_unpack) as buildable
DEBUG: Marking task 861 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_patch) as buildable
DEBUG: Marking task 865 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_configure) as buildable
DEBUG: Marking task 866 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_compile) as buildable
DEBUG: Marking task 862 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_install) as buildable
DEBUG: Marking task 863 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/gettext/gettext_0.18.3.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 41 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_unpack) as buildable
DEBUG: Marking task 42 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_patch) as buildable
DEBUG: Marking task 46 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_configure) as buildable
DEBUG: Marking task 47 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_compile) as buildable
DEBUG: Marking task 43 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_install) as buildable
DEBUG: Marking task 44 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/file/file_5.18.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 867 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_unpack) as buildable
DEBUG: Marking task 868 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_patch) as buildable
DEBUG: Marking task 873 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_configure) as buildable
DEBUG: Marking task 874 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1399 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack) as buildable
DEBUG: Marking task 1398 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_extraunpack) as buildable
DEBUG: Marking task 1391 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_unpack) as buildable
DEBUG: Marking task 1392 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_patch) as buildable
DEBUG: Marking task 1396 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_configure) as buildable
DEBUG: Marking task 1397 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_compile) as buildable
DEBUG: Marking task 1393 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_install) as buildable
DEBUG: Marking task 714 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_unpack) as buildable
DEBUG: Marking task 1394 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-kernel/cryptodev/cryptodev-linux_1.6.bb, do_populate_sysroot) as bu=
ildable
DEBUG: Marking task 715 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_patch) as buildable
DEBUG: Marking task 719 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_configure) as buildable
DEBUG: Marking task 720 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_compile) as buildable
DEBUG: Marking task 716 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_install) as buildable
DEBUG: Marking task 717 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-connectivity/openssl/openssl_1.0.1j.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 950 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_unpack) as buildable
DEBUG: Marking task 951 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_patch) as buildable
DEBUG: Marking task 955 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_configure) as buildable
DEBUG: Marking task 956 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_compile) as buildable
DEBUG: Marking task 952 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_install) as buildable
DEBUG: Marking task 953 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 850 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_unpack) as buildable
DEBUG: Marking task 851 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_patch) as buildable
DEBUG: Marking task 855 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_configure) as buildable
DEBUG: Marking task 856 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_compile) as buildable
DEBUG: Marking task 852 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_install) as buildable
DEBUG: Marking task 853 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 840 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_unpack) as buildable
DEBUG: Marking task 841 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_patch) as buildable
DEBUG: Marking task 845 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_configure) as buildable
DEBUG: Marking task 846 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_compile) as buildable
DEBUG: Marking task 842 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_install) as buildable
DEBUG: Marking task 843 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 875 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_compile) as buildable
DEBUG: Marking task 876 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1406 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_unpack) as buildable
DEBUG: Marking task 1407 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_patch) as buildable
DEBUG: Marking task 1400 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_patch) as buildable
DEBUG: Marking task 1411 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_configure) as buildable
DEBUG: Marking task 1404 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_configure) as buildable
DEBUG: Marking task 1412 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_compile) as buildable
DEBUG: Marking task 1405 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_compile) as buildable
DEBUG: Marking task 1408 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_install) as buildable
DEBUG: Marking task 1401 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_install) as buildable
DEBUG: Marking task 721 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_unpack) as buildable
DEBUG: Marking task 1409 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/readline/readline_6.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1402 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/bzip2/bzip2_1.0.6.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 722 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_patch) as buildable
DEBUG: Marking task 726 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_configure) as buildable
DEBUG: Marking task 727 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_compile) as buildable
DEBUG: Marking task 723 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_install) as buildable
DEBUG: Marking task 724 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/python/python-native_2.7.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1219 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_unpack) as buildable
DEBUG: Marking task 1220 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_patch) as buildable
DEBUG: Marking task 1224 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_configure) as buildable
DEBUG: Marking task 1225 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_compile) as buildable
DEBUG: Marking task 1221 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_install) as buildable
DEBUG: Marking task 1222 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 644 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_unpack) as buildable
DEBUG: Marking task 645 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_patch) as buildable
DEBUG: Marking task 649 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_configure) as buildable
DEBUG: Marking task 650 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_compile) as buildable
DEBUG: Marking task 646 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_install) as buildable
DEBUG: Marking task 647 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/elfutils/elfutils_0.160.bb, do_populate_sysroot) as buildab=
le
DEBUG: Marking task 707 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_unpack) as buildable
DEBUG: Marking task 700 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 693 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_unpack) as buildable
DEBUG: Marking task 686 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_unpack) as buildable
DEBUG: Marking task 679 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_unpack) as buildable
DEBUG: Marking task 672 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_unpack) as buildable
DEBUG: Marking task 665 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_unpack) as buildable
DEBUG: Marking task 708 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_patch) as buildable
DEBUG: Marking task 701 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_patch) as buildable
DEBUG: Marking task 694 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_patch) as buildable
DEBUG: Marking task 687 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_patch) as buildable
DEBUG: Marking task 680 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_patch) as buildable
DEBUG: Marking task 673 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_patch) as buildable
DEBUG: Marking task 666 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_patch) as buildable
DEBUG: Marking task 712 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_configure) as buildable
DEBUG: Marking task 705 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_configure) as buildable
DEBUG: Marking task 698 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_configure) as buildable
DEBUG: Marking task 691 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_configure) as buildable
DEBUG: Marking task 684 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_configure) as buildable
DEBUG: Marking task 677 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_configure) as buildable
DEBUG: Marking task 670 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_configure) as buildable
DEBUG: Marking task 713 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_compile) as buildable
DEBUG: Marking task 706 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_compile) as buildable
DEBUG: Marking task 699 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_compile) as buildable
DEBUG: Marking task 692 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_compile) as buildable
DEBUG: Marking task 685 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_compile) as buildable
DEBUG: Marking task 678 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_compile) as buildable
DEBUG: Marking task 671 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_compile) as buildable
DEBUG: Marking task 709 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_install) as buildable
DEBUG: Marking task 702 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_install) as buildable
DEBUG: Marking task 695 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_install) as buildable
DEBUG: Marking task 688 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_install) as buildable
DEBUG: Marking task 681 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_install) as buildable
DEBUG: Marking task 674 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_install) as buildable
DEBUG: Marking task 667 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_install) as buildable
DEBUG: Marking task 34 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_unpack) as buildable
DEBUG: Marking task 710 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/db/db_6.0.30.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 703 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/beecrypt/beecrypt_4.2.1.bb, do_populate_sysroot) as buildabl=
e
DEBUG: Marking task 696 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-extended/byacc/byacc_20141006.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 689 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb, do_populate_sysroot) as build=
able
DEBUG: Marking task 682 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/popt/popt_1.16.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 675 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/attr/acl_2.2.52.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 668 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-support/libpcre/libpcre_8.36.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 35 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_patch) as buildable
DEBUG: Marking task 39 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_configure) as buildable
DEBUG: Marking task 40 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_compile) as buildable
DEBUG: Marking task 36 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_install) as buildable
DEBUG: Marking task 37 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/rpm/rpm_5.4.14.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 757 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_package) as buildable
DEBUG: Marking task 1340 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_unpack) as buildable
DEBUG: Marking task 1341 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_patch) as buildable
DEBUG: Marking task 1345 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_configure) as buildable
DEBUG: Marking task 1346 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_compile) as buildable
DEBUG: Marking task 1342 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_install) as buildable
DEBUG: Marking task 1343 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 870 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_install) as buildable
DEBUG: Marking task 869 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1420 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_unpack) as buildable
DEBUG: Marking task 1421 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_patch) as buildable
DEBUG: Marking task 1426 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_configure) as buildable
DEBUG: Marking task 1427 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 174 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_unpack) as buildable
DEBUG: Marking task 175 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_patch) as buildable
DEBUG: Marking task 179 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_configure) as buildable
DEBUG: Marking task 180 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_compile) as buildable
DEBUG: Marking task 176 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_install) as buildable
DEBUG: Marking task 177 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 871 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1491 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_unpack) as buildable
DEBUG: Marking task 1492 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_patch) as buildable
DEBUG: Marking task 1496 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_configure) as buildable
DEBUG: Marking task 1497 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_compile) as buildable
DEBUG: Marking task 1493 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_install) as buildable
DEBUG: Marking task 1494 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb, do_populate_sysroot) as bui=
ldable
DEBUG: Marking task 1428 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_compile) as buildable
DEBUG: Marking task 1429 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 823 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_packagedata) as buildable
DEBUG: Marking task 811 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_packagedata) as buildable
DEBUG: Marking task 756 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_packagedata) as buildable
DEBUG: Marking task 825 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc-initial_2.20.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 813 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc-initial_4.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 122 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_package) as buildable
DEBUG: Marking task 758 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/l=
inux-libc-headers/linux-libc-headers_3.16.bb, do_package_write_rpm) as buil=
dable
DEBUG: Marking task 121 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_packagedata) as buildable
DEBUG: Marking task 123 (/home/alimon/repos/poky-bugs/meta/recipes-core/gli=
bc/glibc_2.20.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 791 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_package) as buildable
DEBUG: Marking task 354 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_unpack) as buildable
DEBUG: Marking task 355 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_patch) as buildable
DEBUG: Marking task 359 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_configure) as buildable
DEBUG: Marking task 360 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_compile) as buildable
DEBUG: Marking task 356 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_install) as buildable
DEBUG: Marking task 357 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1131 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack) as buildable
DEBUG: Marking task 1132 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_patch) as buildable
DEBUG: Marking task 1136 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_configure) as buildable
DEBUG: Marking task 1137 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_compile) as buildable
DEBUG: Marking task 1133 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_install) as buildable
DEBUG: Marking task 1134 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/update-rc.d/update-rc.d_0.7.bb, do_populate_sysroot) as builda=
ble
DEBUG: Marking task 1657 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_unpack) as buildable
DEBUG: Marking task 1658 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_patch) as buildable
DEBUG: Marking task 1662 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_configure) as buildable
DEBUG: Marking task 1663 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_compile) as buildable
DEBUG: Marking task 1659 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_install) as buildable
DEBUG: Marking task 1660 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1546 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 1547 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_patch) as buildable
DEBUG: Marking task 1551 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_configure) as buildable
DEBUG: Marking task 1552 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1548 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_install) as buildable
DEBUG: Marking task 1549 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-extended/shadow/shadow_4.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1118 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_unpack) as buildable
DEBUG: Marking task 1119 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_patch) as buildable
DEBUG: Marking task 1124 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_configure) as buildable
DEBUG: Marking task 1125 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1423 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_install) as buildable
DEBUG: Marking task 1422 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 790 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_packagedata) as buildable
DEBUG: Marking task 792 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/libgcc_4.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 110 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_package) as buildable
DEBUG: Marking task 109 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_packagedata) as buildable
DEBUG: Marking task 111 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/gcc/gcc-runtime_4.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1227 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_package) as buildable
DEBUG: Marking task 878 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_package) as buildable
DEBUG: Marking task 83 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_packagedata) as buildable
DEBUG: Marking task 85 (/home/alimon/repos/poky-bugs/meta/recipes-devtools/=
libtool/libtool-cross_2.4.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1665 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_package) as buildable
DEBUG: Marking task 848 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_package) as buildable
DEBUG: Marking task 958 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_package) as buildable
DEBUG: Marking task 1155 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_unpack) as buildable
DEBUG: Marking task 1156 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_patch) as buildable
DEBUG: Marking task 1160 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_configure) as buildabl=
e
DEBUG: Marking task 1161 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_compile) as buildable
DEBUG: Marking task 1157 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_install) as buildable
DEBUG: Marking task 1158 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-util/util-macros_1.19.0.bb, do_populate_sysroot) as b=
uildable
DEBUG: Marking task 1108 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_unpack) as buildable
DEBUG: Marking task 1109 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_patch) as buildable
DEBUG: Marking task 1113 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_configure) as buildable
DEBUG: Marking task 1114 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_compile) as buildable
DEBUG: Marking task 1110 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_install) as buildable
DEBUG: Marking task 1111 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1138 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_unpack) as buildable
DEBUG: Marking task 1139 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_patch) as buildable
DEBUG: Marking task 1143 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_configure) as buildable
DEBUG: Marking task 1144 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_compile) as buildable
DEBUG: Marking task 1140 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_install) as buildable
DEBUG: Marking task 1141 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 384 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_unpack) as buildable
DEBUG: Marking task 364 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_unpack) as buildable
DEBUG: Marking task 385 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_patch) as buildable
DEBUG: Marking task 365 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_patch) as buildable
DEBUG: Marking task 389 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_configure) as buildable
DEBUG: Marking task 369 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_configure) as buildable
DEBUG: Marking task 390 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_compile) as buildable
DEBUG: Marking task 370 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_compile) as buildable
DEBUG: Marking task 386 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_install) as buildable
DEBUG: Marking task 366 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_install) as buildable
DEBUG: Marking task 387 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 367 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 910 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_unpack) as buildable
DEBUG: Marking task 911 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_patch) as buildable
DEBUG: Marking task 915 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_configure) as buildable
DEBUG: Marking task 916 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_compile) as buildable
DEBUG: Marking task 912 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_install) as buildable
DEBUG: Marking task 913 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 918 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_package) as buildable
DEBUG: Marking task 164 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_unpack) as buildable
DEBUG: Marking task 165 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_patch) as buildable
DEBUG: Marking task 169 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_configure) as buildable
DEBUG: Marking task 170 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_compile) as buildable
DEBUG: Marking task 166 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_install) as buildable
DEBUG: Marking task 167 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1457 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_unpack) as buildable
DEBUG: Marking task 1458 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_patch) as buildable
DEBUG: Marking task 1462 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_configure) as buildable
DEBUG: Marking task 1463 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_compile) as buildable
DEBUG: Marking task 1459 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_install) as buildable
DEBUG: Marking task 1465 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_package) as buildable
DEBUG: Marking task 1460 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 284 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_unpack) as buildable
DEBUG: Marking task 285 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_patch) as buildable
DEBUG: Marking task 289 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_configure) as buildable
DEBUG: Marking task 290 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_compile) as buildable
DEBUG: Marking task 286 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_install) as buildable
DEBUG: Marking task 287 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1038 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_unpack) as buildable
DEBUG: Marking task 1039 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_patch) as buildable
DEBUG: Marking task 1043 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_configure) as buildable
DEBUG: Marking task 1044 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_compile) as buildable
DEBUG: Marking task 1040 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_install) as buildable
DEBUG: Marking task 1041 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xproto_7.0.26.bb, do_populate_sysroot) as build=
able
DEBUG: Marking task 294 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_unpack) as buildable
DEBUG: Marking task 295 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_patch) as buildable
DEBUG: Marking task 299 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_configure) as buildable
DEBUG: Marking task 300 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_compile) as buildable
DEBUG: Marking task 296 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_install) as buildable
DEBUG: Marking task 297 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1467 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_unpack) as buildable
DEBUG: Marking task 1468 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_patch) as buildable
DEBUG: Marking task 1472 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_configure) as buildable
DEBUG: Marking task 1473 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_compile) as buildable
DEBUG: Marking task 1469 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_install) as buildable
DEBUG: Marking task 1028 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_unpack) as buildable
DEBUG: Marking task 1470 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.10.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 1029 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_patch) as buildable
DEBUG: Marking task 1033 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_configure) as buildable
DEBUG: Marking task 1034 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_compile) as buildable
DEBUG: Marking task 1030 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_install) as buildable
DEBUG: Marking task 1031 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 497 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_unpack) as buildable
DEBUG: Marking task 498 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_patch) as buildable
DEBUG: Marking task 502 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_configure) as buildable
DEBUG: Marking task 503 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_compile) as buildable
DEBUG: Marking task 499 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_install) as buildable
DEBUG: Marking task 500 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1711 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_unpack) as buildable
DEBUG: Marking task 1701 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_unpack) as buildable
DEBUG: Marking task 1712 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_patch) as buildable
DEBUG: Marking task 1702 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_patch) as buildable
DEBUG: Marking task 1716 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_configure) as buildable
DEBUG: Marking task 1706 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_configure) as buildable
DEBUG: Marking task 1717 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_compile) as buildable
DEBUG: Marking task 1707 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_compile) as buildable
DEBUG: Marking task 1713 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_install) as buildable
DEBUG: Marking task 1703 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_install) as buildable
DEBUG: Marking task 1714 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1704 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1638 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_unpack) as buildable
DEBUG: Marking task 1276 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 1639 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_patch) as buildable
DEBUG: Marking task 1277 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_patch) as buildable
DEBUG: Marking task 1643 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_configure) as buildable
DEBUG: Marking task 1281 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_configure) as buildable
DEBUG: Marking task 1644 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_compile) as buildable
DEBUG: Marking task 1282 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1640 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_install) as buildable
DEBUG: Marking task 1278 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_install) as buildable
DEBUG: Marking task 1641 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1646 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_package) as buildable
DEBUG: Marking task 1279 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1684 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_unpack) as buildable
DEBUG: Marking task 1674 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 1685 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_patch) as buildable
DEBUG: Marking task 1675 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_patch) as buildable
DEBUG: Marking task 1689 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_configure) as buildable
DEBUG: Marking task 1679 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_configure) as buildable
DEBUG: Marking task 1690 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_compile) as buildable
DEBUG: Marking task 1680 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1686 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_install) as buildable
DEBUG: Marking task 1676 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_install) as buildable
DEBUG: Marking task 1687 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1682 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_package) as buildable
DEBUG: Marking task 1677 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1440 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_unpack) as buildable
DEBUG: Marking task 1441 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_patch) as buildable
DEBUG: Marking task 1445 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_configure) as buildable
DEBUG: Marking task 1446 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_compile) as buildable
DEBUG: Marking task 1442 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_install) as buildable
DEBUG: Marking task 1448 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_package) as buildable
DEBUG: Marking task 1443 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1481 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_unpack) as buildable
DEBUG: Marking task 1482 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_patch) as buildable
DEBUG: Marking task 1486 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_configure) as buildable
DEBUG: Marking task 1487 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_compile) as buildable
DEBUG: Marking task 1483 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_install) as buildable
DEBUG: Marking task 1484 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1667 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_unpack) as buildable
DEBUG: Marking task 1668 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_patch) as buildable
DEBUG: Marking task 1672 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_configure) as buildable
DEBUG: Marking task 1673 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_compile) as buildable
DEBUG: Marking task 1669 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_install) as buildable
DEBUG: Marking task 1670 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-gnome/libffi/libffi_3.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1474 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_unpack) as buildable
DEBUG: Marking task 1475 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_patch) as buildable
DEBUG: Marking task 1479 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_configure) as buildable
DEBUG: Marking task 1480 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_compile) as buildable
DEBUG: Marking task 1476 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_install) as buildable
DEBUG: Marking task 1477 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/glib-2.0/glib-2.0_2.40.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1058 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_unpack) as buildable
DEBUG: Marking task 1059 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_patch) as buildable
DEBUG: Marking task 1064 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_configure) as buildable
DEBUG: Marking task 1065 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1126 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_compile) as buildable
DEBUG: Marking task 1127 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1424 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1045 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_unpack) as buildable
DEBUG: Marking task 1046 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_patch) as buildable
DEBUG: Marking task 1051 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_configure) as buildable
DEBUG: Marking task 1052 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1066 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_compile) as buildable
DEBUG: Marking task 1067 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1121 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_install) as buildable
DEBUG: Marking task 1120 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1053 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_compile) as buildable
DEBUG: Marking task 1054 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1509 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_unpack) as buildable
DEBUG: Marking task 1508 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_extraunpack) as buildable
DEBUG: Marking task 847 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_packagedata) as buildable
DEBUG: Marking task 292 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_package) as buildable
DEBUG: Marking task 182 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_package) as buildable
DEBUG: Marking task 849 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-util/util-macros_1.19.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1186 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_unpack) as buildable
DEBUG: Marking task 1187 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_patch) as buildable
DEBUG: Marking task 1192 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_configure) as buildable
DEBUG: Marking task 1193 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 957 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_packagedata) as buildable
DEBUG: Marking task 858 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_package) as buildable
DEBUG: Marking task 959 (/home/alimon/repos/poky-bugs/meta/recipes-core/exp=
at/expat_2.1.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 857 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_packagedata) as buildable
DEBUG: Marking task 172 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_package) as buildable
DEBUG: Marking task 302 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_package) as buildable
DEBUG: Marking task 859 (/home/alimon/repos/poky-bugs/meta/recipes-core/get=
text/gettext_0.18.3.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 362 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_package) as buildable
DEBUG: Marking task 1498 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_unpack) as buildable
DEBUG: Marking task 1499 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_patch) as buildable
DEBUG: Marking task 1503 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_configure) as buildable
DEBUG: Marking task 1504 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_compile) as buildable
DEBUG: Marking task 1500 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_install) as buildable
DEBUG: Marking task 1506 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_package) as buildable
DEBUG: Marking task 1501 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 920 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_unpack) as buildable
DEBUG: Marking task 921 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_patch) as buildable
DEBUG: Marking task 925 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_configure) as buildable
DEBUG: Marking task 926 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_compile) as buildable
DEBUG: Marking task 922 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_install) as buildable
DEBUG: Marking task 928 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_package) as buildable
DEBUG: Marking task 923 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1061 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_install) as buildable
DEBUG: Marking task 1060 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 424 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_unpack) as buildable
DEBUG: Marking task 425 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_patch) as buildable
DEBUG: Marking task 430 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_configure) as buildable
DEBUG: Marking task 431 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1071 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_unpack) as buildable
DEBUG: Marking task 1072 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_patch) as buildable
DEBUG: Marking task 1076 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_configure) as buildable
DEBUG: Marking task 1077 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_compile) as buildable
DEBUG: Marking task 1073 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_install) as buildable
DEBUG: Marking task 1122 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1074 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1048 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_install) as buildable
DEBUG: Marking task 1047 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1510 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_patch) as buildable
DEBUG: Marking task 1515 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_configure) as buildable
DEBUG: Marking task 1516 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1194 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_compile) as buildable
DEBUG: Marking task 1195 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 181 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_packagedata) as buildable
DEBUG: Marking task 392 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_package) as buildable
DEBUG: Marking task 372 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_package) as buildable
DEBUG: Marking task 183 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xproto_7.0.26.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1062 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 432 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_compile) as buildable
DEBUG: Marking task 433 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1091 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 1081 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_unpack) as buildable
DEBUG: Marking task 1092 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_patch) as buildable
DEBUG: Marking task 1082 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_patch) as buildable
DEBUG: Marking task 1096 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_configure) as buildable
DEBUG: Marking task 1086 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_configure) as buildable
DEBUG: Marking task 1097 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1087 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_compile) as buildable
DEBUG: Marking task 1093 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_install) as buildable
DEBUG: Marking task 1083 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_install) as buildable
DEBUG: Marking task 1094 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1084 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1049 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 981 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_unpack) as buildable
DEBUG: Marking task 982 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_patch) as buildable
DEBUG: Marking task 986 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_configure) as buildable
DEBUG: Marking task 987 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_compile) as buildable
DEBUG: Marking task 983 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_install) as buildable
DEBUG: Marking task 984 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-core/libxml/libxml2_2.9.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1517 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_compile) as buildable
DEBUG: Marking task 1518 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1101 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_unpack) as buildable
DEBUG: Marking task 1102 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_patch) as buildable
DEBUG: Marking task 1106 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_configure) as buildable
DEBUG: Marking task 1107 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_compile) as buildable
DEBUG: Marking task 1103 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_install) as buildable
DEBUG: Marking task 1104 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/libxslt/libxslt_1.1.28.bb, do_populate_sysroot) as buildabl=
e
DEBUG: Marking task 507 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_unpack) as buildable
DEBUG: Marking task 508 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_patch) as buildable
DEBUG: Marking task 513 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_configure) as buildable
DEBUG: Marking task 514 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1226 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_packagedata) as buildable
DEBUG: Marking task 1284 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_package) as buildable
DEBUG: Marking task 1348 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_package) as buildable
DEBUG: Marking task 1146 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_package) as buildable
DEBUG: Marking task 1189 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_install) as buildable
DEBUG: Marking task 1188 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 427 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_install) as buildable
DEBUG: Marking task 426 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1618 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_unpack) as buildable
DEBUG: Marking task 1619 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_patch) as buildable
DEBUG: Marking task 1623 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_configure) as buildable
DEBUG: Marking task 1624 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_compile) as buildable
DEBUG: Marking task 1620 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_install) as buildable
DEBUG: Marking task 1621 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1512 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_install) as buildable
DEBUG: Marking task 1511 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 515 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_compile) as buildable
DEBUG: Marking task 516 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 877 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_packagedata) as buildable
DEBUG: Marking task 1129 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_package) as buildable
DEBUG: Marking task 361 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_packagedata) as buildable
DEBUG: Marking task 363 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xtrans_1.3.4.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1709 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_package) as buildable
DEBUG: Marking task 1176 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_unpack) as buildable
DEBUG: Marking task 1177 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_patch) as buildable
DEBUG: Marking task 1181 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_configure) as buildable
DEBUG: Marking task 1182 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_compile) as buildable
DEBUG: Marking task 1178 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_install) as buildable
DEBUG: Marking task 1197 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_package) as buildable
DEBUG: Marking task 1190 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1184 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_package) as buildable
DEBUG: Marking task 1179 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 171 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_packagedata) as buildable
DEBUG: Marking task 173 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xextproto_7.3.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1347 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_packagedata) as buildable
DEBUG: Marking task 1349 (/home/alimon/repos/poky-bugs/meta/recipes-core/nc=
urses/ncurses_5.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1431 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_package) as buildable
DEBUG: Marking task 1626 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_package) as buildable
DEBUG: Marking task 1116 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_package) as buildable
DEBUG: Marking task 428 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 391 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_packagedata) as buildable
DEBUG: Marking task 371 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_packagedata) as buildable
DEBUG: Marking task 393 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxdmcp_1.1.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 373 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxau_1.0.8.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1628 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_unpack) as buildable
DEBUG: Marking task 1629 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_patch) as buildable
DEBUG: Marking task 1633 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_configure) as buildable
DEBUG: Marking task 1634 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_compile) as buildable
DEBUG: Marking task 1630 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_install) as buildable
DEBUG: Marking task 1631 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1520 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_package) as buildable
DEBUG: Marking task 1513 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1236 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_unpack) as buildable
DEBUG: Marking task 1237 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_patch) as buildable
DEBUG: Marking task 1241 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_configure) as buildable
DEBUG: Marking task 1242 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_compile) as buildable
DEBUG: Marking task 1238 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_install) as buildable
DEBUG: Marking task 1239 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 510 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_install) as buildable
DEBUG: Marking task 509 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 917 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_packagedata) as buildable
DEBUG: Marking task 291 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_packagedata) as buildable
DEBUG: Marking task 919 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpthread-stubs_0.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 293 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/kbproto_1.0.6.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1378 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_unpack) as buildable
DEBUG: Marking task 1379 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_patch) as buildable
DEBUG: Marking task 1384 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_configure) as buildable
DEBUG: Marking task 1385 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 301 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_packagedata) as buildable
DEBUG: Marking task 303 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/inputproto_2.3.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1464 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_packagedata) as buildable
DEBUG: Marking task 1466 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-proto/xcb-proto_1.10.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1036 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_package) as buildable
DEBUG: Marking task 1035 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_packagedata) as buildable
DEBUG: Marking task 505 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_package) as buildable
DEBUG: Marking task 1037 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxcb_1.10.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 504 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_packagedata) as buildable
DEBUG: Marking task 506 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libx11_1.6.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1115 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1117 (/home/alimon/repos/poky-bugs/meta/recipes-core/ut=
il-linux/util-linux_2.24.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1719 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_package) as buildable
DEBUG: Marking task 144 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_unpack) as buildable
DEBUG: Marking task 145 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_patch) as buildable
DEBUG: Marking task 149 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_configure) as buildable
DEBUG: Marking task 150 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_compile) as buildable
DEBUG: Marking task 146 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_install) as buildable
DEBUG: Marking task 152 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_package) as buildable
DEBUG: Marking task 147 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1145 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_packagedata) as buildable
DEBUG: Marking task 1147 (/home/alimon/repos/poky-bugs/meta/recipes-core/in=
itscripts/initscripts_1.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1529 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_unpack) as buildable
DEBUG: Marking task 1522 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_unpack) as buildable
DEBUG: Marking task 1530 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_patch) as buildable
DEBUG: Marking task 1523 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_patch) as buildable
DEBUG: Marking task 1534 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_configure) as buildable
DEBUG: Marking task 1527 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_configure) as buildable
DEBUG: Marking task 1535 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_compile) as buildable
DEBUG: Marking task 1528 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_compile) as buildable
DEBUG: Marking task 1531 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_install) as buildable
DEBUG: Marking task 1524 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_install) as buildable
DEBUG: Marking task 1229 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_unpack) as buildable
DEBUG: Marking task 1532 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/freetype/freetype_2.5.3.bb, do_populate_sysroot) as builda=
ble
DEBUG: Marking task 1525 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-lib/libfontenc_1.1.2.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 1230 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_patch) as buildable
DEBUG: Marking task 1234 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_configure) as buildable
DEBUG: Marking task 1235 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_compile) as buildable
DEBUG: Marking task 511 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1231 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_install) as buildable
DEBUG: Marking task 611 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_unpack) as buildable
DEBUG: Marking task 1232 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/xorg-app/mkfontscale_1.1.1.bb, do_populate_sysroot) as bui=
ldable
DEBUG: Marking task 612 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_patch) as buildable
DEBUG: Marking task 616 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_configure) as buildable
DEBUG: Marking task 617 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_compile) as buildable
DEBUG: Marking task 613 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_install) as buildable
DEBUG: Marking task 619 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_package) as buildable
DEBUG: Marking task 614 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1386 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_compile) as buildable
DEBUG: Marking task 1387 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1584 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_unpack) as buildable
DEBUG: Marking task 1206 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_unpack) as buildable
DEBUG: Marking task 1585 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_patch) as buildable
DEBUG: Marking task 1207 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_patch) as buildable
DEBUG: Marking task 1590 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_configure) as buildable
DEBUG: Marking task 1212 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_configure) as buildable
DEBUG: Marking task 1591 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1213 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 374 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_unpack) as buildable
DEBUG: Marking task 375 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_patch) as buildable
DEBUG: Marking task 379 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_configure) as buildable
DEBUG: Marking task 380 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_compile) as buildable
DEBUG: Marking task 376 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_install) as buildable
DEBUG: Marking task 377 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 382 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_package) as buildable
DEBUG: Marking task 1505 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_packagedata) as buildable
DEBUG: Marking task 414 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_unpack) as buildable
DEBUG: Marking task 415 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_patch) as buildable
DEBUG: Marking task 419 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_configure) as buildable
DEBUG: Marking task 1199 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_unpack) as buildable
DEBUG: Marking task 420 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_compile) as buildable
DEBUG: Marking task 1200 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_patch) as buildable
DEBUG: Marking task 416 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_install) as buildable
DEBUG: Marking task 1507 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb1_1.0.19.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1079 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_package) as buildable
DEBUG: Marking task 1204 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_configure) as buildable
DEBUG: Marking task 417 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 422 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_package) as buildable
DEBUG: Marking task 1205 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_compile) as buildable
DEBUG: Marking task 1201 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_install) as buildable
DEBUG: Marking task 1202 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/perl/perl-native_5.20.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1128 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_packagedata) as buildable
DEBUG: Marking task 1078 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_packagedata) as buildable
DEBUG: Marking task 1718 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_packagedata) as buildable
DEBUG: Marking task 1708 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_packagedata) as buildable
DEBUG: Marking task 1130 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/=
kmod/kmod_git.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1099 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_package) as buildable
DEBUG: Marking task 1080 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/libusb/libusb-compat_0.1.5.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1089 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_package) as buildable
DEBUG: Marking task 1720 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/e2fsprogs/e2fsprogs_1.42.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1692 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_package) as buildable
DEBUG: Marking task 1710 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libice_1.0.9.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1664 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_packagedata) as buildable
DEBUG: Marking task 1645 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_packagedata) as buildable
DEBUG: Marking task 1283 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 1447 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_packagedata) as buildable
DEBUG: Marking task 447 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_unpack) as buildable
DEBUG: Marking task 448 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_patch) as buildable
DEBUG: Marking task 452 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_configure) as buildable
DEBUG: Marking task 1691 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1681 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 453 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_compile) as buildable
DEBUG: Marking task 1666 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-passwd/base-passwd_3.5.29.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1647 (/home/alimon/repos/poky-bugs/meta/recipes-core/ba=
se-files/base-files_3.0.14.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 449 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_install) as buildable
DEBUG: Marking task 1449 (/home/alimon/repos/poky-bugs/meta/recipes-gnome/l=
ibffi/libffi_3.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 450 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1693 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libsm_1.2.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1489 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_package) as buildable
DEBUG: Marking task 1683 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-sysroot_4.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1488 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1018 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_unpack) as buildable
DEBUG: Marking task 1019 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_patch) as buildable
DEBUG: Marking task 1023 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_configure) as buildable
DEBUG: Marking task 1024 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_compile) as buildable
DEBUG: Marking task 1020 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_install) as buildable
DEBUG: Marking task 1021 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1069 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_package) as buildable
DEBUG: Marking task 572 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_unpack) as buildable
DEBUG: Marking task 573 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_patch) as buildable
DEBUG: Marking task 577 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_configure) as buildable
DEBUG: Marking task 578 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 204 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_unpack) as buildable
DEBUG: Marking task 154 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 205 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_patch) as buildable
DEBUG: Marking task 155 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_patch) as buildable
DEBUG: Marking task 209 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_configure) as buildable
DEBUG: Marking task 159 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_configure) as buildable
DEBUG: Marking task 210 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_compile) as buildable
DEBUG: Marking task 160 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1611 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_unpack) as buildable
DEBUG: Marking task 206 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_install) as buildable
DEBUG: Marking task 156 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_install) as buildable
DEBUG: Marking task 1612 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_patch) as buildable
DEBUG: Marking task 1430 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_packagedata) as buildable
DEBUG: Marking task 212 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_package) as buildable
DEBUG: Marking task 207 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 162 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_package) as buildable
DEBUG: Marking task 157 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1616 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_configure) as buildable
DEBUG: Marking task 1617 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_compile) as buildable
DEBUG: Marking task 1613 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_install) as buildable
DEBUG: Marking task 1614 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/expat/expat_2.1.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1068 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_packagedata) as buildable
DEBUG: Marking task 1056 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_package) as buildable
DEBUG: Marking task 1381 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_install) as buildable
DEBUG: Marking task 1380 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1592 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_compile) as buildable
DEBUG: Marking task 1214 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_compile) as buildable
DEBUG: Marking task 1593 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1215 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 487 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_unpack) as buildable
DEBUG: Marking task 477 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_unpack) as buildable
DEBUG: Marking task 457 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_unpack) as buildable
DEBUG: Marking task 394 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_unpack) as buildable
DEBUG: Marking task 274 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_unpack) as buildable
DEBUG: Marking task 488 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_patch) as buildable
DEBUG: Marking task 478 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_patch) as buildable
DEBUG: Marking task 458 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_patch) as buildable
DEBUG: Marking task 395 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_patch) as buildable
DEBUG: Marking task 275 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_patch) as buildable
DEBUG: Marking task 492 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_configure) as buildable
DEBUG: Marking task 482 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_configure) as buildable
DEBUG: Marking task 462 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_configure) as buildable
DEBUG: Marking task 399 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_configure) as buildable
DEBUG: Marking task 279 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_configure) as buildable
DEBUG: Marking task 493 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_compile) as buildable
DEBUG: Marking task 483 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_compile) as buildable
DEBUG: Marking task 463 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_compile) as buildable
DEBUG: Marking task 400 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_compile) as buildable
DEBUG: Marking task 280 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_compile) as buildable
DEBUG: Marking task 489 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_install) as buildable
DEBUG: Marking task 479 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_install) as buildable
DEBUG: Marking task 459 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_install) as buildable
DEBUG: Marking task 396 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_install) as buildable
DEBUG: Marking task 276 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_install) as buildable
DEBUG: Marking task 490 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 495 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_package) as buildable
DEBUG: Marking task 480 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 485 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_package) as buildable
DEBUG: Marking task 465 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_package) as buildable
DEBUG: Marking task 460 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 397 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 282 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_package) as buildable
DEBUG: Marking task 277 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 940 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_unpack) as buildable
DEBUG: Marking task 900 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_unpack) as buildable
DEBUG: Marking task 890 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_unpack) as buildable
DEBUG: Marking task 941 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_patch) as buildable
DEBUG: Marking task 901 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_patch) as buildable
DEBUG: Marking task 891 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_patch) as buildable
DEBUG: Marking task 945 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_configure) as buildable
DEBUG: Marking task 905 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_configure) as buildable
DEBUG: Marking task 895 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_configure) as buildable
DEBUG: Marking task 946 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_compile) as buildable
DEBUG: Marking task 906 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_compile) as buildable
DEBUG: Marking task 896 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_compile) as buildable
DEBUG: Marking task 942 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_install) as buildable
DEBUG: Marking task 902 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_install) as buildable
DEBUG: Marking task 892 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_install) as buildable
DEBUG: Marking task 948 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_package) as buildable
DEBUG: Marking task 943 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 903 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 898 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_package) as buildable
DEBUG: Marking task 893 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1098 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 1088 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_packagedata) as buildable
DEBUG: Marking task 1055 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_packagedata) as buildable
DEBUG: Marking task 1100 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/pci=
utils/pciutils_3.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1090 (/home/alimon/repos/poky-bugs/meta/recipes-bsp/usb=
utils/usbutils_007.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 518 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_package) as buildable
DEBUG: Marking task 1625 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_packagedata) as buildable
DEBUG: Marking task 517 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_packagedata) as buildable
DEBUG: Marking task 1627 (/home/alimon/repos/poky-bugs/meta/recipes-core/re=
adline/readline_6.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1636 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_package) as buildable
DEBUG: Marking task 1357 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_unpack) as buildable
DEBUG: Marking task 1255 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_unpack) as buildable
DEBUG: Marking task 1243 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_unpack) as buildable
DEBUG: Marking task 1358 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_patch) as buildable
DEBUG: Marking task 1256 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_patch) as buildable
DEBUG: Marking task 1244 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_patch) as buildable
DEBUG: Marking task 1362 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_configure) as buildable
DEBUG: Marking task 1260 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_configure) as buildable
DEBUG: Marking task 1248 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_configure) as buildable
DEBUG: Marking task 1363 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1261 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 1249 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_configure_ptest_base) as buildable
DEBUG: Marking task 151 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_packagedata) as buildable
DEBUG: Marking task 579 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_compile) as buildable
DEBUG: Marking task 580 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 153 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fixesproto_5.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1026 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_package) as buildable
DEBUG: Marking task 1450 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_unpack) as buildable
DEBUG: Marking task 1451 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_patch) as buildable
DEBUG: Marking task 1455 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_configure) as buildable
DEBUG: Marking task 1456 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_compile) as buildable
DEBUG: Marking task 1452 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_install) as buildable
DEBUG: Marking task 1008 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_unpack) as buildable
DEBUG: Marking task 998 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_unpack) as buildable
DEBUG: Marking task 988 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_unpack) as buildable
DEBUG: Marking task 930 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_unpack) as buildable
DEBUG: Marking task 880 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_unpack) as buildable
DEBUG: Marking task 618 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_packagedata) as buildable
DEBUG: Marking task 1453 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-graphics/wayland/wayland_1.6.0.bb, do_populate_sysroot) as buildabl=
e
DEBUG: Marking task 1009 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_patch) as buildable
DEBUG: Marking task 999 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxxf86vm_1.1.3.bb, do_patch) as buildable
DEBUG: Marking task 989 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_patch) as buildable
DEBUG: Marking task 931 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_patch) as buildable
DEBUG: Marking task 881 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_patch) as buildable
DEBUG: Marking task 381 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1013 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_configure) as buildable
DEBUG: Marking task 1003 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_configure) as buildable
DEBUG: Marking task 993 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_configure) as buildable
DEBUG: Marking task 935 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_configure) as buildable
DEBUG: Marking task 885 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_configure) as buildable
DEBUG: Marking task 1014 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_compile) as buildable
DEBUG: Marking task 1004 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_compile) as buildable
DEBUG: Marking task 994 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_compile) as buildable
DEBUG: Marking task 936 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_compile) as buildable
DEBUG: Marking task 886 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_compile) as buildable
DEBUG: Marking task 1010 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_install) as buildable
DEBUG: Marking task 1000 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_install) as buildable
DEBUG: Marking task 990 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_install) as buildable
DEBUG: Marking task 932 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_install) as buildable
DEBUG: Marking task 882 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_install) as buildable
DEBUG: Marking task 1011 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1001 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 996 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_package) as buildable
DEBUG: Marking task 991 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 938 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_package) as buildable
DEBUG: Marking task 933 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 888 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_package) as buildable
DEBUG: Marking task 883 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 927 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_packagedata) as buildable
DEBUG: Marking task 620 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/encodings_1.0.4.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 455 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_package) as buildable
DEBUG: Marking task 404 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_unpack) as buildable
DEBUG: Marking task 383 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxext_1.3.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 405 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_patch) as buildable
DEBUG: Marking task 409 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_configure) as buildable
DEBUG: Marking task 410 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_compile) as buildable
DEBUG: Marking task 406 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_install) as buildable
DEBUG: Marking task 412 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_package) as buildable
DEBUG: Marking task 407 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 929 (/home/alimon/repos/poky-bugs/meta/recipes-kernel/c=
ryptodev/cryptodev-linux_1.6.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 435 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_package) as buildable
DEBUG: Marking task 421 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1196 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_packagedata) as buildable
DEBUG: Marking task 1183 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_packagedata) as buildable
DEBUG: Marking task 454 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_packagedata) as buildable
DEBUG: Marking task 434 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_packagedata) as buildable
DEBUG: Marking task 402 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_package) as buildable
DEBUG: Marking task 423 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libpciaccess_0.13.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1185 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/db/db_6.0.30.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 908 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_package) as buildable
DEBUG: Marking task 1382 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1025 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_packagedata) as buildable
DEBUG: Marking task 1587 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_install) as buildable
DEBUG: Marking task 1209 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_install) as buildable
DEBUG: Marking task 1586 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1208 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1027 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxfixes_5.0.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 211 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_packagedata) as buildable
DEBUG: Marking task 161 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 213 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1006 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_package) as buildable
DEBUG: Marking task 1016 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_package) as buildable
DEBUG: Marking task 163 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/damageproto_1.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1635 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_packagedata) as buildable
DEBUG: Marking task 1519 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_packagedata) as buildable
DEBUG: Marking task 960 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_unpack) as buildable
DEBUG: Marking task 961 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_patch) as buildable
DEBUG: Marking task 494 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_packagedata) as buildable
DEBUG: Marking task 484 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_packagedata) as buildable
DEBUG: Marking task 464 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_packagedata) as buildable
DEBUG: Marking task 401 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_packagedata) as buildable
DEBUG: Marking task 281 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_packagedata) as buildable
DEBUG: Marking task 965 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_configure) as buildable
DEBUG: Marking task 966 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_compile) as buildable
DEBUG: Marking task 962 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_install) as buildable
DEBUG: Marking task 467 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_unpack) as buildable
DEBUG: Marking task 437 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_unpack) as buildable
DEBUG: Marking task 344 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_unpack) as buildable
DEBUG: Marking task 334 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_unpack) as buildable
DEBUG: Marking task 324 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_unpack) as buildable
DEBUG: Marking task 314 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_unpack) as buildable
DEBUG: Marking task 304 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_unpack) as buildable
DEBUG: Marking task 264 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 254 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_unpack) as buildable
DEBUG: Marking task 244 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_unpack) as buildable
DEBUG: Marking task 234 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_unpack) as buildable
DEBUG: Marking task 224 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_unpack) as buildable
DEBUG: Marking task 214 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_unpack) as buildable
DEBUG: Marking task 194 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_unpack) as buildable
DEBUG: Marking task 184 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_unpack) as buildable
DEBUG: Marking task 134 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_unpack) as buildable
DEBUG: Marking task 124 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_unpack) as buildable
DEBUG: Marking task 963 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-graphics/xorg-util/makedepend_1.0.5.bb, do_populate_sysroot) as buil=
dable
DEBUG: Marking task 468 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_patch) as buildable
DEBUG: Marking task 438 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_patch) as buildable
DEBUG: Marking task 345 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_patch) as buildable
DEBUG: Marking task 335 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_patch) as buildable
DEBUG: Marking task 325 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_patch) as buildable
DEBUG: Marking task 315 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_patch) as buildable
DEBUG: Marking task 305 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_patch) as buildable
DEBUG: Marking task 265 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_patch) as buildable
DEBUG: Marking task 255 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_patch) as buildable
DEBUG: Marking task 245 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_patch) as buildable
DEBUG: Marking task 235 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_patch) as buildable
DEBUG: Marking task 225 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_patch) as buildable
DEBUG: Marking task 215 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_patch) as buildable
DEBUG: Marking task 195 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_patch) as buildable
DEBUG: Marking task 185 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_patch) as buildable
DEBUG: Marking task 135 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_patch) as buildable
DEBUG: Marking task 125 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_patch) as buildable
DEBUG: Marking task 472 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_configure) as buildable
DEBUG: Marking task 442 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_configure) as buildable
DEBUG: Marking task 349 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_configure) as buildable
DEBUG: Marking task 339 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_configure) as buildable
DEBUG: Marking task 329 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_configure) as buildable
DEBUG: Marking task 319 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_configure) as buildable
DEBUG: Marking task 309 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_configure) as buildable
DEBUG: Marking task 269 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_configure) as buildable
DEBUG: Marking task 259 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_configure) as buildable
DEBUG: Marking task 249 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_configure) as buildable
DEBUG: Marking task 239 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_configure) as buildable
DEBUG: Marking task 229 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_configure) as buildable
DEBUG: Marking task 219 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_configure) as buildable
DEBUG: Marking task 199 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_configure) as buildable
DEBUG: Marking task 189 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_configure) as buildable
DEBUG: Marking task 139 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_configure) as buildable
DEBUG: Marking task 129 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_configure) as buildable
DEBUG: Marking task 473 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_compile) as buildable
DEBUG: Marking task 443 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_compile) as buildable
DEBUG: Marking task 350 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_compile) as buildable
DEBUG: Marking task 340 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_compile) as buildable
DEBUG: Marking task 330 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_compile) as buildable
DEBUG: Marking task 320 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_compile) as buildable
DEBUG: Marking task 310 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_compile) as buildable
DEBUG: Marking task 270 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_compile) as buildable
DEBUG: Marking task 260 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_compile) as buildable
DEBUG: Marking task 250 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_compile) as buildable
DEBUG: Marking task 240 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_compile) as buildable
DEBUG: Marking task 230 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_compile) as buildable
DEBUG: Marking task 220 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_compile) as buildable
DEBUG: Marking task 200 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_compile) as buildable
DEBUG: Marking task 190 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_compile) as buildable
DEBUG: Marking task 140 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_compile) as buildable
DEBUG: Marking task 130 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_compile) as buildable
DEBUG: Marking task 469 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_install) as buildable
DEBUG: Marking task 439 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_install) as buildable
DEBUG: Marking task 346 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_install) as buildable
DEBUG: Marking task 336 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_install) as buildable
DEBUG: Marking task 326 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_install) as buildable
DEBUG: Marking task 316 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_install) as buildable
DEBUG: Marking task 306 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_install) as buildable
DEBUG: Marking task 266 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_install) as buildable
DEBUG: Marking task 256 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_install) as buildable
DEBUG: Marking task 246 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_install) as buildable
DEBUG: Marking task 236 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_install) as buildable
DEBUG: Marking task 226 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_install) as buildable
DEBUG: Marking task 216 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_install) as buildable
DEBUG: Marking task 196 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_install) as buildable
DEBUG: Marking task 186 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_install) as buildable
DEBUG: Marking task 136 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_install) as buildable
DEBUG: Marking task 126 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_install) as buildable
DEBUG: Marking task 470 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 440 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 347 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 337 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 332 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_package) as buildable
DEBUG: Marking task 327 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 322 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_package) as buildable
DEBUG: Marking task 317 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 312 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_package) as buildable
DEBUG: Marking task 307 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 272 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_package) as buildable
DEBUG: Marking task 267 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 257 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 262 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_package) as buildable
DEBUG: Marking task 252 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_package) as buildable
DEBUG: Marking task 247 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 242 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_package) as buildable
DEBUG: Marking task 237 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 232 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_package) as buildable
DEBUG: Marking task 227 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 217 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 222 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_package) as buildable
DEBUG: Marking task 202 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_package) as buildable
DEBUG: Marking task 197 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 192 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_package) as buildable
DEBUG: Marking task 187 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 137 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 142 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_package) as buildable
DEBUG: Marking task 132 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_package) as buildable
DEBUG: Marking task 127 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1637 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/sqlite/sqlite3_3.8.6.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1521 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bzip2/bzip2_1.0.6.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1389 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_package) as buildable
DEBUG: Marking task 947 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_packagedata) as buildable
DEBUG: Marking task 907 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_packagedata) as buildable
DEBUG: Marking task 897 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_packagedata) as buildable
DEBUG: Marking task 496 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/dri2proto_2.8.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 486 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86driproto_2.1.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 466 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/glproto_1.4.17.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 403 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/drm/libdrm_2.4.58.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 283 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/fontsproto_2.1.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1364 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_compile) as buildable
DEBUG: Marking task 1262 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_compile) as buildable
DEBUG: Marking task 1250 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_compile) as buildable
DEBUG: Marking task 1365 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1263 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1251 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_compile_ptest_base) as buildable
DEBUG: Marking task 1350 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_unpack) as buildable
DEBUG: Marking task 1351 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_patch) as buildable
DEBUG: Marking task 575 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_install) as buildable
DEBUG: Marking task 1388 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_packagedata) as buildable
DEBUG: Marking task 1355 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_configure) as buildabl=
e
DEBUG: Marking task 949 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libcap/libcap_2.24.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 909 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libfontenc_1.1.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 352 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_package) as buildable
DEBUG: Marking task 899 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/freetype/freetype_2.5.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 574 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1356 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_compile) as buildable
DEBUG: Marking task 1352 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_install) as buildable
DEBUG: Marking task 1148 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_unpack) as buildable
DEBUG: Marking task 1353 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_populate_sysroot) as b=
uildable
DEBUG: Marking task 1149 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_patch) as buildable
DEBUG: Marking task 1153 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_configure) as buildable
DEBUG: Marking task 1154 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_compile) as buildable
DEBUG: Marking task 1150 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_install) as buildable
DEBUG: Marking task 1151 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/intltool/intltool_0.50.2.bb, do_populate_sysroot) as build=
able
DEBUG: Marking task 1536 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_unpack) as buildable
DEBUG: Marking task 1228 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1390 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python_2.7.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 411 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_packagedata) as buildable
DEBUG: Marking task 1537 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_patch) as buildable
DEBUG: Marking task 1541 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_configure) as buildable
DEBUG: Marking task 1542 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_compile) as buildable
DEBUG: Marking task 1538 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_install) as buildable
DEBUG: Marking task 1544 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_package) as buildable
DEBUG: Marking task 1539 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 413 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxkbfile_1.0.8.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1721 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_unpack) as buildable
DEBUG: Marking task 1722 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_patch) as buildable
DEBUG: Marking task 1726 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_configure) as buildable
DEBUG: Marking task 1727 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_compile) as buildable
DEBUG: Marking task 1723 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_install) as buildable
DEBUG: Marking task 1694 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_unpack) as buildable
DEBUG: Marking task 1724 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus_1.8.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1695 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_patch) as buildable
DEBUG: Marking task 1699 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_configure) as buildable
DEBUG: Marking task 1700 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_compile) as buildable
DEBUG: Marking task 1696 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_install) as buildable
DEBUG: Marking task 1567 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_unpack) as buildable
DEBUG: Marking task 1015 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_packagedata) as buildable
DEBUG: Marking task 1005 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_packagedata) as buildable
DEBUG: Marking task 995 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_packagedata) as buildable
DEBUG: Marking task 937 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_packagedata) as buildable
DEBUG: Marking task 887 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_packagedata) as buildable
DEBUG: Marking task 1697 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-core/dbus/dbus-glib_0.100.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1568 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_patch) as buildable
DEBUG: Marking task 1572 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_configure) as buildable
DEBUG: Marking task 1573 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_compile) as buildable
DEBUG: Marking task 1569 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_install) as buildable
DEBUG: Marking task 1595 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_package) as buildable
DEBUG: Marking task 1588 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1570 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1575 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_package) as buildable
DEBUG: Marking task 1217 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_package) as buildable
DEBUG: Marking task 1210 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1017 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxdamage_1.1.4.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1007 (/home/alimon/repos/poky-bugs/meta/recipes-graphic=
s/xorg-lib/libxxf86vm_1.1.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 475 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_package) as buildable
DEBUG: Marking task 997 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/wayland/wayland_1.6.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 939 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgpg-error/libgpg-error_1.12.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 445 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_package) as buildable
DEBUG: Marking task 889 (/home/alimon/repos/poky-bugs/meta/recipes-multimed=
ia/libpng/libpng_1.6.13.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 342 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_package) as buildable
DEBUG: Marking task 563 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_unpack) as buildable
DEBUG: Marking task 564 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_patch) as buildable
DEBUG: Marking task 0 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_unpack) as buildable
DEBUG: Marking task 567 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_configure) as buildable
DEBUG: Marking task 1 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_patch) as buildable
DEBUG: Marking task 568 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_compile) as buildable
DEBUG: Marking task 7 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_populate_lic) as buildable
DEBUG: Marking task 565 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_install) as buildable
DEBUG: Marking task 570 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_package) as buildable
DEBUG: Marking task 474 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_packagedata) as buildable
DEBUG: Marking task 444 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_packagedata) as buildable
DEBUG: Marking task 351 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_packagedata) as buildable
DEBUG: Marking task 341 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_packagedata) as buildable
DEBUG: Marking task 331 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_packagedata) as buildable
DEBUG: Marking task 321 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_packagedata) as buildable
DEBUG: Marking task 311 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_packagedata) as buildable
DEBUG: Marking task 271 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 261 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_packagedata) as buildable
DEBUG: Marking task 251 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_packagedata) as buildable
DEBUG: Marking task 241 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_packagedata) as buildable
DEBUG: Marking task 231 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_packagedata) as buildable
DEBUG: Marking task 221 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_packagedata) as buildable
DEBUG: Marking task 201 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_packagedata) as buildable
DEBUG: Marking task 191 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 141 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_packagedata) as buildable
DEBUG: Marking task 131 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_packagedata) as buildable
DEBUG: Marking task 569 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_packagedata) as buildable
DEBUG: Marking task 1360 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_install) as buildable
DEBUG: Marking task 1258 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_install) as buildable
DEBUG: Marking task 1246 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_install) as buildable
DEBUG: Marking task 1359 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1257 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 1245 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_install_ptest_base) as buildable
DEBUG: Marking task 5 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_configure) as buildable
DEBUG: Marking task 1543 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_packagedata) as buildable
DEBUG: Marking task 6 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_compile) as buildable
DEBUG: Marking task 582 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_package) as buildable
DEBUG: Marking task 2 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_install) as buildable
DEBUG: Marking task 581 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_packagedata) as buildable
DEBUG: Marking task 476 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/mesa/mesa_10.3.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 446 (/home/alimon/repos/poky-bugs/meta/recipes-support/=
libgcrypt/libgcrypt_1.6.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 353 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/libxfont_1.5.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 343 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/pixman_0.32.6.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 333 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/presentproto_git.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 323 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xcmiscproto_1.2.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 313 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/bigreqsproto_1.1.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 273 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xineramaproto_1.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 263 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/scrnsaverproto_1.2.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 253 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/videoproto_2.3.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 243 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/resourceproto_1.2.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 233 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/recordproto_1.14.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 223 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/compositeproto_0.4.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 203 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86miscproto_0.9.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 193 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/xf86dgaproto_2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 143 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/renderproto_0.11.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 133 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-proto/randrproto_1.4.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 11 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xorg_1.16.2.bb, do_package) as buildable
DEBUG: Marking task 3 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1604 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_unpack) as buildable
DEBUG: Marking task 879 (/home/alimon/repos/poky-bugs/meta/recipes-core/zli=
b/zlib_1.2.8.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 571 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/make/make_4.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1605 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_patch) as buildable
DEBUG: Marking task 1609 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_configure) as buildable
DEBUG: Marking task 1610 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_compile) as buildable
DEBUG: Marking task 1606 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_install) as buildable
DEBUG: Marking task 1331 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_unpack) as buildable
DEBUG: Marking task 1607 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/cross-localedef-native_2.20.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1332 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_patch) as buildable
DEBUG: Marking task 1335 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_configure) as buildable
DEBUG: Marking task 1336 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_compile) as buildable
DEBUG: Marking task 1594 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_packagedata) as buildable
DEBUG: Marking task 1574 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1333 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_install) as buildable
DEBUG: Marking task 1216 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_packagedata) as buildable
DEBUG: Marking task 1545 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gmp/gmp_6.0.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1338 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_package) as buildable
DEBUG: Marking task 1337 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_packagedata) as buildable
DEBUG: Marking task 8 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_packagedata) as buildable
DEBUG: Marking task 1267 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_unpack) as buildable
DEBUG: Marking task 621 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_unpack) as buildable
DEBUG: Marking task 602 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_unpack) as buildable
DEBUG: Marking task 547 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_unpack) as buildable
DEBUG: Marking task 538 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_unpack) as buildable
DEBUG: Marking task 529 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_unpack) as buildable
DEBUG: Marking task 520 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_unpack) as buildable
DEBUG: Marking task 1268 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_patch) as buildable
DEBUG: Marking task 622 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_patch) as buildable
DEBUG: Marking task 603 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_patch) as buildable
DEBUG: Marking task 548 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_patch) as buildable
DEBUG: Marking task 539 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_patch) as buildable
DEBUG: Marking task 530 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_patch) as buildable
DEBUG: Marking task 521 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_patch) as buildable
DEBUG: Marking task 1271 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_configure) as buildable
DEBUG: Marking task 625 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_configure) as buildable
DEBUG: Marking task 606 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_configure) as buildable
DEBUG: Marking task 551 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_configure) as buildable
DEBUG: Marking task 542 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_configure) as buildable
DEBUG: Marking task 533 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_configure) as buildable
DEBUG: Marking task 524 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_configure) as buildable
DEBUG: Marking task 1272 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_compile) as buildable
DEBUG: Marking task 626 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_compile) as buildable
DEBUG: Marking task 607 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_compile) as buildable
DEBUG: Marking task 552 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_compile) as buildable
DEBUG: Marking task 543 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_compile) as buildable
DEBUG: Marking task 534 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_compile) as buildable
DEBUG: Marking task 525 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_compile) as buildable
DEBUG: Marking task 1269 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_install) as buildable
DEBUG: Marking task 623 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_install) as buildable
DEBUG: Marking task 604 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_install) as buildable
DEBUG: Marking task 549 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_install) as buildable
DEBUG: Marking task 540 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_install) as buildable
DEBUG: Marking task 531 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_install) as buildable
DEBUG: Marking task 522 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_install) as buildable
DEBUG: Marking task 1576 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus-glib_0.100.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1274 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_package) as buildable
DEBUG: Marking task 628 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_package) as buildable
DEBUG: Marking task 609 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_package) as buildable
DEBUG: Marking task 554 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_package) as buildable
DEBUG: Marking task 545 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_package) as buildable
DEBUG: Marking task 536 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_package) as buildable
DEBUG: Marking task 527 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_package) as buildable
DEBUG: Marking task 1273 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_packagedata) as buildable
DEBUG: Marking task 627 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_packagedata) as buildable
DEBUG: Marking task 608 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_packagedata) as buildable
DEBUG: Marking task 553 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_packagedata) as buildable
DEBUG: Marking task 544 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_packagedata) as buildable
DEBUG: Marking task 535 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_packagedata) as buildable
DEBUG: Marking task 526 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_packagedata) as buildable
DEBUG: Marking task 1597 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_unpack) as bui=
ldable
DEBUG: Marking task 1577 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_unpack) as buildable
DEBUG: Marking task 1560 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_unpack) as buildable
DEBUG: Marking task 1553 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_unpack) as buildable
DEBUG: Marking task 1339 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ibc/glibc-locale_2.20.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1596 (/home/alimon/repos/poky-bugs/meta/recipes-core/li=
bxml/libxml2_2.9.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1598 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_patch) as buil=
dable
DEBUG: Marking task 1578 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_patch) as buildable
DEBUG: Marking task 1561 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_patch) as buildable
DEBUG: Marking task 1554 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_patch) as buildable
DEBUG: Marking task 1602 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_configure) as =
buildable
DEBUG: Marking task 1582 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_configure) as buildable
DEBUG: Marking task 1565 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_configure) as builda=
ble
DEBUG: Marking task 1558 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_configure) as buildable
DEBUG: Marking task 1603 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_compile) as bu=
ildable
DEBUG: Marking task 1583 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_compile) as buildable
DEBUG: Marking task 1566 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_compile) as buildabl=
e
DEBUG: Marking task 1559 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_compile) as buildable
DEBUG: Marking task 1648 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_unpack) as buildable
DEBUG: Marking task 1599 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_install) as bu=
ildable
DEBUG: Marking task 1579 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_install) as buildable
DEBUG: Marking task 1562 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_install) as buildabl=
e
DEBUG: Marking task 1555 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_install) as buildable
DEBUG: Marking task 1369 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_unpack) as buildable
DEBUG: Marking task 1322 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_unpack) as buildable
DEBUG: Marking task 1313 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_unpack) as buildable
DEBUG: Marking task 1304 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_unpack) as buildable
DEBUG: Marking task 1295 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_unpack) as buildable
DEBUG: Marking task 1286 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_unpack) as build=
able
DEBUG: Marking task 593 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_unpack) as buildable
DEBUG: Marking task 584 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_unpack) as buildable
DEBUG: Marking task 1649 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_patch) as buildable
DEBUG: Marking task 1600 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-support/shared-mime-info/shared-mime-info_1.3.bb, do_populate_sysro=
ot) as buildable
DEBUG: Marking task 1580 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pyrex-native_0.9.9.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1563 (virtual:native:/home/alimon/repos/poky-bugs/meta/=
recipes-devtools/python/python-pygobject_2.28.3.bb, do_populate_sysroot) as=
 buildable
DEBUG: Marking task 1556 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzcode/tzcode-native_2014j.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 1370 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_patch) as buildable
DEBUG: Marking task 1323 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_patch) as buildable
DEBUG: Marking task 1314 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_patch) as buildable
DEBUG: Marking task 1305 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_patch) as buildable
DEBUG: Marking task 1296 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_patch) as buildable
DEBUG: Marking task 1287 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_patch) as builda=
ble
DEBUG: Marking task 594 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_patch) as buildable
DEBUG: Marking task 585 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_patch) as buildable
DEBUG: Marking task 1652 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_configure) as buildable
DEBUG: Marking task 1373 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_configure) as buildable
DEBUG: Marking task 1326 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_configure) as buildable
DEBUG: Marking task 1317 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_configure) as buildable
DEBUG: Marking task 1308 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_configure) as buildable
DEBUG: Marking task 1299 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_configure) as buildable
DEBUG: Marking task 1290 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_configure) as bu=
ildable
DEBUG: Marking task 597 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_configure) as buildable
DEBUG: Marking task 588 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_configure) as buildable
DEBUG: Marking task 1653 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_compile) as buildable
DEBUG: Marking task 1374 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_compile) as buildable
DEBUG: Marking task 1327 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_compile) as buildable
DEBUG: Marking task 1318 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_compile) as buildable
DEBUG: Marking task 1309 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_compile) as buildable
DEBUG: Marking task 1300 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_compile) as buildable
DEBUG: Marking task 1291 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_compile) as buil=
dable
DEBUG: Marking task 598 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_compile) as buildable
DEBUG: Marking task 589 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_compile) as buildable
DEBUG: Marking task 1650 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_install) as buildable
DEBUG: Marking task 1371 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_install) as buildable
DEBUG: Marking task 1324 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_install) as buildable
DEBUG: Marking task 1315 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_install) as buildable
DEBUG: Marking task 1306 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_install) as buildable
DEBUG: Marking task 1297 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_install) as buildable
DEBUG: Marking task 1288 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_install) as buil=
dable
DEBUG: Marking task 595 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_install) as buildable
DEBUG: Marking task 586 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_install) as buildable
DEBUG: Marking task 1655 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_package) as buildable
DEBUG: Marking task 1376 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_package) as buildable
DEBUG: Marking task 1367 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_package) as buildable
DEBUG: Marking task 1329 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_package) as buildable
DEBUG: Marking task 1320 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_package) as buildable
DEBUG: Marking task 1311 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_package) as buildable
DEBUG: Marking task 1302 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_package) as buildable
DEBUG: Marking task 1293 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_package) as buil=
dable
DEBUG: Marking task 1265 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_package) as buildable
DEBUG: Marking task 1253 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_package) as buildable
DEBUG: Marking task 600 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_package) as buildable
DEBUG: Marking task 591 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_package) as buildable
DEBUG: Marking task 1654 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_packagedata) as buildable
DEBUG: Marking task 1375 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_packagedata) as buildable
DEBUG: Marking task 1366 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_packagedata) as buildable
DEBUG: Marking task 1328 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_packagedata) as buildable
DEBUG: Marking task 1319 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_packagedata) as buildable
DEBUG: Marking task 1310 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_packagedata) as buildable
DEBUG: Marking task 1301 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_packagedata) as buildable
DEBUG: Marking task 1292 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_packagedata) as =
buildable
DEBUG: Marking task 1264 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_packagedata) as buildable
DEBUG: Marking task 1252 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_packagedata) as buildable
DEBUG: Marking task 599 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_packagedata) as buildable
DEBUG: Marking task 590 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_packagedata) as buildable
DEBUG: Marking task 1432 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/attr_2.4.47.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1275 (/home/alimon/repos/poky-bugs/meta/recipes-core/co=
reutils/coreutils_8.22.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1490 (/home/alimon/repos/poky-bugs/meta/recipes-core/db=
us/dbus_1.8.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 629 (/home/alimon/repos/poky-bugs/meta/recipes-core/upd=
ate-rc.d/update-rc.d_0.7.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 519 (/home/alimon/repos/poky-bugs/meta/recipes-core/ude=
v/udev_182.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 610 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontscale_1.1.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 555 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/xkbcomp_1.2.4.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 546 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-xserver/xserver-xf86-config_0.1.bb, do_package_write_rpm) as buildabl=
e
DEBUG: Marking task 537 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/rgb_1.0.5.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 528 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-lib/xkeyboard-config_2.12.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 12 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xorg_1.16.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1656 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow-securetty_4.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1285 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/shadow/shadow_4.2.1.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1377 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/m4/m4_1.4.17.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1218 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/flex/flex_2.5.39.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1368 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/diffutils/diffutils_3.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1198 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gdbm/gdbm_1.11.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1330 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/shared-mime-info/shared-mime-info_1.3.bb, do_package_write_rpm) as buildab=
le
DEBUG: Marking task 1321 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-dbus_1.2.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1312 (/home/alimon/repos/poky-bugs/meta/recipes-devtool=
s/python/python-pygobject_2.28.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1303 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/tzdata/tzdata_2014j.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1294 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb, do_package_write_rp=
m) as buildable
DEBUG: Marking task 1070 (/home/alimon/repos/poky-bugs/meta/recipes-core/gl=
ib-2.0/glib-2.0_2.40.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1057 (/home/alimon/repos/poky-bugs/meta/recipes-support=
/attr/acl_2.2.52.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1266 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/bash/bash_4.3.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 1254 (/home/alimon/repos/poky-bugs/meta/recipes-extende=
d/sed/sed_4.2.2.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 583 (/home/alimon/repos/poky-bugs/meta/recipes-devtools=
/perl/perl_5.20.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 456 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-font/font-util_1.3.0.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 601 (/home/alimon/repos/poky-bugs/meta/recipes-graphics=
/xorg-app/mkfontdir_1.0.7.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 592 (/home/alimon/repos/poky-bugs/meta/recipes-extended=
/bc/bc_1.06.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 436 (/home/alimon/repos/poky-bugs/meta/recipes-connecti=
vity/openssl/openssl_1.0.1j.bb, do_package_write_rpm) as buildable
DEBUG: Marking task 651 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_unpack) as buildable
DEBUG: Marking task 652 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_patch) as buildable
DEBUG: Marking task 656 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_configure) as buildable
DEBUG: Marking task 657 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_compile) as buildable
DEBUG: Marking task 653 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_install) as buildable
DEBUG: Marking task 27 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_unpack) as buildable
DEBUG: Marking task 654 (virtual:native:/home/alimon/repos/poky-bugs/meta/r=
ecipes-devtools/binutils/binutils_2.24.bb, do_populate_sysroot) as buildabl=
e
DEBUG: Marking task 28 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_patch) as buildable
DEBUG: Marking task 32 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_configure) as buildable
DEBUG: Marking task 33 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_compile) as buildable
DEBUG: Marking task 29 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_install) as buildable
DEBUG: Marking task 30 (virtual:native:/home/alimon/repos/poky-bugs/meta/re=
cipes-devtools/prelink/prelink_git.bb, do_populate_sysroot) as buildable
DEBUG: Marking task 9 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/x=
org-xserver/xserver-xorg_1.16.2.bb, do_package_qa) as buildable
DEBUG: Marking task 10 (/home/alimon/repos/poky-bugs/meta/recipes-graphics/=
xorg-xserver/xserver-xorg_1.16.2.bb, do_build) as buildable
NOTE: Running noexec task 1728 of 1728 (ID: 10, /home/alimon/repos/poky-bug=
s/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb, do_build)
DEBUG: Teardown for bitbake-worker
NOTE: Tasks Summary: Attempted 1728 tasks of which 1727 didn't need to be r=
erun and all succeeded.

Summary: There was 1 WARNING message shown.

--------------040908000800020807080002--
