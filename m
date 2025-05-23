Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B89CC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 13:26:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48266.1748006769492268437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 06:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=723863cc86=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCvBDN021413
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 13:26:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx3wbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 13:26:08 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 23 May 2025 06:25:47 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] ruby: fix CVE-2025-27221
Date: Fri, 23 May 2025 18:55:42 +0530
Message-ID: <20250523132542.3201402-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=68307770 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8 a=OK-8mIdLAAAA:8 a=-fKjk79AAAAA:8
 a=QIhr-27iAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=cjS-EvIX5SvndW2NF50A:9 a=otKe4FUvdikA:10 a=_Rl3U6_J5c4A:10 a=s5zKW874KtQA:10 a=bPPIUcp-n4lFe3GeRkWd:22 a=yfRUlTaMxgxjPDvNZr5O:22 a=cgaYBWEFosGJW4rWv5Lf:22 a=CDB6uwv3NW-08_pL9N3q:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExOSBTYWx0ZWRfX6RlzfZC4LQuy YHdLkoAH2LEZo4E5iGc21AaQl3d7UTds64p9dyWrsOvZmHTYCXe9W3h0dLLC6P1guMFWh2zOEW3 7I/YsS2nG7uDav9PRiULMoZTCpby8uilw6jOGermf111sHwkARNkbDV6EpqI5vS5WZWjYJeFfoE
 And1HY0vt8E402j3EksRd//CtC7GZq2XHbDtskzwhLhRbMG7o050GJRSPaM4mmRmSv0z07pz7u0 TvRd/EI+y/gqiBNRIjwf/3ekx2kLmiYzIb3kfiIMDk6J/aZua69flE4WD344RhP0SW8870e3Twx bDOF1HeA9vCqZM4GYxTJT6hq4iMxd2EqZJIP5S9b3Qu9qzOEjaI1Cy0DaBBQ8V/fZudXTRCb/yk
 eYl/cboK8i8CPmk0gObw7Z+O58+v+MjxS5110f/9lXgebDMAdTRFWMYfadw2ba/BTB82Ff6t
X-Proofpoint-GUID: HHrEGzyUDSq19x3sALM9bf7D1C9To6Gl
X-Proofpoint-ORIG-GUID: HHrEGzyUDSq19x3sALM9bf7D1C9To6Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=918 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 13:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217211

From: Divya Chellam <divya.chellam@windriver.com>

In the URI gem before 1.0.3 for Ruby, the URI handling methods
(URI.join, URI#merge, URI#+) have an inadvertent leakage of
authentication credentials because userinfo is retained even
after changing the host.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-27221

Upstream-patches:
https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495
https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2025-27221-0001.patch       | 57 +++++++++++++++
 .../ruby/ruby/CVE-2025-27221-0002.patch       | 73 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
new file mode 100644
index 0000000000..95802d04f9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
@@ -0,0 +1,57 @@
+From 3675494839112b64d5f082a9068237b277ed1495 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 16:29:36 +0900
+Subject: [PATCH] Truncate userinfo with URI#join, URI#merge and URI#+
+
+CVE: CVE-2025-27221
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/uri/generic.rb       |  6 +++++-
+ test/uri/test_generic.rb | 11 +++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
+index f3540a2..ecc78c5 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1141,7 +1141,11 @@ module URI
+       end
+ 
+       # RFC2396, Section 5.2, 7)
+-      base.set_userinfo(rel.userinfo) if rel.userinfo
++      if rel.userinfo
++        base.set_userinfo(rel.userinfo)
++      else
++        base.set_userinfo(nil)
++      end
+       base.set_host(rel.host)         if rel.host
+       base.set_port(rel.port)         if rel.port
+       base.query = rel.query       if rel.query
+diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
+index e661937..17ba2b6 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -164,6 +164,17 @@ class URI::TestGeneric < Test::Unit::TestCase
+     # must be empty string to identify as path-abempty, not path-absolute
+     assert_equal('', url.host)
+     assert_equal('http:////example.com', url.to_s)
++
++    # sec-2957667
++    url = URI.parse('http://user:pass@example.com').merge('//example.net')
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
++    url = URI.join('http://user:pass@example.com', '//example.net')
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
++    url = URI.parse('http://user:pass@example.com') + '//example.net'
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
+   end
+ 
+   def test_parse_scheme_with_symbols
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
new file mode 100644
index 0000000000..4435b87c34
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
@@ -0,0 +1,73 @@
+From 2789182478f42ccbb62197f952eb730e4f02bfc5 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 18:16:28 +0900
+Subject: [PATCH] Fix merger of URI with authority component
+
+https://hackerone.com/reports/2957667
+
+Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
+
+CVE: CVE-2025-27221
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/uri/generic.rb       | 19 +++++++------------
+ test/uri/test_generic.rb |  7 +++++++
+ 2 files changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
+index ecc78c5..2c0a88d 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1133,21 +1133,16 @@ module URI
+       base.fragment=(nil)
+ 
+       # RFC2396, Section 5.2, 4)
+-      if !authority
+-        base.set_path(merge_path(base.path, rel.path)) if base.path && rel.path
+-      else
+-        # RFC2396, Section 5.2, 4)
+-        base.set_path(rel.path) if rel.path
++      if authority
++        base.set_userinfo(rel.userinfo)
++        base.set_host(rel.host)
++        base.set_port(rel.port || base.default_port)
++        base.set_path(rel.path)
++      elsif base.path && rel.path
++        base.set_path(merge_path(base.path, rel.path))
+       end
+ 
+       # RFC2396, Section 5.2, 7)
+-      if rel.userinfo
+-        base.set_userinfo(rel.userinfo)
+-      else
+-        base.set_userinfo(nil)
+-      end
+-      base.set_host(rel.host)         if rel.host
+-      base.set_port(rel.port)         if rel.port
+       base.query = rel.query       if rel.query
+       base.fragment=(rel.fragment) if rel.fragment
+ 
+diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
+index 17ba2b6..1a70dd4 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -267,6 +267,13 @@ class URI::TestGeneric < Test::Unit::TestCase
+     assert_equal(u0, u1)
+   end
+ 
++  def test_merge_authority
++    u = URI.parse('http://user:pass@example.com:8080')
++    u0 = URI.parse('http://new.example.org/path')
++    u1 = u.merge('//new.example.org/path')
++    assert_equal(u0, u1)
++  end
++
+   def test_route
+     url = URI.parse('http://hoge/a.html').route_to('http://hoge/b.html')
+     assert_equal('b.html', url.to_s)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index c91c51657f..b37f0d03e7 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2025-27219.patch \
            file://CVE-2025-27220.patch \
+           file://CVE-2025-27221-0001.patch \
+           file://CVE-2025-27221-0002.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


