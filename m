Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E3A1F61BCB
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u68so418259pfb.2
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zvTguXFct7CvuniAAK3bIu0ooGLQMug5dCJRnXuUSBI=;
	b=ljjaXrPBwhabbmgWuJzaQP9SciKHAo35Yn1vjPOwdbsHPdyw42oYXUr/anejx4Dxyx
	u1V3Rze67Q9m5KBGfunmIFqFfC6iWydYLGi7rceuhS6ezOXFjmOK+g1eAhBqx4x7xbH8
	iBx7YR6pchPdC+q1SHhl+HkQmn3B5XZp/o6LB7XnPEer4hCIiJ2L3CXr47CSS8CrWKFW
	w9xWVgD6tLvRxVaeDMVBlz+vvvctHrbYrmZYkWXN3dQEAuDBE5GkDzl40sxMolHzsV+0
	uSyPnk9lcx39WXfQw6nFL3M9QE508V38Qx279x4Z45nRQxDviw0a0biundcN6JRt73z1
	WuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zvTguXFct7CvuniAAK3bIu0ooGLQMug5dCJRnXuUSBI=;
	b=O7+s+3sWw5mylpNcx564PWNTz4ZtqK/NNuvDAmem2z+5EL47kekHo2gjkusxysW9Wk
	SgLKGbQjQ+259R0xiuJzbQbD9pLqFUmUV8+N1IP0ENPgQsVp1iy3q2zYbUzoLoL1Vs0J
	SESn6aeH6rInZ0WC1LOy5zJXo7I7aNRv76IUpmth5B4aCy9JCUHfVXd2tkIbB3SuLu4A
	5Ks+wh5aRSKUOZZf952kf4uND4q2Mb40SMCu5ezWrZaOEoMrPExhQITbEIkbb507D0Y4
	64ep5SLDGCFulIIYkPEg7+HsoF/WVZgJC8vsgHyRC35ZBYAr9R+HXrZO4A4el4sWzOpu
	giDw==
X-Gm-Message-State: ANhLgQ3cisBTPIC8+eFt3eQJ0oUJVLhQzGCJTsNOPJa2e+buvPj5pmqG
	TwxbWi0WzH7jeIge9BpTUfMzaUUq
X-Google-Smtp-Source: ADFU+vtn4L1X9NRWjHUHa/hUF4mwE166C2Mq8Ak/4O7UJ6j0HaYkyj5k4NbyYdcVcskBQCkkXimFNA==
X-Received: by 2002:a63:e007:: with SMTP id e7mr706372pgh.262.1583893589906;
	Tue, 10 Mar 2020 19:26:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.29
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:11 -0700
Message-Id: <c5c5b7f4043d05485df135aeceffc1c54d411403.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:30 -0000

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


