Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD2A61C13
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:09 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id t24so8277907pgj.7
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zvTguXFct7CvuniAAK3bIu0ooGLQMug5dCJRnXuUSBI=;
	b=SpuVlH+aKl5R17OOcL0LaJyaj6/2pcwUsP5NbX9cZ52gWwROeJtmgVG2uaKvAxUan1
	b+NF6EiyXJgRIO5ZJQ39Qeb/3egvt5dWVjt+Z1Fuxf3o463cRvYVCMO6Ugeyr9KXuFIu
	HteZStdU5u/VoPnZnklu0eOdp/czVsszQpgmFtdOnqt3Es15Ls4H2SKqUTKumfgfx+ds
	B6f1cg86m7p3U/aEqqx/tmFRX5qA5ItXP8QUlrT0vhChQXLs1Lrc+NvNaAnSD/PMk8I6
	jozyulVywZEAq5dc1Wm1UzdFBo1MXANcCJjm5rIVShcKQybGWZqA6t7ZA5VQ1Ao9mg9y
	f/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zvTguXFct7CvuniAAK3bIu0ooGLQMug5dCJRnXuUSBI=;
	b=RfWHp8V6wRhW6oMqMltpo6ilmE5g7r2nuVaudBxH4id4wUSfwz4u54BUtwxJfSsadB
	75Wdxjo4qk94i+mVaSEB3oiM8RK4YDppjHpKANIjLb8ij8Ce23LnxoHr+/sOtOLue148
	gj11mxdLFy9fRP6ZO6nxz5NRWWuvQl49I6gpipdPgWSEymseBAL9tXNPgvcag6r8tBch
	v/7woSqF5D9jgdeidZMjm14qrs4pe+QHoDUzCAhI3TfzQML2a6j4CuwMCKFRuC8mEpkN
	o99uAdooWjv4ExZ1MFSA5B2LhIo1i3XYrXzddlb8BEGtjRKkrhgfwCqBrY3GtnRftSKI
	0Q6A==
X-Gm-Message-State: ANhLgQ2QZwV3lp8DFIlP/7fBRDwj6TPqgy2q4etsHCyoUEQqtHznqLrY
	QKPbuyWKYG0snPb4tlLmxDOiOmXj
X-Google-Smtp-Source: ADFU+vvArFRhOdqRzr4IhAaexIp2oPn+O86x2rs5T2cyWE0cDUmcfC6ndv1YzcFP3hZpPz9nqeROZg==
X-Received: by 2002:a62:4ec4:: with SMTP id
	c187mr25306971pfb.223.1584295930772; 
	Sun, 15 Mar 2020 11:12:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:52 -0700
Message-Id: <c5c5b7f4043d05485df135aeceffc1c54d411403.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 10/16] ruby: fix CVE-2019-16254
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:10 -0000

From: Rahul Chauhan <rahulchauhankitps@gmail.com>

Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ruby/ruby/fix-CVE-2019-16254.patch        | 106 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.5.bb      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch

diff --git a/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
new file mode 100644
index 0000000000..704c850c50
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
index 223b0371eb..58bb97f4bd 100644
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
2.17.1


