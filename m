Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web08.7995.1623852324512851685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hZ+bKr2y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso2547400otm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oqmHHsuu0//fnQC8Z9BHd7mR0NqhG2r5eZ7nY2GiRb8=;
        b=hZ+bKr2y/Tw+6lMgjmr/wBHTfruUeCc4h7vaVQ3eajoK3336YahaJlfTiivbIT+n2p
         3llNAwMPMvDDsuJF3HZ69hfq7Vd/ppTBcPBQ3XISHwVuw/dD1mL4dWPkT7lf2PD38IHX
         WPDFJfP0jL3o9mckBBe2aFcXNpV16nfrWdYULKGRc3OFJggzAb1Zzo3nnyPUZQJRTMxn
         MocETIcECc3tcA7aotwad5iF2lEzTyCa/G/6Oj90ErDgLSTaSDMQLGnQrw8MYsDMXXCv
         UizEYvHIn/+VO1GAJDel1lbnPjaD4tsa07PuPOzecrq8/BpyYghL8XMu162+BCoEcGfP
         ZczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqmHHsuu0//fnQC8Z9BHd7mR0NqhG2r5eZ7nY2GiRb8=;
        b=qQVyho3PWHNzMySg7h8iUbad3Z10DgsBpDwFnV+z7Cpz/5X2syJpM7giqk9zYpgl6B
         Ghgd0iDF8XSL03YCvv6tgyQyCvY6Y+gw76F+TlOwDdx7ANyFWBoB79RInKzEv3dr5y3b
         kweBui/SWiDBAsXIuEyWwKb6aJuSfKdOLzxSru/4MEc8/OY2hrikC3yCpndpgToU/7CA
         4Jz8eclpjCVPLb2QYPBrzI+2IqozD+CsDOHP7okukvcHv7Bu0UnnaYtpfYA68nNl+Uxb
         fQoJvXCmnZ0O1KaesPp9W9KTcLPF6TqQV6wi816kz7SKxyH4GUH0vrTKe462f0pe4lUx
         lbbA==
X-Gm-Message-State: AOAM530apXF1LSIDGchu6GSLziJqWfUDzrDl4yif8EmOBuaBKhL6z3Ce
	e1o8DnSKStklWq6bV+vDwuSJzasIHXUSXGoZoMw=
X-Google-Smtp-Source: ABdhPJypqpL0n0wPwOplo+SM9AMoZaaqPXo1aH9HivcsFfV5+BeRBbYY9hSzFWuWCQWfmE4UuhIC/Q==
X-Received: by 2002:a9d:82b:: with SMTP id 40mr41431oty.81.1623852323349;
        Wed, 16 Jun 2021 07:05:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.05.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] ruby: 2.7.1 -> 2.7.3
Date: Wed, 16 Jun 2021 04:04:26 -1000
Message-Id: <4de0d54827bc4645b69e5a0043b6f285b0193402.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623852080.git.steve@sakoman.com>
References: <cover.1623852080.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

This release includes security fixes.

CVE-2021-28965: XML round-trip vulnerability in REXML
CVE-2021-28966: Path traversal in Tempfile on Windows

CVE-2020-25613 fixed in 2.7.2, do drop the patch

release notes for 2.7.2 and 2.7.3
https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/
https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2020-25613.patch            | 40 -------------------
 .../ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb}     |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb} (94%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch b/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
deleted file mode 100644
index 1abcb7547e..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8946bb38b4d87549f0d99ed73c62c41933f97cc7 Mon Sep 17 00:00:00 2001
-From: Yusuke Endoh <mame@ruby-lang.org>
-Date: Tue, 29 Sep 2020 13:15:58 +0900
-Subject: [PATCH] Make it more strict to interpret some headers
-
-Some regexps were too tolerant.
-
-Upstream-Status: Backport
-[https://github.com/ruby/webrick/commit/8946bb38b4d87549f0d99ed73c62c41933f97cc7]
-CVE: CVE-2020-25613
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- lib/webrick/httprequest.rb | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/webrick/httprequest.rb b/lib/webrick/httprequest.rb
-index 294bd91..d34eac7 100644
---- a/lib/webrick/httprequest.rb
-+++ b/lib/webrick/httprequest.rb
-@@ -227,9 +227,9 @@ def parse(socket=nil)
-         raise HTTPStatus::BadRequest, "bad URI `#{@unparsed_uri}'."
-       end
- 
--      if /close/io =~ self["connection"]
-+      if /\Aclose\z/io =~ self["connection"]
-         @keep_alive = false
--      elsif /keep-alive/io =~ self["connection"]
-+      elsif /\Akeep-alive\z/io =~ self["connection"]
-         @keep_alive = true
-       elsif @http_version < "1.1"
-         @keep_alive = false
-@@ -508,7 +508,7 @@ def read_body(socket, block)
-       return unless socket
-       if tc = self['transfer-encoding']
-         case tc
--        when /chunked/io then read_chunked(socket, block)
-+        when /\Achunked\z/io then read_chunked(socket, block)
-         else raise HTTPStatus::NotImplemented, "Transfer-Encoding: #{tc}."
-         end
-       elsif self['content-length'] || @remaining_size
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.3.bb
similarity index 94%
rename from meta/recipes-devtools/ruby/ruby_2.7.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.3.bb
index a6c65e887b..318b9acdae 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.3.bb
@@ -6,12 +6,11 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
-           file://CVE-2020-25613.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
+SRC_URI[md5sum] = "72ef97685008981de3ddb748d0dab31f"
+SRC_URI[sha256sum] = "8925a95e31d8f2c81749025a52a544ea1d05dad18794e6828709268b92e55338"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1

