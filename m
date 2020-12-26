Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.19196.1608974893642244666
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fhPPsmeG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b9so8358629ejy.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CD8fBrhiLt+N2xh07YRG6exLcCLSWqdXD4Y7Whe/Uwg=;
        b=fhPPsmeGYg94Yj8MNgYoSBvYX8seXPew5jI3SOLKsC6rRI8TQZD5ey849kqzbDLaO6
         3p1BazazPg5UaVscbf4urGy/d6+wtZ8ER/PBkQwa6Xn7szb/Q26hteFlw7+5N8a3nF1Z
         cuUaYvNs5tRbO+2K6aphoQi/ZWsYEjpT/C6VxW4A3W5uIer0U1YEAm1H3br0vw/1y6vg
         FsUhioKO+A7nKNm4cgSwo6anEWl066j1K513CQ57676Sxy+g6NOShPhMVwFUCL8ptxyn
         sXHoJeZV5Q8fXMR2TqQJVh7RhEwwUlebh25wMEwDn6cUX5ppEGaJn31CDUwh1Mqk4TAC
         hbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CD8fBrhiLt+N2xh07YRG6exLcCLSWqdXD4Y7Whe/Uwg=;
        b=cSXGr/6bfXCH/s4GjwtUmgRvJ3KdNejeeRF7pOndMvzs1ku6Y/ZUF2T99Gzh+tynEQ
         7JHQzB/GxnweD0E1fXdUrlXCb/y6IEg1k7Wh0GvyxcpYjAmiuIbg9eg6+YCxn65OVYJl
         IVEfStJQ6i09YWV05FyvHK4ESQXLb7zhZu0r/VodsVciDpgxXdDxTINC+T/4MaIzKxVF
         +qmWbIrSsZuHAL2iZWK1M/aUb4zwYQ+SxNO+TBuNsNXFILTWnI/Z9dZcIlb848W4OxDf
         YTT8jFhIDD7DfIE3JeDZpRNu55opQjGlsCTeJllquzGrkBwY00/ZHsrVKmc82Ul/vdvO
         KqSw==
X-Gm-Message-State: AOAM530pG6FQHaMx7jJjSKhqdf6TSC60Ln+ihIdByuVxmW9dmDDHSfKH
	Bp07JTdpQdOQla+yqN5CRC7iu3KFV+4=
X-Google-Smtp-Source: ABdhPJzTvcO34cAuwFiozHj1acQm1zzNoEU7tYbA6De3KVQiQGNt5SXtNZ9r5vjjXbVbaTDQjUklPw==
X-Received: by 2002:a17:906:40c1:: with SMTP id a1mr33675658ejk.520.1608974892256;
        Sat, 26 Dec 2020 01:28:12 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:11 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/48] piglit: update to latest revision
Date: Sat, 26 Dec 2020 10:27:22 +0100
Message-Id: <20201226092732.52323-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...nder-ops.c-add-missing-format-string.patch | 24 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch b/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
new file mode 100644
index 0000000000..261d98d8f6
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
@@ -0,0 +1,24 @@
+From e21e68f6aa0f5249fce613e8fd4ac0edbd5cb7b0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 22 Dec 2020 13:35:11 +0100
+Subject: [PATCH] render-ops.c: add missing format string
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/spec/ati_fragment_shader/render-ops.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/spec/ati_fragment_shader/render-ops.c b/tests/spec/ati_fragment_shader/render-ops.c
+index 131334ba2..19a353d67 100644
+--- a/tests/spec/ati_fragment_shader/render-ops.c
++++ b/tests/spec/ati_fragment_shader/render-ops.c
+@@ -393,7 +393,7 @@ piglit_display(void)
+ 		bool ok = piglit_probe_rect_halves_equal_rgba(get_test_x(i), get_test_y(i),
+ 							      w * 2, h);
+ 		enum piglit_result sub_result = ok ? PIGLIT_PASS : PIGLIT_FAIL;
+-		piglit_report_subtest_result(sub_result, test->name);
++		piglit_report_subtest_result(sub_result, "%s", test->name);
+ 		piglit_merge_result(&result, sub_result);
+ 	}
+ 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 31954aa8b6..442c1a3c62 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,10 +13,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-serializer.py-make-.gz-files-reproducible.patch \
            file://0001-framework-profile.py-make-test-lists-reproducible.patch \
            file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
+           file://0001-render-ops.c-add-missing-format-string.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0fda9f67a782edec640998286e7b6058e8933d17"
+SRCREV = "603deba4ab66e2a8948693a14d715e536caddcc5"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.29.2

