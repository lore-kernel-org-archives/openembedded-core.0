Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5236.1793336859846644337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 22:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FbO+rpgu;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso383239c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 22:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336859; x=1793941659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C69V8/KPSUwKAUW+gxLhhDNKu4fPf4+GJhsCqJGU4hw=;
        b=FbO+rpguyJVRFaPPSPom+7QkQ+AIgdYwA1SqIYbKXjE1BG2Odl2ck5s2xkKlZUpcxl
         gUEKFJVy454ZgWo8eY/BDl6hkwVcLZA12PykaVG6qKiso0JO7G5us8Dg4EMAA03eyb/x
         HkIRU+oh9U9/wdbhiJD3aox+85uqe06TpMP8J5zP0BQOsmEynbfzeRfyO9QXyQXkXctM
         EMrtvH5ZGermCiaWCt4XEfNU7T1RwCxr+XkkVsMjvwSUIEw9TsdYTersJchaDgx47BbP
         1PJd18CrO5lWPzp1WqYfLMUsMExBpA3s2CIDmBg6fGAT4w424GgZP8/SnuNCY22oOmQ4
         Gw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336859; x=1793941659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C69V8/KPSUwKAUW+gxLhhDNKu4fPf4+GJhsCqJGU4hw=;
        b=GYdv5RCp5fm6d4usrakZkMp46rmVqb/CVxL7jry4ySajMtNCyScrifnwKAeVidxExk
         hwleM7qvo2hAppv3oKPjz9gkiAAEKCygtBmlk4je42S8Y5FMANEbN+9vD/4MNowWm/84
         XyraL7l2hbxcZSFCNC0SOyhGS8Q6vCwv9XpPBwxIdd4wsKvtoxbQcTnd5aaLs6pD8Ndz
         5FjfessSfaDW1nGu4SynJaoSm0UNK+AMBhsHxhP8t1kKgG/E9c9MezNyi86kggoDdAVq
         1wB+iO/Kks9vQlu/uWT+5cP3uAv2yfrraadYnakATJt+wwLLkciMBaLvgdX3WJ0Y2ykX
         K1Zw==
X-Gm-Message-State: AFq9FYKtZ3SYN/7LnsX3PVJDk1A++sRVYzDc5rKV0YnpHsT3leSztcGg
	cU3DMAzQVb/hIcELCX8rcfdq2V/hCkQkIO4r+GnSfY3JD/xZpZk7ZsIWNd61+tn1
X-Gm-Gg: AYBFou1wpSLwaRsF8gckxvMhfajEhWjoHQdwDFswPxOnvXF7HNoNs/kHnBgYnAat5R4
	eQnh1YxsVXoLdcBXKZRj7EAtQnPQuk4O4I7RGtcC+L8tpKhAl3/7cBFUwI8OTKeapSCGQ5nnwgE
	UZCb6wisrhYxb34yz3xTwH7MVFhK+BJv+9qH9qz0RCA1P8v3LrFX1g2NzMI8r1a5RHPquR5gh/3
	xMoTgX3qXcldtNQTh+YKS0wAyTEzZGjCgocJThmc0ZN6ZUlAUsse04L2rqsx7Ca21nnptBk8ZM9
	thtzL7YZPg8w0zTxMY9d0vlpG0PaG/PTz/0tT5QDPbBeryNrXPhl3ELTNAlU44Ke7gUGYXBMdH2
	A78QO/B8IIvN4smp3dCeUUEvorZXKE2Q9nX3oeP8bEAS0LPrQfNt6P86TjwQ6A4nEZiLoR8wAoo
	yvs254Kqs7eAQY4n7vpwfXnHQ8oRPqtwxd2m3Zpi+ggy2n4KWWhwCU/uY3dqZ/sbr3UDDpST/ds
	exVhvNWN3ihyCTsSlzeXCoZ2F6HvDHHJejR9JUXqgX12Cva4qSd4/1u7EJcRl/4poUfX4BuEyLl
	pjygfjWDBBZuDt34pIGougZnM2enoTesfAGfboE0dx9gSE0RbKnj0x5t/uBmQxBk
X-Received: by 2002:a05:701b:4193:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1ac5da76f61mr1724807c88.31.1793336858933;
        Thu, 29 Oct 2026 22:07:38 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm4115991eec.23.2026.10.29.22.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:07:38 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH] alsa-lib: patch CVE-2026-96674 and CVE-2026-96675
Date: Fri, 30 Oct 2026 14:07:23 +0900
Message-Id: <20261030050723.721054-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248987
Content-Type: text/plain; charset="utf-8"

From: Prasanth R <ragaprasanth@gmail.com>

Backport the two upstream fixes:
- CVE-2026-96674 & CVE-2026-96675

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../alsa/alsa-lib/CVE-2026-96674.patch        | 68 +++++++++++++++++++
 .../alsa/alsa-lib/CVE-2026-96675.patch        | 45 ++++++++++++
 .../alsa/alsa-lib_1.2.16.1.bb                 |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
new file mode 100644
index 0000000000..1060723bf9
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
@@ -0,0 +1,68 @@
+From f8253a68baf9a5f57cdff1cd178920d13e5beb2b Mon Sep 17 00:00:00 2001
+From: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Date: Thu, 1 Oct 2026 00:28:15 +0530
+Subject: [PATCH] topology: fix uint32_t overflow in control decoder size
+ checks
+
+size2 = x->size + x->priv.size was computed in 32-bit arithmetic and could
+wrap on a 64-bit host, bypassing the subsequent bounds check. Pre-check
+for overflow then cast to size_t. Affects tplg_decode_control_mixer,
+tplg_decode_control_enum, and tplg_decode_control_bytes.
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/527
+Signed-off-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+CVE: CVE-2026-96674
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f8253a68baf9a5f57cdff1cd178920d13e5beb2b]
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+---
+ src/topology/ctl.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/topology/ctl.c b/src/topology/ctl.c
+index 322c461c..93a09f1e 100644
+--- a/src/topology/ctl.c
++++ b/src/topology/ctl.c
+@@ -1315,7 +1315,12 @@ next:
+ 	}
+ 	INIT_LIST_HEAD(&heap);
+ 	mc = bin;
+-	size2 = mc->size + mc->priv.size;
++	if (mc->priv.size > size || mc->size > size - mc->priv.size) {
++		snd_error(TOPOLOGY, "mixer: element sizes overflow (%d, priv %d)",
++				    mc->size, mc->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)mc->size + (size_t)mc->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "mixer: wrong element size (%d, priv %d)",
+ 				    mc->size, mc->priv.size);
+@@ -1419,7 +1424,12 @@ next:
+ 	}
+ 	INIT_LIST_HEAD(&heap);
+ 	ec = bin;
+-	size2 = ec->size + ec->priv.size;
++	if (ec->priv.size > size || ec->size > size - ec->priv.size) {
++		snd_error(TOPOLOGY, "enum: element sizes overflow (%d, priv %d)",
++				    ec->size, ec->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)ec->size + (size_t)ec->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "enum: wrong element size (%d, priv %d)",
+ 				    ec->size, ec->priv.size);
+@@ -1510,7 +1520,12 @@ next:
+ 		return -EINVAL;
+ 	}
+ 	bc = bin;
+-	size2 = bc->size + bc->priv.size;
++	if (bc->priv.size > size || bc->size > size - bc->priv.size) {
++		snd_error(TOPOLOGY, "bytes: element sizes overflow (%d, priv %d)",
++				    bc->size, bc->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)bc->size + (size_t)bc->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "bytes: wrong element size (%d, priv %d)",
+ 				    bc->size, bc->priv.size);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch
new file mode 100644
index 0000000000..6cce139324
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch
@@ -0,0 +1,45 @@
+From 81c4a89eb445f8e991ca80ab55b5649530c0aacd Mon Sep 17 00:00:00 2001
+From: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Date: Thu, 1 Oct 2026 00:28:53 +0530
+Subject: [PATCH] pcm: replace multi plugin binding asserts with -EINVAL checks
+
+Sparse binding maps leave sidxs[i] == -1 for gap indices. The previous
+assert() calls caused SIGABRT in debug builds and OOB reads under NDEBUG.
+Return -EINVAL with explicit bounds and sign checks instead.
+
+[ fixed coding style -- tiwai ]
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/527
+Signed-off-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+CVE: CVE-2026-96675
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/81c4a89eb445f8e991ca80ab55b5649530c0aacd]
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+---
+ src/pcm/pcm_multi.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcm/pcm_multi.c b/src/pcm/pcm_multi.c
+index 121c4c20..c7c67e73 100644
+--- a/src/pcm/pcm_multi.c
++++ b/src/pcm/pcm_multi.c
+@@ -1121,8 +1121,16 @@ int snd_pcm_multi_open(snd_pcm_t **pcmp, const char *name,
+ 	}
+ 	for (i = 0; i < channels_count; ++i) {
+ 		snd_pcm_multi_channel_t *bind = &multi->channels[i];
+-		assert(sidxs[i] < (int)slaves_count);
+-		assert(schannels[i] < schannels_count[sidxs[i]]);
++		if (sidxs[i] < 0 || sidxs[i] >= (int)slaves_count) {
++			SNDERR("multi: ch %d invalid slave idx %d",
++			       i, sidxs[i]);
++			return -EINVAL;
++		}
++		if (schannels[i] >= schannels_count[sidxs[i]]) {
++			SNDERR("multi: ch %d channel %d out of range",
++			       i, schannels[i]);
++			return -EINVAL;
++		}
+ 		bind->slave_idx = sidxs[i];
+ 		bind->slave_channel = schannels[i];
+ 		if (sidxs[i] < 0)
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 685f06c726..30a5d3bb57 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://CVE-2026-90781.patch \
+           file://CVE-2026-96674.patch \
+           file://CVE-2026-96675.patch \
            "
 SRC_URI[sha256sum] = "f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e"
 
-- 
2.34.1

