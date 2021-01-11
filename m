Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.27038.1610325995044784800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eINy9cx1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id lj6so6776981pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=+u63D7JIMdKkQQyrb2SKHPvFxnvzrpZN8zuQRF0oqL0=;
        b=eINy9cx1bGWaBMjDrDUDtNv1405ZQDJsTEJ5LKio3Wx+2p6PLbpR7TGkY8NMHXGvHe
         B1WRo9WA9d16Pd/7xNn/aT3c1q1RiPJOMNuSZWmUJtpwlpGRst/rJFzVjiuCbvhRO/gv
         zfdovSo0Hux0jaGUkFkjmz231bs44DxxIZLB5VEqT7rpSziPbC4IwQh4Hy2ZUmo53bFT
         q0E4/ss2mTAa3OFEsFX6snFVLZqS3OYpfJL5rsfi/aqUe5VBxAHEnUe3lnIqnV1c0//N
         0bxauuHYQaJrk+aMUWb47xWZaVObuuPU7vLKCNm/64PjtrReX2gmWFqJJcJwt/jRLzSI
         wBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=+u63D7JIMdKkQQyrb2SKHPvFxnvzrpZN8zuQRF0oqL0=;
        b=GBdsCnL23bDVRLiUOvT9Hq5ke7haBCgaxn9S8NCtksJ2YPQuOD7CR5sNFw48B+xkoP
         kgdA2BtsYGuZ3wNMqKaAMAhOvpS4Fty1XLIYc65++tbSfXLxb/0QKpahFrj+jabpijJO
         OboWR2QHA1qOrBHVUKVvrC5qsa2m16Vag2nrWnKam2UcHJCuWwN/ahaES5lwN+7p68LN
         isvtMcngOQ14c9SLwr6t09wEc2jrDT6v1pMHGZMD2JdQ8EBpNAgZ78ST/uG5J2TaB5IE
         IbSAO7zQTvtZg2p2d2bx2B9wHt3cCtfqJFwEFu/rM++o4yoz9ueWhQQU0HP/CQu019bl
         XcAQ==
X-Gm-Message-State: AOAM5321y57ocUn6Jxf2XX4z6g/H/jPJM7xEfFj5OWQrJc1k23G52zy8
	P4A7C/CDo8eFkgYJSe6p6Ej2sYTxHXXr2z7KQmw=
X-Google-Smtp-Source: ABdhPJxREZtmK/T2jnCQCtd+yCSNCR8rttrlnKcgT6Xo2kkGPV0FaOu4YimcNlmPw6xGE7DhOlWQoA==
X-Received: by 2002:a17:90b:606:: with SMTP id gb6mr12070957pjb.27.1610325994249;
        Sun, 10 Jan 2021 16:46:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] glib-2.0: add patch for CVE-2020-35457
Date: Sun, 10 Jan 2021 14:45:48 -1000
Message-Id: <196d6a668fb44ac3f69d791d42d2eead285a758e.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Upstream has disputed CVE-2020-35457 claiming it's not exploitable but
the patch is simple to add.

https://security-tracker.debian.org/tracker/CVE-2020-35457

"https://gitlab.gnome.org/GNOME/glib/-/commit/63c5b62f0a984fac9a9700b12f54fe878e016a5d
https://gitlab.gnome.org/GNOME/glib/-/issues/2197
Upstream position is that it is not realistically a security issue."

For master branch this CVE is not reported by CVE checker:

NOTE: glib-2.0-2.66.4 is not vulnerable to CVE-2020-35457

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...econdition-to-avoid-GOptionEntry-lis.patch | 41 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
new file mode 100644
index 0000000000..17dcada613
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
@@ -0,0 +1,41 @@
+From 63c5b62f0a984fac9a9700b12f54fe878e016a5d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <withnall@endlessm.com>
+Date: Wed, 2 Sep 2020 12:38:09 +0100
+Subject: [PATCH] goption: Add a precondition to avoid GOptionEntry list
+ overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the calling code adds more option entries than `G_MAXSIZE` then
+there’ll be an integer overflow. This seems vanishingly unlikely (given
+that all callers use static option entry lists), but add a precondition
+anyway.
+
+Signed-off-by: Philip Withnall <withnall@endlessm.com>
+
+Fixes: #2197
+---
+ glib/goption.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+CVE: CVE-2020-35457
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/63c5b62f0a984fac9a9700b12f54fe878e016a5d]
+Comment: adjusted offset by -5 to fix patch fuzz warning
+
+diff --git a/glib/goption.c b/glib/goption.c
+index 9f5b977c4..bb9093a33 100644
+--- a/glib/goption.c
++++ b/glib/goption.c
+@@ -2417,6 +2417,8 @@ g_option_group_add_entries (GOptionGroup       *group,
+ 
+   for (n_entries = 0; entries[n_entries].long_name != NULL; n_entries++) ;
+ 
++  g_return_if_fail (n_entries <= G_MAXSIZE - group->n_entries);
++
+   group->entries = g_renew (GOptionEntry, group->entries, group->n_entries + n_entries);
+ 
+   /* group->entries could be NULL in the trivial case where we add no
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
index 09d253fbfb..0ad14a0878 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://tzdata-update.patch \
+           file://0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1

