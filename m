Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3012.1628562837922105187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 19:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnlkpfVm;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id f3so8306009plg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EZVcplAzVIN7xJdGKq7XWBbFGauzeSAOEbJSOT010Ls=;
        b=ZnlkpfVmh3yCyg2os2onpWnZerxvceB0eeHHtqTi1iS8QpdOs+5lXmDTUNZucpxbX6
         VESLPI77nGImkkUaIYjOWlEqldeDuhtYGO6TRjfKQziMybSOoeK4LNo0fMwIiao9jfC0
         mJD3zq0fsbQImL1tYNBq0SzdvcOggUOJJMxsNXqb0LwZKTtEgN19UocB6ZI5slez/zoJ
         4hjHRWv3HWjU0eGrhdvhSccDQ6Jj+vHkrhyWFqzvLHupiBAnWg/pWkdpuhjjMgsVYl/7
         j5SMvxDWGY5n3NOj8RQtw98oNNr3ioAP8IH0kXe/BHGpSzIverpZ+QWJn6vxDeYhoa+T
         W8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EZVcplAzVIN7xJdGKq7XWBbFGauzeSAOEbJSOT010Ls=;
        b=mVXXZ5Gw4KGJ+o/ovwgRg5dqN3Eomzijhy6foW+w/YppgSiA8Gf+9cIE9ZjeS8KExn
         qXLXgD/bYIuE23++snAJXIhYAxnbzUr96yI7m2v9MCqH9+n/KL1ZPcCA9RWnMFT05Aub
         MZ/vBzB125eI0kZHUhy05Xn56aloCkYArsegetY5xegGNMAW/QqrkVPjkneT94PY2uco
         K3U7jRHiwrBCt18R9cRuvwwwh+aDYYn4rrFw85xc04QHFoygeaK75PwtPtse1ajEw5CC
         oQao9jIcQY6vmTiTNsWTnUOgkq960Oue/o52+Cqy0EUUdfoZQIc2oEm9nY0+2TKH2biR
         6uyA==
X-Gm-Message-State: AOAM5323i6ksvorreSeojeiS/Dt0X/oeIXDeq25Ky8T7eVQQ++qKy84U
	YQGr66M+uGvoKXuj2UmqvxvnZAiSOujMhw==
X-Google-Smtp-Source: ABdhPJyDSluK6GI4MFWqTUqe6dHXBHQtKRfNbtUMBR6ivv+6nIMUoUMHSs93+dKN4V5EgSGPZjBa3A==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id t15-20020a62ea0f0000b02903198eef5ff1mr27077265pfh.74.1628562837024;
        Mon, 09 Aug 2021 19:33:57 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id q4sm1013967pga.48.2021.08.09.19.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 19:33:55 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH] ruby: 2.7.1 -> 2.7.4
Date: Tue, 10 Aug 2021 11:33:41 +0900
Message-Id: <20210810023341.260889-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This release includes security fixes.

CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
CVE-2021-31799: A command injection vulnerability in RDoc
CVE-2021-28965: XML round-trip vulnerability in REXML
CVE-2021-28966: Path traversal in Tempfile on Windows

CVE-2020-25613 fixed in 2.7.2, do drop the patch

release notes for 2.7.2, 2.7.3 and 2.7.4
https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/
https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/
https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-7-4-released/
---
 .../ruby/ruby/CVE-2020-25613.patch            | 40 -------------------
 .../ruby/{ruby_2.7.1.bb => ruby_2.7.4.bb}     |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.4.bb} (94%)

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
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
similarity index 94%
rename from meta/recipes-devtools/ruby/ruby_2.7.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.4.bb
index a6c65e887b..dafa7d2f6b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
@@ -6,12 +6,11 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
-           file://CVE-2020-25613.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
+SRC_URI[md5sum] = "823cd21d93c69e4168b03dd127369343"
+SRC_URI[sha256sum] = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1

