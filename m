Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.540.1793726077333896886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 09:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OeIFvFjS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57676bf431=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E73aP3130526
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2026 09:14:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=9bdkyPgoN
	tR4amNVMUgDfTEx77u0/RIWPd6Mj3QDOo0=; b=OeIFvFjSiT0cwiLu3dDUhtxWu
	xJ0MVDQZsJMeSovf4S8KgUL/yBmdYWqGnodvHcJzjXC8coLG//LfG2ElMzePkI71
	Dv/gNEDKdZCK3AV2MyNhAbENlWwoUPVkX+5pYhQA3aJBy1thRiM4zP9BpOUUU8/s
	UC80PBXAFvTIpjopepBHjYpaysBemxlNRp3BtUUefGPaKFBPIaGrvFJMUBbl1WzB
	Ciw78atGtwIfzsP+pDteuC8BmU2+NLakSLmzbD3orwxYL4Siueix6QiIMfFdqVij
	zUrHQ3eZfa5co1I+wTg7KXcgDbnFkCAl7Ah6W8fSwgoDV/sj8omYkLE6xEXiw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1mkda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:14:36 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Tue, 3 Nov 2026 09:14:35 -0800
Received: from yow-vravikan-lx1.corp.ad.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Nov 2026 09:14:32 -0800
From: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <randy.macleod@windriver.com>,
        Sumanth Gavini
	<sumanth.gavini@windriver.com>,
        Rachit Sharma <rachit.sharma@windriver.com>,
        Venky <venkatasainath.ravikanti@windriver.com>
Subject: [OE-core][PATCH] maintainers.inc: volunteer to maintain recipes
Date: Tue, 3 Nov 2026 12:14:24 -0500
Message-ID: <20261103171426.635820-1-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfX1PqvfGUQ0hjw
 WcSMFrY/8/XKXqcXfQvA3lIMCH96Vdz85oukmobJp81Dv3de2vpx/LW/jnBVoIITjd7oUuwu0Xl
 0xq6vonjWTbXDtuAIpHLAEbnPU0YJmyc/UbDhNYhRJiqr5LyWsLt4P6Qw79O2Yp/YSPN1TjhCVa
 DQyXksvu67mvtwT+os9D2SYoQOcKICJW9ksCf1sYSxKdaJAWC89S3roYarCQoR9dkWESeoKUgeV
 MzIDo7An5S7wvnz1CHBM98qly/BTSpllJ6DWDHBOtyTIgZOQUGUJSWqibk0WvLAx5SSMVkBphtM
 c27wjhTpoIzpeGECrAAvciH89nvOk2DsELlNHJzHcjgeKpE0CeAWDMB0rVnwTaG555KtIZrYAY5
 IqvbiIeLECepT7v515pZXdnKNw0EX6jv9xWyt0HLw1dVFJZ0i40pkBRRoE2ST3LjQwzklhclO/h
 8ll9nKewGhlXfqVm+qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfXydpinmRMYsFW
 CoPvp0K0InAxV15SwGdQzlftjDKkzS8LjgYYTrU5N40wvrfP0+SubBJ0VLCEAh+4fO/4wbtFJFX
 QEIbropmxBinhFAxMJsK0k9qU79vvDUHiovcKizzRNKfTRC2dozd
X-Proofpoint-ORIG-GUID: RxJaCMVR0Ogu_p6UrOR8kWvC63hEZbPj
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6aea167c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=omOdbC7AAAAA:8 a=d70CFdQeAAAA:8
 a=7CQSdrXTAAAA:8 a=_iH6NxeTAAAA:8 a=IpJZQVW2AAAA:8 a=ag1SF4gXAAAA:8
 a=0gcC27t9AAAA:8 a=sMS2-BuVMfAFNp5841QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=zZzRKORMDKZaSe7LaTAy:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=f5sM90hAhNS9OGT-JDKn:22
X-Proofpoint-GUID: RxJaCMVR0Ogu_p6UrOR8kWvC63hEZbPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A3E73aP3130526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 17:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249291

Volunteer Venkatasainath Ravikanti as the maintainer for bison, flex,
json-c, json-glib, logrotate, makedevs, mesa, mesa-demos, mesa-gl,
mesa-tools-native, patch, resolvconf, sudo, sysfsutils and util-linux,
taking them over from their previous maintainers or from Unassigned.

Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriv=
er.com>
---
 meta/conf/distro/include/maintainers.inc | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9c7ab70bd0..a8de550348 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
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
@@ -184,7 +184,7 @@ RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
-RECIPE_MAINTAINER:pn-flex =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-flex =3D "Venkatasainath Ravikanti <venkatasainath.=
ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-fmt =3D "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-font-util =3D "Unassigned <unassigned@yoctoproject.=
org>"
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
@@ -487,7 +487,7 @@ RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gma=
il.com>"
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
@@ -505,7 +505,7 @@ RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang=
@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-make =3D "Aravind Bandari <Aravind.Bandari@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
-RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-makedevs =3D "Venkatasainath Ravikanti <venkatasain=
ath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
 RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-man-pages =3D "Sumanth Gavini <sumanth.gavini@windr=
iver.com>"
@@ -521,11 +521,11 @@ RECIPE_MAINTAINER:pn-matchbox-wm =3D "Ross Burton <=
ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mc =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mdadm =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-menu-cache =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-mesa =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-mesa-demos =3D "Unassigned <unassigned@yoctoproject=
.org>"
-RECIPE_MAINTAINER:pn-mesa-gl =3D "Unassigned <unassigned@yoctoproject.or=
g>"
+RECIPE_MAINTAINER:pn-mesa =3D "Venkatasainath Ravikanti <venkatasainath.=
ravikanti@windriver.com>"
+RECIPE_MAINTAINER:pn-mesa-demos =3D "Venkatasainath Ravikanti <venkatasa=
inath.ravikanti@windriver.com>"
+RECIPE_MAINTAINER:pn-mesa-gl =3D "Venkatasainath Ravikanti <venkatasaina=
th.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-mesa-libclc =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>"
-RECIPE_MAINTAINER:pn-mesa-tools-native =3D "Unassigned <unassigned@yocto=
project.org>"
+RECIPE_MAINTAINER:pn-mesa-tools-native =3D "Venkatasainath Ravikanti <ve=
nkatasainath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-meson =3D "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} =3D "Richard Purdie <ri=
chard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} =3D "Richard Pur=
die <richard.purdie@linuxfoundation.org>"
@@ -590,7 +590,7 @@ RECIPE_MAINTAINER:pn-p11-kit =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-package-index =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-pango =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-parted =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-patch =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-patch =3D "Venkatasainath Ravikanti <venkatasainath=
.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-patchelf =3D "Richard Purdie <richard.purdie@linuxf=
oundation.org>"
 RECIPE_MAINTAINER:pn-pbzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-pciutils =3D "Karthik <karthik.gopal@windriver.com>=
"
@@ -772,7 +772,7 @@ RECIPE_MAINTAINER:pn-quota =3D "Unassigned <unassigne=
d@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-re2c =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-readline =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
 RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-resolvconf =3D "Venkatasainath Ravikanti <venkatasa=
inath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -822,9 +822,9 @@ RECIPE_MAINTAINER:pn-startup-notification =3D "Unassi=
gned <unassigned@yoctoproject
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
+RECIPE_MAINTAINER:pn-sysfsutils =3D "Venkatasainath Ravikanti <venkatasa=
inath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-sysklogd =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-syslinux =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-sysstat =3D "Karthik <karthik.gopal@windriver.com>"
@@ -866,7 +866,7 @@ RECIPE_MAINTAINER:pn-unzip =3D "Denys Dmytriyenko <de=
nis@denix.org>"
 RECIPE_MAINTAINER:pn-update-rc.d =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-usbutils =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-utfcpp =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-util-linux =3D "Venkatasainath Ravikanti <venkatasa=
inath.ravikanti@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Chen Qi <Qi.Chen@windriver.=
com>"
 RECIPE_MAINTAINER:pn-util-macros =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-v86d =3D "Unassigned <unassigned@yoctoproject.org>"
--=20
2.53.0

