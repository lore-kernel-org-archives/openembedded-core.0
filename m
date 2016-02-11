Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3D3731D7;
	Thu, 11 Feb 2016 15:18:46 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c200so78014625wme.0;
	Thu, 11 Feb 2016 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=68L3/u1W9NPfCS448inM2R/uLnD/A4CggEL0Hyg+GD8=;
	b=WUWZRhhKRIHE0BcFXtUerLruPuzR9Oi8Rlfjy9G+Bu+NnLmqqdDdPliPtUKD+1SX/Q
	B6FhXJn2EafM6ORahwCPfyjIe+5TsWjAm3NYxCrlqazn/tmV94YzX4KB+K/dZ1mR5xIJ
	JN9jMzpDMMufrM+jvvIxIIuPZVUIqz+lWHePl134gMpgWevrTVfhNWL88Eu0f7HCAAoe
	5cJF7XLHTIyT7CpCFSuC7+tzKvQIUk4rSGZG7Ey2StaB2vKGkasuLMcNDda4go3HGaRB
	TwU5Z+Hp9yZ//alB2g69H++me9LMG4JWh7ERqMdj18FEuOSvAwrGxojKGBwsuQx4k/Qh
	60QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=68L3/u1W9NPfCS448inM2R/uLnD/A4CggEL0Hyg+GD8=;
	b=kx3U1orb5XaKRzlVjN3jjUXM3u05Gv3LtoAwGMTJQH/dNnkA9TA0QmPLkbte9amFUf
	j8Uc9Ivj7wc3LoryStWnD0fGhlQ0o5pJiFefHLJvGzFEoiDF9jDDM+27KogsrxEGKc3z
	QRKTce31fIu+hyLS4P/dEJQEbyzCF+mY1fghUAo/od/8JacLUhkV44KVOpMnmcoN+2nA
	YYdBldgAV6vSD1JoW6YACK4qDiZ/m3yxdfHP8FX2Egb2nD3npJP1ourDuMI/mXiaasYH
	gfwhtQVTQLMH6erz9ocq9RUw8PadRguLrQyvzhVIc796TMIyASeQHfV9q2iMgx5EFl9k
	z68Q==
X-Gm-Message-State: AG10YORVIS5OQ+/WPvXQyPNBkFjhjWSumrxm88m2AVcqfhmQpvy68ARrP6kW6QE0pNUr/g==
X-Received: by 10.28.212.9 with SMTP id l9mr19243735wmg.75.1455203926816;
	Thu, 11 Feb 2016 07:18:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g1sm3346261wmc.0.2016.02.11.07.18.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Feb 2016 07:18:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Feb 2016 16:22:48 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160211152248.GA2595@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-02-10
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
X-List-Received-Date: Thu, 11 Feb 2016 15:18:48 -0000
X-Groupsio-MsgNum: 78009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
93918f0 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
2f26ee9 ptest-runner: Explicitly set EXTRA_OEMAKE as required
d5d8d0f unzip: Explicitly set EXTRA_OEMAKE as required
bb062fc sysklogd: Explicitly set EXTRA_OEMAKE as required
5ce7faf stat: Explicitly set EXTRA_OEMAKE as required
c952a3b pigz: Explicitly set EXTRA_OEMAKE as required
4199e08 iputils: Explicitly set EXTRA_OEMAKE as required
c32666d ed: Explicitly set EXTRA_OEMAKE as required
d8f974e gptfdisk: Explicitly set EXTRA_OEMAKE as required
76214ba dmidecode: Explicitly set EXTRA_OEMAKE as required
6ffb37d libacpi: Explicitly set EXTRA_OEMAKE as required
5cf2b39 apmd: Explicitly set EXTRA_OEMAKE as required
2bba4b9 perl: Explicitly set EXTRA_OEMAKE as required
d787299 bitbake.conf: Remove unhelpful default value for EXTRA_OEMAKE
4092c4f sstate-sysroot-cruft.sh: Extend the whitelist
ccb6421 qemux86: Add identical qemux86copy variant for tests
a1532a0 report-error: Allow to upload reports automatically
3c1ac70 arch-armv7ve.inc: respect armv7a override as well
9f58fa4 gcc-5.3: backport fix for PR-target-65358

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
d24c10b abiword: make build deterministic for meta-office [1] in layers
3fb1249 abiword: update to 3.0.1
f37febf gnome-mime-data: add (from oe-core)
d63cff8 gtk-theme-torturer: add
840091a ntp: remove empty libexecdir to prevent potential QA issues
195aa03 python-django: update package to 1.8.9
8e4a5be nginx: update to 1.9.10
e65ca86 nginx: make nginx user and home directory configurable
472ba33 ne10: add recipe
42ff87b toybox: upgrade to 0.7.0
048a5a7 efivar: nvme header was renamed in linux 4.4
3fd8390 rsyslog: add tls related tests
b17c0ad rsyslog: avoid deprecated GnuTLS functions
a710f4b xterm: make xft PACKAGECONFIG depend on freetype-native
0693ba2 gst-plugins-base: add perl runtime dependency to gst-plugins-base-a=
pps
a41c106 lldpd: Update to version 0.9.0
57a3d5c python-daemonize: Update to version 2.4.2
1924af4 networkmanager: use bash-completion.bbclass
5dfa822 lldpd: use bash-completion.bbclass
b1541ad dracut: use bash-completion.bbclass
ad565c0 bash-completion: move to oe-core
75f58aa vpnc: Explicitly set EXTRA_OEMAKE as required
5b02783 pimd: Explicitly set EXTRA_OEMAKE as required
0c9a51f pptp-linux: Explicitly set EXTRA_OEMAKE as required
7b03b02 vsftpd: Explicitly set EXTRA_OEMAKE as required
b393a75 vlan: Explicitly set EXTRA_OEMAKE as required
fae40c3 libebml: Explicitly set EXTRA_OEMAKE as required
4d4f9ec nbench-byte: Explicitly set EXTRA_OEMAKE as required
b2c123b ckermit: Explicitly set EXTRA_OEMAKE as required
7fe379f rarpd: Explicitly set EXTRA_OEMAKE as required
616d121 yavta: Explicitly set EXTRA_OEMAKE as required
02ab1a3 serialcheck: Explicitly set EXTRA_OEMAKE as required
98f8b28 iptraf: Explicitly set EXTRA_OEMAKE as required
3fc81ce mg: Explicitly set EXTRA_OEMAKE as required
8d7eb56 pngcheck: Explicitly set EXTRA_OEMAKE as required
91034c8 vboxguestdrivers: upgrade to 4.3.36
88d35a2 hwdata: add new recipe
3a12524 thrift: Add recipe for Apache Thrift.
b1fa1f0 samba: update systemd service files
795ebef ntp: update 4.2.8p6
9eaf883 hunspell: initial add 1.3.3
e32110e apache2: add openldap support to PACKAGECONFIG
0b116f1 openldap: enable native build
645b160 mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
51ddcfa lua: Added ptest for lua
f2c7e73 packagegroup-xfce-extended: add xfce4-calculator-plugin
bbda40e xfce4-calculator-plugin: initial add 0.5.1
b3e53c8 python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.
e2886e5 start-stop-daemon: Upgrade 1.16.0.2 -> 1.17.25
e61865e nodejs: upgrade from 4.2.4 to 4.2.6
8308fe2 rygel: Update to 0.28.2
edc3aab gupnp: Update to 0.20.14
ded806b ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
e0ecd67 netkit-telnet: Add to generate telnetlogin.
e0f527e netkit-rsh: add two patches and some fixes.
db745a1 net-snmp: fix cross-compile breakage, add libnl pkgconfig option
069ccfd efivar: fix zero initializer compiler error
ed722c3 fix missing packageconfig for samba with sysvinit
3dffa82 waf-samba.bbclass: add cross-answers option and files
462476f samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
bede8b1 lowpan-tools: add missing flex/bison deps
ba89155 postfix: fix clean broken issue
68e9e07 ncftp: fix build failures with ccdv
8b6c8af iscsitarget: skip the arch test for kernel modules
c856fb0 iscsitarget: split the kernel module into separate package
791e42b netkit-ftp: fixed invalid symlink
79b4d6a ctdb: add PACKAGECONFIG for libtdb
a152701 cim-schema-exper: fix host-user-contaminated
949cd53 nbd: use BPN in Files
6885241 wireshark: update SRC_URI link to sources
2d366c7 postfix: premission of /var/spool/mail seems incorrect

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
909858b qt5: use common PACKAGECONFIG to build examples
8e70eeb qt5-git.inc: Ensure we export the SRCREV as the module name
d6aeedb qtbase: Fix installation of fonts and libraries

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'12'|QA !!Comme=
nt
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	=
||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminate=
d	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||=
invalid-pkgconfig	||pkgname	||=09
|-
||2016-02-10	||32	||39	||38	||1		||1		||7		||3		||31		||22		||3		||2		||0		=
||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-02-10 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160211_022047.log

=3D=3D=3D common (29) =3D=3D=3D
    * /meta-browser/recipes-mozilla/firefox/firefox_38.4.0esr.bb, do_install
    * /meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2=
-utils_git.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-extended/gtk-theme-torturer/gtk=
-theme-torturer_git.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.=
1.bb, do_install
    * /meta-openembedded/meta-multimedia/recipes-mkv/libmatroska/libmatrosk=
a_1.4.1.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_install
    * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2=
=2E9.7.5.bb, do_populate_sysroot
    * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb, do_pop=
ulate_sysroot
    * /meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.=
3.bb, do_populate_sysroot
    * /meta-openembedded/meta-networking/recipes-support/dovecot/dovecot_2.=
2.21.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb, =
do_package_qa
    * /meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_packa=
ge_qa
    * /meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb, do_=
populate_sysroot
    * /meta-openembedded/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb, do_=
populate_sysroot
    * /meta-openembedded/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.b=
b, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.=
8.0.bb, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-graphics/tesseract/tesseract_3.02.=
02.bb, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/farsight/libnice_0.0.13.bb=
, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_gi=
t.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/system-setup-keyboard/syst=
em-setup-keyboard_0.8.8.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.=
bb, do_configure
    * /meta-qt5/recipes-qt/qt5/qtbase_git.bb, do_package_qa
    * /meta-qt5/recipes-qt/qt5/qtbase_git.bb, do_populate_sysroot
    * /meta-smartphone/meta-android/recipes-support/invensense/invensense_g=
it.bb, do_package_qa
    * /meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb, =
do_compile

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/=
gst-ffmpeg_0.10.13.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrenc=
ykit_git.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
, do_configure

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb=
, do_package
    * /openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb, do=
_compile

=3D=3D=3D qemux86 (5) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static=
-utils_2.0.4.bb, do_compile
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.b=
b, do_package_qa
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile
    * /meta-openembedded/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb=
, do_package_qa

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_4.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_c=
ompile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile

=3D=3D=3D Number of failed tasks (109) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 32	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160208_132424.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12392/
|-
|| qemux86 	|| 39	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160209_100958.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12411/
|-
|| qemux86_64 	|| 38	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160210_055816.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/12458/
|}

=3D=3D=3D PNBLACKLISTs (87) =3D=3D=3D

=3D=3D=3D QA issues (70) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||invalid-pkgconfig
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||already-stripped
|-
||1	||libdir
|-
||2	||installed-vs-shipped
|-
||22	||version-going-backwards
|-
||3	||build-deps
|-
||3	||host-user-contaminated
|-
||31	||file-rdeps
|-
||7	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from m=
eta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inclu=
de whole downloads directory in /home/builder/poky :/"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to b binary '/t=
mp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-split/libavfilter/usr/lib/li=
bavfilter.so.5.40.101' has relocations in .text [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libpostproc/usr/lib/libpostproc.so.53.3.100' has relocations in .text=
 [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libswresample/usr/lib/libswresample.so.1.2.101' has relocations in .t=
ext [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libswscale/usr/lib/libswscale.so.3.1.101' has relocations in .text [t=
extrel]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]


count: 3	issue: build-deps
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency? =
[build-deps]
toybox-0.7.0: toybox rdepends on libattr, but it isn't a build dependency? =
[build-deps]


count: 31	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS =
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot r=
equires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
libboners found in its RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so()=
(64bit), but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
msr-tools-1.3: /usr/sbin/wrmsr_msr-tools contained in package msr-tools req=
uires libc.so.6(GLIBC_2.3)(64bit), but no providers found in its RDEPENDS [=
file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui containe=
d in package networkmanager-nmtui requires libnewt.so()(64bit), but no prov=
iders found in its RDEPENDS [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui containe=
d in package networkmanager-nmtui requires libnewt.so, but no providers fou=
nd in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.=
py_perf contained in package perf requires /usr/bin/python2, but no provide=
rs found in its RDEPENDS [file-rdeps]
perf-1.0: /usr/libexec/perf-core/tests/attr.py_perf contained in package pe=
rf requires /usr/bin/python, but no providers found in its RDEPENDS [file-r=
deps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]
wmiconfig-0.0.0+svnr5394: /usr/bin/wmiconfig_wmiconfig contained in package=
 wmiconfig requires libc.so.6(GLIBC_2.2.5)(64bit), but no providers found i=
n its RDEPENDS [file-rdeps]


count: 22	issue: version-going-backwards
perf-1.0: Package version for package perf went backwards which would break=
 package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-backwards]
perf-1.0: Package version for package perf-archive went backwards which wou=
ld break package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-dbg went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-dev went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-doc went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-locale went backwards which woul=
d break package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-ba=
ckwards]
perf-1.0: Package version for package perf-perl went backwards which would =
break package feeds from (0:None-r9.4 to 0:4.1.17-r9.5) [version-going-back=
wards]
perf-1.0: Package version for package perf-python went backwards which0:4.1=
=2E17-r9.5) [version-going-backwards]
rsyslog-7.6.1: Package version for package rsyslog went backwards which wou=
ld break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [version-going-b=
ackwards]
rsyslog-7.6.1: Package version for package rsyslog went backwards which wou=
ld break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [version-going-b=
ackwards]
rsyslog-7.6.1: Package version for package rsyslog-dbg went backwards which=
 would break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-dbg went backwards which=
 would break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-dev went backwards which=
 would break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-dev went backwards which=
 would break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-doc went backwards which=
 would break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-doc went backwards which=
 would break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [version-goi=
ng-backwards]
rsyslog-7.6.1: Package version for package rsyslog-locale went backwards wh=
ich would break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [version-=
going-backwards]
rsyslog-7.6.1: Package version for package rsyslog-locale went backwards wh=
ich would break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [version-=
going-backwards]
rsyslog-7.6.1: Package version for package rsyslog-staticdev went backwards=
 which would break package feeds from (0:7.6.1-r0.1 to 0:7.6.1-r0.0) [versi=
on-going-backwards]
rsyslog-7.6.1: Package version for package rsyslog-staticdev went backwards=
 which would break package feeds from (0:7.6.1-r0.2 to 0:7.6.1-r0.0) [versi=
on-going-backwards]


count: 3	issue: host-user-contaminated
firefox-addon-webconverger: /firefox-addon-webconverger/usr/lib/firefox/ext=
ensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nautilu=
s.nph is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]


count: 2	issue: installed-vs-shipped
poppler-data: 261 installed and not shipped files. [installed-vs-shipped]
uim: 5 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla8p0cACgkQN1Ujt2V2gBwOLQCgkIe2Zl/LWP1ls7+dSMZ2Edsk
8+QAn1ROBNJnMIa2xi1eoOOPUCv8zf90
=I2x+
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
