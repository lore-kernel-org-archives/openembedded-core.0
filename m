Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1542.1795801791396549838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NORpvcFd;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so4779864f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801790; x=1796406590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=540vsAIkLI6KdvfB0itZ4dPB1XdOHu6GW4AyUiduEMM=;
        b=NORpvcFdUsP8JAhBh787HO9FHvvmbF/1eN5jwXxoJZllwMQVILe8kwilRe9WV2/nb/
         B6uDX2wR43i9Bv8J8QV8hXc3rs/K22388ShV7zkcVNefVGYwVg9LbxWGT/hIYshEURQT
         V0WqsF4tNeqsMHKjFdNIEUK1gvFBUrGO7jFuxVLprf6t7kn7Dq7gLlrCde+qeE/CQJd1
         yj0xnzuS2DYhr9tZ1ZHyXpgSvL0IhQLKqRv7SQGDBXgKMQooSlRFpMI6Xo1CQuoUs3gV
         Vnda2K2pewo3EZxrPtnU+WQV3gd+J+s/DTXPUwG4s36yfoWGd3rZq08cytP/TEvilgwl
         4NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801790; x=1796406590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=540vsAIkLI6KdvfB0itZ4dPB1XdOHu6GW4AyUiduEMM=;
        b=Y1NG726nZYOW+YwCi5QJR5QzmydI0EFab/FplAT5oejP0+oPHmgcb6F7erNJGTUZpA
         HwYiLMAFDGBO1EBHatLe8mJHmVxGq7ALuh4HH5/Rl2nzTZfTmYdG37MpfuZIPQw07DM6
         4SOjuQmX2uoXs6SC2Vlas69pi5kvgQMTOmJ4kP3Vx75vZnUfMaGr8ALHalaNuumFUr/f
         kywi/pU8A/+adgYlIZbPrxCCnJoUFC22+QPkfSmkJpHJSmr0t3zjHrKj4Tnwo+RMmQVW
         zMl6f10ghqPVAYpsZXrnpghKLqlS7dqKWKVQkUkOomYcgY/rL4PPxjVOnkqEfoKdD42E
         Rarg==
X-Gm-Message-State: APuU4Z8LvBMRAwyIChx0zG4lsqgdMY/UYRmBFrpwxOHOLBRBsh+IHu8/
	7Fut7gGR6Czb4Zhi/79i21S4SZ6IqNzbPWT5S+YCFOFfNDy5A+uELFFyW1jB4aPQNEaJdyRNwhC
	hc9MJEYw=
X-Gm-Gg: AZFdTZcuye5voih8XJ5Fv006ZysfIrXW033lI3Qc3i1aSe01JDRlemWuafQXiyPzJZ7
	UTvl2AE4TibbR9VVU+mA6n7qkry/4AUihw/6fbe5HVkwVVtVQLZPeOKQGdQLCL2mGIpJVUtoSOp
	FoagL5KvUDwjWhCyXaHBM8AGw9pjlmK2XN3QoCD90rm/WLPd/9CbZYCBsPg3jmJpwYWHj+ZJCse
	Zipl7FrLX9uYzmeQ9zgVqOy7yuX9Ebee/9tkvWNDX3eni+WAgRd58rVcSsnmUJFcYAaSeBkXTza
	S+BLfJgLm2+1x4YGcG6EZzvgGuOJK17vAfPgtsQ6+k8nBLyPyxn3lpKS+d00NERXun/B/g2I3ZQ
	GPj4j77G7qN1N2vnI161roY1ivsvrUB4dHnUSmUwWFXwAz+yVNn38rginGlBmhn9Z6doHsqmL9q
	mcP+Cl0GM/+ipb4+FTFlmA3PEUCSibmfEGwvFKuxxnbFv54Tbd2bbzRyDkDTSvf+KAPIuV1MJBg
	9M77277QDakjymPLiVFYjgDr0uhIWzRt8coUv2ZialZh09298FE6IjswSMkMdR/nfWGQf8TEGog
	+Hx9RnedVT3sf+nKoV3kUtW64tqSJ1afdXra5NcyAyziR2ccDjRgkDZ99w0EXqSOnDT5mk3jd19
	41cz2+t97pttDBx7jJ1A46l7LEQ+5
X-Received: by 2002:a05:6000:2404:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4abb0f3c218mr51406394f8f.15.1795801789604;
        Fri, 27 Nov 2026 09:49:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/37] gnupg: fix CVE-2026-57062
Date: Fri, 27 Nov 2026 18:49:10 +0100
Message-ID: <10890ac8f9cb22757fcfac5a70c1fbc2dc04f1bc.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251433
Content-Type: text/plain; charset="utf-8"

From: Prasanth R <ragaprasanth@gmail.com>

gpgsm accepts AES-GCM authentication tags shorter than 12 bytes.
Backport the upstream fix, as done for wrynose. It applies to 2.4.9
unchanged.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.9.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
new file mode 100644
index 00000000000..d18b9e9cb3d
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
@@ -0,0 +1,43 @@
+From 09d686f5ca09f1161f1e433473968d15b563687f Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 18 Jun 2026 10:51:34 +0200
+Subject: [PATCH] gpgsm: Require a minimum tag length for GCM decryption.
+
+* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.
+--
+
+Reported-by: Thai Duong <thai@calif.io>
+This is similar to OpenSSL's
+CVE-id: CVE-2026-34182
+
+CVE: CVE-2026-57062
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4c7e68cf3d335328821bdbb70db309a60d0e4fd4]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ sm/decrypt.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/sm/decrypt.c b/sm/decrypt.c
+index c4bc57657..09ed7f8a7 100644
+--- a/sm/decrypt.c
++++ b/sm/decrypt.c
+@@ -1399,7 +1399,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estream_t out_fp)
+                 }
+               if (DBG_CRYPTO)
+                 log_printhex (authtag, authtaglen, "Authtag ...:");
+-              rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
++              if (authtaglen < 12)
++                {
++                  log_info ("authentication tag is too short (%zu octets)\n",
++                            authtaglen);
++                  rc = gpg_error (GPG_ERR_CHECKSUM);
++                }
++              else
++                rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
+               xfree (authtag);
+               if (rc)
+                 log_error ("data is not authentic: %s\n", gpg_strerror (rc));
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.9.bb b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
index c85de6047fe..57f918b75f3 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://CVE-2026-24882-0001.patch \
            file://CVE-2026-24882-0002.patch \
+           file://CVE-2026-57062.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
