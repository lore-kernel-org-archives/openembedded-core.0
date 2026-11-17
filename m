Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12546.1794899207561907073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OAP5XBQv;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3be948e60so26301a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 23:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899207; x=1795504007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqXDqkG4996qxKiBBDxVTKnYoR3jkdyyLU1mfJGbCSU=;
        b=OAP5XBQveQXg3H0/XgMRx1OUhAElxgswVOvdA1c00atafTCXw7aNwBlnDQFIXHGSfA
         gICdY5YI3IYpwisgnNZNNafCTLXPsD30B0RN3iV1XzOfUVD+13BhE2v7zmRWw9F8ODlE
         oVdVPapDX0p51Lbs8a5GuXw84id6ikGZyFMNYLjzeQVFFQ9CTXKdBIAvIP6GDPirEm7Q
         +zmH1lqknKQjxYVX3C6sVrImHsm4QRwDKcNWlU9KHhrdYkY5Wv8egyRpusklEqEblmTV
         eWkM/nGvqQj6MvQ29VZqDfFmE9kvDH2ZOjjv5jcVgGwA3+fhJBX+a0Q1sNTZD0cuHdZm
         YLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899207; x=1795504007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqXDqkG4996qxKiBBDxVTKnYoR3jkdyyLU1mfJGbCSU=;
        b=Te20GhpXKZbv1iNHuSO5XHCbtxdK8aplxV56LS0p6/bJ2qicu+o7qcqLKctaE+qp7n
         PijFT9IquRN3/LyVeNBab4qv2IBp3mhvZ/vfX6FCn1YvsMKwkRIOnlZkiIy3nR9f+BGw
         ZJfXI+AiatOAJ0lcQ2i6UmutdhVONHzkbZp5w0zIGmuEhcGwMNLOxbONnO8ouT1sAJ+E
         4lLCDw/6VUScJ3YM6McPIGje6VKezhRA3ZjtYu830/s23jHs9e3VKoRuY54cvPYOXec5
         ui5c3uuqdR9dI6O2K3+YL2aIF6WrRT5CMK7E+iUNFgE5+eoYVVPWY03kTv+ErrkxZuFY
         +PYQ==
X-Gm-Message-State: APuU4Z9ZeaezyE+g/skVjLDJ4WCwEdW2X4GXstYFNrDz9zecAS3RDNKC
	jfnz4XPZzX+b0RWQvfw0Fy7X/y893h3eGML38I0a3KHMsIEQGFROi8It01vwaItW
X-Gm-Gg: AZFdTZfcKrn5bD7QOARK/iNTRATmzFKhigSX0NXXWYK5VQHl4ilfsZQ2Fzy/qhDvcs9
	l8acVm6RUjYzjTDsLZHS/CW8YV9jDL3I0f+PdyilIQKTnUqJajuz2oUrymRUTniL+OYa8nf7L6J
	Zjil29Ss+2UIUXyUb73OByQw+tufG0HIM5AapBCP1lgam03BNQ7tujEPDmjE8WEJrYnhxy58h7K
	yPVZt+CsiSOzdYwW/2Mpczb5qdiYG1A1NNIxfe0wkVq4l8Uyy06dgQigEMeA+xW3HLm5Qv5IEUH
	5ZYdYz05H1M8dZYVHkU7LbwG8JcZ+dEnt5WZLuIn4KBfn2//gtxKi1qbqouZNaJQIPECg3XVydy
	wlEfdZLIftnuTvxekBOSIbqbw8r4jujXfgL8dNj+tFWA9tMfBY2hsW38RLeCjWft7bhcsjPobg6
	B2z5yYYFTLxzg8HkJssiHJHK9BzASJEwEbk08xO8+TaURhHGebASy5pbYdzSLPrGPyX4sx/pa94
	YzVI2NXI3HIj4vmHbLfbavTZyMOpSbtxqxeeI4iKtvbkvnX1ihU4OhjeJriRpO9CiCDjDqT2Mpl
	WOukIypZKegyBoLjX0/EH0X9Xw62PxCOjIs/IxzeYEDLHaTpFcW1zipJumOTh9sQZQ==
X-Received: by 2002:a17:90b:584b:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b1b0ccee09mr11744964a91.66.1794899206713;
        Mon, 16 Nov 2026 23:06:46 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm2595929a91.12.2026.11.16.23.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:06:46 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [scarthgap][PATCH 1/2] gnupg: fix CVE-2026-57062
Date: Tue, 17 Nov 2026 16:06:24 +0900
Message-Id: <20261117070625.3040397-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250407
Content-Type: text/plain; charset="utf-8"

gpgsm accepts AES-GCM authentication tags shorter than 12 bytes.
Backport the upstream fix, as done for wrynose. It applies to 2.4.9
unchanged.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.9.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
new file mode 100644
index 0000000000..d18b9e9cb3
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
index c85de6047f..57f918b75f 100644
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
-- 
2.34.1

