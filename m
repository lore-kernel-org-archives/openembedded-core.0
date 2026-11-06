Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6361.1794000499115382997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 13:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VXgfqxp0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5770971b67=rachit.sharma@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HrMmg2673654
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 13:28:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BQur3UJ8DGPfVK7Fg2B9
	uusZLeqipTFEjn9HikH2soI=; b=VXgfqxp06pjDmoNsOFDNmwqvUA3GiNTJXjJa
	9Fv8W978kuF0YQF27A5oTRzyvF5oUExUKdcJGkJmGrsxniQQIDtGG/BAY0E4Ctpp
	B1ydAOvyP53YFKqQZT1n3PxZbZvC7Mq9LjH5GJDxaIdbe+GD9qwoV1jtXheMMnDZ
	bGdFL5YLW04BMMQ2WA/9MpL8IEJ3Oh8oSAG+DS1OsdcjSu4dnnVn1BKOB+nJqQ6J
	DyRBVd1RwXS2rZcydTRCCanJAyGV8ttbz6Fyey3VVN3BmRLym5p2+HX+cQLdPAyt
	TG+Y5UTBwytYcsaxQuIZZ5en9R7wFnU+8Cq3SKFjr69jmvWkyA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3prhrpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:28:18 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Fri, 6 Nov 2026 13:28:17 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 6 Nov 2026 13:28:17 -0800
From: <rachit.sharma@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] maintainers.inc: update additional recipe maintainers
Date: Fri, 6 Nov 2026 21:28:15 +0000
Message-ID: <20261106212817.2156903-1-rachit.sharma@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 2Xe4Gl-_dHKMk8twnCyttFAxSXjtefOH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX86bFX7tJO4Pe
 XziUnJJc6pnKn3GA96U/VAuVAkWKAMbOgdUegjPGDUxxUoaVG/z3fwEZvv3n4qLPh3XxTARg84g
 K/B3jgxQc2jMZBEfgWLZWN3xVEDVAvaOkOU3DnhCzcV4tJwfCX6n
X-Proofpoint-GUID: 2Xe4Gl-_dHKMk8twnCyttFAxSXjtefOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX1zkiHkXL1tyZ
 ZKk7w9HiLehGlDIG5t98VgZ+mUTLi2LBiwAmABNBi5nCznpCZ9CoP9hFZWdKk2+UOqigAXYSAtZ
 W6tBfaEWC6veLF7Bdw43Dlfy9/iCzNEJsSWHMq67kNs3UGX4Zx5yuKRhbEGV2c6oUZEqTZxV1VE
 09Fmh/z0w4HjmgLvthIU/bTjnTUjQeBahCA6I7Q/QmIimMYqKXBv3K55mVjsDz05/JiHh1UU2b1
 e5BrYtz8mSnY9MJDuQdj5qMSSaH/4DPxd5REgYYZfrIVvfPtrVvywjUNbPtpUzQicBbLlyhlNjb
 e0Rh4HKjm+eTsWjnnL9F3npkQBwlOBZAMvIDTFbLimGG3BXw6YaWg7h/MzqWKK+x99/YmlWrM4h
 9yF2ccVS4GabMNcPNVkbLefZxACovTuVsdDwlzIGjROUXANuYYvaWc/2d0uu1wyCtCJmJ7sHs4U
 7Ed8KUEtNC6bWMojfrw==
X-Authority-Analysis: v=2.4 cv=T/kZ3PKQ c=1 sm=1 tr=0 ts=6aee4672 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=0gcC27t9AAAA:8 a=r9lhY5OmAAAA:8
 a=67k8HWImAAAA:8 a=d70CFdQeAAAA:8 a=uChsZFC9AAAA:8 a=IpJZQVW2AAAA:8
 a=a_U1oVfrAAAA:8 a=EUspDBNiAAAA:8 a=zjtiufAZAAAA:8 a=_iH6NxeTAAAA:8
 a=COk6AnOGAAAA:8 a=UmpJZ9HE9-grymgpjnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=uCSXFHLys93vLW5PjgO_:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=lBmE0PM3J_p9GLi-zqlx:22 a=-Ce2kUORdVUGt2UwD6To:22 a=NcxpMcIZDGm-g932nG_k:22
 a=ULtXvzFHYWHLyBAuiDia:22 a=IawgGOuG5U0WyFbmm1f5:22 a=2tRhtM0yMehlNRDZlsEQ:22
 a=zZzRKORMDKZaSe7LaTAy:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A6HrMmg2673654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 21:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249717

From: Rachit Sharma <rachit.sharma@windriver.com>

Signed-off-by: Rachit Sharma <rachit.sharma@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 162 +++++++++++------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3b050f8559..35503d2db9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -28,7 +28,7 @@
 # Please keep this list in alphabetical order using the C locale.
 # (e.g. use 'LC_ALL=3DC sort' to sort the list).
 #
-RECIPE_MAINTAINER:pn-acl =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-acl =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-acpica =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-acpid =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-adwaita-icon-theme =3D "Ross Burton <ross.burton@ar=
m.com>"
@@ -44,15 +44,15 @@ RECIPE_MAINTAINER:pn-apr =3D "Enoch Ng <enoch.ng@wind=
river.com>"
 RECIPE_MAINTAINER:pn-apr-util =3D "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-apt =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-asciidoc =3D "Kanksha Paturi <Kanksha.Paturi@windri=
ver.com>"
+RECIPE_MAINTAINER:pn-asciidoc =3D "Venkatasainath Ravikanti <venkatasain=
ath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-at =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-at =3D "Sumanth Gavini <sumanth.gavini@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-at-spi2-core =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-attr =3D "Rachit Sharma <Rachit.Sharma@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-autoconf =3D "Aravind Bandari <Aravind.Bandari@wind=
river.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive =3D "Aravind Bandari <Aravind.Band=
ari@windriver.com>"
 RECIPE_MAINTAINER:pn-automake =3D "Aravind Bandari <Aravind.Bandari@wind=
river.com>"
-RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-avahi =3D "Abinav Parupudi <abinav.parupudi@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-avahi-libnss-mdns =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-babeltrace2 =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yocto@pengutronix.d=
e>"
@@ -70,7 +70,7 @@ RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} =3D =
"Khem Raj <raj.khem@gmail.c
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D=
 "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <raj.khem@gmail.co=
m>"
-RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-bison =3D "Venkatasainath Ravikanti <venkatasainath=
.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <liuyd.fnst@fuji=
tsu.com>"
 RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org=
>"
@@ -96,9 +96,9 @@ RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <u=
nassigned@yoctoproject.org>
 RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.MacLeod@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-cargo-c =3D "Deepesh Varatharajan <Deepesh.Varathar=
ajan@windriver.com>"
 RECIPE_MAINTAINER:pn-ccache =3D "Sumanth Gavini <sumanth.gavini@windrive=
r.com>"
-RECIPE_MAINTAINER:pn-cdrtools-native =3D "Yi Zhao <yi.zhao@windriver.com=
>"
-RECIPE_MAINTAINER:pn-cgo-helloworld =3D "Changqing Li <changqing.li@wind=
river.com>"
-RECIPE_MAINTAINER:pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-cdrtools-native =3D "Abinav Parupudi <abinav.parupu=
di@windriver.com>"
+RECIPE_MAINTAINER:pn-cgo-helloworld =3D "Abinav Parupudi <abinav.parupud=
i@windriver.com>"
+RECIPE_MAINTAINER:pn-chrpath =3D "Abinav Parupudi <abinav.parupudi@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-clang =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-clang-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D =
"Khem Raj <raj.khem@gmail.com>"
@@ -110,7 +110,7 @@ RECIPE_MAINTAINER:pn-compiler-rt-sanitizers =3D "Khem=
 Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-connman =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-connman-conf =3D "Ross Burton <ross.burton@arm.com>=
"
 RECIPE_MAINTAINER:pn-connman-gnome =3D "Ross Burton <ross.burton@arm.com=
>"
-RECIPE_MAINTAINER:pn-consolekit =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-consolekit =3D "Harish Kore <harish.kore@windriver.=
com>"
 RECIPE_MAINTAINER:pn-core-image-base =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-full-cmdline =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-initramfs-boot =3D "Ross Burton <ross.bu=
rton@arm.com>"
@@ -130,32 +130,32 @@ RECIPE_MAINTAINER:pn-core-image-tiny-initramfs =3D =
"Richard Purdie <richard.purdie
 RECIPE_MAINTAINER:pn-core-image-weston =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston-sdk =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-coreutils =3D "Ahmed Merdan <ahmed.merdan@windriver=
.com>"
 RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-createrepo-c =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-cronie =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-cross-localedef-native =3D "Khem Raj <raj.khem@gmai=
l.com>"
-RECIPE_MAINTAINER:pn-cryptodev-linux =3D "Karthik <karthik.gopal@windriv=
er.com>"
-RECIPE_MAINTAINER:pn-cryptodev-module =3D "Karthik <karthik.gopal@windri=
ver.com>"
-RECIPE_MAINTAINER:pn-cryptodev-tests =3D "Karthik <karthik.gopal@windriv=
er.com>"
-RECIPE_MAINTAINER:pn-cups =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-linux =3D "Ahmed Merdan <ahmed.merdan@win=
driver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-module =3D "Ahmed Merdan <ahmed.merdan@wi=
ndriver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-tests =3D "Ahmed Merdan <ahmed.merdan@win=
driver.com>"
+RECIPE_MAINTAINER:pn-cups =3D "Ahmed Merdan <ahmed.merdan@windriver.com>=
"
 RECIPE_MAINTAINER:pn-curl =3D "Robert Joslyn <robert.joslyn@redrectangle=
.org>"
 RECIPE_MAINTAINER:pn-db =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus =3D "Juhandr=C3=A9 Knoetze <juhandre.knoetze@w=
indriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib =3D "Juhandr=C3=A9 Knoetze <juhandre.knoe=
tze@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-wait =3D "Juhandr=C3=A9 Knoetze <juhandre.knoe=
tze@windriver.com>"
-RECIPE_MAINTAINER:pn-debianutils =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-debugedit =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-debianutils =3D "Ahmed Merdan <ahmed.merdan@windriv=
er.com>"
+RECIPE_MAINTAINER:pn-debugedit =3D "Ahmed Merdan <ahmed.merdan@windriver=
.com>"
 RECIPE_MAINTAINER:pn-dejagnu =3D "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER:pn-depmodwrapper-cross =3D "Unassigned <unassigned@yoc=
toproject.org>"
 RECIPE_MAINTAINER:pn-desktop-file-utils =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-dhcpcd =3D "Jaipaul Cheernam <jaipaul.cheernam@est.=
tech>"
 RECIPE_MAINTAINER:pn-diffoscope =3D "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-diffstat =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-diffutils =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-distcc =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-distcc-config =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-diffstat =3D "Ahmed Merdan <ahmed.merdan@windriver.=
com>"
+RECIPE_MAINTAINER:pn-diffutils =3D "Ahmed Merdan <ahmed.merdan@windriver=
.com>"
+RECIPE_MAINTAINER:pn-distcc =3D "Ahmed Merdan <ahmed.merdan@windriver.co=
m>"
+RECIPE_MAINTAINER:pn-distcc-config =3D "Kusuma Dirisala <kusuma.dirisala=
@windriver.com>"
 RECIPE_MAINTAINER:pn-dmidecode =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-dnf =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-docbook-xml-dtd4 =3D "Kanksha Paturi <Kanksha.Patur=
i@windriver.com>"
@@ -163,9 +163,9 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets =3D "Kan=
ksha Paturi <Kanksha.Paturi@w
 RECIPE_MAINTAINER:pn-dos2unix =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dpkg =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-dropbear =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-dropbear =3D "Harish Kore <harish.kore@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-dtc =3D "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-e2fsprogs =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
+RECIPE_MAINTAINER:pn-e2fsprogs =3D "Kusuma Dirisala <kusuma.dirisala@win=
driver.com>"
 RECIPE_MAINTAINER:pn-ed =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burton@arm.com>"
@@ -177,14 +177,14 @@ RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unas=
signed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-ethtool =3D "Jaipaul Cheernam <jaipaul.cheernam@est=
.tech>"
 RECIPE_MAINTAINER:pn-eudev =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-expat =3D "Kusuma Dirisala <kusuma.dirisala@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-fastfloat =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-file =3D "Kusuma Dirisala <kusuma.dirisala@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-findutils =3D "Kusuma Dirisala <kusuma.dirisala@win=
driver.com>"
 RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
-RECIPE_MAINTAINER:pn-flex =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-flex =3D "Venkatasainath Ravikanti <venkataVenkatas=
ainath Ravikanti <venkatasainath.ravikanti@windriver.com>>"
 RECIPE_MAINTAINER:pn-fmt =3D "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-font-util =3D "Unassigned <unassigned@yoctoproject.=
org>"
@@ -193,7 +193,7 @@ RECIPE_MAINTAINER:pn-formfactor =3D "Ross Burton <ros=
s.burton@arm.com>"
 RECIPE_MAINTAINER:pn-freetype =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-fribidi =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-fts =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gawk =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-gawk =3D "Kusuma Dirisala <kusuma.dirisala@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-gcc =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-cross-${TARGET_ARCH} =3D "Khem Raj <raj.khem@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "K=
hem Raj <raj.khem@gmail.com>"
@@ -228,8 +228,8 @@ RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-gn =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross Burton <ross.burton=
@arm.com>"
 RECIPE_MAINTAINER:pn-gnu-config =3D "Sumanth Gavini <sumanth.gavini@wind=
river.com>"
-RECIPE_MAINTAINER:pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-gnupg =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-gnu-efi =3D "Venkata Adhitya Navuduri <venkata.navu=
duri@windriver.com>"
+RECIPE_MAINTAINER:pn-gnupg =3D "Harish Kore <harish.kore@windriver.com>"
 RECIPE_MAINTAINER:pn-gnutls =3D "Simone Wei=C3=9F <simone.p.weiss@posteo=
.net>"
 RECIPE_MAINTAINER:pn-go =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-binary-native =3D "Khem Raj <raj.khem@gmail.com>=
"
@@ -240,10 +240,10 @@ RECIPE_MAINTAINER:pn-go-helloworld =3D "Khem Raj <r=
aj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-runtime =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gobject-introspection =3D "Unassigned <unassigned@y=
octoproject.org>"
 RECIPE_MAINTAINER:pn-gperf =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-gpgme =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-gpgme =3D "Kusuma Dirisala <kusuma.dirisala@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-graphene =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-grep =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-groff =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-groff =3D "Kusuma Dirisala <kusuma.dirisala@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-grub =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-grub-bootconf =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-grub-efi =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
@@ -266,7 +266,7 @@ RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-o=
nline.de>"
 RECIPE_MAINTAINER:pn-gzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-harfbuzz =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-hdparm =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-help2man =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
+RECIPE_MAINTAINER:pn-help2man =3D "Kusuma Dirisala <kusuma.dirisala@wind=
river.com>"
 RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-hwdata =3D "Hiago De Franco <hfranco@baylibre.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
@@ -298,8 +298,8 @@ RECIPE_MAINTAINER:pn-iso-codes =3D "Wang Mingyu <wang=
my@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-iw =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-jansson =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-json-c =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-json-glib =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-json-c =3D "Venkatasainath Ravikanti <venkatasainat=
h.ravikanti@windriver.com>"
+RECIPE_MAINTAINER:pn-json-glib =3D "Venkatasainath Ravikanti <venkatasai=
nath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-kbd =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kea =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kern-tools-native =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
@@ -307,7 +307,7 @@ RECIPE_MAINTAINER:pn-kernel-devsrc =3D "Bruce Ashfiel=
d <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kernel-signing-keys-native =3D "Adrian Freihofer <a=
drian.freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-kexec-tools =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-keymaps =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-kmod =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-kmod =3D "Peyman Jahangirlou <peyman.jahangirlou@wi=
ndriver.com>"
 RECIPE_MAINTAINER:pn-kmscube =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-l3afpad =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
@@ -319,13 +319,13 @@ RECIPE_MAINTAINER:pn-libaio =3D "Unassigned <unassi=
gned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libarchive =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-libassuan =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libatomic-ops =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
-RECIPE_MAINTAINER:pn-libbsd =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libbsd =3D "Kusuma Dirisala <kusuma.dirisala@windri=
ver.com>"
 RECIPE_MAINTAINER:pn-libc-test =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-libcap =3D "Karthik <karthik.gopal@windriver.com>"
+RECIPE_MAINTAINER:pn-libcap =3D "Ajay Mahajan <ajay.mahajan@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-libcap-ng =3D "Kris Gavvala <kris.gavvala@windriver=
.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python =3D "Kris Gavvala <kris.gavvala@wi=
ndriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-libcheck =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libcheck =3D "Venkata Adhitya Navuduri <venkata.nav=
uduri@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libconfig =3D "Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
@@ -346,16 +346,16 @@ RECIPE_MAINTAINER:pn-libffi =3D "Unassigned <unassi=
gned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libfm-extra =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-libfontenc =3D "Unassigned <unassigned@yoctoproject=
.org>"
-RECIPE_MAINTAINER:pn-libfyaml =3D "Changqing Li <changqing.li@windriver.=
com>"
+RECIPE_MAINTAINER:pn-libfyaml =3D "Venkata Adhitya Navuduri <venkata.nav=
uduri@windriver.com>"
 RECIPE_MAINTAINER:pn-libgcc =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgcc-initial =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-libgcrypt =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
+RECIPE_MAINTAINER:pn-libgcrypt =3D "Harish Kore <harish.kore@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-libgfortran =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgit2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libgloss =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
 RECIPE_MAINTAINER:pn-libglu =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libglvnd =3D "Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>"
-RECIPE_MAINTAINER:pn-libgpg-error =3D "Hongxu Jia <hongxu.jia@windriver.=
com>"
+RECIPE_MAINTAINER:pn-libgpg-error =3D "Venkata Adhitya Navuduri <venkata=
.navuduri@windriver.com>"
 RECIPE_MAINTAINER:pn-libgudev =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libical =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libice =3D "Unassigned <unassigned@yoctoproject.org=
>"
@@ -487,11 +487,11 @@ RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@g=
mail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-23.1.3 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-logrotate =3D "Venkatasainath Ravikanti <venkatasai=
nath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-lrzsz =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-lsb-release =3D "Sumanth Gavini <sumanth.gavini@win=
driver.com>"
 RECIPE_MAINTAINER:pn-lsof =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-ltp =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-ltp =3D "Peyman Jahangirlou <peyman.jahangirlou@win=
driver.com>"
 RECIPE_MAINTAINER:pn-lttng-modules =3D "Richard Purdie <richard.purdie@l=
inuxfoundation.org>"
 RECIPE_MAINTAINER:pn-lttng-tools =3D "Richard Purdie <richard.purdie@lin=
uxfoundation.org>"
 RECIPE_MAINTAINER:pn-lttng-ust =3D "Richard Purdie <richard.purdie@linux=
foundation.org>"
@@ -501,13 +501,13 @@ RECIPE_MAINTAINER:pn-lzip =3D "Denys Dmytriyenko <d=
enis@denix.org>"
 RECIPE_MAINTAINER:pn-lzlib =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzo =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzop =3D "Marek Vasut <marex@denx.de>"
-RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
+RECIPE_MAINTAINER:pn-m4 =3D "Peyman Jahangirlou <peyman.jahangirlou@wind=
river.com>"
+RECIPE_MAINTAINER:pn-m4-native =3D "Peyman Jahangirlou <peyman.jahangirl=
ou@windriver.com>"
 RECIPE_MAINTAINER:pn-make =3D "Aravind Bandari <Aravind.Bandari@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
-RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-makedevs =3D "Peyman Jahangirlou <peyman.jahangirlo=
u@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
-RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-man-db =3D "Peyman Jahangirlou <peyman.jahangirlou@=
windriver.com>"
 RECIPE_MAINTAINER:pn-man-pages =3D "Sumanth Gavini <sumanth.gavini@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-matchbox-config-gtk =3D "Ross Burton <ross.burton@a=
rm.com>"
 RECIPE_MAINTAINER:pn-matchbox-desktop =3D "Ross Burton <ross.burton@arm.=
com>"
@@ -535,13 +535,13 @@ RECIPE_MAINTAINER:pn-meta-ide-support =3D "Richard =
Purdie <richard.purdie@linuxfou
 RECIPE_MAINTAINER:pn-meta-toolchain =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-world-pkgdata =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-world-recipe-sbom =3D "Joshua Watt <JPEWhacker=
@gmail.com>"
-RECIPE_MAINTAINER:pn-mingetty =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-mingetty =3D "Peyman Jahangirlou <peyman.jahangirlo=
u@windriver.com>"
 RECIPE_MAINTAINER:pn-mini-x-session =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-minicom =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-mkfontscale =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-mmc-utils =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-mobile-broadband-provider-info =3D "Unassigned <una=
ssigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-modutils-initscripts =3D "Yi Zhao <yi.zhao@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-modutils-initscripts =3D "Peyman Jahangirlou <peyma=
n.jahangirlou@windriver.com>"
 RECIPE_MAINTAINER:pn-mpfr =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-mpg123 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-msmtp =3D "Wang Mingyu <wangmy@fujitsu.com>"
@@ -560,14 +560,14 @@ RECIPE_MAINTAINER:pn-nativesdk-libtool =3D "Richard=
 Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host =3D "Ross Burton <r=
oss.burton@arm.com>"
 RECIPE_MAINTAINER:pn-nativesdk-qemu-helper =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-sdk-provides-dummy =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-ncurses =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-ncurses =3D "Peyman Jahangirlou <peyman.jahangirlou=
@windriver.com>"
 RECIPE_MAINTAINER:pn-neard =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-net-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-netbase =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-nettle =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <alejandro@enedino.=
org>"
-RECIPE_MAINTAINER:pn-nfs-export-root =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
-RECIPE_MAINTAINER:pn-nfs-utils =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
+RECIPE_MAINTAINER:pn-nfs-export-root =3D "Peyman Jahangirlou <peyman.jah=
angirlou@windriver.com>"
+RECIPE_MAINTAINER:pn-nfs-utils =3D "Peyman Jahangirlou <peyman.jahangirl=
ou@windriver.com>"
 RECIPE_MAINTAINER:pn-nghttp2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-ninja =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-npth =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -589,11 +589,11 @@ RECIPE_MAINTAINER:pn-ovmf-shell-image =3D "Unassign=
ed <unassigned@yoctoproject.org
 RECIPE_MAINTAINER:pn-p11-kit =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-package-index =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-pango =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-parted =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-patch =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-parted =3D "Peyman Jahangirlou <peyman.jahangirlou@=
windriver.com>"
+RECIPE_MAINTAINER:pn-patch =3D "Venkatasainath Ravikanti <venkatasainath=
.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-patchelf =3D "Richard Purdie <richard.purdie@linuxf=
oundation.org>"
 RECIPE_MAINTAINER:pn-pbzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-pciutils =3D "Karthik <karthik.gopal@windriver.com>=
"
+RECIPE_MAINTAINER:pn-pciutils =3D "Ajay Mahajan <ajay.mahajan@windriver.=
com>"
 RECIPE_MAINTAINER:pn-pcmanfm =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield <bruce.ashfield@gmail.com>=
"
 RECIPE_MAINTAINER:pn-perl =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -610,10 +610,10 @@ RECIPE_MAINTAINER:pn-pointercal-xinput =3D "Unassig=
ned <unassigned@yoctoproject.or
 RECIPE_MAINTAINER:pn-pong-clock =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-popt =3D "Kris Gavvala <kris.gavvala@windriver.com>=
"
 RECIPE_MAINTAINER:pn-powertop =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
-RECIPE_MAINTAINER:pn-ppp =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-ppp-dialin =3D "Hongxu Jia <hongxu.jia@windriver.co=
m>"
+RECIPE_MAINTAINER:pn-ppp =3D "Thejas Raj <thejas.raj@windriver.com>"
+RECIPE_MAINTAINER:pn-ppp-dialin =3D "Pranav Nayak <HPranav.Nayak@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-procps =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-pseudo =3D "Robert Yang <liezhi.yang@windriver.com>=
"
+RECIPE_MAINTAINER:pn-pseudo =3D "Thejas Raj <thejas.raj@windriver.com>"
 RECIPE_MAINTAINER:pn-psmisc =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-psplash =3D "Sai Sireesha T <saisireesha.t@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-ptest-runner =3D "Ross Burton <ross.burton@arm.com>=
"
@@ -766,13 +766,13 @@ RECIPE_MAINTAINER:pn-qemu-helper-native =3D "Richar=
d Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-qemu-native =3D "Richard Purdie <richard.purdie@lin=
uxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-system-native =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemuwrapper-cross =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-quilt =3D "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-quilt-native =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-quilt =3D "Pranav Nayak <HPranav.Nayak@windriver.co=
m>"
+RECIPE_MAINTAINER:pn-quilt-native =3D "Pranav Nayak <HPranav.Nayak@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-quota =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-re2c =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-readline =3D "Rachit Sharma <Rachit.Sharma@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-resolvconf =3D "Venkatasainath Ravikanti <venkatasa=
inath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-rpcbind =3D "Rachit Sharma <Rachit.Sharma@windriver=
.com>"
@@ -780,7 +780,7 @@ RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.=
khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy =3D "Zolt=C3=A1n B=C3=B6s=
z=C3=B6rm=C3=A9nyi <zboszor@gmail.com>"
-RECIPE_MAINTAINER:pn-rsync =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-rsync =3D "Sumanth Gavini <sumanth.gavini@windriver=
.com>"
 RECIPE_MAINTAINER:pn-rt-tests =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
@@ -802,32 +802,32 @@ RECIPE_MAINTAINER:pn-serf =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-setserial =3D "Sumanth Gavini <sumanth.gavini@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-settings-daemon =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-shaderc =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
-RECIPE_MAINTAINER:pn-shadow =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-shadow-securetty =3D "Chen Qi <Qi.Chen@windriver.co=
m>"
-RECIPE_MAINTAINER:pn-shadow-sysroot =3D "Chen Qi <Qi.Chen@windriver.com>=
"
+RECIPE_MAINTAINER:pn-shadow =3D "Sumanth Gavini <sumanth.gavini@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-shadow-securetty =3D "Venkata Adhitya Navuduri <ven=
kata.navuduri@windriver.com>"
+RECIPE_MAINTAINER:pn-shadow-sysroot =3D "Venkata Adhitya Navuduri <venka=
ta.navuduri@windriver.com>"
 RECIPE_MAINTAINER:pn-shared-mime-info =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <richard.purdie@li=
nuxfoundation.org>"
-RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-slang =3D "Pranav Nayak <HPranav.Nayak@windriver.co=
m>"
+RECIPE_MAINTAINER:pn-socat =3D "Pranav Nayak <HPranav.Nayak@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <michael.opdenacker@r=
ootcommit.com>"
 RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <michael.opdenacke=
r@rootcommit.com>"
 RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <quaresma.jose@gma=
il.com>"
 RECIPE_MAINTAINER:pn-spirv-llvm-translator =3D "Khem Raj <raj.khem@gmail=
.com>"
 RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <quaresma.jose@gmail=
.com>"
 RECIPE_MAINTAINER:pn-sqlite3 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-squashfs-tools =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
+RECIPE_MAINTAINER:pn-squashfs-tools =3D "Pranav Nayak <HPranav.Nayak@win=
driver.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-startup-notification =3D "Unassigned <unassigned@yo=
ctoproject.org>"
 RECIPE_MAINTAINER:pn-strace =3D "Kris Gavvala <kris.gavvala@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-stress-ng =3D "Babanpreet Singh <bbnpreetsingh@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-subversion =3D "Richard Purdie <richard.purdie@linu=
xfoundation.org>"
-RECIPE_MAINTAINER:pn-sudo =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-sudo =3D "Venkatasainath Ravikanti <venkatasainath.=
ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-swig =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-sysfsutils =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-sysklogd =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-sysfsutils =3D "Ajay Mahajan <ajay.mahajan@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-sysklogd =3D "Sai Sireesha T <saisireesha.t@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-syslinux =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
-RECIPE_MAINTAINER:pn-sysstat =3D "Karthik <karthik.gopal@windriver.com>"
+RECIPE_MAINTAINER:pn-sysstat =3D "Sai Sireesha T <saisireesha.t@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-systemd =3D "Sai Sireesha T <saisireesha.t@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-systemd-boot =3D "Sai Sireesha T <saisireesha.t@win=
driver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot-native =3D "Viswanath Kraleti <quic_vk=
raleti@quicinc.com>"
@@ -842,11 +842,11 @@ RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor K=
amensky <victor.kamensky7@gmail
 RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sysvinit-inittab =3D "Ross Burton <ross.burton@arm.=
com>"
 RECIPE_MAINTAINER:pn-taglib =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-tar =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-tar =3D "Thejas Raj <thejas.raj@windriver.com>"
 RECIPE_MAINTAINER:pn-target-sdk-provides-dummy =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-tcf-agent =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-tcl =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-tcl8 =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-tcl =3D "Thejas Raj <thejas.raj@windriver.com>"
+RECIPE_MAINTAINER:pn-tcl8 =3D "Thejas Raj <thejas.raj@windriver.com>"
 RECIPE_MAINTAINER:pn-testexport-tarball =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-texinfo =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-texinfo-dummy-native =3D "Unassigned <unassigned@yo=
ctoproject.org>"
@@ -866,16 +866,16 @@ RECIPE_MAINTAINER:pn-unzip =3D "Denys Dmytriyenko <=
denis@denix.org>"
 RECIPE_MAINTAINER:pn-update-rc.d =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-usbutils =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-utfcpp =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Chen Qi <Qi.Chen@windriver.=
com>"
+RECIPE_MAINTAINER:pn-util-linux =3D "Ajay Mahajan <ajay.mahajan@windrive=
r.com>"
+RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Venkata Adhitya Navuduri <v=
enkata.navuduri@windriver.com>"
 RECIPE_MAINTAINER:pn-util-macros =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-v86d =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-valgrind =3D "Mingli Yu <mingli.yu@windriver.com>"
+RECIPE_MAINTAINER:pn-valgrind =3D "Venkata Adhitya Navuduri <venkata.nav=
uduri@windriver.com>"
 RECIPE_MAINTAINER:pn-vim =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vim-tiny =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-virglrenderer =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
-RECIPE_MAINTAINER:pn-volatile-binds =3D "Chen Qi <Qi.Chen@windriver.com>=
"
+RECIPE_MAINTAINER:pn-volatile-binds =3D "Sumanth Gavini <sumanth.gavini@=
windriver.com>"
 RECIPE_MAINTAINER:pn-vte =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vulkan-headers =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-vulkan-loader =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
@@ -893,7 +893,7 @@ RECIPE_MAINTAINER:pn-wayland-utils =3D "Denys Dmytriy=
enko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-webkitgtk =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-weston =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-weston-init =3D "Denys Dmytriyenko <denis@denix.org=
>"
-RECIPE_MAINTAINER:pn-wget =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-wget =3D "Venkata Adhitya Navuduri <venkata.navudur=
i@windriver.com>"
 RECIPE_MAINTAINER:pn-which =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-wic =3D "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wic-tools =3D "Trevor Woerner <twoerner@gmail.com>"
@@ -932,7 +932,7 @@ RECIPE_MAINTAINER:pn-xinput =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xinput-calibrator =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-xkbcomp =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-xkeyboard-config =3D "Unassigned <unassigned@yoctop=
roject.org>"
-RECIPE_MAINTAINER:pn-xmlto =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-xmlto =3D "Bhavikkumar Girishbhai Ronvelia <Bhavikk=
umarGirishbhai.Ronvelia@windriver.com>"
 RECIPE_MAINTAINER:pn-xmodmap =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-xorg-minimal-fonts =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-xorgproto =3D "Unassigned <unassigned@yoctoproject.=
org>"
--=20
2.43.0

