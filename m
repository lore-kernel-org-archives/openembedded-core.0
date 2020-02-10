Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0C8060C1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 18:17:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id ay11so3153358plb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kQDo25GtUIMrl3Gj2T/EDG+0KhgiohQERI4ZHGA7jy8=;
	b=oxYyp8k2+PclO64o8d4bUlZWZnBqtCtxOlOBWjquY2tXJGaf2+8NE6vLyCBnlS3P7q
	dBDTGBcz9K6ednjscUmWUIvDYAxr+R8SX33KWUlJtPn7pHtKoseWRKUTRPaynQiv/GAS
	hCyeF7bberCn/itFChP/7EHykQ2GN81RomOwIWb2gfL9kMnz5TSIbUbZPOl/ZueciP8z
	0jo6zRq8+6KK5lQ31TTzeXMnFd1Ui1EX+AFTOJobUz6ilJcN07SqXa/a5TQ5/1BkyDEu
	G+IEkJnXzWUczFzbcuLmvv+XLfrlwPXEqIiMnOTrwyq7fb1wQpvFZbyFFG+NYq8En1PJ
	x8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kQDo25GtUIMrl3Gj2T/EDG+0KhgiohQERI4ZHGA7jy8=;
	b=dBXzzzO8UWs9m5dUyrk0LdIyOT9lvVXcA/h0tCTyFv+Wvxa+yulCL22Djo0QaAnU4V
	mNlxYFIgBb1phQNQ14An3zMD9IvymhSXC+JaFY058NvLReVVRhZ3ht/o2lX6qHjJol5A
	A8QSLEC867Lmed3K1rwsjf8k2z1kMa+SX4YAYQd/FDoc3dQ65Rliaj/z9ZW2YLRvwhUl
	LmrakDnl8xB+qBicibxfQnWUAGKkOFPsxLSPT6sFJE+LzUCUah47ot1mDMZPblu9bi7w
	+JDqF8vVfsCoKKgNnBa4isYhFyWkYp4pKr/onbtGyyypWjCMUOJ7VoNbAvrcEMrcExQG
	IWhQ==
X-Gm-Message-State: APjAAAXv5ZxEXacDgPvnfjTwTcDU9gJ4rFaTc3dmcRZgf6KWAUrlz5fa
	dolEdsPoaISgS/u5xOqcfrKDqTNJ
X-Google-Smtp-Source: APXvYqwwvCFsCCK87wy+xmMy2MnrHs0+hS1KSpVHUyhYwqu+cr4MGwDPXDMa34+G5OVfewKxRCl9NQ==
X-Received: by 2002:a17:90a:8545:: with SMTP id a5mr349168pjw.3.1581358644300; 
	Mon, 10 Feb 2020 10:17:24 -0800 (PST)
Received: from localhost.localdomain ([36.255.87.199])
	by smtp.gmail.com with ESMTPSA id
	f81sm1034983pfa.118.2020.02.10.10.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Feb 2020 10:17:23 -0800 (PST)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2020 23:46:59 +0530
Message-Id: <1581358619-5570-1-git-send-email-rahulchauhankitps@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ruby: fix CVE-2019-16254
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
X-List-Received-Date: Mon, 10 Feb 2020 18:17:24 -0000

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


