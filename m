Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19479.1792663967895176865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dukBR/LT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: roshs@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0AfC3427136;
	Thu, 22 Oct 2026 10:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hz7YvzjFrzWMWLhYQLuVVg5TpUzkoZBmL7E
	mjleTu8Q=; b=dukBR/LTtthAdo6CzN+v+ZXZuSBItFw6yd9Ch1RayZXfoQ6pbJH
	O3q98kHz5vMM4+rLuJXwGxCWOTWn4PGABjVbDueCX3VWZpPxed+xUgSNwIbly0A0
	iOBibXt8cPxTYbOqmsbPUuBiGnmuJIJPV665KcyLPTYaGBXl977GDmshoHs3Cz3y
	GTB7TPaDbpzXASBQS1sAVD9B8svoKGF7U9DXaUqFwaxN0NbsSwJpjK4HYk4zr0uh
	vS+zW+ZXPAFN2GNCLOUHZ8/Bca3YwN6nDZARpTYClP2mM2jnzPmMsApr4U4Sq64/
	/P7fr7lgXxllybXzXtSClSf/vbzxTMPrdVQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0h1k-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 10:12:46 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8kw6I1985538;
	Thu, 22 Oct 2026 08:46:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-roshs-hyd.qualcomm.com [10.147.243.236])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M8kw3H1985531
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 08:46:58 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4086833)
	id 27AD0B80; Thu, 22 Oct 2026 14:16:57 +0530 (+0530)
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Sumanth Gavini <sumanth.gavini@windriver.com>,
        Roshan Sivakumar <roshs@qti.qualcomm.com>
Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dependency generator
Date: Thu, 22 Oct 2026 14:16:35 +0530
Message-Id: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: o7b8vQ_v3fPqDOlFw-uuaquC-TxOmo65
X-Proofpoint-ORIG-GUID: o7b8vQ_v3fPqDOlFw-uuaquC-TxOmo65
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX4npkkDDZE1Gu
 GLP1Z6b16Cc5SOtO7ppp+3Jxm8KEWDZHD7GAyvzfRAfSh1xQ+qwHEDW6aOqC7GT3xkrchJ+TB8f
 nmuTBiWfQn6yrwN8lspd1jcrJJFUleE=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e19e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=vLLX-xeOgGuXLJo5pdYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXyN4RQALvwIzo
 RVzdYhstO3kivg3w35oaUy2DfSoMQdzt9aDZkxFYMm5A1bWukUQNPLvjVz78IPlCd4XddhNphPD
 8FdxwoIAqA/3HfGGRQzz7CRAKKWk3aU9X4VuGMO0J2jvCZXZtM/sp7FpC0ezEy16JOyru5cpxmR
 Bpsx0tlKJcM4dI1THc4R+6EXn1RlPU3EeRiFW1xsXodnQ7WgoV9/JxM2dKbr+JUMf+MC8R0DtLN
 8S2qUFtgoKAq2DWfWRr/ySwbEL0+H68GKrM0946rtjYjsVfEV/RxDfg0zU4B1lZn3i3UB67nAjT
 gSok5xv6vOXiDKi8oyGUxUGFpCn7M661bzfrkUGFaqpnadUMIdDYeqfhZVi9/IjpcKZCTClfvtg
 7tnOj2vDuByqIg9agsR7lAmCp9++7+TrPrX+hpzatGEDO19Ps2Iu1QBXAT+ZuH/RnIBNu0vZ9+O
 pV/1wi+UiL1WKRoKW5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248435
Content-Type: text/plain; charset="utf-8"

RPM 4 generated dependencies with the external __find_requires /
__find_provides generator, which OE disabled entirely via
_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
v6-format packages only the internal fileattr generators run.

rpm's script.attr generator therefore runs for the first time in OE
builds. For every packaged executable whose first line is a #! shebang
it emits an interpreter dependency. kernel-devsrc ships
scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:

  Requires: /bin/sed

OE manages build and runtime dependencies explicitly through
DEPENDS / RDEPENDS and does not want these. They break real use cases:

- The interpreter path is taken verbatim from the shebang. A #!/bin/sed
  script requires /bin/sed, but under usrmerge the only provider
  (busybox) offers /usr/bin/sed. The literal paths never match and the
  package becomes uninstallable.
- In the SDK the sole interpreter providers (busybox, coreutils, bash,
  perl) are deliberately banned by target-sdk-provides-dummy, so these
  auto-generated requires make -dev/-src packages uninstallable during
  do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").
- The requires are non-reproducible: they are only emitted when the
  interpreter is scanned from the shebang during packaging, so the same
  recipe can produce different packages between the reproducible A and
  B builds.

This is the same class of regression already handled for the pkgconfig
generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".

Suppressing the generator from the rpmbuild command line
(__requires_exclude / __script_requires set to %{nil}) is not reliable:
rpm reloads the fileattr macros during dependency generation and
clobbers the --define. Remove script.attr and its helper script.req
from rpm's install lists via a source patch. This changes
do_unpack/do_patch, so the whole rpm recipe and everything downstream
re-hash and no stale rpm-native is reused.

Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
---
 ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-interpreter-dependency-gen.patch

diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-interpreter-dependency-gen.patch
new file mode 100644
index 0000000000..8c3d1769c8
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-interpreter-dependency-gen.patch
@@ -0,0 +1,72 @@
+From: Roshan Sivakumar <roshs@qti.qualcomm.com>
+Date: Thu, 16 Oct 2026 00:00:00 +0000
+Subject: [PATCH] Do not install the script interpreter dependency generator
+
+RPM 4 generated dependencies with the external __find_requires /
+__find_provides generator, which OE disabled entirely via
+_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
+v6-format packages only the internal fileattr generators run.
+
+rpm's script.attr generator therefore runs for the first time in OE
+builds. For every packaged executable whose first line is a #! shebang
+it adds an interpreter dependency, e.g. a kernel-devsrc package shipping
+scripts/mksysmap (#!/bin/sed -f) gains:
+
+  Requires: /bin/sed
+
+OpenEmbedded manages build and runtime dependencies explicitly via
+DEPENDS/RDEPENDS and does not want these. They break real use cases:
+
+- The literal interpreter path is taken verbatim from the shebang, so a
+  #!/bin/sed script requires /bin/sed while the only provider (busybox)
+  offers /usr/bin/sed under usrmerge. The paths never match and the
+  package is uninstallable.
+- In the SDK the sole interpreter providers (busybox, coreutils, bash,
+  perl) are deliberately banned by target-sdk-provides-dummy, so these
+  auto-generated requires make -dev/-src packages uninstallable during
+  do_populate_sdk ("nothing provides /bin/sed").
+- The requires are non-reproducible: they are only emitted when the
+  interpreter happens to be scanned from the shebang in the build
+  sysroot, so the same recipe can produce different packages.
+
+This is the same class of problem fixed for pkgconfig.attr; see
+"rpm: disable the RPM 6 pkgconfig dependency generator".
+
+Suppressing the generator from the rpmbuild command line is not
+reliable: rpm reloads the fileattr macros during dependency generation
+and clobbers any --define. Remove script.attr and its helper script.req
+from rpm's install lists via a source patch. This changes
+do_unpack/do_patch, so the whole rpm recipe and everything downstream
+re-hash and no stale rpm-native is reused.
+
+Upstream-Status: Inappropriate [OE policy: dependencies are managed by the build system, not generated by rpmbuild]
+
+Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
+---
+ fileattrs/CMakeLists.txt | 2 +-
+ scripts/CMakeLists.txt   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt
+--- a/fileattrs/CMakeLists.txt
++++ b/fileattrs/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ install(FILES
+ 	debuginfo.attr desktop.attr elf.attr font.attr metainfo.attr
+ 	ocaml.attr
+-	rpm_macro.attr rpm_lua.attr script.attr sysusers.attr usergroup.attr
++	rpm_macro.attr rpm_lua.attr sysusers.attr usergroup.attr
+ 	DESTINATION ${RPM_CONFIGDIR}/fileattrs
+ )
+diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
+--- a/scripts/CMakeLists.txt
++++ b/scripts/CMakeLists.txt
+@@ -6,7 +6,7 @@ install(PROGRAMS
+ 	check-buildroot check-rpaths check-rpaths-worker
+ 	find-lang.sh find-requires find-provides
+ 	ocamldeps.sh
+-	fontconfig.prov script.req
++	fontconfig.prov
+ 	rpm_macros_provides.sh
+ 	rpmdb_dump rpmdb_load
+ 	rpm2cpio.sh tgpg
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index c27f58a0e8..6c80c839ca 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rp
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch \
+           file://0004-Do-not-install-the-script-interpreter-dependency-gen.patch \
            "
 
 PE = "1"
-- 
2.34.1

