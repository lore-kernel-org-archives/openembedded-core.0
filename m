Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C0C2F60CB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 13:43:20 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id b35so5726640pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kQDo25GtUIMrl3Gj2T/EDG+0KhgiohQERI4ZHGA7jy8=;
	b=Bdmwr8Q/wMwHA2uM/PdbvDVYA2F2BCrtIAiW4ngBOKFfldVV4vR5/QMtjFyIvTu6OX
	9WH/XW4PhGZBsKoaTIkwVDHOXSwbKnm6h8xCGxcCR3waBkDllGnh40ZqFtQlmeCLDOEC
	Dc8oNR/QTSqIHXz1hEV5ZUEtSaz7Y7SOvcIM3kWdgGHminy76/FGM6fthFhkpv08ljcm
	x8EdAOVOsPqfrNfua3INgirb7rCnqc+CMXCh5S3mWP425oAPze9gwHpTFxLXcB8H0pvB
	FL/cHMtnOZ2SpmVnJ1/bDQ4Dk2Yj7GdMaVO1Ec5N6xibCR9YPhD1pUfAok7ZsUObqZ0/
	aEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kQDo25GtUIMrl3Gj2T/EDG+0KhgiohQERI4ZHGA7jy8=;
	b=DmPWFQ292SimXcijUWFgf+Qb7aTxFFKO0Faz8Fxwk3DeEf6GL6Y6T9Kp4LWMFK7CG1
	own7y/062Okv5JBblyewsYCZxztnPmOiI4NBt0iGoHZeeEpYQHbV52/rFkEHL3E1l1oI
	SKYNqHWwe/rGe075XFc+OomfdmPyBhRYsekbyEg23fBa9fnsCM7Ci4G/AQT0KnN09MfN
	65iTbI5ig3EDwxH8BLwJAwyRxycsBqiKoLrJB+O9DGfw5jPEx0zxdfWubSb+nPogqglF
	xQGcgkeI9DiGJa51aAROzt2neNQxjdqxXBxVzhu4P7SgU/hml7SVQ1V8DXL1TOalf08p
	+McA==
X-Gm-Message-State: APjAAAXZeIaARdDDbWmJBgJ95XUESjh/28w8SCG5BViEHpPTW/5V7HB7
	Ouzbk/ytCS6ubkcoKnrlbbswXkV9
X-Google-Smtp-Source: APXvYqyzFwdx2blMweGpJ3Pywt3IcI3paikniEtD/07piLDaf+CK9ZIi4n63Yo4/PN0j9Mjypgh+Pw==
X-Received: by 2002:a63:f403:: with SMTP id g3mr7147445pgi.62.1581428601224;
	Tue, 11 Feb 2020 05:43:21 -0800 (PST)
Received: from localhost.localdomain ([36.255.87.199])
	by smtp.gmail.com with ESMTPSA id k8sm4294508pgg.18.2020.02.11.05.43.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Feb 2020 05:43:20 -0800 (PST)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 19:13:08 +0530
Message-Id: <1581428588-3822-1-git-send-email-rahulchauhankitps@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH v2] ruby: fix CVE-2019-16254
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
X-List-Received-Date: Tue, 11 Feb 2020 13:43:20 -0000

Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
---
 .../ruby/ruby/fix-CVE-2019-16254.patch             | 106 +++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.5.bb           |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch

diff --git a/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
new file mode 100644
index 0000000..704c850
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
@@ -0,0 +1,106 @@
+From 18d5289b4579822e391b3f5c16541e6552e9f06c Mon Sep 17 00:00:00 2001
+From: Yusuke Endoh <mame@ruby-lang.org>
+Date: Tue, 1 Oct 2019 12:29:18 +0900
+Subject: [PATCH] WEBrick: prevent response splitting and header injection
+
+This is a follow up to d9d4a28f1cdd05a0e8dabb36d747d40bbcc30f16.
+The commit prevented CRLR, but did not address an isolated CR or an
+isolated LF.
+
+Upstream-Status: Backport https://github.com/ruby/ruby/commit/3ce238b5f9795581eb84114dcfbdf4aa086bfecc
+CVE: CVE-2019-16254
+
+Co-Authored-By: NARUSE, Yui <naruse@airemix.jp>
+Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
+---
+ lib/webrick/httpresponse.rb       |  3 ++-
+ test/webrick/test_httpresponse.rb | 46 +++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 46 insertions(+), 3 deletions(-)
+
+diff --git a/lib/webrick/httpresponse.rb b/lib/webrick/httpresponse.rb
+index 6d77692..d26324c 100644
+--- a/lib/webrick/httpresponse.rb
++++ b/lib/webrick/httpresponse.rb
+@@ -367,7 +367,8 @@ def set_error(ex, backtrace=false)
+     private
+
+     def check_header(header_value)
+-      if header_value =~ /\r\n/
++      header_value = header_value.to_s
++      if /[\r\n]/ =~ header_value
+         raise InvalidHeader
+       else
+         header_value
+diff --git a/test/webrick/test_httpresponse.rb b/test/webrick/test_httpresponse.rb
+index 6263e0a..24a6968 100644
+--- a/test/webrick/test_httpresponse.rb
++++ b/test/webrick/test_httpresponse.rb
+@@ -29,7 +29,7 @@ def setup
+       @res.keep_alive  = true
+     end
+
+-    def test_prevent_response_splitting_headers
++    def test_prevent_response_splitting_headers_crlf
+       res['X-header'] = "malicious\r\nCookie: hack"
+       io = StringIO.new
+       res.send_response io
+@@ -39,7 +39,7 @@ def test_prevent_response_splitting_headers
+       refute_match 'hack', io.string
+     end
+
+-    def test_prevent_response_splitting_cookie_headers
++    def test_prevent_response_splitting_cookie_headers_crlf
+       user_input = "malicious\r\nCookie: hack"
+       res.cookies << WEBrick::Cookie.new('author', user_input)
+       io = StringIO.new
+@@ -50,6 +50,48 @@ def test_prevent_response_splitting_cookie_headers
+       refute_match 'hack', io.string
+     end
+
++    def test_prevent_response_splitting_headers_cr
++      res['X-header'] = "malicious\rCookie: hack"
++      io = StringIO.new
++      res.send_response io
++      io.rewind
++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
++      assert_equal '500', res.code
++      refute_match 'hack', io.string
++    end
++
++    def test_prevent_response_splitting_cookie_headers_cr
++      user_input = "malicious\rCookie: hack"
++      res.cookies << WEBrick::Cookie.new('author', user_input)
++      io = StringIO.new
++      res.send_response io
++      io.rewind
++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
++      assert_equal '500', res.code
++      refute_match 'hack', io.string
++    end
++
++    def test_prevent_response_splitting_headers_lf
++      res['X-header'] = "malicious\nCookie: hack"
++      io = StringIO.new
++      res.send_response io
++      io.rewind
++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
++      assert_equal '500', res.code
++      refute_match 'hack', io.string
++    end
++
++    def test_prevent_response_splitting_cookie_headers_lf
++      user_input = "malicious\nCookie: hack"
++      res.cookies << WEBrick::Cookie.new('author', user_input)
++      io = StringIO.new
++      res.send_response io
++      io.rewind
++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
++      assert_equal '500', res.code
++      refute_match 'hack', io.string
++    end
++
+     def test_304_does_not_log_warning
+       res.status      = 304
+       res.setup_header
+--
+2.7.4
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 223b037..58bb97f 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -3,6 +3,7 @@ require ruby.inc
 SRC_URI += " \
            file://0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
            file://run-ptest \
+           file://fix-CVE-2019-16254.patch \
            "
 
 SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
-- 
2.7.4


