Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.2980.1604100140317682003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 16:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XWEnNYGu;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id n18so8134505wrs.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 16:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIzEOg2PghuH5AbEzLINkj+7a7jYgdUV7dU39c58kY8=;
        b=XWEnNYGuaiSnyn/i5jtePd/YsGC0ih3G7OguOiZ4bVXDYP6divB9zNRZvQshqD0OnF
         5tDUQ/vt/amI7meN+40PvpnJkBMnMV+oU1MoplFV98G/eGQKVJ96FPXAD0p7j6SL15Te
         d9u5JC8+l4P+3z4sF62swYMHpQz/8n7glYAoXCYpbo7079ki0OfRkgOzYpI+b5dPnlTB
         DFrfkDl9HMM0aYf41fePcc44iLiV1CNausntdPrzoZCwg1ge9LJ5+DwTnHi0udRYnaAO
         ov9ZVuSjoIfHNXbQ26Ot4NabyQdOpl47IqGwsA/Tab1POh2jocBN1gi2fAiIjQFuxsns
         Knmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIzEOg2PghuH5AbEzLINkj+7a7jYgdUV7dU39c58kY8=;
        b=oyKiUZIKrDtFjNBcKBYlVdqdHh12F6KbDKiPNIsFKmXDfZYLvllgWfxRpQdKl6Z3Y6
         cGexDlcb5F9JN6VUvtBrkL9gRtgbDjyVmbTEvyr8jtMZSCPC/qBLAiqhcYhQ6Qm0Vt+r
         1a/6eHqAovZ2DzccJ1Es2SdldHqVI6IqsVb6+qR+6dIZW2+FwMmUNsIP7cJ9oaIxAX0Q
         OUXsgPMUjLAEhsVJNmjKS+yppldACw84YfjgV0rfZdKMUXwYT0STcWKwkGrmYBLLYLKJ
         28d1XuhoHMDjLAu18xkJ94MhAJUtFyJTBgedJvn+/eisPelg1gj/JrIVYS+HInRgQSU+
         ziYg==
X-Gm-Message-State: AOAM531awkSCCduBtls3mLB8v6MNrz05BgaZXt8a/jgvn4zLhVQ5DSNC
	jyL7b8xs4quYERmT0RodKH7YJKBA7Y3CphoF
X-Google-Smtp-Source: ABdhPJwWkWXk3bpAP3PMorPPEfWKvbdL5w6saVGCVBSGIIWd0eSh3CDtrQyrjQ7mO5fNFc6/UO/dVA==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr5941697wri.230.1604100138582;
        Fri, 30 Oct 2020 16:22:18 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id v24sm12611590wrv.80.2020.10.30.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 16:22:17 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0: drop 0004-capfix.patch
Date: Fri, 30 Oct 2020 23:22:09 +0000
Message-Id: <20201030232209.624184-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the update for 1.18 it added by mistake

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0/0004-capfix.patch  | 48 -------------------
 1 file changed, 48 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
deleted file mode 100644
index 32e9610cff..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 9607e9858d681f5ad2e1677f5dbbb1fb61bd8846 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 18 Oct 2020 10:40:59 +0100
-Subject: [PATCH 4/4] Currently gstreamer configuration depends on whether
- setcap is found on the host system. Turn this into a configure option to make
- builds deterinistic.
-
-RP 2020/2/19
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
----
- libs/gst/helpers/meson.build | 7 ++++++-
- meson_options.txt            | 1 +
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/libs/gst/helpers/meson.build b/libs/gst/helpers/meson.build
-index 9e5a4ae..c2e540f 100644
---- a/libs/gst/helpers/meson.build
-+++ b/libs/gst/helpers/meson.build
-@@ -66,7 +66,12 @@ if have_ptp
-       description : 'getifaddrs() and AF_LINK is available')
-   endif
- 
--  setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  setcap_feature = get_option('setcap')
-+  if setcap_feature.disabled()
-+    setcap_prog = find_program('dontexist', required : false)
-+  else
-+    setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  endif
-   cap_dep = dependency('libcap', required: false)
- 
-   # user/group to change to in gst-ptp-helper
-diff --git a/meson_options.txt b/meson_options.txt
-index 346c423..03338ad 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -25,6 +25,7 @@ option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to ge
- option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
- option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
- option('coretracers', type : 'feature', value : 'auto', description : 'Build coretracers plugin')
-+option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
- 
- # Common feature options
- option('examples', type : 'feature', value : 'auto', yield : true)
--- 
-2.28.0
-
-- 
2.29.2

