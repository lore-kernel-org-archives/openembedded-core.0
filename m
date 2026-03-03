Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE8DE67A83
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12828.1772521020939893444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mp/fFdAl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234OFqx1485837
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6alZ+nrRBwYozVBj33Ga4ts1Bq2kQJ4mRV79R0z/nhY=; b=Mp/fFdAlysB4
	8cMLT5c4fOY6q45SWuVHRdZB+AMC0VxxSO8tkoEVcIW0dz5Con8GD7Np/5+ZwNdp
	ulQdybkvP42AmBH14vBkda5NDDLXoJzynTK03BlmS1vEouLHdNjbSIn83IOx4vAm
	X/5R+IBrq0W3ya3oLhRhMh7ktRTtJ/ZvcU1uK+OBWX0VGIXqsQ9w+5WcU4g3PCgI
	tm1diAuiWcqgkDwoyv3sAM0vy3HgDuMN+ep+eKlT0xNDRjTUJurRtsj8sBLTSQTc
	wH2U1O6qsSNmkWfx7lo6EoDniOxTOS8t/m091sOsOb2J7hQkWRxfHvPOuXUHxfiS
	76gMz/mb0g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kacs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:58 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 17/19] python3-uv-build: upgrade 0.9.28 -> 0.10.4
Date: Tue, 3 Mar 2026 14:56:38 +0800
Message-ID: <20260303065640.2541884-17-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6863b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=gpDDQ9tWAAAA:20 a=t7CeM3EgAAAA:8
 a=ILP5huTTfEolZf3N0lkA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: oU3oZ6b7bTRVoVaZcMjHDA7gj8dX_2o1
X-Proofpoint-ORIG-GUID: oU3oZ6b7bTRVoVaZcMjHDA7gj8dX_2o1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX0dQKl4KNNXvW
 3PVGOWkBzfkFG1YfDb/5mId+oo8Tu611cCsu1ylyDoubK/mine50x955i4Xt/R/I18/SuyWpv4f
 RIM88vI6TXO2rg67h/Pq4OY8S1QSE06PZLL9OtFxUSEaqClJWunryg1z6DQejTQAOr/+X+2XFrR
 Y5Q46DsuPawuaYXSXzTgBC138P8T7wi03J571WqpZk69B8BrC+GSUkKGfq4yKrjO04omW9sz2wg
 VKX7bH0RX7eJucy8UyHheVH1U2t1bcVhZ/7sGFyqTAP2RCYuVJxhfNioIDiGgi1TJGnRSKNNS+2
 evj7BLhghrPOKKGdWrsar0NcDkXlZnLgphhHNMQ+au8Di5lM2Eg3I8Jvh7y2H07cr8+Rtg4CGOM
 1NLAroS3tVj8kLSXELPPmc5/gpZLwj0BiQ/1zzdaXIT0YxSsZVppK0wqxIgtcPRdqClSwtIWhWL
 Rfeb7OQxFLqRqaOpuuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232255

Released on 2026-02-17[1].
Enhancements

    Remove duplicate references to the affected paths when showing uv python errors (#18008)
    Skip discovery of workspace members that contain only git-ignored files, including in sub-directories (#18051)

Bug fixes

    Don't panic when initialising a package at the filesystem root (e.g. uv init / --name foo) (#17983)
    Fix permissions on wheel and sdist files produced by the uv_build build backend (#18020)
    Revert locked file change to fix locked files on NFS mounts (#18071)

[1] https://github.com/astral-sh/uv/releases/tag/0.10.4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-uv-build-crates.inc        | 138 +++++++++---------
 ...d_0.9.28.bb => python3-uv-build_0.10.4.bb} |   2 +-
 2 files changed, 69 insertions(+), 71 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.9.28.bb => python3-uv-build_0.10.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 3a19d4630e..d81eaf7787 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -6,16 +6,15 @@ SRC_URI += " \
     crate://crates.io/aes/0.8.4 \
     crate://crates.io/aho-corasick/1.1.3 \
     crate://crates.io/allocator-api2/0.2.21 \
-    crate://crates.io/ambient-id/0.0.7 \
+    crate://crates.io/ambient-id/0.0.10 \
     crate://crates.io/anes/0.1.6 \
     crate://crates.io/anstream/0.6.21 \
     crate://crates.io/anstyle/1.0.11 \
     crate://crates.io/anstyle-parse/0.2.7 \
     crate://crates.io/anstyle-query/1.1.3 \
     crate://crates.io/anstyle-wincon/3.0.9 \
-    crate://crates.io/anyhow/1.0.100 \
+    crate://crates.io/anyhow/1.0.101 \
     crate://crates.io/approx/0.5.1 \
-    crate://crates.io/arbitrary/1.4.1 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayref/0.3.9 \
     crate://crates.io/arrayvec/0.7.6 \
@@ -63,11 +62,12 @@ SRC_URI += " \
     crate://crates.io/bytemuck/1.23.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/byteorder-lite/0.1.0 \
-    crate://crates.io/bytes/1.10.1 \
+    crate://crates.io/bytes/1.11.1 \
     crate://crates.io/bzip2/0.5.2 \
+    crate://crates.io/bzip2/0.6.1 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/camino/1.1.10 \
-    crate://crates.io/cargo-util/0.2.25 \
+    crate://crates.io/cargo-util/0.2.26 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/cbc/0.1.2 \
     crate://crates.io/cc/1.2.30 \
@@ -78,16 +78,16 @@ SRC_URI += " \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/clap/4.5.54 \
-    crate://crates.io/clap_builder/4.5.54 \
+    crate://crates.io/clap/4.5.57 \
+    crate://crates.io/clap_builder/4.5.57 \
     crate://crates.io/clap_complete/4.5.55 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
-    crate://crates.io/clap_derive/4.5.49 \
+    crate://crates.io/clap_derive/4.5.55 \
     crate://crates.io/clap_lex/0.7.5 \
-    crate://crates.io/codspeed/4.2.1 \
-    crate://crates.io/codspeed-criterion-compat/4.2.1 \
-    crate://crates.io/codspeed-criterion-compat-walltime/4.2.1 \
+    crate://crates.io/codspeed/4.3.0 \
+    crate://crates.io/codspeed-criterion-compat/4.3.0 \
+    crate://crates.io/codspeed-criterion-compat-walltime/4.3.0 \
     crate://crates.io/color_quant/1.1.0 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/colored/2.2.0 \
@@ -126,7 +126,6 @@ SRC_URI += " \
     crate://crates.io/der/0.7.10 \
     crate://crates.io/der-parser/10.0.0 \
     crate://crates.io/deranged/0.5.5 \
-    crate://crates.io/derive_arbitrary/1.4.1 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/digest/0.10.7 \
@@ -162,7 +161,7 @@ SRC_URI += " \
     crate://crates.io/fdeflate/0.3.7 \
     crate://crates.io/filetime/0.2.27 \
     crate://crates.io/fixedbitset/0.5.7 \
-    crate://crates.io/flate2/1.1.5 \
+    crate://crates.io/flate2/1.1.9 \
     crate://crates.io/float-cmp/0.9.0 \
     crate://crates.io/float-cmp/0.10.0 \
     crate://crates.io/fluent-uri/0.1.4 \
@@ -172,7 +171,7 @@ SRC_URI += " \
     crate://crates.io/fontconfig-parser/0.5.8 \
     crate://crates.io/fontdb/0.23.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
-    crate://crates.io/fs-err/3.2.2 \
+    crate://crates.io/fs-err/3.3.0 \
     crate://crates.io/futures/0.3.31 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
@@ -212,7 +211,7 @@ SRC_URI += " \
     crate://crates.io/httpdate/1.0.3 \
     crate://crates.io/hyper/1.8.1 \
     crate://crates.io/hyper-rustls/0.27.7 \
-    crate://crates.io/hyper-util/0.1.19 \
+    crate://crates.io/hyper-util/0.1.20 \
     crate://crates.io/icu_collections/2.0.0 \
     crate://crates.io/icu_locale_core/2.0.0 \
     crate://crates.io/icu_normalizer/2.0.0 \
@@ -230,7 +229,7 @@ SRC_URI += " \
     crate://crates.io/indicatif/0.18.3 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/insta/1.46.1 \
+    crate://crates.io/insta/1.46.3 \
     crate://crates.io/ipnet/2.11.0 \
     crate://crates.io/iri-string/0.7.8 \
     crate://crates.io/is-docker/0.2.0 \
@@ -242,8 +241,8 @@ SRC_URI += " \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.18 \
-    crate://crates.io/jiff-static/0.2.18 \
+    crate://crates.io/jiff/0.2.19 \
+    crate://crates.io/jiff-static/0.2.19 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -252,23 +251,23 @@ SRC_URI += " \
     crate://crates.io/junction/1.4.1 \
     crate://crates.io/kurbo/0.13.0 \
     crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libbz2-rs-sys/0.2.2 \
     crate://crates.io/libc/0.2.178 \
     crate://crates.io/libm/0.2.15 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
     crate://crates.io/libredox/0.1.12 \
-    crate://crates.io/libz-rs-sys/0.5.1 \
     crate://crates.io/linux-raw-sys/0.11.0 \
     crate://crates.io/litemap/0.8.0 \
     crate://crates.io/lock_api/0.4.13 \
     crate://crates.io/log/0.4.27 \
     crate://crates.io/lru-slab/0.1.2 \
-    crate://crates.io/lzma-rs/0.3.0 \
+    crate://crates.io/lzma-rust2/0.15.7 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/markdown/1.0.0 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/md-5/0.10.6 \
-    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/memchr/2.8.0 \
     crate://crates.io/memmap2/0.9.7 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/miette/7.6.0 \
@@ -349,7 +348,7 @@ SRC_URI += " \
     crate://crates.io/pretty_assertions/1.4.1 \
     crate://crates.io/priority-queue/2.5.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
-    crate://crates.io/proc-macro2/1.0.105 \
+    crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/procfs/0.18.0 \
     crate://crates.io/procfs-core/0.18.0 \
     crate://crates.io/ptr_meta/0.3.0 \
@@ -360,7 +359,7 @@ SRC_URI += " \
     crate://crates.io/quinn/0.11.8 \
     crate://crates.io/quinn-proto/0.11.12 \
     crate://crates.io/quinn-udp/0.5.13 \
-    crate://crates.io/quote/1.0.43 \
+    crate://crates.io/quote/1.0.44 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.0 \
@@ -372,15 +371,15 @@ SRC_URI += " \
     crate://crates.io/rand_core/0.9.3 \
     crate://crates.io/rayon/1.11.0 \
     crate://crates.io/rayon-core/1.13.0 \
-    crate://crates.io/rcgen/0.14.6 \
+    crate://crates.io/rcgen/0.14.7 \
     crate://crates.io/redox_syscall/0.5.15 \
     crate://crates.io/redox_syscall/0.7.0 \
     crate://crates.io/redox_users/0.5.0 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.28 \
-    crate://crates.io/regex/1.12.2 \
-    crate://crates.io/regex-automata/0.4.13 \
+    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex-automata/0.4.14 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rend/0.5.2 \
     crate://crates.io/reqsign/0.18.1 \
@@ -417,8 +416,8 @@ SRC_URI += " \
     crate://crates.io/salsa20/0.10.2 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schannel/0.1.27 \
-    crate://crates.io/schemars/1.2.0 \
-    crate://crates.io/schemars_derive/1.2.0 \
+    crate://crates.io/schemars/1.2.1 \
+    crate://crates.io/schemars_derive/1.2.1 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/scroll/0.13.0 \
     crate://crates.io/scroll_derive/0.13.0 \
@@ -481,7 +480,7 @@ SRC_URI += " \
     crate://crates.io/sync_wrapper/1.0.2 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/sys-info/0.9.1 \
-    crate://crates.io/system-configuration/0.6.1 \
+    crate://crates.io/system-configuration/0.7.0 \
     crate://crates.io/system-configuration-sys/0.6.0 \
     crate://crates.io/tagu/0.1.6 \
     crate://crates.io/tar/0.4.44 \
@@ -536,8 +535,8 @@ SRC_URI += " \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-serde/0.2.0 \
     crate://crates.io/tracing-subscriber/0.3.22 \
-    crate://crates.io/tracing-test/0.2.5 \
-    crate://crates.io/tracing-test-macro/0.2.5 \
+    crate://crates.io/tracing-test/0.2.6 \
+    crate://crates.io/tracing-test-macro/0.2.6 \
     crate://crates.io/tracing-tree/0.4.1 \
     crate://crates.io/try-lock/0.2.5 \
     crate://crates.io/ttf-parser/0.25.1 \
@@ -566,7 +565,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.19.0 \
+    crate://crates.io/uuid/1.20.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wait-timeout/0.2.1 \
@@ -588,7 +587,7 @@ SRC_URI += " \
     crate://crates.io/webpki-roots/1.0.2 \
     crate://crates.io/weezl/0.1.10 \
     crate://crates.io/which/8.0.0 \
-    crate://crates.io/whoami/2.0.2 \
+    crate://crates.io/whoami/2.1.0 \
     crate://crates.io/widestring/1.2.0 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -645,8 +644,8 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.2 \
     crate://crates.io/zerovec/0.11.2 \
     crate://crates.io/zerovec-derive/0.11.1 \
-    crate://crates.io/zip/2.4.2 \
-    crate://crates.io/zlib-rs/0.5.1 \
+    crate://crates.io/zip/7.1.0 \
+    crate://crates.io/zlib-rs/0.6.0 \
     crate://crates.io/zmij/1.0.15 \
     crate://crates.io/zopfli/0.8.2 \
     crate://crates.io/zstd/0.13.3 \
@@ -663,16 +662,15 @@ SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e062506252
 SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
-SRC_URI[ambient-id-0.0.7.sha256sum] = "b8cad022ed72ad2176498be1c097bb46e598193e92f3491ea0766980edeee168"
+SRC_URI[ambient-id-0.0.10.sha256sum] = "e61320f0a8ca54a235b0e49307b16dcade6eecd441b1f8a8c7ca9204056cb17c"
 SRC_URI[anes-0.1.6.sha256sum] = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
 SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
 SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
 SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
 SRC_URI[anstyle-query-1.1.3.sha256sum] = "6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9"
 SRC_URI[anstyle-wincon-3.0.9.sha256sum] = "403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882"
-SRC_URI[anyhow-1.0.100.sha256sum] = "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
+SRC_URI[anyhow-1.0.101.sha256sum] = "5f0e0fee31ef5ed1ba1316088939cea399010ed7731dba877ed44aeb407a75ea"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
-SRC_URI[arbitrary-1.4.1.sha256sum] = "dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayref-0.3.9.sha256sum] = "76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb"
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
@@ -720,11 +718,12 @@ SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f2
 SRC_URI[bytemuck-1.23.1.sha256sum] = "5c76a5792e44e4abe34d3abf15636779261d45a7450612059293d1d2cfc63422"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[byteorder-lite-0.1.0.sha256sum] = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
-SRC_URI[bytes-1.10.1.sha256sum] = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a"
+SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
+SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[camino-1.1.10.sha256sum] = "0da45bc31171d8d6960122e222a67740df867c1dd53b4d51caa297084c185cab"
-SRC_URI[cargo-util-0.2.25.sha256sum] = "03ae3fc62640c9e0235c95b07e68a59a31919d7331bd95961cc811bc0607c87b"
+SRC_URI[cargo-util-0.2.26.sha256sum] = "f70b0c7772872ac3234e46a6591091d4da57f0c3aa24c381776ed1550624a14b"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
 SRC_URI[cbc-0.1.2.sha256sum] = "26b52a9543ae338f279b96b0b9fed9c8093744685043739079ce85cd58f289a6"
 SRC_URI[cc-1.2.30.sha256sum] = "deec109607ca693028562ed836a5f1c4b8bd77755c4e132fc5ce11b0b6211ae7"
@@ -735,16 +734,16 @@ SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[clap-4.5.54.sha256sum] = "c6e6ff9dcd79cff5cd969a17a545d79e84ab086e444102a591e288a8aa3ce394"
-SRC_URI[clap_builder-4.5.54.sha256sum] = "fa42cf4d2b7a41bc8f663a7cab4031ebafa1bf3875705bfaf8466dc60ab52c00"
+SRC_URI[clap-4.5.57.sha256sum] = "6899ea499e3fb9305a65d5ebf6e3d2248c5fab291f300ad0a704fbe142eae31a"
+SRC_URI[clap_builder-4.5.57.sha256sum] = "7b12c8b680195a62a8364d16b8447b01b6c2c8f9aaf68bee653be34d4245e238"
 SRC_URI[clap_complete-4.5.55.sha256sum] = "a5abde44486daf70c5be8b8f8f1b66c49f86236edf6fa2abadb4d961c4c6229a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
-SRC_URI[clap_derive-4.5.49.sha256sum] = "2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671"
+SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
 SRC_URI[clap_lex-0.7.5.sha256sum] = "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
-SRC_URI[codspeed-4.2.1.sha256sum] = "5f0d98d97fd75ca4489a1a0997820a6521531085e7c8a98941bd0e1264d567dd"
-SRC_URI[codspeed-criterion-compat-4.2.1.sha256sum] = "d16fe2db207123f7b3a3b5cfff0c22f99469f7534145f3573f57f4c8a5653c2c"
-SRC_URI[codspeed-criterion-compat-walltime-4.2.1.sha256sum] = "b035c7f9846b143aeabb3833f5b584023eb97b43ecbff3d997db74c4372df2bd"
+SRC_URI[codspeed-4.3.0.sha256sum] = "38c2eb3388ebe26b5a0ab6bf4969d9c4840143d7f6df07caa3cc851b0606cef6"
+SRC_URI[codspeed-criterion-compat-4.3.0.sha256sum] = "e1e270597a1d1e183f86d1cc9f94f0133654ee3daf201c17903ee29363555dd7"
+SRC_URI[codspeed-criterion-compat-walltime-4.3.0.sha256sum] = "e6c2613d2fac930fe34456be76f9124ee0800bb9db2e7fd2d6c65b9ebe98a292"
 SRC_URI[color_quant-1.1.0.sha256sum] = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[colored-2.2.0.sha256sum] = "117725a109d387c937a1533ce01b450cbde6b88abceea8473c4d7a85853cda3c"
@@ -783,7 +782,6 @@ SRC_URI[deadpool-runtime-0.1.4.sha256sum] = "092966b41edc516079bdf31ec78a2e0588d
 SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
 SRC_URI[der-parser-10.0.0.sha256sum] = "07da5016415d5a3c4dd39b11ed26f915f52fc4e0dc197d87908bc916e51bc1a6"
 SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587"
-SRC_URI[derive_arbitrary-1.4.1.sha256sum] = "30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
@@ -819,7 +817,7 @@ SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e9
 SRC_URI[fdeflate-0.3.7.sha256sum] = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
 SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
-SRC_URI[flate2-1.1.5.sha256sum] = "bfe33edd8e85a12a67454e37f8c75e730830d83e313556ab9ebf9ee7fbeb3bfb"
+SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
 SRC_URI[float-cmp-0.9.0.sha256sum] = "98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4"
 SRC_URI[float-cmp-0.10.0.sha256sum] = "b09cf3155332e944990140d967ff5eceb70df778b34f77d8075db46e4704e6d8"
 SRC_URI[fluent-uri-0.1.4.sha256sum] = "17c704e9dbe1ddd863da1e6ff3567795087b1eb201ce80d8fa81162e1516500d"
@@ -829,7 +827,7 @@ SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac1917768
 SRC_URI[fontconfig-parser-0.5.8.sha256sum] = "bbc773e24e02d4ddd8395fd30dc147524273a83e54e0f312d986ea30de5f5646"
 SRC_URI[fontdb-0.23.0.sha256sum] = "457e789b3d1202543297a350643cf459f836cade38934e7a4cf6a39e7cde2905"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
-SRC_URI[fs-err-3.2.2.sha256sum] = "baf68cef89750956493a66a10f512b9e58d9db21f2a573c079c0bdf1207a54a7"
+SRC_URI[fs-err-3.3.0.sha256sum] = "73fde052dbfc920003cfd2c8e2c6e6d4cc7c1091538c3a24226cec0665ab08c0"
 SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
@@ -869,7 +867,7 @@ SRC_URI[httparse-1.10.1.sha256sum] = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d
 SRC_URI[httpdate-1.0.3.sha256sum] = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
 SRC_URI[hyper-1.8.1.sha256sum] = "2ab2d4f250c3d7b1c9fcdff1cece94ea4e2dfbec68614f7b87cb205f24ca9d11"
 SRC_URI[hyper-rustls-0.27.7.sha256sum] = "e3c93eb611681b207e1fe55d5a71ecf91572ec8a6705cdb6857f7d8d5242cf58"
-SRC_URI[hyper-util-0.1.19.sha256sum] = "727805d60e7938b76b826a6ef209eb70eaa1812794f9424d4a4e2d740662df5f"
+SRC_URI[hyper-util-0.1.20.sha256sum] = "96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0"
 SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
 SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
 SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
@@ -887,7 +885,7 @@ SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc
 SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[insta-1.46.1.sha256sum] = "248b42847813a1550dafd15296fd9748c651d0c32194559dbc05d804d54b21e8"
+SRC_URI[insta-1.46.3.sha256sum] = "e82db8c87c7f1ccecb34ce0c24399b8a73081427f3c7c50a5d597925356115e4"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
 SRC_URI[iri-string-0.7.8.sha256sum] = "dbc5ebe9c3a1a7a5127f920a418f7585e9e758e911d0466ed004f393b0e380b2"
 SRC_URI[is-docker-0.2.0.sha256sum] = "928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3"
@@ -899,8 +897,8 @@ SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a69
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.18.sha256sum] = "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7aded68351e85e71ecf50"
-SRC_URI[jiff-static-0.2.18.sha256sum] = "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
+SRC_URI[jiff-0.2.19.sha256sum] = "d89a5b5e10d5a9ad6e5d1f4bd58225f655d6fe9767575a5e8ac5a6fe64e04495"
+SRC_URI[jiff-static-0.2.19.sha256sum] = "ff7a39c8862fc1369215ccf0a8f12dd4598c7f6484704359f0351bd617034dbf"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -909,23 +907,23 @@ SRC_URI[jsonwebtoken-9.3.1.sha256sum] = "5a87cc7a48537badeae96744432de36f4be2b4a
 SRC_URI[junction-1.4.1.sha256sum] = "642883fdc81cf2da15ee8183fa1d2c7da452414dd41541a0f3e1428069345447"
 SRC_URI[kurbo-0.13.0.sha256sum] = "7564e90fe3c0d5771e1f0bc95322b21baaeaa0d9213fa6a0b61c99f8b17b3bfb"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
 SRC_URI[libc-0.2.178.sha256sum] = "37c93d8daa9d8a012fd8ab92f088405fb202ea0b6ab73ee2482ae66af4f42091"
 SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
 SRC_URI[libredox-0.1.12.sha256sum] = "3d0b95e02c851351f877147b7deea7b1afb1df71b63aa5f8270716e0c5720616"
-SRC_URI[libz-rs-sys-0.5.1.sha256sum] = "172a788537a2221661b480fee8dc5f96c580eb34fa88764d3205dc356c7e4221"
 SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
 SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
 SRC_URI[lru-slab-0.1.2.sha256sum] = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
-SRC_URI[lzma-rs-0.3.0.sha256sum] = "297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e"
+SRC_URI[lzma-rust2-0.15.7.sha256sum] = "1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[markdown-1.0.0.sha256sum] = "a5cab8f2cadc416a82d2e783a1946388b31654d391d1c7d92cc1f03e295b1deb"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
-SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[memmap2-0.9.7.sha256sum] = "483758ad303d734cec05e5c12b41d7e93e6a6390c5e9dae6bdeb7c1259012d28"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[miette-7.6.0.sha256sum] = "5f98efec8807c63c752b5bd61f862c165c115b0a35685bdcfd9238c7aeb592b7"
@@ -1006,7 +1004,7 @@ SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7ca
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
 SRC_URI[priority-queue-2.5.0.sha256sum] = "5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] = "edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
-SRC_URI[proc-macro2-1.0.105.sha256sum] = "535d180e0ecab6268a3e718bb9fd44db66bbbc256257165fc699dadf70d16fe7"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
 SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
 SRC_URI[ptr_meta-0.3.0.sha256sum] = "fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28199e48daf8c8fc937ea90"
@@ -1017,7 +1015,7 @@ SRC_URI[quick-xml-0.38.3.sha256sum] = "42a232e7487fc2ef313d96dde7948e7a3c0510187
 SRC_URI[quinn-0.11.8.sha256sum] = "626214629cda6781b6dc1d316ba307189c85ba657213ce642d9c77670f8202c8"
 SRC_URI[quinn-proto-0.11.12.sha256sum] = "49df843a9161c85bb8aae55f101bc0bac8bcafd637a620d9122fd7e0b2f7422e"
 SRC_URI[quinn-udp-0.5.13.sha256sum] = "fcebb1209ee276352ef14ff8732e24cc2b02bbac986cd74a4c81bcb2f9881970"
-SRC_URI[quote-1.0.43.sha256sum] = "dc74d9a594b72ae6656596548f56f667211f8a97b3d4c3d467150794690dc40a"
+SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.0.sha256sum] = "caf5f7161924b9d1cea0e4cabc97c372cea92b5f927fc13c6bca67157a0ad947"
@@ -1029,15 +1027,15 @@ SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a
 SRC_URI[rand_core-0.9.3.sha256sum] = "99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38"
 SRC_URI[rayon-1.11.0.sha256sum] = "368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f"
 SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
-SRC_URI[rcgen-0.14.6.sha256sum] = "3ec0a99f2de91c3cddc84b37e7db80e4d96b743e05607f647eb236fc0455907f"
+SRC_URI[rcgen-0.14.7.sha256sum] = "10b99e0098aa4082912d4c649628623db6aba77335e4f4569ff5083a6448b32e"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
 SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00e4697b356fb1f74173a5e0ee27"
 SRC_URI[redox_users-0.5.0.sha256sum] = "dd6f9d3d47bdd2ad6945c5015a226ec6155d0bcdfd8f7cd29f86b71f8de99d2b"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.28.sha256sum] = "23bbed272e39c47a095a5242218a67412a220006842558b03fe2935e8f3d7b92"
-SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
-SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rend-0.5.2.sha256sum] = "a35e8a6bf28cd121053a66aa2e6a2e3eaffad4a60012179f0e864aa5ffeff215"
 SRC_URI[reqsign-0.18.1.sha256sum] = "ea386ba750000b6e59f760a08bdcca9461809b95e6f8f209ce5724056802824f"
@@ -1074,8 +1072,8 @@ SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0
 SRC_URI[salsa20-0.10.2.sha256sum] = "97a22f5af31f73a954c10289c93e8a50cc23d971e80ee446f1f6f7137a088213"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schannel-0.1.27.sha256sum] = "1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d"
-SRC_URI[schemars-1.2.0.sha256sum] = "54e910108742c57a770f492731f99be216a52fadd361b06c8fb59d74ccc267d2"
-SRC_URI[schemars_derive-1.2.0.sha256sum] = "4908ad288c5035a8eb12cfdf0d49270def0a268ee162b75eeee0f85d155a7c45"
+SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
+SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d81715d0420f8bc77a18c6260b307f"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[scroll-0.13.0.sha256sum] = "c1257cd4248b4132760d6524d6dda4e053bc648c9070b960929bf50cfb1e7add"
 SRC_URI[scroll_derive-0.13.0.sha256sum] = "22fc4f90c27b57691bbaf11d8ecc7cfbfe98a4da6dbe60226115d322aa80c06e"
@@ -1138,7 +1136,7 @@ SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea
 SRC_URI[sync_wrapper-1.0.2.sha256sum] = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[sys-info-0.9.1.sha256sum] = "0b3a0d0aba8bf96a0e1ddfdc352fc53b3df7f39318c71854910c3c4b024ae52c"
-SRC_URI[system-configuration-0.6.1.sha256sum] = "3c879d448e9d986b661742763247d3693ed13609438cf3d006f51f5368a5ba6b"
+SRC_URI[system-configuration-0.7.0.sha256sum] = "a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b"
 SRC_URI[system-configuration-sys-0.6.0.sha256sum] = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
 SRC_URI[tagu-0.1.6.sha256sum] = "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2971f6ae2436de576a"
 SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
@@ -1193,8 +1191,8 @@ SRC_URI[tracing-durations-export-0.3.1.sha256sum] = "32e0c2cfee378f62291f2703bbb
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee5088f83d1dd7ee6f6246fc6ff1"
 SRC_URI[tracing-subscriber-0.3.22.sha256sum] = "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
-SRC_URI[tracing-test-0.2.5.sha256sum] = "557b891436fe0d5e0e363427fc7f217abf9ccd510d5136549847bdcbcd011d68"
-SRC_URI[tracing-test-macro-0.2.5.sha256sum] = "04659ddb06c87d233c566112c1c9c5b9e98256d9af50ec3bc9c8327f873a7568"
+SRC_URI[tracing-test-0.2.6.sha256sum] = "19a4c448db514d4f24c5ddb9f73f2ee71bfb24c526cf0c570ba142d1119e0051"
+SRC_URI[tracing-test-macro-0.2.6.sha256sum] = "ad06847b7afb65c7866a36664b75c40b895e318cea4f71299f013fb22965329d"
 SRC_URI[tracing-tree-0.4.1.sha256sum] = "ac87aa03b6a4d5a7e4810d1a80c19601dbe0f8a837e9177f23af721c7ba7beec"
 SRC_URI[try-lock-0.2.5.sha256sum] = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
 SRC_URI[ttf-parser-0.25.1.sha256sum] = "d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31"
@@ -1223,7 +1221,7 @@ SRC_URI[usvg-0.46.0.sha256sum] = "e419dff010bb12512b0ae9e3d2f318dfbdf0167fde7eb0
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.19.0.sha256sum] = "e2e054861b4bd027cd373e18e8d8d8e6548085000e41290d95ce0c373a654b4a"
+SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
@@ -1245,7 +1243,7 @@ SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02
 SRC_URI[webpki-roots-1.0.2.sha256sum] = "7e8983c3ab33d6fb807cfcdad2491c4ea8cbc8ed839181c7dfd9c67c83e261b2"
 SRC_URI[weezl-0.1.10.sha256sum] = "a751b3277700db47d3e574514de2eced5e54dc8a5436a3bf7a0b248b2cee16f3"
 SRC_URI[which-8.0.0.sha256sum] = "d3fabb953106c3c8eea8306e4393700d7657561cb43122571b172bbfb7c7ba1d"
-SRC_URI[whoami-2.0.2.sha256sum] = "ace4d5c7b5ab3d99629156d4e0997edbe98a4beb6d5ba99e2cae830207a81983"
+SRC_URI[whoami-2.1.0.sha256sum] = "8fae98cf96deed1b7572272dfc777713c249ae40aa1cf8862e091e8b745f5361"
 SRC_URI[widestring-1.2.0.sha256sum] = "dd7cf3379ca1aac9eea11fba24fd7e315d621f8dfe35c8d7d2be8b793726e07d"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -1302,8 +1300,8 @@ SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.2.sha256sum] = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
 SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350f99f34e338d5fdd294428"
 SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
-SRC_URI[zip-2.4.2.sha256sum] = "fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50"
-SRC_URI[zlib-rs-0.5.1.sha256sum] = "626bd9fa9734751fc50d6060752170984d7053f5a39061f524cda68023d4db8a"
+SRC_URI[zip-7.1.0.sha256sum] = "9013f1222db8a6d680f13a7ccdc60a781199cd09c2fa4eff58e728bb181757fc"
+SRC_URI[zlib-rs-0.6.0.sha256sum] = "a7948af682ccbc3342b6e9420e8c51c1fe5d7bf7756002b4a3c6cabfe96a7e3c"
 SRC_URI[zmij-1.0.15.sha256sum] = "94f63c051f4fe3c1509da62131a678643c5b6fbdc9273b2b79d4378ebda003d2"
 SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.9.28.bb b/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.9.28.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
index b7bf7f775a..180b44519b 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.9.28.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ad9165d94b51a43671d382c7567dc972f831090457ca94ddbd1e9969487a3729"
+SRC_URI[sha256sum] = "fb201561844484d77cc9318c2ad7c51a0006e11c632037877a9524166fa47717"
 
 require ${BPN}-crates.inc
 
-- 
2.34.1


