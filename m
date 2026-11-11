Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5576.1794387800824788645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=go0nbdCx;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20263145e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387799; x=1794992599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t4AG7tLCFYlsk+ohqMOF6q1Hg9DeonWK5fRlFIIfyJg=;
        b=go0nbdCxISvNkWNIAD1vM9daqzKYoBf3i+InXfyy+5OwSiQuMV0VUj8eLR0qYzm8k5
         pW6pUymIqpL11d2mSNQyjKtzsfYaPRd4ddLqtIWCSuI4EC2VNw446D/XyfuQ4uqyDYhW
         uVoVzDTe2iqh8SbjCwiSMgdLJICnKZrdg0KrqcXFX2NK9Xkq4cMcmT9BcoxwDigfLS+W
         n53gXXMpUlkSIUGkRRVIlfAsjJPZGstwXnNNYsW+kfZECPWsKiTM+p8jgM6ShgqIl/x3
         IhNiH27AX9xwWHAqPTEFlc8GMtwGWyxLpFCKKrquEmJtnPIqfMTQRkPXNH4XrrwdabsL
         AAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387799; x=1794992599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t4AG7tLCFYlsk+ohqMOF6q1Hg9DeonWK5fRlFIIfyJg=;
        b=Yh5VjdETYCee4zdJ4w9rc+esCLRtgWBPHXXbmyPDEHOZcI8V3jtJTuAPigmBwYQhL8
         NK/tfWpB9ZEo1FNnZOdWLorPS+twWnngJN63mUGmezuMR7JBE+CTYCVVk5b9A6+wW6pw
         L6ozGwP7mStR59EjlbC/P0Y4bATp6jwt18Lb7IuykkD35nv1MIMhgtzSFOLP+x/cudut
         cfc/0NqK//eGWun/jmv+/KhZrIZ4JZlwqfIz+cCFNeobzBWaG/0B5V0JfgncDR2iZiY9
         q+JGlW3/zZXweTFiBDKcVM0hKz51MzHB21Z8WYuEbp95Izs6d09bV3b4LaVJwMg6KjPS
         KVow==
X-Gm-Message-State: APuU4Z/se6D6HQTVgXeEnGUbNUtNJcGjwzGqoidu23zEYRP9u7OTIL2f
	SK407KEp/NUCXi01Qwvw6BGT+Hx+AG05vntMwpZe3nmboR4Ast6oECsFZkHE4BEenq2z9dBkLlm
	TGTIdPzY=
X-Gm-Gg: AYBFou3G8Z0HSZODQQ8Qq/7lEzmUu7ADlZxCno91cArHsYAon8MVbtwFPU6vEmfx/iF
	qjtAhUQt4HC5ZIke/jfMmJAzUJIwfAoxUGlhnSUataS8Lk0D7wjpYJ4eq5dO0cQj8Wm1Pekvwsh
	kC272NipL1ml8xk3RAVO/hMIvubrBy/xC2jpHq3xjsZsksrkZl1GR7RZFK9qE38bDS4qnmFA0gM
	Rbn6Nm/SNeq6rZvRNkq/TdMgsISrF+leTuCO/O+JFOaqd3xhoHewrHdHRA/NU2IHYTqQqQ7czO6
	Bjko7VAtNfufk6g5VJ5dWwxBOTcYToJABEZpPqr/wnQv//AIyC5iYUBuNXCeQrhue3zX4SZk2y9
	XP8o94Ae6q0SzQMQyK3uEuXu6KzMOO6dzZEGHWkIX3yID6y/HghPyBG/svb5s6f9j0d2daccXPZ
	VvBPoZUedBqJSrw0geJXq+Ihxij+AqtUiPjNqBQejnztfyI3JSqA7DTXCC+JXbn4ReXeU8F4OlN
	x0Uu6l7GSgj8yxN/fZjYtwEE0y4L+810MVNkNNDlNKMwS6aDPRNt8Y66XqP8D3yHFGOAy6jx0zW
	TA+L7ImZ4D3GOHxEM+Lz19kkak8B3758IlqXRB36leVTfiKgCybkin5hv8PE+E0jAE5wVujVTB1
	nExVUuOIVmTq52yW6QrcMN0AWnBJvge9LgwyKiCiGMtBXClFxcg==
X-Received: by 2002:a05:600d:82e5:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ba0939c32dmr33775165e9.27.1794387799091;
        Wed, 11 Nov 2026 01:03:19 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/35] bluez5: Return correct error when SEP is inuse
Date: Wed, 11 Nov 2026 10:02:29 +0100
Message-ID: <5b7dca5eeee9b7acfddd87609e6b80acef541132.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249975
Content-Type: text/plain; charset="utf-8"

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Reject AVDTP_SET_CONFIGURATION with SEP_IN_USE when the SEID is
already bound to an active stream.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...turn-correct-error-when-SEP-is-inuse.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7e05bda4f13..de9835e5a7f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -78,6 +78,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
+           file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
new file mode 100644
index 00000000000..583e2c2e230
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
@@ -0,0 +1,32 @@
+From f1bbe63447bcc69beb546bc1e26a4e99c529d70e Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:30:13 +0200
+Subject: [PATCH] avdtp: Return correct error when SEP is inuse
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BI-08-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/39ad431de60b896a03904887a0f1d0285b719edd]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 7cfc9a80d..b57ba609b 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1556,6 +1556,12 @@ static gboolean avdtp_setconf_cmd(struct avdtp *session, uint8_t transaction,
+ 		goto failed;
+ 	}
+ 
++	/* check if SEID is in use */
++	if (find_stream_by_lsep(session, sep)) {
++		err = AVDTP_SEP_IN_USE;
++		goto failed;
++	}
++
+ 	switch (sep->info.type) {
+ 	case AVDTP_SEP_TYPE_SOURCE:
+ 		service = btd_device_get_service(session->device,
+-- 
+2.34.1
+
