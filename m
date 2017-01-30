Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DEAD173D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 13:25:30 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cYBxa-0004nB-4y from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2017 05:25:30 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 30 Jan 2017 13:25:27 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Mon, 30 Jan 2017 13:25:26 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/2] grub_git: extend recipe for proper
	target	deployment
Thread-Index: AQHSV5a0y1Z09goc0EWPp0qxN+IZRaEbxpmagAsFq2aACtkXj4AfpBLw
Date: Mon, 30 Jan 2017 13:25:26 +0000
Message-ID: <1485782726812.27130@mentor.com>
References: <1481890756-18807-1-git-send-email-awais_belal@mentor.com>,
	<1482840926804.77705@mentor.com>, <1483446874461.46009@mentor.com>,
	<1484043253234.5319@mentor.com>
In-Reply-To: <1484043253234.5319@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] grub_git: extend recipe for proper target	deployment
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
X-List-Received-Date: Mon, 30 Jan 2017 13:25:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Tuesday, January 10, 2017 3:14 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2 1/2] grub_git: extend recipe for proper ta=
rget deployment=0A=
=0A=
ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Tuesday, January 3, 2017 5:34 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2 1/2] grub_git: extend recipe for proper ta=
rget deployment=0A=
=0A=
ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Tuesday, December 27, 2016 5:15 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2 1/2] grub_git: extend recipe for proper ta=
rget deployment=0A=
=0A=
ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Friday, December 16, 2016 5:19 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH v2 1/2] grub_git: extend recipe for proper target=
     deployment=0A=
=0A=
This extends the grub_git recipe so it can deploy grub=0A=
on the target boot disk just like grub-efi. Mainly=0A=
this copies stuff from the grub-efi recipe and then=0A=
adjusts some bits accordingly. This would allow=0A=
using the latest and greatest versions of grub=0A=
on the target.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta/recipes-bsp/grub/grub_git.bb | 60 +++++++++++++++++++++++++++++++++++=
----=0A=
 1 file changed, 54 insertions(+), 6 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub=
_git.bb=0A=
index eb824cc..13c48c7 100644=0A=
--- a/meta/recipes-bsp/grub/grub_git.bb=0A=
+++ b/meta/recipes-bsp/grub/grub_git.bb=0A=
@@ -3,11 +3,15 @@ require grub2.inc=0A=
 DEFAULT_PREFERENCE =3D "-1"=0A=
 DEFAULT_PREFERENCE_arm =3D "1"=0A=
=0A=
+DEPENDS +=3D "grub-native"=0A=
+RDEPENDS_${PN}_class-target =3D "diffutils freetype"=0A=
+=0A=
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/grub-git:"=0A=
=0A=
 PV =3D "2.00+${SRCPV}"=0A=
 SRCREV =3D "7a5b301e3adb8e054288518a325135a1883c1c6c"=0A=
 SRC_URI =3D "git://git.savannah.gnu.org/grub.git \=0A=
+           file://cfg \=0A=
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.pa=
tch \=0A=
            file://autogen.sh-exclude-pc.patch \=0A=
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \=0A=
@@ -19,29 +23,73 @@ COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|aarch64.*)-=
(linux.*|freebsd.*)'=0A=
 COMPATIBLE_HOST_armv7a =3D 'null'=0A=
 COMPATIBLE_HOST_armv7ve =3D 'null'=0A=
=0A=
-inherit autotools gettext texinfo=0A=
+inherit autotools gettext texinfo deploy=0A=
=0A=
 # configure.ac has code to set this automagically from the target tuple=0A=
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.=0A=
-=0A=
 GRUBPLATFORM_arm =3D "uboot"=0A=
 GRUBPLATFORM_aarch64 =3D "efi"=0A=
 GRUBPLATFORM ??=3D "pc"=0A=
=0A=
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_HELP2MAN=3D"=0A=
 EXTRA_OECONF =3D "--with-platform=3D${GRUBPLATFORM} --disable-grub-mkfont =
--program-prefix=3D"" \=0A=
                 --enable-liblzma=3Dno --enable-device-mapper=3Dno --enable=
-libzfs=3Dno"=0A=
-=0A=
+EXTRA_OECONF +=3D "${@bb.utils.contains('GRUBPLATFORM', 'efi', '--enable-e=
fiemu=3Dno', '', d)}"=0A=
 EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-=
-enable-largefile', '--disable-largefile', d)}"=0A=
=0A=
-do_install_append () {=0A=
+# Determine the target arch for the grub modules=0A=
+python __anonymous () {=0A=
+    import re=0A=
+    target =3D d.getVar('TARGET_ARCH', True)=0A=
+    platform =3D d.getVar('GRUBPLATFORM', True)=0A=
+    if target =3D=3D "x86_64":=0A=
+        grubtarget =3D 'x86_64'=0A=
+        grubimage =3D "bootx64." + platform=0A=
+    elif re.match('i.86', target):=0A=
+        grubtarget =3D 'i386'=0A=
+        grubimage =3D "bootia32." + platform=0A=
+    elif re.match('arm', target):=0A=
+        grubtarget =3D 'arm'=0A=
+        grubimage =3D "bootarm." + platform=0A=
+    elif re.match('aarch64', target):=0A=
+        grubtarget =3D 'arm64'=0A=
+        grubimage =3D "bootaa64." + platform=0A=
+    else:=0A=
+        raise bb.parse.SkipPackage("grub is incompatible with target %s" %=
 target)=0A=
+    d.setVar("GRUB_TARGET", grubtarget)=0A=
+    d.setVar("GRUB_IMAGE", grubimage)=0A=
+}=0A=
+=0A=
+do_install_class-native() {=0A=
+    install -d ${D}${bindir}=0A=
+    install -m 755 grub-mkimage ${D}${bindir}=0A=
+}=0A=
+=0A=
+do_install_append() {=0A=
     install -d ${D}${sysconfdir}/grub.d=0A=
     rm -rf ${D}${libdir}/charset.alias=0A=
 }=0A=
=0A=
+GRUB_BUILDIN ?=3D "boot linux ext2 fat serial part_msdos part_gpt normal e=
fi_gop iso9660 search"=0A=
+do_deploy() {=0A=
+    # Search for the grub.cfg on the local boot media by using the=0A=
+    # built in cfg file provided via this recipe=0A=
+    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \=0A=
+                   -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \=
=0A=
+                   ${GRUB_BUILDIN}=0A=
+    install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}=0A=
+}=0A=
+=0A=
+do_deploy_class-native() {=0A=
+    :=0A=
+}=0A=
+=0A=
+addtask deploy after do_install before do_build=0A=
+=0A=
 # debugedit chokes on bare metal binaries=0A=
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"=0A=
=0A=
-RDEPENDS_${PN} =3D "diffutils freetype"=0A=
-=0A=
 INSANE_SKIP_${PN} =3D "arch"=0A=
 INSANE_SKIP_${PN}-dbg =3D "arch"=0A=
+=0A=
+BBCLASSEXTEND =3D "native"=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

