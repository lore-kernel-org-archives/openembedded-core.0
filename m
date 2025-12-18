Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BFED68BE7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:27:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36502.1766042866329113555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 23:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WY4/RCFA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4447c74403=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI552o32164954
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OoHMoz/HdZkmbDzt/z2A
	OPxxQiTkVWGI7XBk+Xs6RFU=; b=WY4/RCFABTuG0qy81VO2Mev2qeLZH3Npxs1s
	QAGXeRYzpupOsyXsfrOhMOSTKGXuKCZoM3howTLJPtQfomzj6OHC6pXu4HVxj1vu
	Ugzzzzajb3QnmWmEiGkKQiczC2yw+6917BWTEbSUOOtQ+0g5qURbl/Qfd0xsVJn8
	2XFV6sjj4v2j1I/CUktuQsuMFTP3GnKvhnBbFd9exhS/NA7MUw9xuduZ0eW4/rdt
	vgk+I9FWBHT/qNFlOEVlP8iWnJ+YrJPHCbJXSl9IimRxBk8S5GHuPgFbYhG/GxGA
	a3rNptw4RIEhPpScvZngjtAEwfoUMVdAuGbR8S+xwHGxwyAgBA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k68sm2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:27:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 23:27:37 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 23:27:37 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] ruby: Upgrade 3.3.5 -> 3.3.10
Date: Thu, 18 Dec 2025 15:27:36 +0800
Message-ID: <20251218072736.3804411-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1OSBTYWx0ZWRfX2rj+BXhGNDbr
 A/WCP8shrrR+QMmCBd5d2bZ7T7DvcEBIHjbU/ZjMVzfyu11dOI+6m97INjNGvdMuTmv5jc6Y2rJ
 PbouPprDU46ba5QaEDBF5NWau0pRGRWVYshpFMHg9hyzLo0WAND8850JUiEgKepVG9WwIbQm3eA
 HlA5fU0KOpEVQU+1Ws+r7TWH8ayL6c3zJM3N0Vvv5NkZeZ31Uxf3J/12xEzA9StSx+0ccjFMZhH
 QHZDxgDdslei/BqiO0I8mvGkkNLGrXsdrxykXFjCGx9THI4QCSyxiRwmi/y4Gw5nDnoEeHjZqK2
 KpwSws4P6iBD6Od//Ptn2An938PqGYFIptUjpeyOCFYxYyw233EYFmiD7doo+Ilo3aXoSelecUa
 Q1pD3pU3P1cJx8Smwe1l53zov2wNkw==
X-Proofpoint-ORIG-GUID: 4-DboCDOSTPubA46MSTKg7EXms39_Wbn
X-Proofpoint-GUID: 4-DboCDOSTPubA46MSTKg7EXms39_Wbn
X-Authority-Analysis: v=2.4 cv=EpLfbCcA c=1 sm=1 tr=0 ts=6943acf1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=w2PP7KgtAAAA:8 a=NEAV23lmAAAA:8
 a=A1X0JdhQAAAA:8 a=OK-8mIdLAAAA:8 a=-fKjk79AAAAA:8 a=QIhr-27iAAAA:8
 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=nfEUICAFgN0N55MfdhcA:9
 a=v2nK5DdjQ86zcpn8:21 a=otKe4FUvdikA:10 a=_Rl3U6_J5c4A:10 a=s5zKW874KtQA:10
 a=CDB6uwv3NW-08_pL9N3q:22 a=bPPIUcp-n4lFe3GeRkWd:22 a=yfRUlTaMxgxjPDvNZr5O:22
 a=cgaYBWEFosGJW4rWv5Lf:22 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228092

From: Mingli Yu <mingli.yu@windriver.com>

Per ruby maintenance policy [1], the 3.3.x branch should be still in normal
maintenance, so upgrade to the latest version 3.3.10 to fix many security
issues and bugs.

Remove the fix for CVE-2025-27219, CVE-2025-27220 and CVE-2025-27221 as
these fixes have been included in the new version.

[1] https://www.ruby-lang.org/en/downloads/branches/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 31 --------
 .../ruby/ruby/CVE-2025-27220.patch            | 78 -------------------
 .../ruby/ruby/CVE-2025-27221-0001.patch       | 57 --------------
 .../ruby/ruby/CVE-2025-27221-0002.patch       | 73 -----------------
 .../ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb}    |  6 +-
 5 files changed, 1 insertion(+), 244 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
deleted file mode 100644
index 7813a6143c8..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9907b76dad0777ee300de236dad4b559e07596ab Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 16:01:17 +0900
-Subject: [PATCH] Use String#concat instead of String#+ for reducing cpu usage
-
-Co-authored-by: "Yusuke Endoh" <mame@ruby-lang.org>
-
-Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]
-CVE: CVE-2025-27219
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
- lib/cgi/cookie.rb | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lib/cgi/cookie.rb b/lib/cgi/cookie.rb
-index 9498e2f..1c4ef6a 100644
---- a/lib/cgi/cookie.rb
-+++ b/lib/cgi/cookie.rb
-@@ -190,9 +190,10 @@ def self.parse(raw_cookie)
-         values ||= ""
-         values = values.split('&').collect{|v| CGI.unescape(v,@@accept_charset) }
-         if cookies.has_key?(name)
--          values = cookies[name].value + values
-+          cookies[name].concat(values)
-+        else
-+          cookies[name] = Cookie.new(name, *values)
-         end
--        cookies[name] = Cookie.new(name, *values)
-       end
- 
-       cookies
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
deleted file mode 100644
index f2f8bc7f766..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From cd1eb08076c8b8e310d4d553d427763f2577a1b6 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 15:53:31 +0900
-Subject: [PATCH] Escape/unescape unclosed tags as well
-
-Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
-
-CVE: CVE-2025-27220
-
-Upstream-Status: Backport [https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/cgi/util.rb           |  4 ++--
- test/cgi/test_cgi_util.rb | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/lib/cgi/util.rb b/lib/cgi/util.rb
-index 4986e54..5f12eae 100644
---- a/lib/cgi/util.rb
-+++ b/lib/cgi/util.rb
-@@ -184,7 +184,7 @@ module CGI::Util
-   def escapeElement(string, *elements)
-     elements = elements[0] if elements[0].kind_of?(Array)
-     unless elements.empty?
--      string.gsub(/<\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?>/i) do
-+      string.gsub(/<\/?(?:#{elements.join("|")})\b[^<>]*+>?/im) do
-         CGI.escapeHTML($&)
-       end
-     else
-@@ -204,7 +204,7 @@ module CGI::Util
-   def unescapeElement(string, *elements)
-     elements = elements[0] if elements[0].kind_of?(Array)
-     unless elements.empty?
--      string.gsub(/&lt;\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?&gt;/i) do
-+      string.gsub(/&lt;\/?(?:#{elements.join("|")})\b(?>[^&]+|&(?![gl]t;)\w+;)*(?:&gt;)?/im) do
-         unescapeHTML($&)
-       end
-     else
-diff --git a/test/cgi/test_cgi_util.rb b/test/cgi/test_cgi_util.rb
-index b0612fc..bff77f7 100644
---- a/test/cgi/test_cgi_util.rb
-+++ b/test/cgi/test_cgi_util.rb
-@@ -269,6 +269,14 @@ class CGIUtilTest < Test::Unit::TestCase
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"]))
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', "A", "IMG"))
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', ["A", "IMG"]))
-+
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', ["A", "IMG"]))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', ["A", "IMG"]))
-+
-+    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', ["A", "IMG"]))
-   end
- 
- 
-@@ -277,6 +285,16 @@ class CGIUtilTest < Test::Unit::TestCase
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescapeElement(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG"))
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
-+
-+    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
-+    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
-+    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
-+    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
-+
-+    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), "A", "IMG"))
-+    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), ["A", "IMG"]))
-+    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), "A", "IMG"))
-+    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), ["A", "IMG"]))
-   end
- end
- 
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
deleted file mode 100644
index 95802d04f9a..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3675494839112b64d5f082a9068237b277ed1495 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 16:29:36 +0900
-Subject: [PATCH] Truncate userinfo with URI#join, URI#merge and URI#+
-
-CVE: CVE-2025-27221
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/uri/generic.rb       |  6 +++++-
- test/uri/test_generic.rb | 11 +++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
-index f3540a2..ecc78c5 100644
---- a/lib/uri/generic.rb
-+++ b/lib/uri/generic.rb
-@@ -1141,7 +1141,11 @@ module URI
-       end
- 
-       # RFC2396, Section 5.2, 7)
--      base.set_userinfo(rel.userinfo) if rel.userinfo
-+      if rel.userinfo
-+        base.set_userinfo(rel.userinfo)
-+      else
-+        base.set_userinfo(nil)
-+      end
-       base.set_host(rel.host)         if rel.host
-       base.set_port(rel.port)         if rel.port
-       base.query = rel.query       if rel.query
-diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
-index e661937..17ba2b6 100644
---- a/test/uri/test_generic.rb
-+++ b/test/uri/test_generic.rb
-@@ -164,6 +164,17 @@ class URI::TestGeneric < Test::Unit::TestCase
-     # must be empty string to identify as path-abempty, not path-absolute
-     assert_equal('', url.host)
-     assert_equal('http:////example.com', url.to_s)
-+
-+    # sec-2957667
-+    url = URI.parse('http://user:pass@example.com').merge('//example.net')
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-+    url = URI.join('http://user:pass@example.com', '//example.net')
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-+    url = URI.parse('http://user:pass@example.com') + '//example.net'
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-   end
- 
-   def test_parse_scheme_with_symbols
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
deleted file mode 100644
index 4435b87c344..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 2789182478f42ccbb62197f952eb730e4f02bfc5 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 18:16:28 +0900
-Subject: [PATCH] Fix merger of URI with authority component
-
-https://hackerone.com/reports/2957667
-
-Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
-
-CVE: CVE-2025-27221
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/uri/generic.rb       | 19 +++++++------------
- test/uri/test_generic.rb |  7 +++++++
- 2 files changed, 14 insertions(+), 12 deletions(-)
-
-diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
-index ecc78c5..2c0a88d 100644
---- a/lib/uri/generic.rb
-+++ b/lib/uri/generic.rb
-@@ -1133,21 +1133,16 @@ module URI
-       base.fragment=(nil)
- 
-       # RFC2396, Section 5.2, 4)
--      if !authority
--        base.set_path(merge_path(base.path, rel.path)) if base.path && rel.path
--      else
--        # RFC2396, Section 5.2, 4)
--        base.set_path(rel.path) if rel.path
-+      if authority
-+        base.set_userinfo(rel.userinfo)
-+        base.set_host(rel.host)
-+        base.set_port(rel.port || base.default_port)
-+        base.set_path(rel.path)
-+      elsif base.path && rel.path
-+        base.set_path(merge_path(base.path, rel.path))
-       end
- 
-       # RFC2396, Section 5.2, 7)
--      if rel.userinfo
--        base.set_userinfo(rel.userinfo)
--      else
--        base.set_userinfo(nil)
--      end
--      base.set_host(rel.host)         if rel.host
--      base.set_port(rel.port)         if rel.port
-       base.query = rel.query       if rel.query
-       base.fragment=(rel.fragment) if rel.fragment
- 
-diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
-index 17ba2b6..1a70dd4 100644
---- a/test/uri/test_generic.rb
-+++ b/test/uri/test_generic.rb
-@@ -267,6 +267,13 @@ class URI::TestGeneric < Test::Unit::TestCase
-     assert_equal(u0, u1)
-   end
- 
-+  def test_merge_authority
-+    u = URI.parse('http://user:pass@example.com:8080')
-+    u0 = URI.parse('http://new.example.org/path')
-+    u1 = u.merge('//new.example.org/path')
-+    assert_equal(u0, u1)
-+  end
-+
-   def test_route
-     url = URI.parse('http://hoge/a.html').route_to('http://hoge/b.html')
-     assert_equal('b.html', url.to_s)
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.10.bb
index 8b45946f6b1..936bc73e32f 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
@@ -26,10 +26,6 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           file://CVE-2025-27219.patch \
-           file://CVE-2025-27220.patch \
-           file://CVE-2025-27221-0001.patch \
-           file://CVE-2025-27221-0002.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
@@ -51,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
+SRC_URI[sha256sum] = "b555baa467a306cfc8e6c6ed24d0d27b27e9a1bed1d91d95509859eac6b0e928"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


