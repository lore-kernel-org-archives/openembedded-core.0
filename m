Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5577.1794387801700150934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=mqmzbSc8;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so24479045e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387800; x=1794992600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VY2AH7NobCUBInYkBKPt2hsmwY6SEqyBFiGifHHOGY0=;
        b=mqmzbSc8waScAcx3W8RG8pU1rJVa/6uFB31+Uq72HcE2PTTLszh5r8gW1uYUyskp0n
         VLH95Ci2COpkH1gxLJ0VNi2cGPq2kLgoFR9Zld9BBrifBsmCHDfuMW998SR6XqWgu84t
         C0wyre49VS5rfgBni0mrL/TZEgWdjFxqGLOFStusvHVWVnY0GijTs1N9HI1McTCzzVQa
         farlB1t64UTVYKnuW0fB4C3/Xf/U6AJqSxKP+d2gLO9yBMyU4Dq2AL3fldd7NsAD4j6B
         wJ+Lu6VHMeQavhXP4e7xXCx/GNq3xZbh5Tt32ugLQtpDOEyhRzuY/6o2hug8DKzMKk88
         bOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387800; x=1794992600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VY2AH7NobCUBInYkBKPt2hsmwY6SEqyBFiGifHHOGY0=;
        b=jNK6e5RuKe1TGsNV9PuI5iChUJPDJvJ7Q8zoP3hfveuAbmH5hTRr48BIxvc768dhXb
         n7/xGdr60dV1NvtvkKYNkaJ1F0xh1raHV4M+lEFq3r9vwrp7RSc76QrXZhKykXZcupA7
         UpttLyRlnkaeAVKZTmCIEuv07eW8e+iWlc5VNpmC2UZOM/Se4QRvpZ1VeF2adWyg0fmP
         6EwdLveiZlbVSi4VefFe3GbheOSjGt0xa8h6U5DkutJmwELSUmAje+5gTfeE0hof6ZJ1
         TA1waLW3lZx1CGPmWk4TxeocTkxLBBD8QksjKS8gwjYN76FhQk8Qe6X3XqkfNSElpQEv
         e4zw==
X-Gm-Message-State: APuU4Z+wlKZ2Qy351Imh/Vr0vBbrtdUiJo4je4j1DJbM79qhOFpmZo2e
	oAQ9NkxuCkzJByixVG4qvk3+TiS9y6K6Z6upZVx3sWPAt+dmWR74zdk8Rvyu9LZJmKd24LUCQtK
	AC74ArHk=
X-Gm-Gg: AYBFou0ubwbDnde2HzuZX4m/aWH9WP6kJ18SqMBz9rQMgP+6+W/1SiPO+YfdOd8tCFx
	bGvoRXVRVkT4px9qMO+YoC4tE9VmTIrMtmDzYwHcYLcK84YpdDmccI3f0D0wNYzzkRPtnTeZdl9
	2PGqpvf59s4nKloxUcUayvikUlDIYFhfkTatymHy8S/48mdNU3cWkPtD228PsBJqS7UqsyBoUqK
	zGjhHEiJJCr2TzUBoAeZz2pQ45SCg8kLmDI0WvrCck3PByV9jE/N0upDyjuSXLdoX6GBk55veMO
	rtW8PRsxmZ11pUleKIFjZE3rdZYGq2IReUypRcHNihvHDxj7CSptmGc77Gp31KXABfJTP24HuHB
	orawBaKd9eIaNj/cD1mSyk1cNfNsIg2COjggD9ALMo+twhgj7IcUa6nUccCpaqDfEsnCwjKVBo/
	sitmyPsXBbtyBEcYNAxed+hvWjJbNhyKy4zREC4C3OICsavBsxSvZFbKHmSBDxFS9n3wqW9P+Ox
	9PkZq3sJPqoQqv/QyRi1mgoZejQR8k5PUYxGBn+VfJoWHSwW1qSp3NlhMn1II8kcEEtwH1A6m/m
	7tWIYIQILpRTx7RaPL8YhQxIXZ03+Pu5FZZjdK8IymYBjZhLnd78fqk77OIaUKj7iAe2vImE1OW
	D0WTH0hxfUOTt60lIhAsc3aq+cN1v
X-Received: by 2002:a05:600c:34d5:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba0936ee3bmr30332875e9.13.1794387799859;
        Wed, 11 Nov 2026 01:03:19 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/35] bluez5: Fix ABORT response being discarded
Date: Wed, 11 Nov 2026 10:02:30 +0100
Message-ID: <63f20c186b05bd15eadcfb1f6f4414f5520ed597.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249976
Content-Type: text/plain; charset="utf-8"

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Send the ABORT response after transfer_complete(), since it clears
the pending tx queue and was discarding the response first.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: upstream commit 27b8778e630e ("bluez5: Fix ABORT response being
discarded")]
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index de9835e5a7f..db650acdd03 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -79,6 +79,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
+           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
new file mode 100644
index 00000000000..5c0d7414ee6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
@@ -0,0 +1,44 @@
+From 38a88cc433e0bc3cccb6dab126e484fc06ccd8bb Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Thu, 27 Aug 2026 16:36:51 +0800
+Subject: [PATCH] gobex: Fix ABORT response being discarded
+
+g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
+so the ABORT success response should be enqueued after transfer_complete().
+
+Fixes the following PTS test cases:
+- OPP/SR/OPH/BV-27-I
+- FTP/SR/OTR/BV-02-C
+- PBAP/PSE/PDF/BV-06-I
+- PBAP/PSE/PBF/BV-03-I
+
+Fixes: 7a35c12a6ceb ("gobex: Fix segfault caused by interrupted transfer")
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d094be10ff0cc9d48714d35557e0fd297f36f907]
+Assisted-by: Claude:claude-sonnet-5
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ gobex/gobex-transfer.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gobex/gobex-transfer.c b/gobex/gobex-transfer.c
+index c94d018b2..e4c7c557d 100644
+--- a/gobex/gobex-transfer.c
++++ b/gobex/gobex-transfer.c
+@@ -314,11 +314,12 @@ static void transfer_abort_req(GObex *obex, GObexPacket *req, gpointer user_data
+ 
+ 	err = g_error_new(G_OBEX_ERROR, G_OBEX_ERROR_CANCELLED,
+ 						"Request was aborted");
+-	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
+-	g_obex_send(obex, rsp, NULL);
+ 
+ 	transfer_complete(transfer, err);
+ 	g_error_free(err);
++
++	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
++	g_obex_send(obex, rsp, NULL);
+ }
+ 
+ static guint8 put_get_bytes(struct transfer *transfer, GObexPacket *req)
+-- 
+2.34.1
+
