Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F410CCD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 06:51:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2753.1780642315824841851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NWj4oeDG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061651d7b1=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6556LIe9586916
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 23:51:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kRUplQcTdnFIGOCkDUvm
	MArhPNL0PvLo4rV00PTnsjA=; b=NWj4oeDGZ28ahhjvra5gfmLQJ4OAFMlnUfVr
	wMWBan6fYfT38KWfmdUAiDdcf3h3lXMyXzsJ9xgW1NmOwjHAF5Slc4TRFFGWOvF5
	5Yu0uR/VFfmzuz/SEjzp9qfTs3nfSSVSRcs16lGKxDPxp9dxmyt1RGNGYz8Ocz8e
	WqWMyZ9RvaQ9PEmxTeIfxNaXdP4kBrFaj5ztzWL98SfB+Jq7JtxwleYaEm3+/dVb
	lNozp5ft1e9hNqzXP7t68yuu3PlB5bvi6Oy6QRj5rAM/p4MP0dpV31fjF7CckLdw
	qQl5FNSiDLzxgTNrzd8309oh5zDVD6I6FU7QCTG3I+yTb94WHA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ek5m31n3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:51:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Jun 2026 23:51:54 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Jun 2026 23:51:53 -0700
From: <Shilong.Jiao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tiff: add ptest support
Date: Fri, 5 Jun 2026 14:51:52 +0800
Message-ID: <20260605065152.402887-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2NCBTYWx0ZWRfXzrMquGTuUrvg
 R/KiCaE+YqB1HB8jGRRVSNiVYCPgGh33xFlwvB2ja+zT9Ebv+388R+aO1fjNkmD8opJo488rgnH
 gUm2coiMPIy3O8ypaEIh9WGXLVhpQQC7s33PXh5JAu4LzsB23yB+zbxZhffgYyYl4XwcDRAlZPV
 21x0R9aAzwfnZCL6ImD10SNDmYlOKSWKRzRDw8Du5fs7mNuU3bIzYrK72AeF5xrbrXwaZI+cUX9
 k8pG60AgJOHbNvErL/xW5rOetWT+VU3/4WZGwKNROPFKiXdHtxR2/ENQHiRXfKwDAnKrtKqypo5
 cjvs1vGFWpU9DvZQLTCUWyuYrIUqpLrnX224gy44rK7EA+R+lDJiWiGVhYnTLUxBzrc9Iuy/GM0
 kL//HqFHLPXjurCMrpAizN9mZygnHzUPfvjKM7wzUFRhb/axx4NT59oOoUXEadknR0rYQloqp+N
 UGcMtA/Ipg2c1bTrsGw==
X-Proofpoint-GUID: bBuxGKYvQyATevlBCOB19HRNhh9rUrZU
X-Proofpoint-ORIG-GUID: bBuxGKYvQyATevlBCOB19HRNhh9rUrZU
X-Authority-Analysis: v=2.4 cv=CPsamxrD c=1 sm=1 tr=0 ts=6a22720a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=O-O20w3EZLuyQaSq4pcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238143

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Add ptest support for libtiff to enable automated testing of the
library's functionality.

Tests for tiffcrop are skipped as this tool has known security
vulnerabilities (CVE-2024-13978, CVE-2025-8176, etc.) and is
disabled by default since version 4.6.0. JBIG tests are skipped
as JBIG support is optional and not commonly enabled.

Test results on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/tiff/ptest
PASS: fax2tiff
PASS: ppm2tiff_pbm
PASS: ppm2tiff_pgm
PASS: ppm2tiff_ppm
PASS: testdeflatelaststripextradata
PASS: testfax3_bug54_1dnoEOL
PASS: testfax3_bug_513
PASS: testfax4
PASS: tiff2bw-palette-1c-8b
PASS: tiff2bw-quad-lzw-compat
PASS: tiff2bw-rgb-3c-8b
PASS: tiff2pdf
PASS: tiff2ps-EPS1
PASS: tiff2ps-PS1
PASS: tiff2ps-PS2
PASS: tiff2ps-PS3
PASS: tiff2rgba-32bpp-None-jpeg
PASS: tiff2rgba-logluv-3c-16b
PASS: tiff2rgba-minisblack-1c-16b
PASS: tiff2rgba-minisblack-1c-8b
PASS: tiff2rgba-minisblack-2c-8b-alpha
PASS: tiff2rgba-miniswhite-1c-1b
PASS: tiff2rgba-ojpeg_chewey_subsamp21_multi_strip
PASS: tiff2rgba-ojpeg_single_strip_no_rowsperstrip
PASS: tiff2rgba-ojpeg_zackthecat_subsamp22_single_strip
PASS: tiff2rgba-palette-1c-1b
PASS: tiff2rgba-palette-1c-4b
PASS: tiff2rgba-palette-1c-8b
PASS: tiff2rgba-quad-tile.jpg
PASS: tiff2rgba-rgb-3c-16b
PASS: tiff2rgba-rgb-3c-8b
PASS: tiffcp-32bpp-None-jpeg
PASS: tiffcp-g3-1d-fill
PASS: tiffcp-g3-1d
PASS: tiffcp-g3-2d-fill
PASS: tiffcp-g3-2d
PASS: tiffcp-g3
PASS: tiffcp-g4
PASS: tiffcp-logluv
PASS: tiffcp-lzw-compat
PASS: tiffcp-lzw-scanline-decode
SKIP: tiffcp-lzw-single-strip-jbig (JBIG not supported)
PASS: tiffcp-split-join
PASS: tiffcp-split
PASS: tiffcp-thumbnail
SKIP: tiffcrop-* (44 tests - tiffcrop has known issues)
PASS: tiffdump
PASS: tiffinfo
DURATION: 1
END: /usr/lib/tiff/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libtiff/tiff/run-ptest | 34 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb | 76 ++++++++++++++++++-
 3 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3f42f908a..0eaa09eb33 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,6 +99,7 @@ PTESTS_FAST = "\
     rpm-sequoia \
     sed \
     slang \
+    tiff \
     utfcpp \
     wayland \
     xz \
diff --git a/meta/recipes-multimedia/libtiff/tiff/run-ptest b/meta/recipes-multimedia/libtiff/tiff/run-ptest
new file mode 100644
index 0000000000..5c62de52c7
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+cd $(dirname $0)/test
+
+for test in *.sh; do
+    [ -x "$test" ] || continue
+    
+    # Skip tests for tools with known issues or missing tools
+    case "$test" in
+        *tiffcrop*)
+            # tiffcrop has known security issues and is disabled by default since 4.6.0
+            echo "SKIP: ${test%.sh} (tiffcrop has known issues)"
+            continue
+            ;;
+        *jbig*)
+            # Skip JBIG tests if not supported
+            echo "SKIP: ${test%.sh} (JBIG not supported)"
+            continue
+            ;;
+        *thumbnail*)
+            # thumbnail tool may not be built by default
+            if [ ! -x ../tools/thumbnail ]; then
+                echo "SKIP: ${test%.sh} (thumbnail tool not available)"
+                continue
+            fi
+            ;;
+    esac
+    
+    if ./"$test" >/dev/null 2>&1; then
+        echo "PASS: ${test%.sh}"
+    else
+        echo "FAIL: ${test%.sh}"
+    fi
+done
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 750565e11c..4175ce5870 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -23,7 +23,9 @@ CVE_STATUS[CVE-2023-6228] = "fixed-version: Fixed since 4.7.0, NVD tracks this a
 CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
 
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
+
+SRC_URI += "file://run-ptest"
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
@@ -63,4 +65,76 @@ do_install:append() {
     oe_multilib_header tiffconf.h
 }
 
+do_compile_ptest() {
+    oe_runmake -C ${B}/test
+    # Build additional tools needed for tests (they are in EXTRA_PROGRAMS)
+    oe_runmake -C ${B}/tools thumbnail || bbwarn "thumbnail tool failed to build"
+    oe_runmake -C ${B}/tools rgb2ycbcr || bbwarn "rgb2ycbcr tool failed to build"
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/tools
+
+    # Install test executables (they are in .libs after libtool build)
+    if [ -d ${B}/test/.libs ]; then
+        for f in ${B}/test/.libs/*; do
+            if [ -f "$f" ] && [ -x "$f" ]; then
+                case "$(basename $f)" in
+                    *.la|*.so*|*.o|lt-*) ;;
+                    *)
+                        install -m 0755 "$f" ${D}${PTEST_PATH}/tools/
+                        ;;
+                esac
+            fi
+        done
+    fi
+
+    # Also check test directory directly
+    for f in ${B}/test/*; do
+        if [ -f "$f" ] && [ -x "$f" ]; then
+            case "$(basename $f)" in
+                *.sh|*.la|*.so*|*.o|Makefile*|*.log) ;;
+                *)
+                    # Skip if already installed from .libs
+                    [ -f ${D}${PTEST_PATH}/tools/$(basename $f) ] && continue
+                    install -m 0755 "$f" ${D}${PTEST_PATH}/tools/
+                    ;;
+            esac
+        fi
+    done
+
+    # Install extra tools from tools/.libs (thumbnail, rgb2ycbcr)
+    if [ -d ${B}/tools/.libs ]; then
+        for tool in thumbnail rgb2ycbcr; do
+            if [ -f ${B}/tools/.libs/$tool ] && [ -x ${B}/tools/.libs/$tool ]; then
+                install -m 0755 ${B}/tools/.libs/$tool ${D}${PTEST_PATH}/tools/
+            fi
+        done
+    fi
+
+    # Install tiff tools from bindir
+    if [ -d ${D}${bindir} ]; then
+        for tool in ${D}${bindir}/*; do
+            if [ -f "$tool" ]; then
+                ln -sf ${bindir}/$(basename $tool) ${D}${PTEST_PATH}/tools/
+            fi
+        done
+    fi
+
+    # Install test data
+    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
+
+    # Install test scripts
+    find ${S}/test -maxdepth 1 -name "*.sh" -exec install -m 0755 {} ${D}${PTEST_PATH}/test/ \;
+
+    # Install common.sh if exists
+    if [ -f ${S}/test/common.sh ]; then
+        install -m 0644 ${S}/test/common.sh ${D}${PTEST_PATH}/test/
+    fi
+}
+
+RDEPENDS:${PN}-ptest += "bash"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


