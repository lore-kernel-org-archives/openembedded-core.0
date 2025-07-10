Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8A5C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 12:33:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7658.1752150780860491994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 05:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92865b89b7=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AAZRjs012008
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 05:33:00 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5n7qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 05:33:00 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 10 Jul 2025 05:32:26 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] ruby: upgrade 3.4.3 -> 3.4.4
Date: Thu, 10 Jul 2025 18:02:28 +0530
Message-ID: <20250710123228.3145945-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX4ZOcOPSs67yi iWutA3gvkceMyiEKlvkhb9s/M66CwDtTMOa8bJ/2Hxw3unmGGRXe5v3ksxQdfAwpJbYqRWzobY+ RMt9JAc7PBxnQODCsOUzzgDP+PPv337wynYWClW4oPVU32cuP6XhyeNy3ROtYDeS+NQD5EdXMH1
 goxTzBLQVxIYAsettGBCcqZ8vhfxE183jbpk/GNApdS5/r8tYkTCEcxFR7HHaumD6xO9Qa4tn3C Uj/mOe5F4h+uEF7s1zJHmkiQQToc6651tSt6HlSlxhDL9gbN6XOQAREKgz8/UUa5ANBHqiH+zPo ekHfBwNql/k7lLSQ7JOvfUTnEcQ5Fo/WVpajVAj1PUH+H1vfKE6ZvV8+55RzO9CF+/uKOlJOJtM Mm1Ye1ct
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686fb2fc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=omOdbC7AAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=9Wbp7B8dAAAA:8
 a=xNf9USuDAAAA:8 a=5C0sMwVKbbH8cXV6DWoA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=BESxJfN36ujmTJQqZ0Zq:22
X-Proofpoint-ORIG-GUID: HBqDz46A8RRJhA8ZiT_kPpekpCqjtn-g
X-Proofpoint-GUID: HBqDz46A8RRJhA8ZiT_kPpekpCqjtn-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 12:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220118

From: Wang Mingyu <wangmy@fujitsu.com>

0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
refreshed for 3.4.4

(From OE-Core rev: 33d75adff3c100d4c16a9dc51dd19f48e20cf328)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 6 +++---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index bb67df0f40..84fe9aee3d 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 7e2337d8b0daf264785cb06d1d6c7d61e428a11b Mon Sep 17 00:00:00 2001
+From 2625f6c155105d352d6a1ff3a722e7896431ff91 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 05432cd..41a05bb 100644
+index 8f996b8..c708b64 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -119,7 +119,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -120,7 +120,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index eda45dd862..190eb7d728 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From ff25f6dddcfbbb7b0464485bb5132458866ab51a Mon Sep 17 00:00:00 2001
+From 97051be9cb9317d2c4d61a82d6d953809e962f13 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 8f353ae..095125f 100644
+index 0b905a7..a102e3c 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1711,7 +1711,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1709,7 +1709,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.3.bb b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.3.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.4.bb
index 45047b8859..39e86fdd28 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "55a4cd1dcbe5ca27cf65e89a935a482c2bb2284832939266551c0ec68b437f46"
+SRC_URI[sha256sum] = "a0597bfdf312e010efd1effaa8d7f1d7833146fdc17950caa8158ffa3dcbfa85"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.40.0


