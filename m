Return-Path: <tykwon@m2i.co.kr>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Jun 2018 09:26:21 UTC
Received: from smtp1.hiworks.co.kr (smtp1.hiworks.co.kr [121.254.168.204])
	by mail.openembedded.org (Postfix) with ESMTP id CFCC574A26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:26:21 +0000 (UTC)
Received: (qmail 82439 invoked from network); 25 Jun 2018 18:19:42 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.37)
	by 0 (qmail 1.03 + ejcp v14) with SMTP; 25 Jun 2018 18:19:42 +0900
Received: (qmail 165168 invoked from network); 25 Jun 2018 18:19:42 +0900
Received: from unknown (HELO DESKTOP3HTLQGF) (tykwon@m2i.co.kr@112.216.145.10)
	by 0 (qmail 1.03 + ejcp v14) with SMTP; 25 Jun 2018 18:19:42 +0900
X-Authinfo: HIWORKS SMTP authenticated
	<tykwon@m2i.co.kr|112.216.145.10|tykwon@m2i.co.kr|180625181942_7605165166>
From: "tykwon" <tykwon@m2i.co.kr>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jun 2018 18:19:44 +0900
Message-ID: <0a9d01d40c65$a7effc60$f7cff520$@co.kr>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdQMZae6tB20CO98QsiSLfz4msbp2w==
Subject: I get "will not overwrite just-created" error during hplip upgrade.
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
X-List-Received-Date: Mon, 25 Jun 2018 09:26:23 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0A9E_01D40CB1.17D7A460"
Content-Language: ko

------=_NextPart_000_0A9E_01D40CB1.17D7A460
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I am trying to upgrade the hplip version of meta-openembedded.

 

Currently, the hplip version of meta-openembedded is version 3.12.6.

I am going to upgrade my recipe to 3.18.6.

 

However, in the do_install step, the following error occurs.

 

Initialising tasks: 100%
|###########################################################################
############################################################################
############| Time: 0:00:01

NOTE: Executing SetScene Tasks

NOTE: Executing RunQueue Tasks

ERROR: hplip-3.18.6-r1 do_install: oe_runmake failed

ERROR: hplip-3.18.6-r1 do_install: Function failed: do_install (log file is
located at
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/temp/log.do_install.16858)

ERROR: Logfile of failure stored in:
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/temp/log.do_install.16858

Log data follows:

| DEBUG: Executing python function extend_recipe_sysroot

| NOTE: Direct dependencies are
['/home/tykwon/yocto/poky/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb:do_po
pulate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/python/python-native_2.7.13.b
b:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-extended/cups/cups_2.2.4.bb:do_populat
e_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do
_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-support/libusb/libusb-compat_0.1.5.bb:
do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/python/python_2.7.13.bb:do_po
pulate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.
bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/pseudo/pseudo_
1.8.2.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/autoconf/autoc
onf_2.69.bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_s
ysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.b
b:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/pkgconfig/pkgc
onfig_git.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/gnu-config/gnu
-config_git.bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/gcc/gcc-cross_7.2.bb:do_popul
ate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/automake/autom
ake_1.15.1.bb:do_populate_sysroot']

| NOTE: Installed into sysroot: []

| NOTE: Skipping as already exists in sysroot: ['gcc-runtime',
'python-native', 'cups', 'quilt-native', 'libusb-compat', 'python',
'libtool-native', 'pseudo-native', 'autoconf-native', 'glibc',
'libtool-cross', 'pkgconfig-native', 'gnu-config-native', 'gcc-cross-arm',
'automake-native', 'libgcc', 'linux-libc-headers', 'xz-native',
'openssl-native', 'zlib-native', 'bzip2-native', 'expat-native',
'readline-native', 'sqlite3-native', 'shadow-native', 'shadow', 'avahi',
'base-files', 'libjpeg-turbo', 'dbus', 'shadow-sysroot', 'zlib',
'dbus-glib', 'base-passwd', 'libpng', 'systemd', 'gnutls', 'db', 'bzip2',
'readline', 'libffi', 'sqlite3', 'gdbm', 'openssl', 'binutils-cross-arm',
'texinfo-dummy-native', 'libusb1', 'm4-native', 'libmpc-native',
'gmp-native', 'mpfr-native', 'gettext-minimal-native',
'cryptodev-linux-native', 'makedepend-native', 'pigz-native',
'ncurses-native', 'attr', 'opkg-utils', 'glib-2.0', 'libdaemon',
'gobject-introspection', 'libcap', 'expat', 'libsm', 'libx11',
'bash-completion', 'libxkbcommon', 'acl', 'xz', 'util-linux', 'libcgroup',
'kmod', 'gmp', 'nettle', 'libunistring', 'libidn', 'ncurses',
'cryptodev-linux', 'bison-native', 'flex-native', 'xproto-native',
'util-macros-native', 'libpcre', 'python3', 'libice', 'util-macros',
'xproto', 'xtrans', 'xextproto', 'kbproto', 'inputproto', 'libxcb',
'xkeyboard-config', 'xcb-proto', 'libpthread-stubs', 'libxau', 'libxdmcp']

| DEBUG: Python function extend_recipe_sysroot finished

| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']

| DEBUG: Executing shell function do_install

| NOTE: make -j 4
DESTDIR=/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hp
lip/3.18.6-r1/image install

| make[1]: Entering directory
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/hplip-3.18.6'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/cups/drv/hp'

|  ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c   libhpmud.la libhpip.la
libhpipp.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/drv/hpcups.drv
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/cups/drv/hp'

|  ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c   cupsext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|   ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c dat2drv
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpmud.so.0.0.6
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpmud.so.0.0.6

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpmud.so.0.0.6 libhpmud.so.0 || { rm -f
libhpmud.so.0 && ln -s libhpmud.so.0.0.6 libhpmud.so.0; }; })

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpmud.so.0.0.6 libhpmud.so || { rm -f
libhpmud.so && ln -s libhpmud.so.0.0.6 libhpmud.so; }; })

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/base'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpmud.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpmud.la

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpip.so.0.0.1
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpip.so.0.0.1

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpip.so.0.0.1 libhpip.so.0 || { rm -f
libhpip.so.0 && ln -s libhpip.so.0.0.1 libhpip.so.0; }; })

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpip.so.0.0.1 libhpip.so || { rm -f
libhpip.so && ln -s libhpip.so.0.0.1 libhpip.so; }; })

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpip.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpip.la

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/cupsext.so
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/cupsext.so

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpipp.so.0.0.1
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpipp.so.0.0.1

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpipp.so.0.0.1 libhpipp.so.0 || { rm -f
libhpipp.so.0 && ln -s libhpipp.so.0.0.1 libhpipp.so.0; }; })

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/cupsext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/cupsext.la

| arm-poky-linux-gnueabi-libtool: install: (cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib && { ln -s -f libhpipp.so.0.0.1 libhpipp.so || { rm -f
libhpipp.so && ln -s libhpipp.so.0.0.1 libhpipp.so; }; })

| arm-poky-linux-gnueabi-libtool: warning: remember to run
'arm-poky-linux-gnueabi-libtool --finish /usr/lib/python2.7/site-packages'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 base/maint.py
base/codes.py base/g.py base/pml.py base/status.py base/__init__.py
base/mfpdtf.py base/utils.py base/wifi.py base/LedmWifi.py base/device.py
base/logger.py base/slp.py base/exif.py base/strings.py base/magic.py
base/imagesize.py base/models.py base/validation.py base/sixext.py
base/avahi.py base/mdns.py base/tui.py base/dime.py base/ldif.py
base/vcard.py base/module.py base/pkit.py base/queues.py base/password.py
base/services.py base/os_utils.py base/smart_install.py base/six.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/base'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpipp.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/libhpipp.la

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/base/pexpect'

| arm-poky-linux-gnueabi-libtool: warning: remember to run
'arm-poky-linux-gnueabi-libtool --finish /usr/lib'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
base/pexpect/__init__.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/base/pexpect'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/copier'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 copier/copier.py
copier/__init__.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/copier'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c align.py info.py
print.py toolbox.py clean.py colorcal.py unload.py testpage.py makeuri.py
check.py fab.py levels.py sendfax.py setup.py makecopies.py probe.py
timedate.py firmware.py scan.py systray.py plugin.py linefeedcal.py
pqdiag.py faxsetup.py devicesettings.py printsettings.py query.py
pkservice.py wificonfig.py diagnose_plugin.py uninstall.py upgrade.py
config_usb_printer.py diagnose_queues.py logcapture.py doctor.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c dat2drv
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/share/hplip/dat2drv

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hal/fdi/preprobe/10osvendor'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 check-plugin.py
hplip_clean.sh
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c prnt/filters/hpps
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/rules/20-hplip-devices.fdi
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hal/fdi/preprobe/10osvendor'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c hpssd.py __init__.py
hpdio.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/installer'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/ldl'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/localization'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/ldl/cb2pcal.ldl.gz data/ldl/cb2pcal_done.ldl.gz data/ldl/cbbcal.ldl.gz
data/ldl/cbccal.ldl.gz data/ldl/cbccal_done.ldl.gz data/ldl/cbcpcal.ldl.gz
data/ldl/cbpcal.ldl.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/ldl'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
installer/__init__.py installer/dcheck.py installer/distros.dat
installer/core_install.py installer/pluginhandler.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/installer'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/localization/hplip_de.qm data/localization/hplip_es.qm
data/localization/hplip_fr.qm data/localization/hplip_it.qm
data/localization/hplip_pt.qm data/localization/hplip_ru.qm
data/localization/hplip_zh.qm
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/localization'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/models'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/pcard'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/models/models.dat
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/models'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/pcl'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
pcard/__init__.py pcard/photocard.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/pcard'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/pcl/align1_8xx.pcl.gz data/pcl/align1_9xx.pcl.gz
data/pcl/align2_8xx.pcl.gz data/pcl/align3_8xx.pcl.gz
data/pcl/align4_8xx.pcl.gz data/pcl/align5_8xx.pcl.gz
data/pcl/align2_9xx.pcl.gz data/pcl/align3_9xx.pcl.gz
data/pcl/align4_450.pcl.gz data/pcl/align6_450.pcl.gz
data/pcl/colorcal1_450.pcl.gz data/pcl/colorcal2_450.pcl.gz
data/pcl/crbcal.pcl.gz data/pcl/crcaldone.pcl.gz data/pcl/crcbcal.pcl.gz
data/pcl/crccal.pcl.gz data/pcl/crcpcal.pcl.gz data/pcl/crpcal.pcl.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/pcl'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/ps'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/ps/testpage.ps.gz data/ps/clean_page.pdf.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/data/ps'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/prnt'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/etc/udev/rules.d'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 prnt/cups.py
prnt/__init__.py prnt/ldl.py prnt/pcl.py prnt/colorcal.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip/prnt'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c
prnt/hpijs/foomatic-rip-hplip
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/rules/56-hpmud.rules
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/etc/udev/rules.d'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/systemd/system'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_pro_m701-ps.ppd.gz
prnt/ps/hp-laserjet_5000_series-ps.ppd.gz
prnt/ps/hp-officejet_pro_451_series-ps.ppd.gz
prnt/ps/hp-laserjet_5si_mopier-ps.ppd.gz
prnt/ps/hp-designjet_t1120ps_44in-ps.ppd.gz
prnt/ps/hp-pagewide_color_e77650-e77660-ps.ppd.gz
prnt/ps/hp-laserjet_m506-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp1514n-ps.ppd.gz
prnt/ps/hp-laserjet_m3035_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_flow_mfp_m680-ps.ppd.gz
prnt/ps/hp-designjet_t1100ps_44in-ps.ppd.gz
prnt/ps/hp-designjet_t7100ps_monochrome-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp4520_series-ps.ppd.gz
prnt/ps/hp-designjet_z6200_60in_photo-ps.ppd.gz
prnt/ps/hp-business_inkjet_2250-ps.ppd.gz prnt/ps/hp-designjet_4500ps.ppd.gz
prnt/ps/hp-officejet_pro_8732-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320n_mfp-ps.ppd.gz
prnt/ps/hp-designjet_t790ps_24in-ps.ppd.gz
prnt/ps/hp-color_laserjet_2700n-ps.ppd.gz
prnt/ps/hp-color_laserjet_3700-ps.ppd.gz
prnt/ps/hp-designjet_z6100ps_42in_photo-ps.ppd.gz
prnt/ps/hp-laserjet_m5025_mfp-ps.ppd.gz
prnt/ps/hp-postscript-laserjet-pro.ppd.gz
prnt/ps/hp-designjet_t1500-postscript.ppd.gz
prnt/ps/hp-business_inkjet_3000-ps.ppd.gz
prnt/ps/hp-designjet_t1700dr_postscript-ps.ppd.gz
prnt/ps/hp-color_laserjet_m452d-ps.ppd.gz
prnt/ps/hp-laserjet_e60055-e60075-ps.ppd.gz
prnt/ps/hp-laserjet_1200-ps.ppd.gz
prnt/ps/hp-cm8050_mfp_with_edgeline-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m725-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz
prnt/ps/hp-laserjet_p2015_series-ps.ppd.gz
prnt/ps/hp-pagewide_p75050-60-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m277-ps.ppd.gz
prnt/ps/hp-color_laserjet_2800-ps.ppd.gz
prnt/ps/hp-laserjet_100_color_mfp_m175-ps.ppd.gz
prnt/ps/hp-laserjet_m1522n_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_P75250-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/rules/hplip-printer@.service
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/systemd/system'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/doc/hplip-3.18.6'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/backend'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 COPYING
copyright prnt/hpijs/README_LIBJPG
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/doc/hplip-3.18.6'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-designjet_t7100ps-ps.ppd.gz
prnt/ps/hp-laserjet_2100_series-ps.ppd.gz prnt/ps/hp-laserjet_4200-ps.ppd.gz
prnt/ps/hp-laserjet_m1522nf_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_6000ps-ps.ppd.gz
prnt/ps/hp-color_laserjet_3000-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp1515n-ps.ppd.gz
prnt/ps/hp-laserjet_flow_mfp_m630-ps.ppd.gz
prnt/ps/hp-laserjet_p3004-ps.ppd.gz
prnt/ps/hp-pagewide_xl_8000ps_blueprinter-ps.ppd.gz
prnt/ps/hp-laserjet_m4345_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_m9059_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_m551-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025x-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp4005-ps.ppd.gz
prnt/ps/hp-laserjet_3050-ps.ppd.gz prnt/ps/hp-laserjet_5200-ps.ppd.gz
prnt/ps/hp-designjet_4500mfp.ppd.gz prnt/ps/hp-color_laserjet_m651-ps.ppd.gz
prnt/ps/hp-laserjet_m4349_mfp-ps.ppd.gz
prnt/ps/hp-business_inkjet_2600-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5520_series-ps.ppd.gz
prnt/ps/hp-laserjet_4mp-ps.ppd.gz
prnt/ps/hp-designjet_t770_postscript-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5000ps_blueprinter-ps.ppd.gz
prnt/ps/hp-designjet_t7200-ps.ppd.gz
prnt/ps/hp-color_laserjet_9500_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_mfp_m575-ps.ppd.gz
prnt/ps/hp-laserjet_4si-ps.ppd.gz prnt/ps/hp-color_laserjet_m855-ps.ppd.gz
prnt/ps/hp-laserjet_1320-ps.ppd.gz
prnt/ps/hp-designjet_z6810ps_42in-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1312nfi_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_8550-ps.ppd.gz
prnt/ps/hp-cm8060_mfp_with_edgeline-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605dn-ps.ppd.gz
prnt/ps/hp-color_laserjet_flow_mfp_m880-ps.ppd.gz
prnt/ps/hp-officejet_color_mfp_x585.ppd.gz
prnt/ps/hp-officejet_pro_551_series-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m201_m202-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|   ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c hp
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/backend'

|   ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c hpcups
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/etc/hp'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 hplip.conf
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/etc/hp'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-pagewide_xl_5000ps-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp6015-ps.ppd.gz
prnt/ps/hp-laserjet_m1522_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_2550_series-ps.ppd.gz
prnt/ps/hp-laserjet_1300n-ps.ppd.gz prnt/ps/hp-laserjet_2300-ps.ppd.gz
prnt/ps/hp-designjet_t3500-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1312_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3390-ps.ppd.gz prnt/ps/hp-laserjet_4-ps.ppd.gz
prnt/ps/hp-pagewide_color_e55650-ps.ppd.gz
prnt/ps/hp-color_laserjet_m153-m154-ps.ppd.gz
prnt/ps/hp-laserjet_1300xi-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp4020_series-ps.ppd.gz
prnt/ps/hp-pagewide_color_556-ps.ppd.gz
prnt/ps/hp-pagewide_352_printer-ps.ppd.gz
prnt/ps/hp-laserjet_700_m712-ps.ppd.gz
prnt/ps/hp-laserjet_4050_series-ps.ppd.gz
prnt/ps/hp-designjet_t1300_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_flow_mfp_m525-ps.ppd.gz
prnt/ps/hp-pagewide_color_e75160-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m681_m682-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_400_m401dne-ps.ppd.gz
prnt/ps/hp-color_laserjet_e65050_e65060-ps.ppd.gz
prnt/ps/hp-designjet_4520ps-ps.ppd.gz
prnt/ps/hp-laserjet_flow_mfp_m830-ps.ppd.gz
prnt/ps/hp-color_laserjet_4500-ps.ppd.gz
prnt/ps/hp-laserjet_8100_series-ps.ppd.gz
prnt/ps/hp-pagewide_pro_552_printer-ps.ppd.gz
prnt/ps/hp-laserjet_500_mfp_m525-ps.ppd.gz
prnt/ps/hp-laserjet_3030-ps.ppd.gz prnt/ps/hp-business_inkjet_2800-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m501dn-ps.ppd.gz prnt/ps/hp-laserjet_6mp-ps.ppd.gz
prnt/ps/hp-pagewide_pro_452_printer-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4500ps_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_765-ps.ppd.gz
prnt/ps/hp-color_laserjet_m552-ps.ppd.gz prnt/ps/hp-color_laserjet-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

| arm-poky-linux-gnueabi-libtool: warning: 'libhpmud.la' has not been
installed in '/usr/lib'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_5p-ps.ppd.gz prnt/ps/hp-officejet_pro_8740-ps.ppd.gz
prnt/ps/hp-color_laserjet_2840-ps.ppd.gz
prnt/ps/hp-laserjet_9050_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025dn-ps.ppd.gz
prnt/ps/hp-laserjet_5100_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_m452-ps.ppd.gz prnt/ps/hp-laserjet_4350-ps.ppd.gz
prnt/ps/hp-pagewide_xl_6000ps_mfp-ps.ppd.gz
prnt/ps/hp-designjet_t1700_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_4300-ps.ppd.gz prnt/ps/hp-laserjet_9000_series-ps.ppd.gz
prnt/ps/hp-officejet_pro_8210-ps.ppd.gz
prnt/ps/hp-designjet_z6810ps_60in-ps.ppd.gz
prnt/ps/hp-laserjet_3052-ps.ppd.gz
prnt/ps/hp-designjet_t920-postscript.ppd.gz
prnt/ps/hp-officejet_pro_8730-ps.ppd.gz prnt/ps/hp-laserjet_p3005-ps.ppd.gz
prnt/ps/hp-laserjet_1300-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_e58650-ps.ppd.gz
prnt/ps/hp-mopier_240-ps.ppd.gz prnt/ps/hp-color_laserjet_4650-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m577-ps.ppd.gz
prnt/ps/hp-color_laserjet_e67550_e67560-ps.ppd.gz
prnt/ps/hp-color_laserjet_3700n-ps.ppd.gz
prnt/ps/hp-postscript-inkjet.ppd.gz prnt/ps/hp-laserjet_3200m-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m527-ps.ppd.gz
prnt/ps/hp-color_laserjet_9500-ps.ppd.gz
prnt/ps/hp-pagewide_pro_750-ps.ppd.gz
prnt/ps/hp-laserjet_400_mfp_m425-ps.ppd.gz prnt/ps/hp-laserjet_5mp-ps.ppd.gz
prnt/ps/hp-laserjet_m607_m608_m609-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6030_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3380-ps.ppd.gz prnt/ps/hp-laserjet_4000_series-ps.ppd.gz
prnt/ps/hp-laserjet_5200lx-ps.ppd.gz
prnt/ps/hp-color_laserjet_2820-ps.ppd.gz
prnt/ps/hp-designjet_t2500-postscript.ppd.gz
prnt/ps/hp-laserjet_pro_m501n-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

|  ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c   hpmudext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hp
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/cups/backend/hp

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_m9050_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm4540_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e87640-50-60-ps.ppd.gz
prnt/ps/hp-pagewide_pro_577_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_flow_mfp_586-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6049_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_p3010_series-ps.ppd.gz
prnt/ps/hp-officejet_color_x555-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4500ps-ps.ppd.gz
prnt/ps/hp-laserjet_9065mfp-ps.ppd.gz
prnt/ps/hp-pagewide_mfp_p57750-ps.ppd.gz
prnt/ps/hp-color_laserjet_m553-ps.ppd.gz
prnt/ps/hp-designjet_t1100ps_24in-ps.ppd.gz
prnt/ps/hp-officejet_pro_276dw_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_780-785-ps.ppd.gz
prnt/ps/hp-color_laserjet_4600-ps.ppd.gz prnt/ps/hp-laserjet_5si-ps.ppd.gz
prnt/ps/hp-color_laserjet_2700-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e77822-25-30-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m630-ps.ppd.gz prnt/ps/hp-designjet_4020ps-ps.ppd.gz
prnt/ps/hp-officejet_pro_476_576_series-ps.ppd.gz
prnt/ps/hp-designjet_z5600_postscript-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6040_mfp-ps.ppd.gz
prnt/ps/hp-designjet_z6800_photo-postscript.ppd.gz
prnt/ps/hp-pagewide_p55250-ps.ppd.gz prnt/ps/hp-laserjet_1220se-ps.ppd.gz
prnt/ps/hp-color_laserjet_2830-ps.ppd.gz prnt/ps/hp-laserjet_5000-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m476-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m426_m427-ps.ppd.gz
prnt/ps/hp-laserjet_cm1410_series-ps.ppd.gz
prnt/ps/hp-laserjet_1320tn-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e72525-25-30-35-ps.ppd.gz
prnt/ps/hp-designjet_z6200_42in_photo-ps.ppd.gz
prnt/ps/hp-lj_300_400_color_mfp_m375_m475-ps.ppd.gz
prnt/ps/hp-business_inkjet_2280-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5225dn-ps.ppd.gz
prnt/ps/hp-designjet_t2300_postscript-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|   ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c hpps
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c hpcups
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/cups/filter/hpcups

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-color_laserjet_4730mfp-ps.ppd.gz
prnt/ps/hp-designjet_z6600-postscript.ppd.gz
prnt/ps/hp-laserjet_pro_m402_m403d-ps.ppd.gz
prnt/ps/hp-laserjet_4250-ps.ppd.gz prnt/ps/hp-laserjet_4240-ps.ppd.gz
prnt/ps/hp-designjet_t795ps_44in-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1015-ps.ppd.gz
prnt/ps/hp-laserjet_8000-ps.ppd.gz prnt/ps/hp-designjet_4000ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1017-ps.ppd.gz
prnt/ps/hp-laserjet_m5035_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_m252-ps.ppd.gz
prnt/ps/hp-laserjet_2200-ps.ppd.gz
prnt/ps/hp-officejet_pro_8000_enterprise_a811a-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_mfp_m570-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m377-ps.ppd.gz
prnt/ps/hp-color_laserjet_4550-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320nf_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3020-ps.ppd.gz prnt/ps/hp-color_laserjet_5500-ps.ppd.gz
prnt/ps/hp-laserjet_m2727_mfp_series-ps.ppd.gz
prnt/ps/hp-designjet_t1120ps_24in-ps.ppd.gz
prnt/ps/hp-lj_300_400_color_m351_m451-ps.ppd.gz
prnt/ps/hp-color_laserjet_m652_m653-ps.ppd.gz
prnt/ps/hp-laserjet_200_colormfp_m275-ps.ppd.gz
prnt/ps/hp-laserjet_1320nw-ps.ppd.gz
prnt/ps/hp-color_laserjet_4700-ps.ppd.gz
prnt/ps/hp-designjet_z6610ps_60in-ps.ppd.gz
prnt/ps/hp-laserjet_3015-ps.ppd.gz prnt/ps/hp-laserjet_4ml-ps.ppd.gz
prnt/ps/hp-laserjet_4_plus-ps.ppd.gz prnt/ps/hp-laserjet_m3027_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_9055mfp-ps.ppd.gz
prnt/ps/hp-laserjet_m1530_mfp_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_4610-ps.ppd.gz
prnt/ps/hp-laserjet_p4010_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025n-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4000ps_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_P77440_P77940-60-ps.ppd.gz
prnt/ps/hp-business_inkjet_2300-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hpmudext.so
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/hpmudext.so

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hpmudext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/hpmudext.la

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_1200n-ps.ppd.gz prnt/ps/hp-laserjet_8100_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m203_m206-ps.ppd.gz
prnt/ps/hp-designjet_z2600_postscript-ps.ppd.gz
prnt/ps/hp-designjet_z5400-postscript.ppd.gz
prnt/ps/hp-laserjet_4345_mfp-ps.ppd.gz
prnt/ps/hp-officejet_pro_251dw_printer-ps.ppd.gz
prnt/ps/hp-laserjet_e62555-e62575-ps.ppd.gz
prnt/ps/hp-laserjet_3300_3310_3320-ps.ppd.gz
prnt/ps/hp-laserjet_2200_series-ps.ppd.gz
prnt/ps/hp-laserjet_pro_mfp_m227-m231-ps.ppd.gz
prnt/ps/hp-laserjet_6p-ps.ppd.gz prnt/ps/hp-laserjet_1220-ps.ppd.gz
prnt/ps/hp-designjet_t790ps_44in-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m178-m181-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e82540-50-60-ps.ppd.gz
prnt/ps/hp-color_laserjet_2500_series-ps.ppd.gz
prnt/ps/hp-laserjet_9040_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_pro_mfp_772-777-ps.ppd.gz
prnt/ps/hp-laserjet_1320_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_2500-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m278-m281-ps.ppd.gz
prnt/ps/hp-laserjet_400_m401-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp3505-ps.ppd.gz
prnt/ps/hp-laserjet_600_m601_m602_m603-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320fxi_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4000ps-ps.ppd.gz
prnt/ps/hp-color_laserjet_5550-ps.ppd.gz
prnt/ps/hp-designjet_4520mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5225n-ps.ppd.gz
prnt/ps/hp-laserjet_1320n-ps.ppd.gz prnt/ps/hp-laserjet_2420-ps.ppd.gz
prnt/ps/hp-designjet_d5800-ps.ppd.gz prnt/ps/hp-color_laserjet_5m-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605dtn-ps.ppd.gz
prnt/ps/hp-color_laserjet_4600_series-ps.ppd.gz
prnt/ps/hp-laserjet_m604_m605_m606-ps.ppd.gz
prnt/ps/hp-laserjet_200_color_m251-ps.ppd.gz
prnt/ps/hp-laserjet_2300_series-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|   ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c locatedriver
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/hplip'

| arm-poky-linux-gnueabi-libtool: warning: remember to run
'arm-poky-linux-gnueabi-libtool --finish /usr/lib/python2.7/site-packages'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c hpps
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/cups/filter/hpps

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

|  ./arm-poky-linux-gnueabi-libtool   --mode=install
/home/tykwon/yocto/build/tmp/hosttools/install -c   pcardext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/python2.7/site-packages'

|  /home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-color_laserjet_cm4730_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_377_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025-ps.ppd.gz
prnt/ps/hp-pagewide_xl_8000ps-ps.ppd.gz
prnt/ps/hp-laserjet_200_colormfp_m276-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp3525-ps.ppd.gz
prnt/ps/hp-laserjet_pro_mfp_m435-ps.ppd.gz
prnt/ps/hp-pagewide_mfp_p77740-60zs-ps.ppd.gz
prnt/ps/hp-laserjet_p2055_series-ps.ppd.gz
prnt/ps/hp-laserjet_cp1520_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_3800-ps.ppd.gz
prnt/ps/hp-designjet_t1200_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_m4555_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_8500-ps.ppd.gz prnt/ps/hp-laserjet_9040-ps.ppd.gz
prnt/ps/hp-laserjet_2410-ps.ppd.gz prnt/ps/hp-laserjet_m9040_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_2430-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5225-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m521-ps.ppd.gz
prnt/ps/hp-color_laserjet_m253-m254-ps.ppd.gz
prnt/ps/hp-mopier_320-ps.ppd.gz
prnt/ps/hp-laserjet_color_flow_mfp_m575-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m706-ps.ppd.gz prnt/ps/hp-laserjet_m806-ps.ppd.gz
prnt/ps/hp-postscript-laserjet.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m477d-ps.ppd.gz
prnt/ps/hp-designjet_z6100ps_60in_photo-ps.ppd.gz
prnt/ps/hp-designjet_t770ps_24in-ps.ppd.gz
prnt/ps/hp-pagewide_pro_477_mfp-ps.ppd.gz
prnt/ps/hp-designjet_z5200_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_2100-ps.ppd.gz prnt/ps/hp-laserjet_9000_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m274-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m402_m403-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m680-ps.ppd.gz
prnt/ps/hp-laserjet_4100_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm3530_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps_mfp_blueprinter-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_586-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_8150_mfp-ps.ppd.gz prnt/ps/hp-laserjet_5200l-ps.ppd.gz
prnt/ps/hp-laserjet_4v-ps.ppd.gz
prnt/ps/hp-laserjet_pro_mfp_m225_m226-ps.ppd.gz
prnt/ps/hp-laserjet_4100_series-ps.ppd.gz prnt/ps/hp-laserjet_9050-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605-ps.ppd.gz
prnt/ps/hp-laserjet_700_color_mfp_m775-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5000ps_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m631_m632_m633-ps.ppd.gz
prnt/ps/hp-laserjet_8000_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp1518ni-ps.ppd.gz
prnt/ps/hp-color_laserjet_m750-ps.ppd.gz ppd/hpcups/apollo-2100.ppd.gz
ppd/hpcups/apollo-2150.ppd.gz ppd/hpcups/apollo-2200.ppd.gz
ppd/hpcups/apollo-2500.ppd.gz ppd/hpcups/apollo-2600.ppd.gz
ppd/hpcups/apollo-2650.ppd.gz ppd/hpcups/apollo-p2000-u.ppd.gz
ppd/hpcups/apollo-p2250.ppd.gz ppd/hpcups/hp-2000c.ppd.gz
ppd/hpcups/hp-2500c.ppd.gz ppd/hpcups/hp-910.ppd.gz ppd/hpcups/hp-915.ppd.gz
ppd/hpcups/hp-amp.ppd.gz ppd/hpcups/hp-business_inkjet_1000.ppd.gz
ppd/hpcups/hp-business_inkjet_1100.ppd.gz
ppd/hpcups/hp-business_inkjet_1200.ppd.gz
ppd/hpcups/hp-business_inkjet_2200.ppd.gz
ppd/hpcups/hp-business_inkjet_2230.ppd.gz
ppd/hpcups/hp-business_inkjet_2250-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2280-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2300-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2600-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2800-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_3000-pcl3.ppd.gz
ppd/hpcups/hp-color_inkjet_cp1700.ppd.gz
ppd/hpcups/hp-color_inkjet_printer_cp1700.ppd.gz
ppd/hpcups/hp-color_laserjet_1600.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c fax/filters/pstotiff
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/lib/cups/filter'

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c locatedriver
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/share/hplip/locatedriver

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/pcardext.so
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/pcardext.so

| arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/pcardext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/image/usr/lib/python2.7/site-packages/pcardext.la

| arm-poky-linux-gnueabi-libtool: warning: remember to run
'arm-poky-linux-gnueabi-libtool --finish /usr/lib/python2.7/site-packages'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-color_laserjet_2500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_2500_series.ppd.gz
ppd/hpcups/hp-color_laserjet_2600n.ppd.gz
ppd/hpcups/hp-color_laserjet_3000-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_3500n.ppd.gz
ppd/hpcups/hp-color_laserjet_3500.ppd.gz
ppd/hpcups/hp-color_laserjet_3550n.ppd.gz
ppd/hpcups/hp-color_laserjet_3550.ppd.gz
ppd/hpcups/hp-color_laserjet_3600.ppd.gz
ppd/hpcups/hp-color_laserjet_3700n.ppd.gz
ppd/hpcups/hp-color_laserjet_3700-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_3800-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4600-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4600_series.ppd.gz
ppd/hpcups/hp-color_laserjet_4610-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4650-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4700-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4730mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5m-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5.ppd.gz
ppd/hpcups/hp-color_laserjet_8500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_8550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_9500_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_9500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm1312_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm1312nfi_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320fxi_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320nf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320n_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm3530_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm4540_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm4730_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm6030_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm6040_mfp.ppd.gz
ppd/hpcups/hp-color_laserjet_cm6049_mfp.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-color_laserjet_cp1215.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1217.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1514n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1515n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1518ni-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025dn-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025x-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp3505-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp3525-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4005-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4020_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4520_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225dn-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5520_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp6015-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_pro_mfp_m176n.ppd.gz
ppd/hpcups/hp-color_laserjet_pro_mfp_m177fw.ppd.gz
ppd/hpcups/hp-cp1160.ppd.gz ppd/hpcups/hp-deskjet_1000_j110_series.ppd.gz
ppd/hpcups/hp-deskjet_1010_series.ppd.gz
ppd/hpcups/hp-deskjet_1050_j410_series.ppd.gz
ppd/hpcups/hp-deskjet_1100.ppd.gz ppd/hpcups/hp-deskjet_1110_series.ppd.gz
ppd/hpcups/hp-deskjet_1120.ppd.gz ppd/hpcups/hp-deskjet_1125.ppd.gz
ppd/hpcups/hp-deskjet_1200c.ppd.gz ppd/hpcups/hp-deskjet_1220c.ppd.gz
ppd/hpcups/hp-deskjet_1280.ppd.gz ppd/hpcups/hp-deskjet_1510_series.ppd.gz
ppd/hpcups/hp-deskjet_1600cm.ppd.gz ppd/hpcups/hp-deskjet_1600cn.ppd.gz
ppd/hpcups/hp-deskjet_1600c.ppd.gz
ppd/hpcups/hp-deskjet_2000_j210_series.ppd.gz
ppd/hpcups/hp-deskjet_2020_series.ppd.gz
ppd/hpcups/hp-deskjet_2050_j510_series.ppd.gz
ppd/hpcups/hp-deskjet_2130_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_2200_series.ppd.gz
ppd/hpcups/hp-deskjet_2510_series.ppd.gz
ppd/hpcups/hp-deskjet_2520_series.ppd.gz
ppd/hpcups/hp-deskjet_2540_series.ppd.gz
ppd/hpcups/hp-deskjet_2600_series.ppd.gz
ppd/hpcups/hp-deskjet_2640_series.ppd.gz
ppd/hpcups/hp-deskjet_3000_j310_series.ppd.gz
ppd/hpcups/hp-deskjet_3050a_j611_series.ppd.gz
ppd/hpcups/hp-deskjet_3050_j610_series.ppd.gz
ppd/hpcups/hp-deskjet_3070_b611_series.ppd.gz
ppd/hpcups/hp-deskjet_3320.ppd.gz ppd/hpcups/hp-deskjet_3325.ppd.gz
ppd/hpcups/hp-deskjet_3420.ppd.gz ppd/hpcups/hp-deskjet_3425.ppd.gz
ppd/hpcups/hp-deskjet_3450.ppd.gz ppd/hpcups/hp-deskjet_3500.ppd.gz
ppd/hpcups/hp-deskjet_3510_series.ppd.gz
ppd/hpcups/hp-deskjet_3520_series.ppd.gz
ppd/hpcups/hp-deskjet_3540_series.ppd.gz ppd/hpcups/hp-deskjet_3550.ppd.gz
ppd/hpcups/hp-deskjet_3600.ppd.gz ppd/hpcups/hp-deskjet_3630_series.ppd.gz
ppd/hpcups/hp-deskjet_3650.ppd.gz ppd/hpcups/hp-deskjet_3700_series.ppd.gz
ppd/hpcups/hp-deskjet_3740.ppd.gz ppd/hpcups/hp-deskjet_3810.ppd.gz
ppd/hpcups/hp-deskjet_3816.ppd.gz ppd/hpcups/hp-deskjet_3819.ppd.gz
ppd/hpcups/hp-deskjet_3820.ppd.gz ppd/hpcups/hp-deskjet_3822.ppd.gz
ppd/hpcups/hp-deskjet_3830_series.ppd.gz ppd/hpcups/hp-deskjet_3840.ppd.gz
ppd/hpcups/hp-deskjet_3870.ppd.gz ppd/hpcups/hp-deskjet_3900.ppd.gz
ppd/hpcups/hp-deskjet_3910.ppd.gz ppd/hpcups/hp-deskjet_3920.ppd.gz
ppd/hpcups/hp-deskjet_3940.ppd.gz ppd/hpcups/hp-deskjet_400l.ppd.gz
ppd/hpcups/hp-deskjet_400.ppd.gz ppd/hpcups/hp-deskjet_4510_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_4530_series.ppd.gz ppd/hpcups/hp-deskjet_460.ppd.gz
ppd/hpcups/hp-deskjet_4610_series.ppd.gz
ppd/hpcups/hp-deskjet_4620_series.ppd.gz
ppd/hpcups/hp-deskjet_4640_series.ppd.gz
ppd/hpcups/hp-deskjet_4670_series.ppd.gz
ppd/hpcups/hp-deskjet_4720_series.ppd.gz
ppd/hpcups/hp-deskjet_5000_series.ppd.gz ppd/hpcups/hp-deskjet_500c.ppd.gz
ppd/hpcups/hp-deskjet_500.ppd.gz ppd/hpcups/hp-deskjet_505j.ppd.gz
ppd/hpcups/hp-deskjet_5100.ppd.gz ppd/hpcups/hp-deskjet_510.ppd.gz
ppd/hpcups/hp-deskjet_5200_series.ppd.gz ppd/hpcups/hp-deskjet_520.ppd.gz
ppd/hpcups/hp-deskjet_5400_series.ppd.gz ppd/hpcups/hp-deskjet_540.ppd.gz
ppd/hpcups/hp-deskjet_550c.ppd.gz ppd/hpcups/hp-deskjet_5520_series.ppd.gz
ppd/hpcups/hp-deskjet_5550.ppd.gz ppd/hpcups/hp-deskjet_5551.ppd.gz
ppd/hpcups/hp-deskjet_5552.ppd.gz ppd/hpcups/hp-deskjet_5570_series.ppd.gz
ppd/hpcups/hp-deskjet_5600.ppd.gz ppd/hpcups/hp-deskjet_5640_series.ppd.gz
ppd/hpcups/hp-deskjet_5650.ppd.gz ppd/hpcups/hp-deskjet_5652.ppd.gz
ppd/hpcups/hp-deskjet_5700.ppd.gz ppd/hpcups/hp-deskjet_5730_series.ppd.gz
ppd/hpcups/hp-deskjet_5800.ppd.gz ppd/hpcups/hp-deskjet_5810_series.ppd.gz
ppd/hpcups/hp-deskjet_5820_series.ppd.gz ppd/hpcups/hp-deskjet_5850.ppd.gz
ppd/hpcups/hp-deskjet_5900_series.ppd.gz ppd/hpcups/hp-deskjet_600.ppd.gz
ppd/hpcups/hp-deskjet_610cl.ppd.gz ppd/hpcups/hp-deskjet_610c.ppd.gz
ppd/hpcups/hp-deskjet_6120.ppd.gz ppd/hpcups/hp-deskjet_6122.ppd.gz
ppd/hpcups/hp-deskjet_6127.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_612c.ppd.gz ppd/hpcups/hp-deskjet_630c.ppd.gz
ppd/hpcups/hp-deskjet_632c.ppd.gz ppd/hpcups/hp-deskjet_640c.ppd.gz
ppd/hpcups/hp-deskjet_648c.ppd.gz ppd/hpcups/hp-deskjet_6500.ppd.gz
ppd/hpcups/hp-deskjet_6520_series.ppd.gz ppd/hpcups/hp-deskjet_656c.ppd.gz
ppd/hpcups/hp-deskjet_6600.ppd.gz ppd/hpcups/hp-deskjet_660.ppd.gz
ppd/hpcups/hp-deskjet_670c.ppd.gz ppd/hpcups/hp-deskjet_670.ppd.gz
ppd/hpcups/hp-deskjet_670tv.ppd.gz ppd/hpcups/hp-deskjet_672c.ppd.gz
ppd/hpcups/hp-deskjet_6800.ppd.gz ppd/hpcups/hp-deskjet_680.ppd.gz
ppd/hpcups/hp-deskjet_682.ppd.gz ppd/hpcups/hp-deskjet_690c.ppd.gz
ppd/hpcups/hp-deskjet_690.ppd.gz ppd/hpcups/hp-deskjet_692.ppd.gz
ppd/hpcups/hp-deskjet_693.ppd.gz ppd/hpcups/hp-deskjet_6940_series.ppd.gz
ppd/hpcups/hp-deskjet_694.ppd.gz ppd/hpcups/hp-deskjet_695.ppd.gz
ppd/hpcups/hp-deskjet_697.ppd.gz ppd/hpcups/hp-deskjet_6980_series.ppd.gz
ppd/hpcups/hp-deskjet_810c.ppd.gz ppd/hpcups/hp-deskjet_812c.ppd.gz
ppd/hpcups/hp-deskjet_815c.ppd.gz ppd/hpcups/hp-deskjet_816c.ppd.gz
ppd/hpcups/hp-deskjet_825c.ppd.gz ppd/hpcups/hp-deskjet_830c.ppd.gz
ppd/hpcups/hp-deskjet_832c.ppd.gz ppd/hpcups/hp-deskjet_840c.ppd.gz
ppd/hpcups/hp-deskjet_841c.ppd.gz ppd/hpcups/hp-deskjet_842c.ppd.gz
ppd/hpcups/hp-deskjet_843c.ppd.gz ppd/hpcups/hp-deskjet_845c.ppd.gz
ppd/hpcups/hp-deskjet_850c.ppd.gz ppd/hpcups/hp-deskjet_855c.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_870c.ppd.gz ppd/hpcups/hp-deskjet_880c.ppd.gz
ppd/hpcups/hp-deskjet_882c.ppd.gz ppd/hpcups/hp-deskjet_890c.ppd.gz
ppd/hpcups/hp-deskjet_895c.ppd.gz ppd/hpcups/hp-deskjet_916c.ppd.gz
ppd/hpcups/hp-deskjet_920c.ppd.gz ppd/hpcups/hp-deskjet_9300.ppd.gz
ppd/hpcups/hp-deskjet_930c.ppd.gz ppd/hpcups/hp-deskjet_932c.ppd.gz
ppd/hpcups/hp-deskjet_933c.ppd.gz ppd/hpcups/hp-deskjet_934c.ppd.gz
ppd/hpcups/hp-deskjet_935c.ppd.gz ppd/hpcups/hp-deskjet_940c.ppd.gz
ppd/hpcups/hp-deskjet_948c.ppd.gz ppd/hpcups/hp-deskjet_950c.ppd.gz
ppd/hpcups/hp-deskjet_952c.ppd.gz ppd/hpcups/hp-deskjet_955c.ppd.gz
ppd/hpcups/hp-deskjet_957c.ppd.gz ppd/hpcups/hp-deskjet_959c.ppd.gz
ppd/hpcups/hp-deskjet_9600.ppd.gz ppd/hpcups/hp-deskjet_960c.ppd.gz
ppd/hpcups/hp-deskjet_970c.ppd.gz ppd/hpcups/hp-deskjet_975c.ppd.gz
ppd/hpcups/hp-deskjet_9800.ppd.gz ppd/hpcups/hp-deskjet_980c.ppd.gz
ppd/hpcups/hp-deskjet_990c.ppd.gz ppd/hpcups/hp-deskjet_995c.ppd.gz
ppd/hpcups/hp-deskjet_d1300_series.ppd.gz
ppd/hpcups/hp-deskjet_d1400_series.ppd.gz
ppd/hpcups/hp-deskjet_d1500_series.ppd.gz
ppd/hpcups/hp-deskjet_d1600_series.ppd.gz
ppd/hpcups/hp-deskjet_d2300_series.ppd.gz
ppd/hpcups/hp-deskjet_d2400_series.ppd.gz
ppd/hpcups/hp-deskjet_d2500_series.ppd.gz
ppd/hpcups/hp-deskjet_d2600_series.ppd.gz
ppd/hpcups/hp-deskjet_d4100_series.ppd.gz
ppd/hpcups/hp-deskjet_d4200_series.ppd.gz
ppd/hpcups/hp-deskjet_d4300_series.ppd.gz
ppd/hpcups/hp-deskjet_d5500_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_d730.ppd.gz ppd/hpcups/hp-deskjet_f2100_series.ppd.gz
ppd/hpcups/hp-deskjet_f2200_series.ppd.gz
ppd/hpcups/hp-deskjet_f2400_series.ppd.gz
ppd/hpcups/hp-deskjet_f300_series.ppd.gz
ppd/hpcups/hp-deskjet_f4100_series.ppd.gz
ppd/hpcups/hp-deskjet_f4200_series.ppd.gz
ppd/hpcups/hp-deskjet_f4210_series.ppd.gz
ppd/hpcups/hp-deskjet_f4213_series.ppd.gz
ppd/hpcups/hp-deskjet_f4400_series.ppd.gz
ppd/hpcups/hp-deskjet_f4500_series.ppd.gz ppd/hpcups/hp-deskjet_f735.ppd.gz
ppd/hpcups/hp-deskjet_ink_adv_2010_k010.ppd.gz
ppd/hpcups/hp-deskjet_ink_adv_2060_k110.ppd.gz
ppd/hpcups/hp-deskjet_ink_advant_k109a-z.ppd.gz
ppd/hpcups/hp-deskjet_ink_advant_k209a-z.ppd.gz ppd/hpcups/hp-dj350.ppd.gz
ppd/hpcups/hp-dj450.ppd.gz ppd/hpcups/hp-envy_100_d410_series.ppd.gz
ppd/hpcups/hp-envy_110_series.ppd.gz ppd/hpcups/hp-envy_120_series.ppd.gz
ppd/hpcups/hp-envy_4500_series.ppd.gz ppd/hpcups/hp-envy_4510_series.ppd.gz
ppd/hpcups/hp-envy_4520_series.ppd.gz ppd/hpcups/hp-envy_5000_series.ppd.gz
ppd/hpcups/hp-envy_5530_series.ppd.gz ppd/hpcups/hp-envy_5540_series.ppd.gz
ppd/hpcups/hp-envy_5640_series.ppd.gz ppd/hpcups/hp-envy_5660_series.ppd.gz
ppd/hpcups/hp-envy_7640_series.ppd.gz ppd/hpcups/hp-envy_8000_series.ppd.gz
ppd/hpcups/hp-envy_photo_6200_series.ppd.gz
ppd/hpcups/hp-envy_photo_7100_series.ppd.gz
ppd/hpcups/hp-envy_photo_7800_series.ppd.gz
ppd/hpcups/hp-laserjet_1000.ppd.gz ppd/hpcups/hp-laserjet_1005_series.ppd.gz
ppd/hpcups/hp-laserjet_1010.ppd.gz ppd/hpcups/hp-laserjet_1012.ppd.gz
ppd/hpcups/hp-laserjet_1015.ppd.gz ppd/hpcups/hp-laserjet_1018.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_1020.ppd.gz ppd/hpcups/hp-laserjet_1022n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1022nw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1022-pcl3.ppd.gz ppd/hpcups/hp-laserjet_1100a.ppd.gz
ppd/hpcups/hp-laserjet_1100.ppd.gz ppd/hpcups/hp-laserjet_1100xi.ppd.gz
ppd/hpcups/hp-laserjet_1150.ppd.gz ppd/hpcups/hp-laserjet_1160.ppd.gz
ppd/hpcups/hp-laserjet_1160_series.ppd.gz
ppd/hpcups/hp-laserjet_1200n.ppd.gz ppd/hpcups/hp-laserjet_1200-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1220-pcl3.ppd.gz ppd/hpcups/hp-laserjet_1220se.ppd.gz
ppd/hpcups/hp-laserjet_1300n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1300-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1300xi-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1320n.ppd.gz ppd/hpcups/hp-laserjet_1320nw.ppd.gz
ppd/hpcups/hp-laserjet_1320.ppd.gz
ppd/hpcups/hp-laserjet_1320_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1320tn.ppd.gz ppd/hpcups/hp-laserjet_2100.ppd.gz
ppd/hpcups/hp-laserjet_2100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2200-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2200_series.ppd.gz
ppd/hpcups/hp-laserjet_2300-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2300_series.ppd.gz
ppd/hpcups/hp-laserjet_2410-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2420-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2430-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3015-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3020-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3030-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3050-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3052-pcl3.ppd.gz ppd/hpcups/hp-laserjet_3055.ppd.gz
ppd/hpcups/hp-laserjet_3100.ppd.gz ppd/hpcups/hp-laserjet_3150.ppd.gz
ppd/hpcups/hp-laserjet_3200m-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_3200.ppd.gz ppd/hpcups/hp-laserjet_3200se.ppd.gz
ppd/hpcups/hp-laserjet_3300_3310_3320-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3330.ppd.gz ppd/hpcups/hp-laserjet_3380-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3390-pcl3.ppd.gz ppd/hpcups/hp-laserjet_3392.ppd.gz
ppd/hpcups/hp-laserjet_4000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4050_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4100_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4150_series.ppd.gz
ppd/hpcups/hp-laserjet_4200-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4240-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4250-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4300-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4345_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4350-pcl3.ppd.gz ppd/hpcups/hp-laserjet_4l.ppd.gz
ppd/hpcups/hp-laserjet_4ml.ppd.gz ppd/hpcups/hp-laserjet_4mp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4_plus-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4si-pcl3.ppd.gz ppd/hpcups/hp-laserjet_4v-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5000.ppd.gz
ppd/hpcups/hp-laserjet_5000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5200l-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5200lx.ppd.gz ppd/hpcups/hp-laserjet_5200-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5l.ppd.gz ppd/hpcups/hp-laserjet_5mp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5p.ppd.gz
ppd/hpcups/hp-laserjet_5si_mopier-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5si-pcl3.ppd.gz ppd/hpcups/hp-laserjet_6l.ppd.gz
ppd/hpcups/hp-laserjet_6mp-pcl3.ppd.gz ppd/hpcups/hp-laserjet_6p.ppd.gz
ppd/hpcups/hp-laserjet_8000.ppd.gz
ppd/hpcups/hp-laserjet_8000_series-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_8100_mfp.ppd.gz
ppd/hpcups/hp-laserjet_8100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_8150_mfp.ppd.gz
ppd/hpcups/hp-laserjet_8150_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9000_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9040_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9040-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9050_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9050-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9055mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9065mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1411fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1412fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1413fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1415fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1415fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1416fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1417fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1418fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cp_1025nw.ppd.gz
ppd/hpcups/hp-laserjet_cp1025nw.ppd.gz ppd/hpcups/hp-laserjet_cp_1025.ppd.gz
ppd/hpcups/hp-laserjet_cp1025.ppd.gz ppd/hpcups/hp-laserjet_m1005.ppd.gz
ppd/hpcups/hp-laserjet_m101-m106.ppd.gz
ppd/hpcups/hp-laserjet_m1120_mfp.ppd.gz
ppd/hpcups/hp-laserjet_m1120n_mfp.ppd.gz
ppd/hpcups/hp-laserjet_m1319f_mfp.ppd.gz
ppd/hpcups/hp-laserjet_m14-m17.ppd.gz
ppd/hpcups/hp-laserjet_m1522nf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m1537dnf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m1538dnf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m1539dnf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m2727_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m3027_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m3035_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m4345_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m4349_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m5025_mfp-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_m5035_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m5039_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9040_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9050_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9059_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_mfp_m129-m134.ppd.gz
ppd/hpcups/hp-laserjet_mfp_m28-m31.ppd.gz
ppd/hpcups/hp-laserjet_p1005.ppd.gz ppd/hpcups/hp-laserjet_p1006.ppd.gz
ppd/hpcups/hp-laserjet_p1007.ppd.gz ppd/hpcups/hp-laserjet_p1008.ppd.gz
ppd/hpcups/hp-laserjet_p1009.ppd.gz ppd/hpcups/hp-laserjet_p1505n-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p1505.ppd.gz ppd/hpcups/hp-laserjet_p2014n-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p2014-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p2015dn_series.ppd.gz
ppd/hpcups/hp-laserjet_p2015d_series.ppd.gz
ppd/hpcups/hp-laserjet_p2015n_series.ppd.gz
ppd/hpcups/hp-laserjet_p2015_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2015x_series.ppd.gz
ppd/hpcups/hp-laserjet_p2035n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2035-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055dn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055d-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055x-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3004-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3005-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3010_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p4014dn.ppd.gz ppd/hpcups/hp-laserjet_p4014n.ppd.gz
ppd/hpcups/hp-laserjet_p4014.ppd.gz ppd/hpcups/hp-laserjet_p4015dn.ppd.gz
ppd/hpcups/hp-laserjet_p4015n.ppd.gz ppd/hpcups/hp-laserjet_p4015.ppd.gz
ppd/hpcups/hp-laserjet_p4015tn.ppd.gz ppd/hpcups/hp-laserjet_p4015x.ppd.gz
ppd/hpcups/hp-laserjet_p4515n.ppd.gz ppd/hpcups/hp-laserjet_p4515.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_p4515tn.ppd.gz ppd/hpcups/hp-laserjet_p4515xm.ppd.gz
ppd/hpcups/hp-laserjet_p4515x.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1132_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1136_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1137_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1138_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1139_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1212nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1213nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1214nfh_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1216nfh_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1217nfw_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1218nfg_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1218nfs_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nfg_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nfs_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1102.ppd.gz
ppd/hpcups/hp-laserjet_professional_p_1102w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1102w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1106.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1106w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1107.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1107w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1108.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1108w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1109.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1109w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1566.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1567.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1568.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1569.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1606dn.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1607dn.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1608dn.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1609dn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125nr.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125nw.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_pro_mfp_m125rnw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125r.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125s.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m126a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m126nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fp.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fs.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m128fn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m128fp.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m128fw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m25a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m25nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m26a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m26nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m27cnw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m27c.ppd.gz
ppd/hpcups/hp-mopier_240-pcl3.ppd.gz ppd/hpcups/hp-mopier_320-pcl3.ppd.gz
ppd/hpcups/hp-officejet_100_mobile_l411.ppd.gz
ppd/hpcups/hp-officejet_150_mobile_l511.ppd.gz
ppd/hpcups/hp-officejet_200_mobile_series.ppd.gz
ppd/hpcups/hp-officejet_250_mobile_series.ppd.gz
ppd/hpcups/hp-officejet_2620_series.ppd.gz
ppd/hpcups/hp-officejet_3830_series.ppd.gz
ppd/hpcups/hp-officejet_4000_k210.ppd.gz
ppd/hpcups/hp-officejet_4100_series.ppd.gz
ppd/hpcups/hp-officejet_4105.ppd.gz
ppd/hpcups/hp-officejet_4115_series.ppd.gz
ppd/hpcups/hp-officejet_4200_series.ppd.gz
ppd/hpcups/hp-officejet_4255.ppd.gz
ppd/hpcups/hp-officejet_4300_series.ppd.gz
ppd/hpcups/hp-officejet_4400_k410.ppd.gz
ppd/hpcups/hp-officejet_4500_g510a-f.ppd.gz
ppd/hpcups/hp-officejet_4500_g510g-m.ppd.gz
ppd/hpcups/hp-officejet_4500_g510n-z.ppd.gz
ppd/hpcups/hp-officejet_4500_k710.ppd.gz
ppd/hpcups/hp-officejet_4610_series.ppd.gz
ppd/hpcups/hp-officejet_4620_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_4630_series.ppd.gz
ppd/hpcups/hp-officejet_4650_series.ppd.gz
ppd/hpcups/hp-officejet_5100_series.ppd.gz
ppd/hpcups/hp-officejet_5105.ppd.gz ppd/hpcups/hp-officejet_5110.ppd.gz
ppd/hpcups/hp-officejet_5110v.ppd.gz
ppd/hpcups/hp-officejet_5200_series.ppd.gz
ppd/hpcups/hp-officejet_5500_series.ppd.gz
ppd/hpcups/hp-officejet_5600_series.ppd.gz
ppd/hpcups/hp-officejet_5740_series.ppd.gz
ppd/hpcups/hp-officejet_6000_e609a.ppd.gz
ppd/hpcups/hp-officejet_6000_e609n.ppd.gz
ppd/hpcups/hp-officejet_6100.ppd.gz
ppd/hpcups/hp-officejet_6100_series.ppd.gz
ppd/hpcups/hp-officejet_6150_series.ppd.gz
ppd/hpcups/hp-officejet_6200_series.ppd.gz
ppd/hpcups/hp-officejet_6300_series.ppd.gz
ppd/hpcups/hp-officejet_6500_e709a.ppd.gz
ppd/hpcups/hp-officejet_6500_e709n.ppd.gz
ppd/hpcups/hp-officejet_6500_e710a-f.ppd.gz
ppd/hpcups/hp-officejet_6500_e710n-z.ppd.gz
ppd/hpcups/hp-officejet_6600.ppd.gz ppd/hpcups/hp-officejet_6700.ppd.gz
ppd/hpcups/hp-officejet_6800.ppd.gz ppd/hpcups/hp-officejet_6950.ppd.gz
ppd/hpcups/hp-officejet_6960.ppd.gz
ppd/hpcups/hp-officejet_7000_e809a.ppd.gz
ppd/hpcups/hp-officejet_7000_e809a_series.ppd.gz
ppd/hpcups/hp-officejet_7100_series.ppd.gz
ppd/hpcups/hp-officejet_7110_series.ppd.gz
ppd/hpcups/hp-officejet_7200_series.ppd.gz
ppd/hpcups/hp-officejet_7300_series.ppd.gz
ppd/hpcups/hp-officejet_7400_series.ppd.gz
ppd/hpcups/hp-officejet_7500_e910.ppd.gz
ppd/hpcups/hp-officejet_7510_series.ppd.gz
ppd/hpcups/hp-officejet_7610_series.ppd.gz
ppd/hpcups/hp-officejet_8040_series.ppd.gz
ppd/hpcups/hp-officejet_8700.ppd.gz
ppd/hpcups/hp-officejet_9100_series-pcl3.ppd.gz
ppd/hpcups/hp-officejet_d_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_g55.ppd.gz ppd/hpcups/hp-officejet_g55xi.ppd.gz
ppd/hpcups/hp-officejet_g85.ppd.gz ppd/hpcups/hp-officejet_g85xi.ppd.gz
ppd/hpcups/hp-officejet_g95.ppd.gz ppd/hpcups/hp-officejet_h470.ppd.gz
ppd/hpcups/hp-officejet_j3500_series.ppd.gz
ppd/hpcups/hp-officejet_j3600_series.ppd.gz
ppd/hpcups/hp-officejet_j4500_series.ppd.gz
ppd/hpcups/hp-officejet_j4660_series.ppd.gz
ppd/hpcups/hp-officejet_j4680_series.ppd.gz
ppd/hpcups/hp-officejet_j5500_series.ppd.gz
ppd/hpcups/hp-officejet_j5700_series.ppd.gz
ppd/hpcups/hp-officejet_j6400_series.ppd.gz
ppd/hpcups/hp-officejet_k60.ppd.gz ppd/hpcups/hp-officejet_k60xi.ppd.gz
ppd/hpcups/hp-officejet_k7100.ppd.gz ppd/hpcups/hp-officejet_k80.ppd.gz
ppd/hpcups/hp-officejet_k80xi.ppd.gz ppd/hpcups/hp-officejet_lx.ppd.gz
ppd/hpcups/hp-officejet.ppd.gz ppd/hpcups/hp-officejet_pro_1150c.ppd.gz
ppd/hpcups/hp-officejet_pro_1170c_series.ppd.gz
ppd/hpcups/hp-officejet_pro_3610.ppd.gz
ppd/hpcups/hp-officejet_pro_3620.ppd.gz
ppd/hpcups/hp-officejet_pro_6230.ppd.gz
ppd/hpcups/hp-officejet_pro_6830.ppd.gz
ppd/hpcups/hp-officejet_pro_6960.ppd.gz
ppd/hpcups/hp-officejet_pro_6970.ppd.gz
ppd/hpcups/hp-officejet_pro_7720_series.ppd.gz
ppd/hpcups/hp-officejet_pro_7730_series.ppd.gz
ppd/hpcups/hp-officejet_pro_7740_series.ppd.gz
ppd/hpcups/hp-officejet_pro_8000_a809.ppd.gz
ppd/hpcups/hp-officejet_pro_8100.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909a.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909g.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909n.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a910.ppd.gz
ppd/hpcups/hp-officejet_pro_8600.ppd.gz
ppd/hpcups/hp-officejet_pro_8610.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_pro_8620.ppd.gz
ppd/hpcups/hp-officejet_pro_8630.ppd.gz
ppd/hpcups/hp-officejet_pro_8640.ppd.gz
ppd/hpcups/hp-officejet_pro_8660.ppd.gz
ppd/hpcups/hp-officejet_pro_8710.ppd.gz
ppd/hpcups/hp-officejet_pro_8720.ppd.gz
ppd/hpcups/hp-officejet_pro_k5300.ppd.gz
ppd/hpcups/hp-officejet_pro_k5400.ppd.gz
ppd/hpcups/hp-officejet_pro_k550.ppd.gz
ppd/hpcups/hp-officejet_pro_k850.ppd.gz
ppd/hpcups/hp-officejet_pro_k8600.ppd.gz
ppd/hpcups/hp-officejet_pro_l7300.ppd.gz
ppd/hpcups/hp-officejet_pro_l7400.ppd.gz
ppd/hpcups/hp-officejet_pro_l7500.ppd.gz
ppd/hpcups/hp-officejet_pro_l7600.ppd.gz
ppd/hpcups/hp-officejet_pro_l7700.ppd.gz ppd/hpcups/hp-officejet_r40.ppd.gz
ppd/hpcups/hp-officejet_r40xi.ppd.gz ppd/hpcups/hp-officejet_r45.ppd.gz
ppd/hpcups/hp-officejet_r60.ppd.gz ppd/hpcups/hp-officejet_r65.ppd.gz
ppd/hpcups/hp-officejet_r80.ppd.gz ppd/hpcups/hp-officejet_r80xi.ppd.gz
ppd/hpcups/hp-officejet_series_300.ppd.gz
ppd/hpcups/hp-officejet_series_310.ppd.gz
ppd/hpcups/hp-officejet_series_320.ppd.gz
ppd/hpcups/hp-officejet_series_330.ppd.gz
ppd/hpcups/hp-officejet_series_350.ppd.gz
ppd/hpcups/hp-officejet_series_520.ppd.gz
ppd/hpcups/hp-officejet_series_570.ppd.gz
ppd/hpcups/hp-officejet_series_580.ppd.gz
ppd/hpcups/hp-officejet_series_590.ppd.gz
ppd/hpcups/hp-officejet_series_600.ppd.gz
ppd/hpcups/hp-officejet_series_610.ppd.gz
ppd/hpcups/hp-officejet_series_630.ppd.gz
ppd/hpcups/hp-officejet_series_700.ppd.gz
ppd/hpcups/hp-officejet_series_710.ppd.gz
ppd/hpcups/hp-officejet_series_720.ppd.gz
ppd/hpcups/hp-officejet_series_725.ppd.gz
ppd/hpcups/hp-officejet_t_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_v30.ppd.gz ppd/hpcups/hp-officejet_v40.ppd.gz
ppd/hpcups/hp-officejet_v40xi.ppd.gz ppd/hpcups/hp-officejet_v45.ppd.gz
ppd/hpcups/hp-photosmart_100.ppd.gz ppd/hpcups/hp-photosmart_1115.ppd.gz
ppd/hpcups/hp-photosmart_1215.ppd.gz ppd/hpcups/hp-photosmart_1218.ppd.gz
ppd/hpcups/hp-photosmart_130.ppd.gz ppd/hpcups/hp-photosmart_1315.ppd.gz
ppd/hpcups/hp-photosmart_140_series.ppd.gz
ppd/hpcups/hp-photosmart_230.ppd.gz
ppd/hpcups/hp-photosmart_240_series.ppd.gz
ppd/hpcups/hp-photosmart_2570_series.ppd.gz
ppd/hpcups/hp-photosmart_2600_series.ppd.gz
ppd/hpcups/hp-photosmart_2700_series.ppd.gz
ppd/hpcups/hp-photosmart_3100_series.ppd.gz
ppd/hpcups/hp-photosmart_3200_series.ppd.gz
ppd/hpcups/hp-photosmart_320_series.ppd.gz
ppd/hpcups/hp-photosmart_3300_series.ppd.gz
ppd/hpcups/hp-photosmart_330_series.ppd.gz
ppd/hpcups/hp-photosmart_370_series.ppd.gz
ppd/hpcups/hp-photosmart_380_series.ppd.gz
ppd/hpcups/hp-photosmart_420_series.ppd.gz
ppd/hpcups/hp-photosmart_470_series.ppd.gz
ppd/hpcups/hp-photosmart_5510d_series.ppd.gz
ppd/hpcups/hp-photosmart_5510_series.ppd.gz
ppd/hpcups/hp-photosmart_5520_series.ppd.gz
ppd/hpcups/hp-photosmart_6510_series.ppd.gz
ppd/hpcups/hp-photosmart_6520_series.ppd.gz
ppd/hpcups/hp-photosmart_7150.ppd.gz
ppd/hpcups/hp-photosmart_7200_series.ppd.gz
ppd/hpcups/hp-photosmart_7345.ppd.gz ppd/hpcups/hp-photosmart_7350.ppd.gz
ppd/hpcups/hp-photosmart_7400_series.ppd.gz
ppd/hpcups/hp-photosmart_7510_series.ppd.gz
ppd/hpcups/hp-photosmart_7520_series.ppd.gz
ppd/hpcups/hp-photosmart_7550.ppd.gz
ppd/hpcups/hp-photosmart_7600_series.ppd.gz
ppd/hpcups/hp-photosmart_7700_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-photosmart_7800_series.ppd.gz
ppd/hpcups/hp-photosmart_7900_series.ppd.gz
ppd/hpcups/hp-photosmart_8000_series.ppd.gz
ppd/hpcups/hp-photosmart_8100_series.ppd.gz
ppd/hpcups/hp-photosmart_8200_series.ppd.gz
ppd/hpcups/hp-photosmart_8400_series.ppd.gz
ppd/hpcups/hp-photosmart_8700_series.ppd.gz
ppd/hpcups/hp-photosmart_a310_series.ppd.gz
ppd/hpcups/hp-photosmart_a320_series.ppd.gz
ppd/hpcups/hp-photosmart_a430_series.ppd.gz
ppd/hpcups/hp-photosmart_a440_series.ppd.gz
ppd/hpcups/hp-photosmart_a510_series.ppd.gz
ppd/hpcups/hp-photosmart_a520_series.ppd.gz
ppd/hpcups/hp-photosmart_a530_series.ppd.gz
ppd/hpcups/hp-photosmart_a610_series.ppd.gz
ppd/hpcups/hp-photosmart_a620_series.ppd.gz
ppd/hpcups/hp-photosmart_a630_series.ppd.gz
ppd/hpcups/hp-photosmart_a640_series.ppd.gz
ppd/hpcups/hp-photosmart_a710_series.ppd.gz
ppd/hpcups/hp-photosmart_a820_series.ppd.gz
ppd/hpcups/hp-photosmart_b010_series.ppd.gz
ppd/hpcups/hp-photosmart_b109a-m.ppd.gz
ppd/hpcups/hp-photosmart_b109a_series.ppd.gz
ppd/hpcups/hp-photosmart_b110_series.ppd.gz
ppd/hpcups/hp-photosmart_b8500_series.ppd.gz
ppd/hpcups/hp-photosmart_c309a_series.ppd.gz
ppd/hpcups/hp-photosmart_c3100_series.ppd.gz
ppd/hpcups/hp-photosmart_c4100_series.ppd.gz
ppd/hpcups/hp-photosmart_c4200_series.ppd.gz
ppd/hpcups/hp-photosmart_c4340_series.ppd.gz
ppd/hpcups/hp-photosmart_c4380_series.ppd.gz
ppd/hpcups/hp-photosmart_c4400_series.ppd.gz
ppd/hpcups/hp-photosmart_c4500_series.ppd.gz
ppd/hpcups/hp-photosmart_c4600_series.ppd.gz
ppd/hpcups/hp-photosmart_c4700_series.ppd.gz
ppd/hpcups/hp-photosmart_c5100_series.ppd.gz
ppd/hpcups/hp-photosmart_c5200_series.ppd.gz
ppd/hpcups/hp-photosmart_c5300_series.ppd.gz
ppd/hpcups/hp-photosmart_c5500_series.ppd.gz
ppd/hpcups/hp-photosmart_c6100_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-photosmart_c6200_series.ppd.gz
ppd/hpcups/hp-photosmart_c6300_series.ppd.gz
ppd/hpcups/hp-photosmart_c7100_series.ppd.gz
ppd/hpcups/hp-photosmart_c7200_series.ppd.gz
ppd/hpcups/hp-photosmart_c8100_series.ppd.gz
ppd/hpcups/hp-photosmart_d110_series.ppd.gz
ppd/hpcups/hp-photosmart_d5060_series.ppd.gz
ppd/hpcups/hp-photosmart_d5100_series.ppd.gz
ppd/hpcups/hp-photosmart_d5300_series.ppd.gz
ppd/hpcups/hp-photosmart_d5400_series.ppd.gz
ppd/hpcups/hp-photosmart_d6100_series.ppd.gz
ppd/hpcups/hp-photosmart_d7100_series.ppd.gz
ppd/hpcups/hp-photosmart_d7200_series.ppd.gz
ppd/hpcups/hp-photosmart_d7300_series.ppd.gz
ppd/hpcups/hp-photosmart_d7400_series.ppd.gz
ppd/hpcups/hp-photosmart_d7500_series.ppd.gz
ppd/hpcups/hp-photosmart_estn_c510_series.ppd.gz
ppd/hpcups/hp-photosmart_ink_adv_k510.ppd.gz
ppd/hpcups/hp-photosmart_p1000.ppd.gz ppd/hpcups/hp-photosmart_p1100.ppd.gz
ppd/hpcups/hp-photosmart_plus_b209a-m.ppd.gz
ppd/hpcups/hp-photosmart_plus_b210_series.ppd.gz
ppd/hpcups/hp-photosmart_prem_c310_series.ppd.gz
ppd/hpcups/hp-photosmart_prem_c410_series.ppd.gz
ppd/hpcups/hp-photosmart_premium_c309g-m.ppd.gz
ppd/hpcups/hp-photosmart_prem-web_c309n-s.ppd.gz
ppd/hpcups/hp-photosmart_pro_b8300_series.ppd.gz
ppd/hpcups/hp-photosmart_pro_b8800_series.ppd.gz
ppd/hpcups/hp-photosmart_wireless_b109n-z.ppd.gz
ppd/hpcups/hp-printer_scanner_copier_300.ppd.gz
ppd/hpcups/hp-psc_1000_series.ppd.gz ppd/hpcups/hp-psc_1100_series.ppd.gz
ppd/hpcups/hp-psc_1200_series.ppd.gz ppd/hpcups/hp-psc_1300_series.ppd.gz
ppd/hpcups/hp-psc_1310_series.ppd.gz ppd/hpcups/hp-psc_1358_series.ppd.gz
ppd/hpcups/hp-psc_1400_series.ppd.gz ppd/hpcups/hp-psc_1500_series.ppd.gz
ppd/hpcups/hp-psc_1510_series.ppd.gz ppd/hpcups/hp-psc_1600_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

|  /home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-psc_2100_series.ppd.gz ppd/hpcups/hp-psc_2150_series.ppd.gz
ppd/hpcups/hp-psc_2170_series.ppd.gz ppd/hpcups/hp-psc_2200_series.ppd.gz
ppd/hpcups/hp-psc_2210_series.ppd.gz ppd/hpcups/hp-psc_2300_series.ppd.gz
ppd/hpcups/hp-psc_2350_series.ppd.gz ppd/hpcups/hp-psc_2400_series.ppd.gz
ppd/hpcups/hp-psc_2500_series.ppd.gz ppd/hpcups/hp-psc_500.ppd.gz
ppd/hpcups/hp-psc_720.ppd.gz ppd/hpcups/hp-psc_750.ppd.gz
ppd/hpcups/hp-psc_750xi.ppd.gz ppd/hpcups/hp-psc_760.ppd.gz
ppd/hpcups/hp-psc_780.ppd.gz ppd/hpcups/hp-psc_780xi.ppd.gz
ppd/hpcups/hp-psc_900_series.ppd.gz ppd/hpcups/hp-psc_920.ppd.gz
ppd/hpcups/hp-psc_950.ppd.gz ppd/hpcups/hp-psc_950vr.ppd.gz
ppd/hpcups/hp-psc_950xi.ppd.gz ppd/hpcups/*.ppd.gz
ppd/hpcups/apollo-2100.ppd.gz ppd/hpcups/apollo-2150.ppd.gz
ppd/hpcups/apollo-2200.ppd.gz ppd/hpcups/apollo-2500.ppd.gz
ppd/hpcups/apollo-2600.ppd.gz ppd/hpcups/apollo-2650.ppd.gz
ppd/hpcups/apollo-p2000-u.ppd.gz ppd/hpcups/apollo-p2250.ppd.gz
ppd/hpcups/hp-2000c.ppd.gz ppd/hpcups/hp-2500c.ppd.gz
ppd/hpcups/hp-910.ppd.gz ppd/hpcups/hp-915.ppd.gz ppd/hpcups/hp-amp.ppd.gz
ppd/hpcups/hp-business_inkjet_1000.ppd.gz
ppd/hpcups/hp-business_inkjet_1100.ppd.gz
ppd/hpcups/hp-business_inkjet_1200.ppd.gz
ppd/hpcups/hp-business_inkjet_2200.ppd.gz
ppd/hpcups/hp-business_inkjet_2230.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2100_series.ppd.gz' with
'ppd/hpcups/hp-psc_2100_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2150_series.ppd.gz' with
'ppd/hpcups/hp-psc_2150_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2170_series.ppd.gz' with
'ppd/hpcups/hp-psc_2170_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2200_series.ppd.gz' with
'ppd/hpcups/hp-psc_2200_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2210_series.ppd.gz' with
'ppd/hpcups/hp-psc_2210_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2300_series.ppd.gz' with
'ppd/hpcups/hp-psc_2300_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2350_series.ppd.gz' with
'ppd/hpcups/hp-psc_2350_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2400_series.ppd.gz' with
'ppd/hpcups/hp-psc_2400_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_2500_series.ppd.gz' with
'ppd/hpcups/hp-psc_2500_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_500.ppd.gz' with
'ppd/hpcups/hp-psc_500.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_720.ppd.gz' with
'ppd/hpcups/hp-psc_720.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_750.ppd.gz' with
'ppd/hpcups/hp-psc_750.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_750xi.ppd.gz' with
'ppd/hpcups/hp-psc_750xi.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_760.ppd.gz' with
'ppd/hpcups/hp-psc_760.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_780.ppd.gz' with
'ppd/hpcups/hp-psc_780.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_780xi.ppd.gz' with
'ppd/hpcups/hp-psc_780xi.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_900_series.ppd.gz' with
'ppd/hpcups/hp-psc_900_series.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_920.ppd.gz' with
'ppd/hpcups/hp-psc_920.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_950.ppd.gz' with
'ppd/hpcups/hp-psc_950.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_950vr.ppd.gz' with
'ppd/hpcups/hp-psc_950vr.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-psc_950xi.ppd.gz' with
'ppd/hpcups/hp-psc_950xi.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2100.ppd.gz' with
'ppd/hpcups/apollo-2100.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2150.ppd.gz' with
'ppd/hpcups/apollo-2150.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2200.ppd.gz' with
'ppd/hpcups/apollo-2200.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2500.ppd.gz' with
'ppd/hpcups/apollo-2500.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2600.ppd.gz' with
'ppd/hpcups/apollo-2600.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-2650.ppd.gz' with
'ppd/hpcups/apollo-2650.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-p2000-u.ppd.gz' with
'ppd/hpcups/apollo-p2000-u.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/apollo-p2250.ppd.gz' with
'ppd/hpcups/apollo-p2250.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-2000c.ppd.gz' with
'ppd/hpcups/hp-2000c.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-2500c.ppd.gz' with
'ppd/hpcups/hp-2500c.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-910.ppd.gz' with 'ppd/hpcups/hp-910.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-915.ppd.gz' with 'ppd/hpcups/hp-915.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-amp.ppd.gz' with 'ppd/hpcups/hp-amp.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1000.ppd.gz' with
'ppd/hpcups/hp-business_inkjet_1000.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1100.ppd.gz' with
'ppd/hpcups/hp-business_inkjet_1100.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1200.ppd.gz' with
'ppd/hpcups/hp-business_inkjet_1200.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_2200.ppd.gz' with
'ppd/hpcups/hp-business_inkjet_2200.ppd.gz'

| /home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_2230.ppd.gz' with
'ppd/hpcups/hp-business_inkjet_2230.ppd.gz'

| Makefile:7899: recipe for target 'install-dist_ppdDATA' failed

| make[1]: *** [install-dist_ppdDATA] Error 1

| make[1]: Leaving directory
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.1
8.6-r1/hplip-3.18.6'

| Makefile:8517: recipe for target 'install-am' failed

| make: *** [install-am] Error 2

| ERROR: oe_runmake failed

| WARNING: exit code 1 from a shell command.

| ERROR: Function failed: do_install (log file is located at
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3.18
.6-r1/temp/log.do_install.16858)

ERROR: Task
(/home/tykwon/yocto/poky/meta-openembedded/meta-oe/recipes-extended/hplip/hp
lip_3.18.6.bb:do_install) failed with exit code '1'

NOTE: Tasks Summary: Attempted 1664 tasks of which 1663 didn't need to be
rerun and 1 failed.

 

Summary: 1 task failed:

 
/home/tykwon/yocto/poky/meta-openembedded/meta-oe/recipes-extended/hplip/hpl
ip_3.18.6.bb:do_install

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

tykwon:top$ 

 

 

I have verified the version of hplip by subdividing it.

Up to 3.17.9 is compiled and error starts from 3.17.10.

 

When manually cross-compiling hplip without using yocto, the error did not
occur.

Is there a good way to resolve this error?

 

I'm sorry I do not have enough English.

 

Regards

Kwon


------=_NextPart_000_0A9E_01D40CB1.17D7A460
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"Malgun Gothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"\D48D\C120 \B3C4\C6C0\B9D0 \D14D\C2A4\D2B8 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:9.0pt;
	font-family:"Malgun Gothic";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Malgun Gothic";
	color:windowtext;}
span.Char
	{mso-style-name:"\D48D\C120 \B3C4\C6C0\B9D0 \D14D\C2A4\D2B8 Char";
	mso-style-priority:99;
	mso-style-link:"\D48D\C120 \B3C4\C6C0\B9D0 \D14D\C2A4\D2B8";
	font-family:"Malgun Gothic";}
.MsoChpDefault
	{mso-style-type:export-only;}
 /* Page Definitions */
 @page Section1
	{size:612.0pt 792.0pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DKO link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span lang=3DEN-US>I am trying to upgrade the hplip =
version of
meta-openembedded.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Currently, the hplip version of
meta-openembedded is version 3.12.6.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I am going to upgrade my recipe =
to 3.18.6.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>However, in the do_install step, =
the
following error occurs.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Initialising tasks: 100%
|########################################################################=
#########################################################################=
##################|
Time: 0:00:01<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>NOTE: Executing SetScene =
Tasks<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>NOTE: Executing RunQueue =
Tasks<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>ERROR: hplip-3.18.6-r1 =
do_install:
oe_runmake failed<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>ERROR: hplip-3.18.6-r1 =
do_install: Function
failed: do_install (log file is located at
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/temp/log.do_install.16858)<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>ERROR: Logfile of failure stored =
in:
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/temp/log.do_install.16858<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Log data =
follows:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| DEBUG: Executing python =
function
extend_recipe_sysroot<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| NOTE: Direct dependencies are
['/home/tykwon/yocto/poky/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb:do=
_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/python/python-native_2.7.1=
3.bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-extended/cups/cups_2.2.4.bb:do_popu=
late_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb=
:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-support/libusb/libusb-compat_0.1.5.=
bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/python/python_2.7.13.bb:do=
_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/libtool/libtool-native_2.4=
.6.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/pseudo/pseu=
do_1.8.2.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/autoconf/au=
toconf_2.69.bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-core/glibc/glibc_2.26.bb:do_populat=
e_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.=
6.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/pkgconfig/p=
kgconfig_git.bb:do_populate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/gnu-config/=
gnu-config_git.bb:do_populate_sysroot',
'/home/tykwon/yocto/poky/meta/recipes-devtools/gcc/gcc-cross_7.2.bb:do_po=
pulate_sysroot',
'virtual:native:/home/tykwon/yocto/poky/meta/recipes-devtools/automake/au=
tomake_1.15.1.bb:do_populate_sysroot']<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| NOTE: Installed into sysroot: =
[]<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| NOTE: Skipping as already =
exists in
sysroot: ['gcc-runtime', 'python-native', 'cups', 'quilt-native',
'libusb-compat', 'python', 'libtool-native', 'pseudo-native',
'autoconf-native', 'glibc', 'libtool-cross', 'pkgconfig-native',
'gnu-config-native', 'gcc-cross-arm', 'automake-native', 'libgcc',
'linux-libc-headers', 'xz-native', 'openssl-native', 'zlib-native',
'bzip2-native', 'expat-native', 'readline-native', 'sqlite3-native',
'shadow-native', 'shadow', 'avahi', 'base-files', 'libjpeg-turbo', =
'dbus',
'shadow-sysroot', 'zlib', 'dbus-glib', 'base-passwd', 'libpng', =
'systemd',
'gnutls', 'db', 'bzip2', 'readline', 'libffi', 'sqlite3', 'gdbm', =
'openssl', 'binutils-cross-arm',
'texinfo-dummy-native', 'libusb1', 'm4-native', 'libmpc-native', =
'gmp-native',
'mpfr-native', 'gettext-minimal-native', 'cryptodev-linux-native',
'makedepend-native', 'pigz-native', 'ncurses-native', 'attr', =
'opkg-utils',
'glib-2.0', 'libdaemon', 'gobject-introspection', 'libcap', 'expat', =
'libsm',
'libx11', 'bash-completion', 'libxkbcommon', 'acl', 'xz', 'util-linux',
'libcgroup', 'kmod', 'gmp', 'nettle', 'libunistring', 'libidn', =
'ncurses',
'cryptodev-linux', 'bison-native', 'flex-native', 'xproto-native',
'util-macros-native', 'libpcre', 'python3', 'libice', 'util-macros', =
'xproto',
'xtrans', 'xextproto', 'kbproto', 'inputproto', 'libxcb', =
'xkeyboard-config',
'xcb-proto', 'libpthread-stubs', 'libxau', =
'libxdmcp']<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| DEBUG: Python function
extend_recipe_sysroot finished<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| DEBUG: SITE files =
['endian-little',
'bit-32', 'arm-common', 'arm-32', 'common-linux', 'common-glibc', =
'arm-linux',
'arm-linux-gnueabi', 'common']<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| DEBUG: Executing shell =
function
do_install<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| NOTE: make -j 4 =
DESTDIR=3D/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnuea=
bi/hplip/3.18.6-r1/image
install<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| make[1]: Entering directory
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/hplip-3.18.6'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/cups/drv/hp'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c&nbsp;&nbsp; =
libhpmud.la
libhpip.la libhpipp.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
prnt/drv/hpcups.drv
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/cups/drv/hp'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c&nbsp;&nbsp; cupsext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;&nbsp; =
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp;
--mode=3Dinstall /home/tykwon/yocto/build/tmp/hosttools/install -c =
dat2drv
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c =
.libs/libhpmud.so.0.0.6
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpmud.so.0.0.6<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpmud.so.0.0.6 libhpmud.so.0 || { rm -f =
libhpmud.so.0
&amp;&amp; ln -s libhpmud.so.0.0.6 libhpmud.so.0; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpmud.so.0.0.6 libhpmud.so || { rm -f =
libhpmud.so
&amp;&amp; ln -s libhpmud.so.0.0.6 libhpmud.so; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/base'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpmud.lai =
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpmud.la<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpip.so.0.0.1
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpip.so.0.0.1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpip.so.0.0.1 libhpip.so.0 || { rm -f =
libhpip.so.0
&amp;&amp; ln -s libhpip.so.0.0.1 libhpip.so.0; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpip.so.0.0.1 libhpip.so || { rm -f libhpip.so
&amp;&amp; ln -s libhpip.so.0.0.1 libhpip.so; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpip.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpip.la<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/cupsext.so
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/cupsext.so<o:p></o:p></spa=
n></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c =
.libs/libhpipp.so.0.0.1
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpipp.so.0.0.1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpipp.so.0.0.1 libhpipp.so.0 || { rm -f =
libhpipp.so.0
&amp;&amp; ln -s libhpipp.so.0.0.1 libhpipp.so.0; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/cupsext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/cupsext.la<o:p></o:p></spa=
n></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
(cd
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib
&amp;&amp; { ln -s -f libhpipp.so.0.0.1 libhpipp.so || { rm -f =
libhpipp.so
&amp;&amp; ln -s libhpipp.so.0.0.1 libhpipp.so; }; =
})<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: warning:
remember to run 'arm-poky-linux-gnueabi-libtool --finish
/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 base/maint.py
base/codes.py base/g.py base/pml.py base/status.py base/__init__.py
base/mfpdtf.py base/utils.py base/wifi.py base/LedmWifi.py =
base/device.py
base/logger.py base/slp.py base/exif.py base/strings.py base/magic.py
base/imagesize.py base/models.py base/validation.py base/sixext.py
base/avahi.py base/mdns.py base/tui.py base/dime.py base/ldif.py =
base/vcard.py
base/module.py base/pkit.py base/queues.py base/password.py =
base/services.py
base/os_utils.py base/smart_install.py base/six.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/base'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/libhpipp.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/libhpipp.la<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/base/pexpect'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: warning:
remember to run 'arm-poky-linux-gnueabi-libtool --finish =
/usr/lib'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
base/pexpect/__init__.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/base/pexpect'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/copier'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
copier/copier.py
copier/__init__.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/copier'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c align.py info.py print.py toolbox.py clean.py colorcal.py unload.py
testpage.py makeuri.py check.py fab.py levels.py sendfax.py setup.py
makecopies.py probe.py timedate.py firmware.py scan.py systray.py =
plugin.py
linefeedcal.py pqdiag.py faxsetup.py devicesettings.py printsettings.py
query.py pkservice.py wificonfig.py diagnose_plugin.py uninstall.py =
upgrade.py
config_usb_printer.py diagnose_queues.py logcapture.py doctor.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c dat2drv
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/share/hplip/dat2drv<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hal/fdi/preprobe/10osvendor'<o:p></o:p></span><=
/p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 check-plugin.py
hplip_clean.sh
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c prnt/filters/hpps
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
data/rules/20-hplip-devices.fdi
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hal/fdi/preprobe/10osvendor'<o:p></o:p></span><=
/p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c hpssd.py __init__.py =
hpdio.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/installer'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/ldl'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/localization'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c -m 644 data/ldl/cb2pcal.ldl.gz data/ldl/cb2pcal_done.ldl.gz
data/ldl/cbbcal.ldl.gz data/ldl/cbccal.ldl.gz =
data/ldl/cbccal_done.ldl.gz
data/ldl/cbcpcal.ldl.gz data/ldl/cbpcal.ldl.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/ldl'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
installer/__init__.py
installer/dcheck.py installer/distros.dat installer/core_install.py
installer/pluginhandler.py =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/installer'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/localization/hplip_de.qm data/localization/hplip_es.qm
data/localization/hplip_fr.qm data/localization/hplip_it.qm
data/localization/hplip_pt.qm data/localization/hplip_ru.qm
data/localization/hplip_zh.qm
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/localization'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/mkdir
-p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/models'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/pcard'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
data/models/models.dat
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/models'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/pcl'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
pcard/__init__.py pcard/photocard.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/pcard'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/pcl/align1_8xx.pcl.gz data/pcl/align1_9xx.pcl.gz =
data/pcl/align2_8xx.pcl.gz
data/pcl/align3_8xx.pcl.gz data/pcl/align4_8xx.pcl.gz
data/pcl/align5_8xx.pcl.gz data/pcl/align2_9xx.pcl.gz
data/pcl/align3_9xx.pcl.gz data/pcl/align4_450.pcl.gz
data/pcl/align6_450.pcl.gz data/pcl/colorcal1_450.pcl.gz
data/pcl/colorcal2_450.pcl.gz data/pcl/crbcal.pcl.gz =
data/pcl/crcaldone.pcl.gz
data/pcl/crcbcal.pcl.gz data/pcl/crccal.pcl.gz data/pcl/crcpcal.pcl.gz
data/pcl/crpcal.pcl.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/pcl'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/ps'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
data/ps/testpage.ps.gz
data/ps/clean_page.pdf.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/data/ps'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/prnt'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/etc/udev/rules.d'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 prnt/cups.py
prnt/__init__.py prnt/ldl.py prnt/pcl.py prnt/colorcal.py
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip/prnt'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c prnt/hpijs/foomatic-rip-hplip
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
data/rules/56-hpmud.rules
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/etc/udev/rules.d'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/systemd/system'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_pro_m701-ps.ppd.gz
prnt/ps/hp-laserjet_5000_series-ps.ppd.gz
prnt/ps/hp-officejet_pro_451_series-ps.ppd.gz
prnt/ps/hp-laserjet_5si_mopier-ps.ppd.gz
prnt/ps/hp-designjet_t1120ps_44in-ps.ppd.gz
prnt/ps/hp-pagewide_color_e77650-e77660-ps.ppd.gz
prnt/ps/hp-laserjet_m506-ps.ppd.gz =
prnt/ps/hp-color_laserjet_cp1514n-ps.ppd.gz
prnt/ps/hp-laserjet_m3035_mfp-ps.ppd.gz =
prnt/ps/hp-color_laserjet_flow_mfp_m680-ps.ppd.gz
prnt/ps/hp-designjet_t1100ps_44in-ps.ppd.gz
prnt/ps/hp-designjet_t7100ps_monochrome-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp4520_series-ps.ppd.gz
prnt/ps/hp-designjet_z6200_60in_photo-ps.ppd.gz
prnt/ps/hp-business_inkjet_2250-ps.ppd.gz =
prnt/ps/hp-designjet_4500ps.ppd.gz
prnt/ps/hp-officejet_pro_8732-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320n_mfp-ps.ppd.gz
prnt/ps/hp-designjet_t790ps_24in-ps.ppd.gz
prnt/ps/hp-color_laserjet_2700n-ps.ppd.gz
prnt/ps/hp-color_laserjet_3700-ps.ppd.gz =
prnt/ps/hp-designjet_z6100ps_42in_photo-ps.ppd.gz
prnt/ps/hp-laserjet_m5025_mfp-ps.ppd.gz
prnt/ps/hp-postscript-laserjet-pro.ppd.gz
prnt/ps/hp-designjet_t1500-postscript.ppd.gz
prnt/ps/hp-business_inkjet_3000-ps.ppd.gz
prnt/ps/hp-designjet_t1700dr_postscript-ps.ppd.gz =
prnt/ps/hp-color_laserjet_m452d-ps.ppd.gz
prnt/ps/hp-laserjet_e60055-e60075-ps.ppd.gz =
prnt/ps/hp-laserjet_1200-ps.ppd.gz
prnt/ps/hp-cm8050_mfp_with_edgeline-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m725-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz =
prnt/ps/hp-laserjet_p2015_series-ps.ppd.gz
prnt/ps/hp-pagewide_p75050-60-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m277-ps.ppd.gz
prnt/ps/hp-color_laserjet_2800-ps.ppd.gz
prnt/ps/hp-laserjet_100_color_mfp_m175-ps.ppd.gz
prnt/ps/hp-laserjet_m1522n_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_P75250-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
data/rules/hplip-printer@.service =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/systemd/system'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/doc/hplip-3.18.6'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/backend'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 COPYING =
copyright
prnt/hpijs/README_LIBJPG
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/doc/hplip-3.18.6'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c -m 644 prnt/ps/hp-designjet_t7100ps-ps.ppd.gz
prnt/ps/hp-laserjet_2100_series-ps.ppd.gz =
prnt/ps/hp-laserjet_4200-ps.ppd.gz
prnt/ps/hp-laserjet_m1522nf_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_6000ps-ps.ppd.gz =
prnt/ps/hp-color_laserjet_3000-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp1515n-ps.ppd.gz
prnt/ps/hp-laserjet_flow_mfp_m630-ps.ppd.gz =
prnt/ps/hp-laserjet_p3004-ps.ppd.gz
prnt/ps/hp-pagewide_xl_8000ps_blueprinter-ps.ppd.gz
prnt/ps/hp-laserjet_m4345_mfp-ps.ppd.gz =
prnt/ps/hp-laserjet_m9059_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_m551-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025x-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp4005-ps.ppd.gz =
prnt/ps/hp-laserjet_3050-ps.ppd.gz
prnt/ps/hp-laserjet_5200-ps.ppd.gz prnt/ps/hp-designjet_4500mfp.ppd.gz
prnt/ps/hp-color_laserjet_m651-ps.ppd.gz
prnt/ps/hp-laserjet_m4349_mfp-ps.ppd.gz
prnt/ps/hp-business_inkjet_2600-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5520_series-ps.ppd.gz
prnt/ps/hp-laserjet_4mp-ps.ppd.gz
prnt/ps/hp-designjet_t770_postscript-ps.ppd.gz =
prnt/ps/hp-pagewide_xl_5000ps_blueprinter-ps.ppd.gz
prnt/ps/hp-designjet_t7200-ps.ppd.gz
prnt/ps/hp-color_laserjet_9500_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_mfp_m575-ps.ppd.gz
prnt/ps/hp-laserjet_4si-ps.ppd.gz =
prnt/ps/hp-color_laserjet_m855-ps.ppd.gz
prnt/ps/hp-laserjet_1320-ps.ppd.gz =
prnt/ps/hp-designjet_z6810ps_42in-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1312nfi_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_8550-ps.ppd.gz
prnt/ps/hp-cm8060_mfp_with_edgeline-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605dn-ps.ppd.gz =
prnt/ps/hp-color_laserjet_flow_mfp_m880-ps.ppd.gz
prnt/ps/hp-officejet_color_mfp_x585.ppd.gz
prnt/ps/hp-officejet_pro_551_series-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m201_m202-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall =
/home/tykwon/yocto/build/tmp/hosttools/install
-c hp
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/backend'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c hpcups
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/etc/hp'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 hplip.conf
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/etc/hp'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
prnt/ps/hp-pagewide_xl_5000ps-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp6015-ps.ppd.gz
prnt/ps/hp-laserjet_m1522_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_2550_series-ps.ppd.gz
prnt/ps/hp-laserjet_1300n-ps.ppd.gz prnt/ps/hp-laserjet_2300-ps.ppd.gz
prnt/ps/hp-designjet_t3500-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1312_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3390-ps.ppd.gz prnt/ps/hp-laserjet_4-ps.ppd.gz
prnt/ps/hp-pagewide_color_e55650-ps.ppd.gz
prnt/ps/hp-color_laserjet_m153-m154-ps.ppd.gz
prnt/ps/hp-laserjet_1300xi-ps.ppd.gz =
prnt/ps/hp-color_laserjet_cp4020_series-ps.ppd.gz
prnt/ps/hp-pagewide_color_556-ps.ppd.gz
prnt/ps/hp-pagewide_352_printer-ps.ppd.gz
prnt/ps/hp-laserjet_700_m712-ps.ppd.gz
prnt/ps/hp-laserjet_4050_series-ps.ppd.gz
prnt/ps/hp-designjet_t1300_postscript-ps.ppd.gz =
prnt/ps/hp-laserjet_flow_mfp_m525-ps.ppd.gz
prnt/ps/hp-pagewide_color_e75160-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m681_m682-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_400_m401dne-ps.ppd.gz
prnt/ps/hp-color_laserjet_e65050_e65060-ps.ppd.gz
prnt/ps/hp-designjet_4520ps-ps.ppd.gz
prnt/ps/hp-laserjet_flow_mfp_m830-ps.ppd.gz
prnt/ps/hp-color_laserjet_4500-ps.ppd.gz
prnt/ps/hp-laserjet_8100_series-ps.ppd.gz
prnt/ps/hp-pagewide_pro_552_printer-ps.ppd.gz
prnt/ps/hp-laserjet_500_mfp_m525-ps.ppd.gz =
prnt/ps/hp-laserjet_3030-ps.ppd.gz
prnt/ps/hp-business_inkjet_2800-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m501dn-ps.ppd.gz =
prnt/ps/hp-laserjet_6mp-ps.ppd.gz
prnt/ps/hp-pagewide_pro_452_printer-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4500ps_mfp-ps.ppd.gz =
prnt/ps/hp-pagewide_color_765-ps.ppd.gz
prnt/ps/hp-color_laserjet_m552-ps.ppd.gz =
prnt/ps/hp-color_laserjet-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: warning:
'libhpmud.la' has not been installed in '/usr/lib'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_5p-ps.ppd.gz prnt/ps/hp-officejet_pro_8740-ps.ppd.gz
prnt/ps/hp-color_laserjet_2840-ps.ppd.gz =
prnt/ps/hp-laserjet_9050_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025dn-ps.ppd.gz
prnt/ps/hp-laserjet_5100_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_m452-ps.ppd.gz =
prnt/ps/hp-laserjet_4350-ps.ppd.gz
prnt/ps/hp-pagewide_xl_6000ps_mfp-ps.ppd.gz
prnt/ps/hp-designjet_t1700_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_4300-ps.ppd.gz =
prnt/ps/hp-laserjet_9000_series-ps.ppd.gz
prnt/ps/hp-officejet_pro_8210-ps.ppd.gz
prnt/ps/hp-designjet_z6810ps_60in-ps.ppd.gz =
prnt/ps/hp-laserjet_3052-ps.ppd.gz
prnt/ps/hp-designjet_t920-postscript.ppd.gz =
prnt/ps/hp-officejet_pro_8730-ps.ppd.gz
prnt/ps/hp-laserjet_p3005-ps.ppd.gz prnt/ps/hp-laserjet_1300-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_e58650-ps.ppd.gz =
prnt/ps/hp-mopier_240-ps.ppd.gz
prnt/ps/hp-color_laserjet_4650-ps.ppd.gz =
prnt/ps/hp-color_laserjet_mfp_m577-ps.ppd.gz
prnt/ps/hp-color_laserjet_e67550_e67560-ps.ppd.gz
prnt/ps/hp-color_laserjet_3700n-ps.ppd.gz =
prnt/ps/hp-postscript-inkjet.ppd.gz
prnt/ps/hp-laserjet_3200m-ps.ppd.gz =
prnt/ps/hp-laserjet_mfp_m527-ps.ppd.gz
prnt/ps/hp-color_laserjet_9500-ps.ppd.gz =
prnt/ps/hp-pagewide_pro_750-ps.ppd.gz
prnt/ps/hp-laserjet_400_mfp_m425-ps.ppd.gz =
prnt/ps/hp-laserjet_5mp-ps.ppd.gz
prnt/ps/hp-laserjet_m607_m608_m609-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6030_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3380-ps.ppd.gz =
prnt/ps/hp-laserjet_4000_series-ps.ppd.gz
prnt/ps/hp-laserjet_5200lx-ps.ppd.gz =
prnt/ps/hp-color_laserjet_2820-ps.ppd.gz
prnt/ps/hp-designjet_t2500-postscript.ppd.gz
prnt/ps/hp-laserjet_pro_m501n-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c&nbsp;&nbsp; =
hpmudext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hp
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/cups/backend/hp<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_m9050_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm4540_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e87640-50-60-ps.ppd.gz =
prnt/ps/hp-pagewide_pro_577_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_flow_mfp_586-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6049_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_p3010_series-ps.ppd.gz
prnt/ps/hp-officejet_color_x555-ps.ppd.gz =
prnt/ps/hp-pagewide_xl_4500ps-ps.ppd.gz
prnt/ps/hp-laserjet_9065mfp-ps.ppd.gz =
prnt/ps/hp-pagewide_mfp_p57750-ps.ppd.gz
prnt/ps/hp-color_laserjet_m553-ps.ppd.gz
prnt/ps/hp-designjet_t1100ps_24in-ps.ppd.gz
prnt/ps/hp-officejet_pro_276dw_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_780-785-ps.ppd.gz
prnt/ps/hp-color_laserjet_4600-ps.ppd.gz =
prnt/ps/hp-laserjet_5si-ps.ppd.gz
prnt/ps/hp-color_laserjet_2700-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e77822-25-30-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m630-ps.ppd.gz =
prnt/ps/hp-designjet_4020ps-ps.ppd.gz
prnt/ps/hp-officejet_pro_476_576_series-ps.ppd.gz
prnt/ps/hp-designjet_z5600_postscript-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm6040_mfp-ps.ppd.gz
prnt/ps/hp-designjet_z6800_photo-postscript.ppd.gz
prnt/ps/hp-pagewide_p55250-ps.ppd.gz =
prnt/ps/hp-laserjet_1220se-ps.ppd.gz
prnt/ps/hp-color_laserjet_2830-ps.ppd.gz =
prnt/ps/hp-laserjet_5000-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m476-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m426_m427-ps.ppd.gz
prnt/ps/hp-laserjet_cm1410_series-ps.ppd.gz
prnt/ps/hp-laserjet_1320tn-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_e72525-25-30-35-ps.ppd.gz
prnt/ps/hp-designjet_z6200_42in_photo-ps.ppd.gz
prnt/ps/hp-lj_300_400_color_mfp_m375_m475-ps.ppd.gz
prnt/ps/hp-business_inkjet_2280-ps.ppd.gz =
prnt/ps/hp-color_laserjet_cp5225dn-ps.ppd.gz
prnt/ps/hp-designjet_t2300_postscript-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c hpps
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c hpcups =
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/cups/filter/hpcups<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-color_laserjet_4730mfp-ps.ppd.gz
prnt/ps/hp-designjet_z6600-postscript.ppd.gz =
prnt/ps/hp-laserjet_pro_m402_m403d-ps.ppd.gz
prnt/ps/hp-laserjet_4250-ps.ppd.gz prnt/ps/hp-laserjet_4240-ps.ppd.gz
prnt/ps/hp-designjet_t795ps_44in-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm1015-ps.ppd.gz =
prnt/ps/hp-laserjet_8000-ps.ppd.gz
prnt/ps/hp-designjet_4000ps.ppd.gz =
prnt/ps/hp-color_laserjet_cm1017-ps.ppd.gz
prnt/ps/hp-laserjet_m5035_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_m252-ps.ppd.gz =
prnt/ps/hp-laserjet_2200-ps.ppd.gz
prnt/ps/hp-officejet_pro_8000_enterprise_a811a-ps.ppd.gz
prnt/ps/hp-laserjet_500_color_mfp_m570-ps.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m377-ps.ppd.gz
prnt/ps/hp-color_laserjet_4550-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320nf_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_3020-ps.ppd.gz =
prnt/ps/hp-color_laserjet_5500-ps.ppd.gz
prnt/ps/hp-laserjet_m2727_mfp_series-ps.ppd.gz
prnt/ps/hp-designjet_t1120ps_24in-ps.ppd.gz
prnt/ps/hp-lj_300_400_color_m351_m451-ps.ppd.gz
prnt/ps/hp-color_laserjet_m652_m653-ps.ppd.gz
prnt/ps/hp-laserjet_200_colormfp_m275-ps.ppd.gz
prnt/ps/hp-laserjet_1320nw-ps.ppd.gz =
prnt/ps/hp-color_laserjet_4700-ps.ppd.gz
prnt/ps/hp-designjet_z6610ps_60in-ps.ppd.gz =
prnt/ps/hp-laserjet_3015-ps.ppd.gz
prnt/ps/hp-laserjet_4ml-ps.ppd.gz prnt/ps/hp-laserjet_4_plus-ps.ppd.gz
prnt/ps/hp-laserjet_m3027_mfp-ps.ppd.gz =
prnt/ps/hp-laserjet_9055mfp-ps.ppd.gz
prnt/ps/hp-laserjet_m1530_mfp_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_4610-ps.ppd.gz
prnt/ps/hp-laserjet_p4010_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025n-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4000ps_mfp-ps.ppd.gz =
prnt/ps/hp-pagewide_P77440_P77940-60-ps.ppd.gz
prnt/ps/hp-business_inkjet_2300-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hpmudext.so
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/hpmudext.so<o:p></o:p></sp=
an></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/hpmudext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/hpmudext.la<o:p></o:p></sp=
an></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_1200n-ps.ppd.gz =
prnt/ps/hp-laserjet_8100_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m203_m206-ps.ppd.gz
prnt/ps/hp-designjet_z2600_postscript-ps.ppd.gz
prnt/ps/hp-designjet_z5400-postscript.ppd.gz
prnt/ps/hp-laserjet_4345_mfp-ps.ppd.gz
prnt/ps/hp-officejet_pro_251dw_printer-ps.ppd.gz
prnt/ps/hp-laserjet_e62555-e62575-ps.ppd.gz
prnt/ps/hp-laserjet_3300_3310_3320-ps.ppd.gz =
prnt/ps/hp-laserjet_2200_series-ps.ppd.gz
prnt/ps/hp-laserjet_pro_mfp_m227-m231-ps.ppd.gz
prnt/ps/hp-laserjet_6p-ps.ppd.gz prnt/ps/hp-laserjet_1220-ps.ppd.gz
prnt/ps/hp-designjet_t790ps_44in-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m178-m181-ps.ppd.gz =
prnt/ps/hp-laserjet_mfp_e82540-50-60-ps.ppd.gz
prnt/ps/hp-color_laserjet_2500_series-ps.ppd.gz
prnt/ps/hp-laserjet_9040_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_pro_mfp_772-777-ps.ppd.gz
prnt/ps/hp-laserjet_1320_series-ps.ppd.gz =
prnt/ps/hp-color_laserjet_2500-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m278-m281-ps.ppd.gz
prnt/ps/hp-laserjet_400_m401-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp3505-ps.ppd.gz
prnt/ps/hp-laserjet_600_m601_m602_m603-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm2320fxi_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_4000ps-ps.ppd.gz
prnt/ps/hp-color_laserjet_5550-ps.ppd.gz =
prnt/ps/hp-designjet_4520mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp5225n-ps.ppd.gz =
prnt/ps/hp-laserjet_1320n-ps.ppd.gz
prnt/ps/hp-laserjet_2420-ps.ppd.gz prnt/ps/hp-designjet_d5800-ps.ppd.gz
prnt/ps/hp-color_laserjet_5m-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605dtn-ps.ppd.gz
prnt/ps/hp-color_laserjet_4600_series-ps.ppd.gz
prnt/ps/hp-laserjet_m604_m605_m606-ps.ppd.gz
prnt/ps/hp-laserjet_200_color_m251-ps.ppd.gz =
prnt/ps/hp-laserjet_2300_series-ps.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c locatedriver =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/hplip'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: warning:
remember to run 'arm-poky-linux-gnueabi-libtool --finish
/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c hpps
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/cups/filter/hpps<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
./arm-poky-linux-gnueabi-libtool&nbsp;&nbsp; --mode=3Dinstall
/home/tykwon/yocto/build/tmp/hosttools/install -c&nbsp;&nbsp; =
pcardext.la
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/mkdir -p
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-color_laserjet_cm4730_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_377_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp2025-ps.ppd.gz
prnt/ps/hp-pagewide_xl_8000ps-ps.ppd.gz =
prnt/ps/hp-laserjet_200_colormfp_m276-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp3525-ps.ppd.gz
prnt/ps/hp-laserjet_pro_mfp_m435-ps.ppd.gz
prnt/ps/hp-pagewide_mfp_p77740-60zs-ps.ppd.gz
prnt/ps/hp-laserjet_p2055_series-ps.ppd.gz
prnt/ps/hp-laserjet_cp1520_series-ps.ppd.gz =
prnt/ps/hp-color_laserjet_3800-ps.ppd.gz
prnt/ps/hp-designjet_t1200_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_m4555_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_8500-ps.ppd.gz =
prnt/ps/hp-laserjet_9040-ps.ppd.gz
prnt/ps/hp-laserjet_2410-ps.ppd.gz =
prnt/ps/hp-laserjet_m9040_mfp-ps.ppd.gz
prnt/ps/hp-laserjet_2430-ps.ppd.gz =
prnt/ps/hp-color_laserjet_cp5225-ps.ppd.gz
prnt/ps/hp-laserjet_mfp_m521-ps.ppd.gz
prnt/ps/hp-color_laserjet_m253-m254-ps.ppd.gz =
prnt/ps/hp-mopier_320-ps.ppd.gz
prnt/ps/hp-laserjet_color_flow_mfp_m575-ps.ppd.gz =
prnt/ps/hp-laserjet_pro_m706-ps.ppd.gz
prnt/ps/hp-laserjet_m806-ps.ppd.gz prnt/ps/hp-postscript-laserjet.ppd.gz
prnt/ps/hp-color_laserjet_pro_mfp_m477d-ps.ppd.gz
prnt/ps/hp-designjet_z6100ps_60in_photo-ps.ppd.gz
prnt/ps/hp-designjet_t770ps_24in-ps.ppd.gz =
prnt/ps/hp-pagewide_pro_477_mfp-ps.ppd.gz
prnt/ps/hp-designjet_z5200_postscript-ps.ppd.gz
prnt/ps/hp-laserjet_2100-ps.ppd.gz =
prnt/ps/hp-laserjet_9000_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_mfp_m274-ps.ppd.gz
prnt/ps/hp-laserjet_pro_m402_m403-ps.ppd.gz =
prnt/ps/hp-color_laserjet_mfp_m680-ps.ppd.gz
prnt/ps/hp-laserjet_4100_mfp-ps.ppd.gz
prnt/ps/hp-color_laserjet_cm3530_mfp-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5100ps_mfp_blueprinter-ps.ppd.gz
prnt/ps/hp-pagewide_color_mfp_586-ps.ppd.gz =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
prnt/ps/hp-laserjet_8150_mfp-ps.ppd.gz =
prnt/ps/hp-laserjet_5200l-ps.ppd.gz
prnt/ps/hp-laserjet_4v-ps.ppd.gz =
prnt/ps/hp-laserjet_pro_mfp_m225_m226-ps.ppd.gz
prnt/ps/hp-laserjet_4100_series-ps.ppd.gz =
prnt/ps/hp-laserjet_9050-ps.ppd.gz
prnt/ps/hp-color_laserjet_2605-ps.ppd.gz
prnt/ps/hp-laserjet_700_color_mfp_m775-ps.ppd.gz
prnt/ps/hp-pagewide_xl_5000ps_mfp-ps.ppd.gz =
prnt/ps/hp-laserjet_mfp_m631_m632_m633-ps.ppd.gz
prnt/ps/hp-laserjet_8000_series-ps.ppd.gz
prnt/ps/hp-color_laserjet_cp1518ni-ps.ppd.gz
prnt/ps/hp-color_laserjet_m750-ps.ppd.gz ppd/hpcups/apollo-2100.ppd.gz
ppd/hpcups/apollo-2150.ppd.gz ppd/hpcups/apollo-2200.ppd.gz =
ppd/hpcups/apollo-2500.ppd.gz
ppd/hpcups/apollo-2600.ppd.gz ppd/hpcups/apollo-2650.ppd.gz
ppd/hpcups/apollo-p2000-u.ppd.gz ppd/hpcups/apollo-p2250.ppd.gz
ppd/hpcups/hp-2000c.ppd.gz ppd/hpcups/hp-2500c.ppd.gz =
ppd/hpcups/hp-910.ppd.gz
ppd/hpcups/hp-915.ppd.gz ppd/hpcups/hp-amp.ppd.gz
ppd/hpcups/hp-business_inkjet_1000.ppd.gz
ppd/hpcups/hp-business_inkjet_1100.ppd.gz
ppd/hpcups/hp-business_inkjet_1200.ppd.gz
ppd/hpcups/hp-business_inkjet_2200.ppd.gz
ppd/hpcups/hp-business_inkjet_2230.ppd.gz =
ppd/hpcups/hp-business_inkjet_2250-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2280-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2300-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2600-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_2800-pcl3.ppd.gz
ppd/hpcups/hp-business_inkjet_3000-pcl3.ppd.gz
ppd/hpcups/hp-color_inkjet_cp1700.ppd.gz
ppd/hpcups/hp-color_inkjet_printer_cp1700.ppd.gz
ppd/hpcups/hp-color_laserjet_1600.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c fax/filters/pstotiff
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/lib/cups/filter'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c locatedriver
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/share/hplip/locatedriver<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/pcardext.so =
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/pcardext.so<o:p></o:p></sp=
an></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: install:
/home/tykwon/yocto/build/tmp/hosttools/install -c .libs/pcardext.lai
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/image/usr/lib/python2.7/site-packages/pcardext.la<o:p></o:p></sp=
an></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
arm-poky-linux-gnueabi-libtool: warning:
remember to run 'arm-poky-linux-gnueabi-libtool --finish
/usr/lib/python2.7/site-packages'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c -m 644 ppd/hpcups/hp-color_laserjet_2500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_2500_series.ppd.gz
ppd/hpcups/hp-color_laserjet_2600n.ppd.gz
ppd/hpcups/hp-color_laserjet_3000-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_3500n.ppd.gz
ppd/hpcups/hp-color_laserjet_3500.ppd.gz
ppd/hpcups/hp-color_laserjet_3550n.ppd.gz
ppd/hpcups/hp-color_laserjet_3550.ppd.gz
ppd/hpcups/hp-color_laserjet_3600.ppd.gz
ppd/hpcups/hp-color_laserjet_3700n.ppd.gz =
ppd/hpcups/hp-color_laserjet_3700-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_3800-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4600-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4600_series.ppd.gz =
ppd/hpcups/hp-color_laserjet_4610-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4650-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4700-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_4730mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5500-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_5550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5m-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_5.ppd.gz
ppd/hpcups/hp-color_laserjet_8500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_8550-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_9500_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_9500-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm1312_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm1312nfi_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320fxi_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_cm2320nf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm2320n_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm3530_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm4540_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm4730_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_cm6030_mfp-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cm6040_mfp.ppd.gz
ppd/hpcups/hp-color_laserjet_cm6049_mfp.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp; =
/home/tykwon/yocto/build/tmp/hosttools/install
-c -m 644 ppd/hpcups/hp-color_laserjet_cp1215.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1217.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1514n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp1515n-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_cp1518ni-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025dn-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp2025x-pcl3.ppd.gz =
ppd/hpcups/hp-color_laserjet_cp3505-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp3525-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4005-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4020_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp4520_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225dn-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225n-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5225-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp5520_series-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_cp6015-pcl3.ppd.gz
ppd/hpcups/hp-color_laserjet_pro_mfp_m176n.ppd.gz
ppd/hpcups/hp-color_laserjet_pro_mfp_m177fw.ppd.gz =
ppd/hpcups/hp-cp1160.ppd.gz
ppd/hpcups/hp-deskjet_1000_j110_series.ppd.gz
ppd/hpcups/hp-deskjet_1010_series.ppd.gz
ppd/hpcups/hp-deskjet_1050_j410_series.ppd.gz =
ppd/hpcups/hp-deskjet_1100.ppd.gz
ppd/hpcups/hp-deskjet_1110_series.ppd.gz =
ppd/hpcups/hp-deskjet_1120.ppd.gz
ppd/hpcups/hp-deskjet_1125.ppd.gz ppd/hpcups/hp-deskjet_1200c.ppd.gz
ppd/hpcups/hp-deskjet_1220c.ppd.gz ppd/hpcups/hp-deskjet_1280.ppd.gz
ppd/hpcups/hp-deskjet_1510_series.ppd.gz =
ppd/hpcups/hp-deskjet_1600cm.ppd.gz
ppd/hpcups/hp-deskjet_1600cn.ppd.gz ppd/hpcups/hp-deskjet_1600c.ppd.gz
ppd/hpcups/hp-deskjet_2000_j210_series.ppd.gz
ppd/hpcups/hp-deskjet_2020_series.ppd.gz
ppd/hpcups/hp-deskjet_2050_j510_series.ppd.gz =
ppd/hpcups/hp-deskjet_2130_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_2200_series.ppd.gz =
ppd/hpcups/hp-deskjet_2510_series.ppd.gz
ppd/hpcups/hp-deskjet_2520_series.ppd.gz
ppd/hpcups/hp-deskjet_2540_series.ppd.gz
ppd/hpcups/hp-deskjet_2600_series.ppd.gz
ppd/hpcups/hp-deskjet_2640_series.ppd.gz
ppd/hpcups/hp-deskjet_3000_j310_series.ppd.gz =
ppd/hpcups/hp-deskjet_3050a_j611_series.ppd.gz
ppd/hpcups/hp-deskjet_3050_j610_series.ppd.gz
ppd/hpcups/hp-deskjet_3070_b611_series.ppd.gz =
ppd/hpcups/hp-deskjet_3320.ppd.gz
ppd/hpcups/hp-deskjet_3325.ppd.gz ppd/hpcups/hp-deskjet_3420.ppd.gz
ppd/hpcups/hp-deskjet_3425.ppd.gz ppd/hpcups/hp-deskjet_3450.ppd.gz
ppd/hpcups/hp-deskjet_3500.ppd.gz =
ppd/hpcups/hp-deskjet_3510_series.ppd.gz
ppd/hpcups/hp-deskjet_3520_series.ppd.gz
ppd/hpcups/hp-deskjet_3540_series.ppd.gz =
ppd/hpcups/hp-deskjet_3550.ppd.gz
ppd/hpcups/hp-deskjet_3600.ppd.gz =
ppd/hpcups/hp-deskjet_3630_series.ppd.gz
ppd/hpcups/hp-deskjet_3650.ppd.gz =
ppd/hpcups/hp-deskjet_3700_series.ppd.gz
ppd/hpcups/hp-deskjet_3740.ppd.gz ppd/hpcups/hp-deskjet_3810.ppd.gz
ppd/hpcups/hp-deskjet_3816.ppd.gz ppd/hpcups/hp-deskjet_3819.ppd.gz =
ppd/hpcups/hp-deskjet_3820.ppd.gz
ppd/hpcups/hp-deskjet_3822.ppd.gz =
ppd/hpcups/hp-deskjet_3830_series.ppd.gz
ppd/hpcups/hp-deskjet_3840.ppd.gz ppd/hpcups/hp-deskjet_3870.ppd.gz
ppd/hpcups/hp-deskjet_3900.ppd.gz ppd/hpcups/hp-deskjet_3910.ppd.gz
ppd/hpcups/hp-deskjet_3920.ppd.gz ppd/hpcups/hp-deskjet_3940.ppd.gz
ppd/hpcups/hp-deskjet_400l.ppd.gz ppd/hpcups/hp-deskjet_400.ppd.gz
ppd/hpcups/hp-deskjet_4510_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_4530_series.ppd.gz =
ppd/hpcups/hp-deskjet_460.ppd.gz
ppd/hpcups/hp-deskjet_4610_series.ppd.gz
ppd/hpcups/hp-deskjet_4620_series.ppd.gz =
ppd/hpcups/hp-deskjet_4640_series.ppd.gz
ppd/hpcups/hp-deskjet_4670_series.ppd.gz
ppd/hpcups/hp-deskjet_4720_series.ppd.gz
ppd/hpcups/hp-deskjet_5000_series.ppd.gz =
ppd/hpcups/hp-deskjet_500c.ppd.gz
ppd/hpcups/hp-deskjet_500.ppd.gz ppd/hpcups/hp-deskjet_505j.ppd.gz
ppd/hpcups/hp-deskjet_5100.ppd.gz ppd/hpcups/hp-deskjet_510.ppd.gz
ppd/hpcups/hp-deskjet_5200_series.ppd.gz =
ppd/hpcups/hp-deskjet_520.ppd.gz
ppd/hpcups/hp-deskjet_5400_series.ppd.gz =
ppd/hpcups/hp-deskjet_540.ppd.gz
ppd/hpcups/hp-deskjet_550c.ppd.gz =
ppd/hpcups/hp-deskjet_5520_series.ppd.gz
ppd/hpcups/hp-deskjet_5550.ppd.gz ppd/hpcups/hp-deskjet_5551.ppd.gz
ppd/hpcups/hp-deskjet_5552.ppd.gz =
ppd/hpcups/hp-deskjet_5570_series.ppd.gz
ppd/hpcups/hp-deskjet_5600.ppd.gz =
ppd/hpcups/hp-deskjet_5640_series.ppd.gz
ppd/hpcups/hp-deskjet_5650.ppd.gz ppd/hpcups/hp-deskjet_5652.ppd.gz
ppd/hpcups/hp-deskjet_5700.ppd.gz =
ppd/hpcups/hp-deskjet_5730_series.ppd.gz
ppd/hpcups/hp-deskjet_5800.ppd.gz =
ppd/hpcups/hp-deskjet_5810_series.ppd.gz
ppd/hpcups/hp-deskjet_5820_series.ppd.gz =
ppd/hpcups/hp-deskjet_5850.ppd.gz
ppd/hpcups/hp-deskjet_5900_series.ppd.gz =
ppd/hpcups/hp-deskjet_600.ppd.gz
ppd/hpcups/hp-deskjet_610cl.ppd.gz ppd/hpcups/hp-deskjet_610c.ppd.gz
ppd/hpcups/hp-deskjet_6120.ppd.gz ppd/hpcups/hp-deskjet_6122.ppd.gz
ppd/hpcups/hp-deskjet_6127.ppd.gz =
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_612c.ppd.gz ppd/hpcups/hp-deskjet_630c.ppd.gz
ppd/hpcups/hp-deskjet_632c.ppd.gz ppd/hpcups/hp-deskjet_640c.ppd.gz
ppd/hpcups/hp-deskjet_648c.ppd.gz ppd/hpcups/hp-deskjet_6500.ppd.gz
ppd/hpcups/hp-deskjet_6520_series.ppd.gz =
ppd/hpcups/hp-deskjet_656c.ppd.gz
ppd/hpcups/hp-deskjet_6600.ppd.gz ppd/hpcups/hp-deskjet_660.ppd.gz =
ppd/hpcups/hp-deskjet_670c.ppd.gz
ppd/hpcups/hp-deskjet_670.ppd.gz ppd/hpcups/hp-deskjet_670tv.ppd.gz
ppd/hpcups/hp-deskjet_672c.ppd.gz ppd/hpcups/hp-deskjet_6800.ppd.gz
ppd/hpcups/hp-deskjet_680.ppd.gz ppd/hpcups/hp-deskjet_682.ppd.gz
ppd/hpcups/hp-deskjet_690c.ppd.gz ppd/hpcups/hp-deskjet_690.ppd.gz
ppd/hpcups/hp-deskjet_692.ppd.gz ppd/hpcups/hp-deskjet_693.ppd.gz
ppd/hpcups/hp-deskjet_6940_series.ppd.gz =
ppd/hpcups/hp-deskjet_694.ppd.gz
ppd/hpcups/hp-deskjet_695.ppd.gz ppd/hpcups/hp-deskjet_697.ppd.gz =
ppd/hpcups/hp-deskjet_6980_series.ppd.gz
ppd/hpcups/hp-deskjet_810c.ppd.gz ppd/hpcups/hp-deskjet_812c.ppd.gz
ppd/hpcups/hp-deskjet_815c.ppd.gz ppd/hpcups/hp-deskjet_816c.ppd.gz
ppd/hpcups/hp-deskjet_825c.ppd.gz ppd/hpcups/hp-deskjet_830c.ppd.gz
ppd/hpcups/hp-deskjet_832c.ppd.gz ppd/hpcups/hp-deskjet_840c.ppd.gz
ppd/hpcups/hp-deskjet_841c.ppd.gz ppd/hpcups/hp-deskjet_842c.ppd.gz
ppd/hpcups/hp-deskjet_843c.ppd.gz ppd/hpcups/hp-deskjet_845c.ppd.gz
ppd/hpcups/hp-deskjet_850c.ppd.gz ppd/hpcups/hp-deskjet_855c.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-deskjet_870c.ppd.gz ppd/hpcups/hp-deskjet_880c.ppd.gz
ppd/hpcups/hp-deskjet_882c.ppd.gz ppd/hpcups/hp-deskjet_890c.ppd.gz
ppd/hpcups/hp-deskjet_895c.ppd.gz ppd/hpcups/hp-deskjet_916c.ppd.gz
ppd/hpcups/hp-deskjet_920c.ppd.gz ppd/hpcups/hp-deskjet_9300.ppd.gz
ppd/hpcups/hp-deskjet_930c.ppd.gz ppd/hpcups/hp-deskjet_932c.ppd.gz =
ppd/hpcups/hp-deskjet_933c.ppd.gz
ppd/hpcups/hp-deskjet_934c.ppd.gz ppd/hpcups/hp-deskjet_935c.ppd.gz
ppd/hpcups/hp-deskjet_940c.ppd.gz ppd/hpcups/hp-deskjet_948c.ppd.gz
ppd/hpcups/hp-deskjet_950c.ppd.gz ppd/hpcups/hp-deskjet_952c.ppd.gz
ppd/hpcups/hp-deskjet_955c.ppd.gz ppd/hpcups/hp-deskjet_957c.ppd.gz
ppd/hpcups/hp-deskjet_959c.ppd.gz ppd/hpcups/hp-deskjet_9600.ppd.gz
ppd/hpcups/hp-deskjet_960c.ppd.gz ppd/hpcups/hp-deskjet_970c.ppd.gz
ppd/hpcups/hp-deskjet_975c.ppd.gz ppd/hpcups/hp-deskjet_9800.ppd.gz =
ppd/hpcups/hp-deskjet_980c.ppd.gz
ppd/hpcups/hp-deskjet_990c.ppd.gz ppd/hpcups/hp-deskjet_995c.ppd.gz
ppd/hpcups/hp-deskjet_d1300_series.ppd.gz
ppd/hpcups/hp-deskjet_d1400_series.ppd.gz
ppd/hpcups/hp-deskjet_d1500_series.ppd.gz =
ppd/hpcups/hp-deskjet_d1600_series.ppd.gz
ppd/hpcups/hp-deskjet_d2300_series.ppd.gz
ppd/hpcups/hp-deskjet_d2400_series.ppd.gz
ppd/hpcups/hp-deskjet_d2500_series.ppd.gz
ppd/hpcups/hp-deskjet_d2600_series.ppd.gz
ppd/hpcups/hp-deskjet_d4100_series.ppd.gz =
ppd/hpcups/hp-deskjet_d4200_series.ppd.gz
ppd/hpcups/hp-deskjet_d4300_series.ppd.gz
ppd/hpcups/hp-deskjet_d5500_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
ppd/hpcups/hp-deskjet_d730.ppd.gz
ppd/hpcups/hp-deskjet_f2100_series.ppd.gz
ppd/hpcups/hp-deskjet_f2200_series.ppd.gz
ppd/hpcups/hp-deskjet_f2400_series.ppd.gz
ppd/hpcups/hp-deskjet_f300_series.ppd.gz
ppd/hpcups/hp-deskjet_f4100_series.ppd.gz =
ppd/hpcups/hp-deskjet_f4200_series.ppd.gz
ppd/hpcups/hp-deskjet_f4210_series.ppd.gz
ppd/hpcups/hp-deskjet_f4213_series.ppd.gz
ppd/hpcups/hp-deskjet_f4400_series.ppd.gz
ppd/hpcups/hp-deskjet_f4500_series.ppd.gz =
ppd/hpcups/hp-deskjet_f735.ppd.gz
ppd/hpcups/hp-deskjet_ink_adv_2010_k010.ppd.gz
ppd/hpcups/hp-deskjet_ink_adv_2060_k110.ppd.gz
ppd/hpcups/hp-deskjet_ink_advant_k109a-z.ppd.gz
ppd/hpcups/hp-deskjet_ink_advant_k209a-z.ppd.gz =
ppd/hpcups/hp-dj350.ppd.gz
ppd/hpcups/hp-dj450.ppd.gz ppd/hpcups/hp-envy_100_d410_series.ppd.gz
ppd/hpcups/hp-envy_110_series.ppd.gz =
ppd/hpcups/hp-envy_120_series.ppd.gz
ppd/hpcups/hp-envy_4500_series.ppd.gz =
ppd/hpcups/hp-envy_4510_series.ppd.gz
ppd/hpcups/hp-envy_4520_series.ppd.gz =
ppd/hpcups/hp-envy_5000_series.ppd.gz
ppd/hpcups/hp-envy_5530_series.ppd.gz =
ppd/hpcups/hp-envy_5540_series.ppd.gz
ppd/hpcups/hp-envy_5640_series.ppd.gz =
ppd/hpcups/hp-envy_5660_series.ppd.gz
ppd/hpcups/hp-envy_7640_series.ppd.gz =
ppd/hpcups/hp-envy_8000_series.ppd.gz
ppd/hpcups/hp-envy_photo_6200_series.ppd.gz =
ppd/hpcups/hp-envy_photo_7100_series.ppd.gz
ppd/hpcups/hp-envy_photo_7800_series.ppd.gz =
ppd/hpcups/hp-laserjet_1000.ppd.gz
ppd/hpcups/hp-laserjet_1005_series.ppd.gz =
ppd/hpcups/hp-laserjet_1010.ppd.gz
ppd/hpcups/hp-laserjet_1012.ppd.gz ppd/hpcups/hp-laserjet_1015.ppd.gz
ppd/hpcups/hp-laserjet_1018.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_1020.ppd.gz =
ppd/hpcups/hp-laserjet_1022n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1022nw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1022-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_1100a.ppd.gz
ppd/hpcups/hp-laserjet_1100.ppd.gz ppd/hpcups/hp-laserjet_1100xi.ppd.gz
ppd/hpcups/hp-laserjet_1150.ppd.gz ppd/hpcups/hp-laserjet_1160.ppd.gz
ppd/hpcups/hp-laserjet_1160_series.ppd.gz =
ppd/hpcups/hp-laserjet_1200n.ppd.gz
ppd/hpcups/hp-laserjet_1200-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_1220-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1220se.ppd.gz =
ppd/hpcups/hp-laserjet_1300n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1300-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_1300xi-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_1320n.ppd.gz
ppd/hpcups/hp-laserjet_1320nw.ppd.gz ppd/hpcups/hp-laserjet_1320.ppd.gz
ppd/hpcups/hp-laserjet_1320_series-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_1320tn.ppd.gz
ppd/hpcups/hp-laserjet_2100.ppd.gz
ppd/hpcups/hp-laserjet_2100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2200-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2200_series.ppd.gz
ppd/hpcups/hp-laserjet_2300-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_2300_series.ppd.gz
ppd/hpcups/hp-laserjet_2410-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_2420-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_2430-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_3015-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3020-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_3030-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3050-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_3052-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3055.ppd.gz ppd/hpcups/hp-laserjet_3100.ppd.gz
ppd/hpcups/hp-laserjet_3150.ppd.gz =
ppd/hpcups/hp-laserjet_3200m-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_3200.ppd.gz ppd/hpcups/hp-laserjet_3200se.ppd.gz
ppd/hpcups/hp-laserjet_3300_3310_3320-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3330.ppd.gz =
ppd/hpcups/hp-laserjet_3380-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_3390-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_3392.ppd.gz
ppd/hpcups/hp-laserjet_4000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4050_series-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_4100_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4150_series.ppd.gz
ppd/hpcups/hp-laserjet_4200-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_4240-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4250-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_4300-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4345_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4350-pcl3.ppd.gz ppd/hpcups/hp-laserjet_4l.ppd.gz
ppd/hpcups/hp-laserjet_4ml.ppd.gz ppd/hpcups/hp-laserjet_4mp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4_plus-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_4si-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_4v-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5000.ppd.gz
ppd/hpcups/hp-laserjet_5000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_5200l-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_5200lx.ppd.gz
ppd/hpcups/hp-laserjet_5200-pcl3.ppd.gz ppd/hpcups/hp-laserjet_5l.ppd.gz
ppd/hpcups/hp-laserjet_5mp-pcl3.ppd.gz ppd/hpcups/hp-laserjet_5p.ppd.gz
ppd/hpcups/hp-laserjet_5si_mopier-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_5si-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_6l.ppd.gz ppd/hpcups/hp-laserjet_6mp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_6p.ppd.gz ppd/hpcups/hp-laserjet_8000.ppd.gz
ppd/hpcups/hp-laserjet_8000_series-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_8100_mfp.ppd.gz
ppd/hpcups/hp-laserjet_8100_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_8150_mfp.ppd.gz =
ppd/hpcups/hp-laserjet_8150_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9000_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9000_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9040_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9040-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9050_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_9050-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9055mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_9065mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1411fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1412fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1413fn-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_cm1415fn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1415fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1416fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1417fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cm1418fnw-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_cp_1025nw.ppd.gz =
ppd/hpcups/hp-laserjet_cp1025nw.ppd.gz
ppd/hpcups/hp-laserjet_cp_1025.ppd.gz =
ppd/hpcups/hp-laserjet_cp1025.ppd.gz
ppd/hpcups/hp-laserjet_m1005.ppd.gz =
ppd/hpcups/hp-laserjet_m101-m106.ppd.gz
ppd/hpcups/hp-laserjet_m1120_mfp.ppd.gz =
ppd/hpcups/hp-laserjet_m1120n_mfp.ppd.gz
ppd/hpcups/hp-laserjet_m1319f_mfp.ppd.gz =
ppd/hpcups/hp-laserjet_m14-m17.ppd.gz
ppd/hpcups/hp-laserjet_m1522nf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m1537dnf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m1538dnf_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_m1539dnf_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m2727_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m3027_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m3035_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m4345_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m4349_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_m5025_mfp-pcl3.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_m5035_mfp-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_m5039_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9040_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9050_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_m9059_mfp-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_mfp_m129-m134.ppd.gz =
ppd/hpcups/hp-laserjet_mfp_m28-m31.ppd.gz
ppd/hpcups/hp-laserjet_p1005.ppd.gz ppd/hpcups/hp-laserjet_p1006.ppd.gz
ppd/hpcups/hp-laserjet_p1007.ppd.gz ppd/hpcups/hp-laserjet_p1008.ppd.gz
ppd/hpcups/hp-laserjet_p1009.ppd.gz =
ppd/hpcups/hp-laserjet_p1505n-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p1505.ppd.gz =
ppd/hpcups/hp-laserjet_p2014n-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p2014-zxs.ppd.gz
ppd/hpcups/hp-laserjet_p2015dn_series.ppd.gz
ppd/hpcups/hp-laserjet_p2015d_series.ppd.gz
ppd/hpcups/hp-laserjet_p2015n_series.ppd.gz =
ppd/hpcups/hp-laserjet_p2015_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2015x_series.ppd.gz
ppd/hpcups/hp-laserjet_p2035n-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2035-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055dn-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055d-pcl3.ppd.gz =
ppd/hpcups/hp-laserjet_p2055-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p2055x-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3004-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3005-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p3010_series-pcl3.ppd.gz
ppd/hpcups/hp-laserjet_p4014dn.ppd.gz =
ppd/hpcups/hp-laserjet_p4014n.ppd.gz ppd/hpcups/hp-laserjet_p4014.ppd.gz
ppd/hpcups/hp-laserjet_p4015dn.ppd.gz =
ppd/hpcups/hp-laserjet_p4015n.ppd.gz
ppd/hpcups/hp-laserjet_p4015.ppd.gz =
ppd/hpcups/hp-laserjet_p4015tn.ppd.gz
ppd/hpcups/hp-laserjet_p4015x.ppd.gz =
ppd/hpcups/hp-laserjet_p4515n.ppd.gz
ppd/hpcups/hp-laserjet_p4515.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_p4515tn.ppd.gz =
ppd/hpcups/hp-laserjet_p4515xm.ppd.gz
ppd/hpcups/hp-laserjet_p4515x.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1132_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1136_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1137_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1138_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1139_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1212nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1213nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1214nfh_mfp.ppd.gz =
ppd/hpcups/hp-laserjet_professional_m1216nfh_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1217nfw_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1218nfg_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1218nfs_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nfg_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nf_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_m1219nfs_mfp.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1102.ppd.gz
ppd/hpcups/hp-laserjet_professional_p_1102w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1102w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1106.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1106w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1107.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1107w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1108.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1108w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1109.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1109w.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1566.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1567.ppd.gz =
ppd/hpcups/hp-laserjet_professional_p1568.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1569.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1606dn.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1607dn.ppd.gz
ppd/hpcups/hp-laserjet_professional_p1608dn.ppd.gz =
ppd/hpcups/hp-laserjet_professional_p1609dn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125nr.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125nw.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-laserjet_pro_mfp_m125rnw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125r.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m125s.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m126a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m126nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fp.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fs.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m127fw.ppd.gz =
ppd/hpcups/hp-laserjet_pro_mfp_m128fn.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m128fp.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m128fw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m25a.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m25nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m26a.ppd.gz =
ppd/hpcups/hp-laserjet_pro_mfp_m26nw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m27cnw.ppd.gz
ppd/hpcups/hp-laserjet_pro_mfp_m27c.ppd.gz =
ppd/hpcups/hp-mopier_240-pcl3.ppd.gz
ppd/hpcups/hp-mopier_320-pcl3.ppd.gz
ppd/hpcups/hp-officejet_100_mobile_l411.ppd.gz =
ppd/hpcups/hp-officejet_150_mobile_l511.ppd.gz
ppd/hpcups/hp-officejet_200_mobile_series.ppd.gz
ppd/hpcups/hp-officejet_250_mobile_series.ppd.gz
ppd/hpcups/hp-officejet_2620_series.ppd.gz
ppd/hpcups/hp-officejet_3830_series.ppd.gz
ppd/hpcups/hp-officejet_4000_k210.ppd.gz =
ppd/hpcups/hp-officejet_4100_series.ppd.gz
ppd/hpcups/hp-officejet_4105.ppd.gz =
ppd/hpcups/hp-officejet_4115_series.ppd.gz
ppd/hpcups/hp-officejet_4200_series.ppd.gz =
ppd/hpcups/hp-officejet_4255.ppd.gz
ppd/hpcups/hp-officejet_4300_series.ppd.gz =
ppd/hpcups/hp-officejet_4400_k410.ppd.gz
ppd/hpcups/hp-officejet_4500_g510a-f.ppd.gz
ppd/hpcups/hp-officejet_4500_g510g-m.ppd.gz
ppd/hpcups/hp-officejet_4500_g510n-z.ppd.gz
ppd/hpcups/hp-officejet_4500_k710.ppd.gz
ppd/hpcups/hp-officejet_4610_series.ppd.gz =
ppd/hpcups/hp-officejet_4620_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_4630_series.ppd.gz =
ppd/hpcups/hp-officejet_4650_series.ppd.gz
ppd/hpcups/hp-officejet_5100_series.ppd.gz =
ppd/hpcups/hp-officejet_5105.ppd.gz
ppd/hpcups/hp-officejet_5110.ppd.gz ppd/hpcups/hp-officejet_5110v.ppd.gz
ppd/hpcups/hp-officejet_5200_series.ppd.gz =
ppd/hpcups/hp-officejet_5500_series.ppd.gz
ppd/hpcups/hp-officejet_5600_series.ppd.gz
ppd/hpcups/hp-officejet_5740_series.ppd.gz
ppd/hpcups/hp-officejet_6000_e609a.ppd.gz
ppd/hpcups/hp-officejet_6000_e609n.ppd.gz =
ppd/hpcups/hp-officejet_6100.ppd.gz
ppd/hpcups/hp-officejet_6100_series.ppd.gz
ppd/hpcups/hp-officejet_6150_series.ppd.gz
ppd/hpcups/hp-officejet_6200_series.ppd.gz
ppd/hpcups/hp-officejet_6300_series.ppd.gz
ppd/hpcups/hp-officejet_6500_e709a.ppd.gz
ppd/hpcups/hp-officejet_6500_e709n.ppd.gz
ppd/hpcups/hp-officejet_6500_e710a-f.ppd.gz
ppd/hpcups/hp-officejet_6500_e710n-z.ppd.gz =
ppd/hpcups/hp-officejet_6600.ppd.gz
ppd/hpcups/hp-officejet_6700.ppd.gz ppd/hpcups/hp-officejet_6800.ppd.gz
ppd/hpcups/hp-officejet_6950.ppd.gz ppd/hpcups/hp-officejet_6960.ppd.gz
ppd/hpcups/hp-officejet_7000_e809a.ppd.gz
ppd/hpcups/hp-officejet_7000_e809a_series.ppd.gz
ppd/hpcups/hp-officejet_7100_series.ppd.gz
ppd/hpcups/hp-officejet_7110_series.ppd.gz
ppd/hpcups/hp-officejet_7200_series.ppd.gz
ppd/hpcups/hp-officejet_7300_series.ppd.gz =
ppd/hpcups/hp-officejet_7400_series.ppd.gz
ppd/hpcups/hp-officejet_7500_e910.ppd.gz
ppd/hpcups/hp-officejet_7510_series.ppd.gz
ppd/hpcups/hp-officejet_7610_series.ppd.gz
ppd/hpcups/hp-officejet_8040_series.ppd.gz =
ppd/hpcups/hp-officejet_8700.ppd.gz
ppd/hpcups/hp-officejet_9100_series-pcl3.ppd.gz
ppd/hpcups/hp-officejet_d_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_g55.ppd.gz ppd/hpcups/hp-officejet_g55xi.ppd.gz
ppd/hpcups/hp-officejet_g85.ppd.gz ppd/hpcups/hp-officejet_g85xi.ppd.gz
ppd/hpcups/hp-officejet_g95.ppd.gz ppd/hpcups/hp-officejet_h470.ppd.gz
ppd/hpcups/hp-officejet_j3500_series.ppd.gz =
ppd/hpcups/hp-officejet_j3600_series.ppd.gz
ppd/hpcups/hp-officejet_j4500_series.ppd.gz
ppd/hpcups/hp-officejet_j4660_series.ppd.gz
ppd/hpcups/hp-officejet_j4680_series.ppd.gz
ppd/hpcups/hp-officejet_j5500_series.ppd.gz
ppd/hpcups/hp-officejet_j5700_series.ppd.gz =
ppd/hpcups/hp-officejet_j6400_series.ppd.gz
ppd/hpcups/hp-officejet_k60.ppd.gz ppd/hpcups/hp-officejet_k60xi.ppd.gz
ppd/hpcups/hp-officejet_k7100.ppd.gz ppd/hpcups/hp-officejet_k80.ppd.gz
ppd/hpcups/hp-officejet_k80xi.ppd.gz ppd/hpcups/hp-officejet_lx.ppd.gz
ppd/hpcups/hp-officejet.ppd.gz ppd/hpcups/hp-officejet_pro_1150c.ppd.gz
ppd/hpcups/hp-officejet_pro_1170c_series.ppd.gz
ppd/hpcups/hp-officejet_pro_3610.ppd.gz =
ppd/hpcups/hp-officejet_pro_3620.ppd.gz
ppd/hpcups/hp-officejet_pro_6230.ppd.gz =
ppd/hpcups/hp-officejet_pro_6830.ppd.gz
ppd/hpcups/hp-officejet_pro_6960.ppd.gz =
ppd/hpcups/hp-officejet_pro_6970.ppd.gz
ppd/hpcups/hp-officejet_pro_7720_series.ppd.gz
ppd/hpcups/hp-officejet_pro_7730_series.ppd.gz
ppd/hpcups/hp-officejet_pro_7740_series.ppd.gz =
ppd/hpcups/hp-officejet_pro_8000_a809.ppd.gz
ppd/hpcups/hp-officejet_pro_8100.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909a.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909g.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a909n.ppd.gz
ppd/hpcups/hp-officejet_pro_8500_a910.ppd.gz =
ppd/hpcups/hp-officejet_pro_8600.ppd.gz
ppd/hpcups/hp-officejet_pro_8610.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_pro_8620.ppd.gz =
ppd/hpcups/hp-officejet_pro_8630.ppd.gz
ppd/hpcups/hp-officejet_pro_8640.ppd.gz =
ppd/hpcups/hp-officejet_pro_8660.ppd.gz
ppd/hpcups/hp-officejet_pro_8710.ppd.gz =
ppd/hpcups/hp-officejet_pro_8720.ppd.gz
ppd/hpcups/hp-officejet_pro_k5300.ppd.gz
ppd/hpcups/hp-officejet_pro_k5400.ppd.gz
ppd/hpcups/hp-officejet_pro_k550.ppd.gz =
ppd/hpcups/hp-officejet_pro_k850.ppd.gz
ppd/hpcups/hp-officejet_pro_k8600.ppd.gz
ppd/hpcups/hp-officejet_pro_l7300.ppd.gz
ppd/hpcups/hp-officejet_pro_l7400.ppd.gz =
ppd/hpcups/hp-officejet_pro_l7500.ppd.gz
ppd/hpcups/hp-officejet_pro_l7600.ppd.gz
ppd/hpcups/hp-officejet_pro_l7700.ppd.gz =
ppd/hpcups/hp-officejet_r40.ppd.gz
ppd/hpcups/hp-officejet_r40xi.ppd.gz ppd/hpcups/hp-officejet_r45.ppd.gz
ppd/hpcups/hp-officejet_r60.ppd.gz ppd/hpcups/hp-officejet_r65.ppd.gz
ppd/hpcups/hp-officejet_r80.ppd.gz ppd/hpcups/hp-officejet_r80xi.ppd.gz
ppd/hpcups/hp-officejet_series_300.ppd.gz
ppd/hpcups/hp-officejet_series_310.ppd.gz
ppd/hpcups/hp-officejet_series_320.ppd.gz =
ppd/hpcups/hp-officejet_series_330.ppd.gz
ppd/hpcups/hp-officejet_series_350.ppd.gz
ppd/hpcups/hp-officejet_series_520.ppd.gz
ppd/hpcups/hp-officejet_series_570.ppd.gz
ppd/hpcups/hp-officejet_series_580.ppd.gz
ppd/hpcups/hp-officejet_series_590.ppd.gz =
ppd/hpcups/hp-officejet_series_600.ppd.gz
ppd/hpcups/hp-officejet_series_610.ppd.gz
ppd/hpcups/hp-officejet_series_630.ppd.gz
ppd/hpcups/hp-officejet_series_700.ppd.gz
ppd/hpcups/hp-officejet_series_710.ppd.gz
ppd/hpcups/hp-officejet_series_720.ppd.gz =
ppd/hpcups/hp-officejet_series_725.ppd.gz
ppd/hpcups/hp-officejet_t_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-officejet_v30.ppd.gz ppd/hpcups/hp-officejet_v40.ppd.gz
ppd/hpcups/hp-officejet_v40xi.ppd.gz ppd/hpcups/hp-officejet_v45.ppd.gz
ppd/hpcups/hp-photosmart_100.ppd.gz ppd/hpcups/hp-photosmart_1115.ppd.gz
ppd/hpcups/hp-photosmart_1215.ppd.gz =
ppd/hpcups/hp-photosmart_1218.ppd.gz ppd/hpcups/hp-photosmart_130.ppd.gz
ppd/hpcups/hp-photosmart_1315.ppd.gz =
ppd/hpcups/hp-photosmart_140_series.ppd.gz
ppd/hpcups/hp-photosmart_230.ppd.gz =
ppd/hpcups/hp-photosmart_240_series.ppd.gz
ppd/hpcups/hp-photosmart_2570_series.ppd.gz =
ppd/hpcups/hp-photosmart_2600_series.ppd.gz
ppd/hpcups/hp-photosmart_2700_series.ppd.gz
ppd/hpcups/hp-photosmart_3100_series.ppd.gz
ppd/hpcups/hp-photosmart_3200_series.ppd.gz
ppd/hpcups/hp-photosmart_320_series.ppd.gz
ppd/hpcups/hp-photosmart_3300_series.ppd.gz =
ppd/hpcups/hp-photosmart_330_series.ppd.gz
ppd/hpcups/hp-photosmart_370_series.ppd.gz
ppd/hpcups/hp-photosmart_380_series.ppd.gz
ppd/hpcups/hp-photosmart_420_series.ppd.gz
ppd/hpcups/hp-photosmart_470_series.ppd.gz
ppd/hpcups/hp-photosmart_5510d_series.ppd.gz =
ppd/hpcups/hp-photosmart_5510_series.ppd.gz
ppd/hpcups/hp-photosmart_5520_series.ppd.gz
ppd/hpcups/hp-photosmart_6510_series.ppd.gz
ppd/hpcups/hp-photosmart_6520_series.ppd.gz
ppd/hpcups/hp-photosmart_7150.ppd.gz
ppd/hpcups/hp-photosmart_7200_series.ppd.gz =
ppd/hpcups/hp-photosmart_7345.ppd.gz
ppd/hpcups/hp-photosmart_7350.ppd.gz
ppd/hpcups/hp-photosmart_7400_series.ppd.gz
ppd/hpcups/hp-photosmart_7510_series.ppd.gz
ppd/hpcups/hp-photosmart_7520_series.ppd.gz
ppd/hpcups/hp-photosmart_7550.ppd.gz =
ppd/hpcups/hp-photosmart_7600_series.ppd.gz
ppd/hpcups/hp-photosmart_7700_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-photosmart_7800_series.ppd.gz
ppd/hpcups/hp-photosmart_7900_series.ppd.gz
ppd/hpcups/hp-photosmart_8000_series.ppd.gz
ppd/hpcups/hp-photosmart_8100_series.ppd.gz
ppd/hpcups/hp-photosmart_8200_series.ppd.gz
ppd/hpcups/hp-photosmart_8400_series.ppd.gz =
ppd/hpcups/hp-photosmart_8700_series.ppd.gz
ppd/hpcups/hp-photosmart_a310_series.ppd.gz
ppd/hpcups/hp-photosmart_a320_series.ppd.gz
ppd/hpcups/hp-photosmart_a430_series.ppd.gz
ppd/hpcups/hp-photosmart_a440_series.ppd.gz
ppd/hpcups/hp-photosmart_a510_series.ppd.gz =
ppd/hpcups/hp-photosmart_a520_series.ppd.gz
ppd/hpcups/hp-photosmart_a530_series.ppd.gz
ppd/hpcups/hp-photosmart_a610_series.ppd.gz
ppd/hpcups/hp-photosmart_a620_series.ppd.gz
ppd/hpcups/hp-photosmart_a630_series.ppd.gz
ppd/hpcups/hp-photosmart_a640_series.ppd.gz =
ppd/hpcups/hp-photosmart_a710_series.ppd.gz
ppd/hpcups/hp-photosmart_a820_series.ppd.gz
ppd/hpcups/hp-photosmart_b010_series.ppd.gz
ppd/hpcups/hp-photosmart_b109a-m.ppd.gz
ppd/hpcups/hp-photosmart_b109a_series.ppd.gz
ppd/hpcups/hp-photosmart_b110_series.ppd.gz
ppd/hpcups/hp-photosmart_b8500_series.ppd.gz
ppd/hpcups/hp-photosmart_c309a_series.ppd.gz
ppd/hpcups/hp-photosmart_c3100_series.ppd.gz
ppd/hpcups/hp-photosmart_c4100_series.ppd.gz
ppd/hpcups/hp-photosmart_c4200_series.ppd.gz =
ppd/hpcups/hp-photosmart_c4340_series.ppd.gz
ppd/hpcups/hp-photosmart_c4380_series.ppd.gz
ppd/hpcups/hp-photosmart_c4400_series.ppd.gz
ppd/hpcups/hp-photosmart_c4500_series.ppd.gz
ppd/hpcups/hp-photosmart_c4600_series.ppd.gz
ppd/hpcups/hp-photosmart_c4700_series.ppd.gz =
ppd/hpcups/hp-photosmart_c5100_series.ppd.gz
ppd/hpcups/hp-photosmart_c5200_series.ppd.gz
ppd/hpcups/hp-photosmart_c5300_series.ppd.gz
ppd/hpcups/hp-photosmart_c5500_series.ppd.gz
ppd/hpcups/hp-photosmart_c6100_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644
ppd/hpcups/hp-photosmart_c6200_series.ppd.gz
ppd/hpcups/hp-photosmart_c6300_series.ppd.gz
ppd/hpcups/hp-photosmart_c7100_series.ppd.gz
ppd/hpcups/hp-photosmart_c7200_series.ppd.gz
ppd/hpcups/hp-photosmart_c8100_series.ppd.gz
ppd/hpcups/hp-photosmart_d110_series.ppd.gz
ppd/hpcups/hp-photosmart_d5060_series.ppd.gz
ppd/hpcups/hp-photosmart_d5100_series.ppd.gz =
ppd/hpcups/hp-photosmart_d5300_series.ppd.gz
ppd/hpcups/hp-photosmart_d5400_series.ppd.gz
ppd/hpcups/hp-photosmart_d6100_series.ppd.gz
ppd/hpcups/hp-photosmart_d7100_series.ppd.gz
ppd/hpcups/hp-photosmart_d7200_series.ppd.gz
ppd/hpcups/hp-photosmart_d7300_series.ppd.gz =
ppd/hpcups/hp-photosmart_d7400_series.ppd.gz
ppd/hpcups/hp-photosmart_d7500_series.ppd.gz
ppd/hpcups/hp-photosmart_estn_c510_series.ppd.gz
ppd/hpcups/hp-photosmart_ink_adv_k510.ppd.gz
ppd/hpcups/hp-photosmart_p1000.ppd.gz =
ppd/hpcups/hp-photosmart_p1100.ppd.gz
ppd/hpcups/hp-photosmart_plus_b209a-m.ppd.gz
ppd/hpcups/hp-photosmart_plus_b210_series.ppd.gz
ppd/hpcups/hp-photosmart_prem_c310_series.ppd.gz
ppd/hpcups/hp-photosmart_prem_c410_series.ppd.gz
ppd/hpcups/hp-photosmart_premium_c309g-m.ppd.gz =
ppd/hpcups/hp-photosmart_prem-web_c309n-s.ppd.gz
ppd/hpcups/hp-photosmart_pro_b8300_series.ppd.gz
ppd/hpcups/hp-photosmart_pro_b8800_series.ppd.gz
ppd/hpcups/hp-photosmart_wireless_b109n-z.ppd.gz
ppd/hpcups/hp-printer_scanner_copier_300.ppd.gz
ppd/hpcups/hp-psc_1000_series.ppd.gz =
ppd/hpcups/hp-psc_1100_series.ppd.gz
ppd/hpcups/hp-psc_1200_series.ppd.gz =
ppd/hpcups/hp-psc_1300_series.ppd.gz
ppd/hpcups/hp-psc_1310_series.ppd.gz =
ppd/hpcups/hp-psc_1358_series.ppd.gz
ppd/hpcups/hp-psc_1400_series.ppd.gz =
ppd/hpcups/hp-psc_1500_series.ppd.gz =
ppd/hpcups/hp-psc_1510_series.ppd.gz
ppd/hpcups/hp-psc_1600_series.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|&nbsp;
/home/tykwon/yocto/build/tmp/hosttools/install -c -m 644 =
ppd/hpcups/hp-psc_2100_series.ppd.gz
ppd/hpcups/hp-psc_2150_series.ppd.gz =
ppd/hpcups/hp-psc_2170_series.ppd.gz
ppd/hpcups/hp-psc_2200_series.ppd.gz =
ppd/hpcups/hp-psc_2210_series.ppd.gz
ppd/hpcups/hp-psc_2300_series.ppd.gz =
ppd/hpcups/hp-psc_2350_series.ppd.gz
ppd/hpcups/hp-psc_2400_series.ppd.gz =
ppd/hpcups/hp-psc_2500_series.ppd.gz
ppd/hpcups/hp-psc_500.ppd.gz ppd/hpcups/hp-psc_720.ppd.gz
ppd/hpcups/hp-psc_750.ppd.gz ppd/hpcups/hp-psc_750xi.ppd.gz
ppd/hpcups/hp-psc_760.ppd.gz ppd/hpcups/hp-psc_780.ppd.gz =
ppd/hpcups/hp-psc_780xi.ppd.gz
ppd/hpcups/hp-psc_900_series.ppd.gz ppd/hpcups/hp-psc_920.ppd.gz
ppd/hpcups/hp-psc_950.ppd.gz ppd/hpcups/hp-psc_950vr.ppd.gz
ppd/hpcups/hp-psc_950xi.ppd.gz ppd/hpcups/*.ppd.gz
ppd/hpcups/apollo-2100.ppd.gz ppd/hpcups/apollo-2150.ppd.gz =
ppd/hpcups/apollo-2200.ppd.gz
ppd/hpcups/apollo-2500.ppd.gz ppd/hpcups/apollo-2600.ppd.gz
ppd/hpcups/apollo-2650.ppd.gz ppd/hpcups/apollo-p2000-u.ppd.gz
ppd/hpcups/apollo-p2250.ppd.gz ppd/hpcups/hp-2000c.ppd.gz
ppd/hpcups/hp-2500c.ppd.gz ppd/hpcups/hp-910.ppd.gz =
ppd/hpcups/hp-915.ppd.gz
ppd/hpcups/hp-amp.ppd.gz ppd/hpcups/hp-business_inkjet_1000.ppd.gz
ppd/hpcups/hp-business_inkjet_1100.ppd.gz
ppd/hpcups/hp-business_inkjet_1200.ppd.gz
ppd/hpcups/hp-business_inkjet_2200.ppd.gz =
ppd/hpcups/hp-business_inkjet_2230.ppd.gz
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2100_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2100_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2150_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2150_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2170_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2170_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2200_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2200_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2210_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2210_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2300_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2300_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2350_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2350_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2400_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2400_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_2500_series.ppd.gz'
with 'ppd/hpcups/hp-psc_2500_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_500.ppd.gz'
with 'ppd/hpcups/hp-psc_500.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_720.ppd.gz'
with 'ppd/hpcups/hp-psc_720.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_750.ppd.gz'
with 'ppd/hpcups/hp-psc_750.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_750xi.ppd.gz'
with 'ppd/hpcups/hp-psc_750xi.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_760.ppd.gz'
with 'ppd/hpcups/hp-psc_760.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_780.ppd.gz'
with 'ppd/hpcups/hp-psc_780.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_780xi.ppd.gz'
with 'ppd/hpcups/hp-psc_780xi.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_900_series.ppd.gz'
with 'ppd/hpcups/hp-psc_900_series.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_920.ppd.gz'
with 'ppd/hpcups/hp-psc_920.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_950.ppd.gz'
with 'ppd/hpcups/hp-psc_950.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_950vr.ppd.gz'
with 'ppd/hpcups/hp-psc_950vr.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-psc_950xi.ppd.gz'
with 'ppd/hpcups/hp-psc_950xi.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2100.ppd.gz'
with 'ppd/hpcups/apollo-2100.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2150.ppd.gz'
with 'ppd/hpcups/apollo-2150.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2200.ppd.gz'
with 'ppd/hpcups/apollo-2200.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2500.ppd.gz'
with 'ppd/hpcups/apollo-2500.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2600.ppd.gz'
with 'ppd/hpcups/apollo-2600.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-2650.ppd.gz'
with 'ppd/hpcups/apollo-2650.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-p2000-u.ppd.gz'
with 'ppd/hpcups/apollo-p2000-u.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/apollo-p2250.ppd.gz'
with 'ppd/hpcups/apollo-p2250.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-2000c.ppd.gz'
with 'ppd/hpcups/hp-2000c.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-2500c.ppd.gz'
with 'ppd/hpcups/hp-2500c.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-910.ppd.gz'
with 'ppd/hpcups/hp-910.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-915.ppd.gz'
with 'ppd/hpcups/hp-915.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-amp.ppd.gz'
with 'ppd/hpcups/hp-amp.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1000.ppd.gz'
with 'ppd/hpcups/hp-business_inkjet_1000.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>|
/home/tykwon/yocto/build/tmp/hosttools/install: will not overwrite =
just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1100.ppd.gz'
with 'ppd/hpcups/hp-business_inkjet_1100.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_1200.ppd.gz'
with 'ppd/hpcups/hp-business_inkjet_1200.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_2200.ppd.gz'
with 'ppd/hpcups/hp-business_inkjet_2200.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| =
/home/tykwon/yocto/build/tmp/hosttools/install:
will not overwrite just-created
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/image/usr/share/ppd/HP/hp-business_inkjet_2230.ppd.gz'
with 'ppd/hpcups/hp-business_inkjet_2230.ppd.gz'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| Makefile:7899: recipe for =
target
'install-dist_ppdDATA' failed<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| make[1]: *** =
[install-dist_ppdDATA] Error
1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| make[1]: Leaving directory
'/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/=
3.18.6-r1/hplip-3.18.6'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| Makefile:8517: recipe for =
target
'install-am' failed<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| make: *** [install-am] Error =
2<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| ERROR: oe_runmake =
failed<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| WARNING: exit code 1 from a =
shell
command.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>| ERROR: Function failed: =
do_install (log
file is located at =
/home/tykwon/yocto/build/tmp/work/armv7ahf-vfp-poky-linux-gnueabi/hplip/3=
.18.6-r1/temp/log.do_install.16858)<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>ERROR: Task
(/home/tykwon/yocto/poky/meta-openembedded/meta-oe/recipes-extended/hplip=
/hplip_3.18.6.bb:do_install)
failed with exit code '1'<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>NOTE: Tasks Summary: Attempted =
1664 tasks
of which 1663 didn't need to be rerun and 1 =
failed.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Summary: 1 task =
failed:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>&nbsp;
/home/tykwon/yocto/poky/meta-openembedded/meta-oe/recipes-extended/hplip/=
hplip_3.18.6.bb:do_install<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Summary: There were 2 ERROR =
messages shown,
returning a non-zero exit code.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>tykwon:top$ =
<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I have verified the version of =
hplip by
subdividing it.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Up to 3.17.9 is compiled and =
error starts
from 3.17.10.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>When manually cross-compiling =
hplip without
using yocto, the error did not occur.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Is there a good way to resolve =
this error?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I'm sorry I do not have enough =
English.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Regards<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Kwon<o:p></o:p></span></p>

</div>

</body>

</html>

------=_NextPart_000_0A9E_01D40CB1.17D7A460--
