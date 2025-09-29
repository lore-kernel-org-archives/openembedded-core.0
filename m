Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E0CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 04:34:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.46499.1759120439824772220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 21:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nBqmK25C;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e504975dbso5140265e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759120438; x=1759725238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bA8F6+mc+T5QdNUcZqCT6MbBxjkMF3hX5XFIhYiwhKg=;
        b=nBqmK25CZk+sYF7rCigEXysD5JpQYkxFe0d4nNEXM/6lmxtGT1YayedBvyyM0lI6cV
         DJLvHCmEbXzejzWndKOqN5KkmcZoLUNiquafWUWeAtdYBEEEvoR713nQoojBTkC7OlV0
         QK7BGNghKcnoXfVB/dprTSAFwyZnxeS/twSKSdnAGMJ5VJYxq619ZPKuW3TbO13aLSWZ
         YkGdfoNYYfjrOEy5HP6n8e1VQ7RyHMEDK/x0dC03Ng+DIsQWs2VioRVsjnM3eMhfcSH7
         VRpWPP2CwGxv/2PIpYPMEw4Ut7dbZmTsPvtnWyaVXANcQzfgXsxNMB0Nx77rmGF20BfL
         PlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759120438; x=1759725238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA8F6+mc+T5QdNUcZqCT6MbBxjkMF3hX5XFIhYiwhKg=;
        b=dBrUiflp+VFdKegxHOEIsIho/+AEza95FDmlaa8jwkhA3RfFdM3eS0XcTk40cRi3ui
         Q+VWltBjq37k5IA3+IDVluG2CCB4fh0ArwepkM+TAKipF8VVPgGQEQWfJhkiUGpgvffz
         lfDjeWMknUjYp8rdnHordMe/FF8tvO1XuayQjXCLoM21PH5YV57UwTysSLLGsd8JRgT2
         /2CUseO8WZlopJS/BbTd1T+NDpyR69bSXR0TnppWnUw7bFQ7ESfF/QOB3S8TjUIZv6dV
         917EskKF67zagGScCjTRwEv5cobrWBkJRV9J8kl5aNehjI058TXY246e0MpFTrY+aQiD
         UjKQ==
X-Gm-Message-State: AOJu0YwIrygWi4ncirzGTy3L/sbw3Y0/+KAizK79/1huVJyNnwdDLRzn
	aN4PEBCI0lsD1cd61sOEOd1pW2bR4Vie2YpNHPVL8ZZG+Dq4JxnjIPweS8owBQ==
X-Gm-Gg: ASbGnctt1eKYmoBZK+NxH7d80ca5y3aomHE7lwGzz2JQS6DCcJpmhNHMSfFvQ5+4Reg
	BKMQkY8LNqZ3SD0kzRIxLhFq2ClvKoxwqxEx8C3MFv2VCzyMwCXuUtq5IAkcRV0bsTCjf8Kh0/R
	1nRhXhGn7Oj+jFmuez/8zZehAE0QyhanKm+ykyiEnvwSFdxUm2WlBNA4UProwpSz+EiDw5RDM/n
	woizxyzbNwj0VeRirVnAI3t/xV3eGQQNnDpuV6+8im1ivK14nXiVNPQgLXLQdJLh1nfaPyEgsZ0
	PF7zwz4CSSNytDVOe3czsFysIbHq1QnmDGyiRB2Lx7sYfpPpAd3xmVEPA4eVm/ip6QtQ+1Jq+xz
	y6iTVdNCF24K2HtSLi6mUuBVPHcx9Hyq4w5lBOMYWk5+RgSw=
X-Google-Smtp-Source: AGHT+IEDlxT4ebzoiCphv1mcwBuiCA5nss4AL7VWap5LtaBCodSmOgWUQD0+CIxIIfLwdq1KDaULAw==
X-Received: by 2002:a05:600c:358f:b0:46e:43ee:3809 with SMTP id 5b1f17b1804b1-46e43ee3ac6mr75676815e9.7.1759120437693;
        Sun, 28 Sep 2025 21:33:57 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9af27dsm213472565e9.8.2025.09.28.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 21:33:57 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: fix Bluetooth LE audio regression
Date: Mon, 29 Sep 2025 04:33:52 +0000
Message-ID: <20250929043352.723306-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 04:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224113

Backport a fix for a regression introduced in 5.84 which breaks Bluetooth LE audio

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...-fix-pac_config_cb-error-code-return.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 24a41f92df..aac38a54a9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -64,6 +64,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           file://0001-media-fix-pac_config_cb-error-code-return.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
new file mode 100644
index 0000000000..a67fd07137
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
@@ -0,0 +1,29 @@
+From d7966dbb7bcf39f9615c906c47ef7ad895796756 Mon Sep 17 00:00:00 2001
+From: Pauli Virtanen <pav@iki.fi>
+Date: Thu, 18 Sep 2025 20:19:35 +0300
+Subject: [PATCH] media: fix pac_config_cb() error code return
+
+Fixes: a887b1a1b91f ("audio: Add support for specific error codes for A2DP configuration")
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/6b0a08776ae44a9102d7c6875a77e83dc6a11a37]
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ profiles/audio/media.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/profiles/audio/media.c b/profiles/audio/media.c
+index 332f643bb..deb321e6c 100644
+--- a/profiles/audio/media.c
++++ b/profiles/audio/media.c
+@@ -1110,7 +1110,7 @@ static void pac_config_cb(struct media_endpoint *endpoint, void *ret, int size,
+ 	if (!transport)
+ 		return;
+ 
+-	data->cb(data->stream, error_code == 0 ? 0 : -EINVAL);
++	data->cb(data->stream, (error_code && *error_code == 0) ? 0 : -EINVAL);
+ }
+ 
+ static struct media_transport *pac_ucast_config(struct bt_bap_stream *stream,
+-- 
+2.43.0
+
-- 
2.43.0


