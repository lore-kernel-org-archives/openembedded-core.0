Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5575.1794387799287543762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=DOMOYCZ+;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16919425e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387797; x=1794992597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wKTFi3lCzelK901L/mrbsNTWnBpzR39c5v2XnkAI4v8=;
        b=DOMOYCZ+I6iQuFht5sjr5fBSii7iuEnCL4qJ4C9CyNzl3bqtyw7+qVaQoCMsmG1z4/
         1tKl+RM1lbYZbms19t1YPLnUrEc/ExTspCj3fJSzQf8AFzNOv6vImeMc5jAuU0a9oRnD
         jNONp9QqAB6Uuy0yMgpmr2NVMaxm5VyREuHtt1Z8bK9BrLgy4BLAv3ruED7gl/KFrI1h
         t2Ub7OxnXdXPIHpGHmX+R0bM/KveYd1OgNAUuFgQ5ppf4GZIqzfxlxZQs+bbuAxZNPai
         jZH1ftEW2EFi8bwN1eSwSGAICTbDG0RAnI6fpZoWbMzAtFJ6Prr3QlfcrpELVU3/RARc
         MNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387797; x=1794992597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wKTFi3lCzelK901L/mrbsNTWnBpzR39c5v2XnkAI4v8=;
        b=g5Dgbz65mq8/ei0blEMP/Dtz+SPmOJRDi9pCS9FAk3rVn70LkBbi1YLAEn7Q3Gjk0Y
         PTYIn8yJmPlRl3ywinEHSFx+l2iWr36lMvbDDACaczW8wNiKHSyqMOI6BRzNjSPRp3pj
         WgL25A2E7lgFECSmEQxRFM0IS7U7NDwPNKD0ykA0rZH9qqbyYPdXC7zh0OABXxjzOTPU
         1gl7J5EG6awBEC6hu4hQtliC2QjyAl0HNteDtgXYR7Tg2NHZf4Nd+Idr8BUBvn+ovNPt
         R7WfOL1O3Xm//r/GCWLLydQ/O8vCWcvrKWdIcrLbfJGcd2MR4DL8HT6U4S9gB69LCF/O
         3ebA==
X-Gm-Message-State: APuU4Z9PfhdfWPyCbSgRb5UDSCZOn4XfYHF+8yg7gqpitxuAFrq5Xyjz
	j11ctKc8ciVbitY8NR9bw7aze0AIVbmMkrJNvA63AExZ0xyJv4MQp6CD9GeelsOeP9lz+pjEX/K
	W8LhqHjI=
X-Gm-Gg: AYBFou1kKaKpaNiFoKp69IFOHaSS1XqflJvbXHG+eRdWjBTzVkyER+ozNx9Kg82Q4B4
	LVuDMB9t5xeq4FLTzg3OsZ0a/euwQ7HMch4yxDrMBxVqAUDGc1roNT+9LvABzLZzvqqSIIEw6Qa
	B9cWtAb63SBkvmPnaioFmnhkTyR2wRAqIzBQKhtBVmiYACg6EwBjZjc92wVFLVg/e3MzLfYAXi3
	td1eBFwAGf+jPLyChuEX625tR0KIKJk8IhX9P3FSdOM3oTuFJnAdyvu3gMTMtnyuIdHzcZnYe3g
	B5QYXqz3+m5Kpagza3u0lbgzjq4BZl3TJ+93/cVPM+i5teg1Im3d20cn5NHf/lVC/JV4oUbjDZd
	Viyl1lPk+qaT4CLepEPbu6KyMf5OaCqGaFgFqYAn9njhtkOJmpcmUTwFB1lEpK/ITAtl1WQKf0d
	xHRWNMJbRcyJT4X3U+MDjs3FeG9UPfN5MOH60tuSF16ZYkcyxSeFZP16EAXHq2Pab7PfxXLsy4a
	7ZijCdn1jkjreXzywWR81DwoNKMZJ32nz5J2QPH8maNpsbrkeiE58CrSUWgqTcRCQHDOvsMKnSm
	MCMynx6frv34UO9zBJHKAi1LxfpPCfVez13n6HXPEC/dU9DPTbeKFkqK5PrJSoG4MaPouuSRZZG
	Zn8BfBP9HNWwj1dfansuavKvMaz04
X-Received: by 2002:a05:600c:1c25:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ba093a9f02mr33198735e9.25.1794387797442;
        Wed, 11 Nov 2026 01:03:17 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/35] bluez5: Fix error handling for AVDTP_OPEN cmd
Date: Wed, 11 Nov 2026 10:02:27 +0100
Message-ID: <f4371b7d7f3ec327f9e58862be9ee1b15f16c768.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249973
Content-Type: text/plain; charset="utf-8"

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Return BAD_STATE instead of BAD_ACP_SEID when the SEID maps to a
valid local SEP.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d857c23a577..169269d3771 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -76,6 +76,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
+           file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
new file mode 100644
index 00000000000..ba77d1e0469
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
@@ -0,0 +1,48 @@
+From 4e0aba5a8ebd969b68cd3442e9f8066a4b15a366 Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Mon, 8 Jun 2026 13:29:23 +0200
+Subject: [PATCH] avdtp: Fix error handling for AVDTP_OPEN cmd
+
+We have to return BAD_STATE when local SEP is available instead of
+BAD_ACP_SEID.
+
+This fixes: AVDTP/SNK/ACP/SIG/SMG/BI-26-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/7c1c90f7b6d0f653c581878a039e2d02362f33f5]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index b57ba609b..56d27b973 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1777,13 +1777,14 @@ static gboolean avdtp_open_cmd(struct avdtp *session, uint8_t transaction,
+ 		return FALSE;
+ 	}
+ 
+-	stream = find_stream_by_lseid(session, req->acp_seid);
+-	if (!stream) {
++	sep = find_local_sep_by_seid(session, req->acp_seid);
++	if (!sep) {
+ 		err = AVDTP_BAD_ACP_SEID;
+ 		goto failed;
+ 	}
+ 
+-	if (stream->state != AVDTP_STATE_CONFIGURED) {
++	stream = find_stream_by_lsep(session, sep);
++	if (!stream || stream->state != AVDTP_STATE_CONFIGURED) {
+ 		err = AVDTP_BAD_STATE;
+ 		goto failed;
+ 	}
+@@ -1796,7 +1797,6 @@ static gboolean avdtp_open_cmd(struct avdtp *session, uint8_t transaction,
+ 							AVDTP_OPEN, NULL, 0);
+ 	}
+ 
+-	sep = stream->lsep;
+ 	if (sep->ind && sep->ind->open && !session->pending_open) {
+ 		if (!sep->ind->open(session, sep, stream, &err,
+ 					sep->user_data))
+-- 
+2.34.1
+
