Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F1B91605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:21:21 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cQvQX-0002t0-I5 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 04:21:21 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Tue, 10 Jan 2017 12:19:50 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Tue, 10 Jan 2017 12:19:50 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 2/2] grub-efi/live-vm-common: allow	grub	as
	EFI_PROVIDER
Thread-Index: AQHSZb3iCOQdKDhJrke6XHzRxCMAQqExrCr2
Date: Tue, 10 Jan 2017 12:19:50 +0000
Message-ID: <1484050790272.67871@mentor.com>
References: <1481890756-18807-1-git-send-email-awais_belal@mentor.com>,
	<1481890756-18807-2-git-send-email-awais_belal@mentor.com>,
	<1482840941211.2620@mentor.com>,<1483446891372.91851@mentor.com>
In-Reply-To: <1483446891372.91851@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] grub-efi/live-vm-common: allow	grub	as	EFI_PROVIDER
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
X-List-Received-Date: Tue, 10 Jan 2017 12:21:22 -0000
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
Sent: Tuesday, January 3, 2017 5:34 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2 2/2] grub-efi/live-vm-common: allow    gru=
b    as      EFI_PROVIDER=0A=
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
Subject: Re: [OE-core] [PATCH v2 2/2] grub-efi/live-vm-common: allow grub  =
     as      EFI_PROVIDER=0A=
=0A=
Ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Friday, December 16, 2016 5:19 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH v2 2/2] grub-efi/live-vm-common: allow grub as   =
     EFI_PROVIDER=0A=
=0A=
This allows grub to be used as EFI_PROVIDER and=0A=
extends the grub-efi class so it can be used as is=0A=
when EFI_PROVIDER is grub.=0A=
Currently this can only be leveraged if you are=0A=
using the grub_git recipe and GRUBPLATFORM plus=0A=
EFI_PROVIDER are set correctly.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta/classes/grub-efi.bbclass       | 23 +++++++++++++++++------=0A=
 meta/classes/live-vm-common.bbclass |  2 +-=0A=
 2 files changed, 18 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass=
=0A=
index 17417ba..c847645 100644=0A=
--- a/meta/classes/grub-efi.bbclass=0A=
+++ b/meta/classes/grub-efi.bbclass=0A=
@@ -16,8 +16,8 @@=0A=
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)=
=0A=
 # ${GRUB_ROOT} - grub's root device.=0A=
=0A=
-do_bootimg[depends] +=3D "${MLPREFIX}grub-efi:do_deploy"=0A=
-do_bootdirectdisk[depends] +=3D "${MLPREFIX}grub-efi:do_deploy"=0A=
+do_bootimg[depends] +=3D "${MLPREFIX}${EFI_PROVIDER}:do_deploy"=0A=
+do_bootdirectdisk[depends] +=3D "${MLPREFIX}${EFI_PROVIDER}:do_deploy"=0A=
=0A=
 GRUB_SERIAL ?=3D "console=3DttyS0,115200"=0A=
 GRUB_CFG_VM =3D "${S}/grub_vm.cfg"=0A=
@@ -40,10 +40,21 @@ efi_populate() {=0A=
=0A=
        install -d ${DEST}${EFIDIR}=0A=
=0A=
-       GRUB_IMAGE=3D"bootia32.efi"=0A=
-       if [ "${TARGET_ARCH}" =3D "x86_64" ]; then=0A=
-               GRUB_IMAGE=3D"bootx64.efi"=0A=
-       fi=0A=
+    if [ "${EFI_PROVIDER}" =3D "grub" ]; then=0A=
+           GRUB_IMAGE=3D"bootia32.${GRUBPLATFORM}"=0A=
+           if [ "${TARGET_ARCH}" =3D "x86_64" ]; then=0A=
+                   GRUB_IMAGE=3D"bootx64.${GRUBPLATFORM}"=0A=
+           elif [ "${TARGET_ARCH}" =3D "arm" ]; then=0A=
+            grubimage =3D "bootarm.${GRUBPLATFORM}"=0A=
+           elif [ "${TARGET_ARCH}" =3D "aarch64" ]; then=0A=
+            grubimage =3D "bootaa64.${GRUBPLATFORM}"=0A=
+        fi=0A=
+    else=0A=
+        GRUB_IMAGE=3D"bootia32.efi"=0A=
+           if [ "${TARGET_ARCH}" =3D "x86_64" ]; then=0A=
+                   GRUB_IMAGE=3D"bootx64.efi"=0A=
+        fi=0A=
+    fi=0A=
        install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}=
=0A=
        EFIPATH=3D$(echo "${EFIDIR}" | sed 's/\//\\/g')=0A=
        printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" >${DEST}/startup.nsh=
=0A=
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-com=
mon.bbclass=0A=
index 734697f..0af228b 100644=0A=
--- a/meta/classes/live-vm-common.bbclass=0A=
+++ b/meta/classes/live-vm-common.bbclass=0A=
@@ -13,7 +13,7 @@ def set_live_vm_vars(d, suffix):=0A=
=0A=
 EFI =3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"=0A=
 EFI_PROVIDER ?=3D "grub-efi"=0A=
-EFI_CLASS =3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROV=
IDER}", "", d)}"=0A=
+EFI_CLASS =3D "${@bb.utils.contains("EFI_PROVIDER", "grub", "grub-efi", "$=
{EFI_PROVIDER}", d)}"=0A=
=0A=
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does =
not=0A=
 # contain "efi". This way legacy is supported by default if neither is=0A=
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

