Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2097.1794939644264425076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oenbm9cX;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so3496f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939642; x=1795544442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jT7JiUgnys1LpVghCFuaZq/QCy60QY6sAFk8F4wDZOA=;
        b=oenbm9cXMsYJgu5K8YsEmTSzmVT3ylVi9LlGxnEtzKD5MMp7/Lg6KiCRbmVSwJvmUv
         wEeksUFZkDRQsg31pMXkismzij8u16UedhSCdVlLqGj6klV7v+M5A6AEbUOqbMWQda2J
         zKKYWbQ2q3YqkLI4nuLt7fEhWRV9270RKQuWuNkokn0VMcEzV+RoVKp/Q4LlTm2DpLJ+
         CXFCu52vVUJJUC5+bnuGZX0myJCYk+d9/rVZ6ZNMQoGI+kAxsGgCrjUyQh4OfPCU2RoW
         CAvHtRg02PJBm/GCIHJhuEPVRhYrbX3tfj4KDLNL+YwnyapjZEMJs9JUzNy8/TfO7eVz
         Etpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939642; x=1795544442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jT7JiUgnys1LpVghCFuaZq/QCy60QY6sAFk8F4wDZOA=;
        b=yPkp/kY5SDRa2Jdmf5hCqlwuUy4gBh1BX4hvxFu2iQc8ybkBBFi175O4ihbQEMUMhX
         VI8chQA2KnzSTeDOhr7vq+AYKLfWSO9DUERgRY99mqDMKhaDydvHyGb+biCPU2E0EIJw
         Dnyj08MIR84mpxKLB/GOdvvFD2Ytx/PwilHmaxSkBp6O6LO3Wmb9pDjrfb6MoCgaezEr
         0z3CiNGB4dKmntLvG93VloMJgVKPFeMC0YL//zUwoQT/GSKLYh1+dTVwWPscKHInfFRb
         hSI1Mt4QJ9gZQy+dvpEkbRZi5i0Sky/qD/+6Bd0Ng4XtKV39Vqi2Xj4zxR2pvgLMB6Q+
         4BoQ==
X-Gm-Message-State: APuU4Z+TAVDVDLXusmM10jUhxiQmv24vTTFYS4fgM8SIrZb1hDuvVJZL
	l2MBNhxQ8pdqU9DFhrsxrl1DsalJhluKq87bXa5ZN7deAgikirRVn4NcJpRWZ523ewYP6EDYiy/
	GAITSaPk=
X-Gm-Gg: AZFdTZcpBmakCUDbzk2J5MBiu3L8IJvi0HND6/Xms2wVGFEoJghMl2YWqgF/PD3LYpw
	eW76OksOQGIq02AX+gFCAX7ReW0mFqRQwMXBvlutEnyxO5YggMP/qHQg57nVy4s97YppiYL+0u+
	bk2cCXxV4YoJT/ICRCN2kXfJDWI8W8ciMNiT9tc9bDxg6REyPsLtMtqdDVzdHu6dDXniVzwKu5P
	ecGW3gc43AIvo0b42+8x284mJTSR2OWjb8kYdMBumq2M3Xt+jbctGSUnN3p7sqO41dSt5xGPpgc
	xHpFPY0yuzRIhdhv/1SH21RcMlqF3PNDhRrA5GeUaYxlso3raqqy+M8XI/RU87WbKQtGmdrpuBf
	eucd0Md96DcRAvdqdMSG5fAJp+ft11AxW8f4bN8qrhohTo4qpnOmX4JGv3msWD3yEkxFV2g+Sre
	aJHbxcjnEZOv/DR86SQFgoCdIDgO8i4801hQSmkhTWZiVqqk8BkKRZI+hqUCzMZeKG+tVyyQfDx
	/TI6wFYZSuP31R3Q+kPJG5c4GsFg50qu8b4WvTXva7dbEUF8T30j8JM01sPC9/5pN1SqKmlW4yg
	gS7B2ayYPOetPBtoXZ7MqjzDAi4BuZ2kc9akOI9bIIxLxKRbdNNO196IkHdsvUIBEuL1haQQ0NY
	kmiLiT+hkwLm4S2wC5lST9XJUWk4X
X-Received: by 2002:a5d:6f03:0:b0:491:632f:2c8f with SMTP id ffacd0b85a97d-4a36c30c6d1mr8096538f8f.2.1794939642483;
        Tue, 17 Nov 2026 10:20:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/17] bluez5: Abort continuing response on fragmented CT replies
Date: Tue, 17 Nov 2026 19:20:14 +0100
Message-ID: <372694226d700cc616965e7c1c14f7c1e78e7847.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250481
Content-Type: text/plain; charset="utf-8"

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Send AbortContinuingResponse when a Get Element Attributes reply
arrives fragmented, as the CT side does not reassemble fragments.

Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
response on fragmented CT replies") to bluez 5.86.

Fixes PTS test AVRCP/CT/RCR/BV-03-C.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...inuing-response-on-fragmented-CT-rep.patch | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 0783a5c28dc..7583b34fa6c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -83,6 +83,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            file://CVE-2026-19774_p1.patch \
            file://CVE-2026-19774_p2.patch \
+           file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
new file mode 100644
index 00000000000..68f824deefd
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
@@ -0,0 +1,62 @@
+From 41a00c93baa48cbd63b182b853e93a946962cada Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:26:56 +0200
+Subject: [PATCH] avrcp: Abort continuing response on fragmented CT replies
+
+Send AbortContinuingResponse when a Get Element Attributes reply
+arrives fragmented, as the CT side does not reassemble fragments.
+
+Fixes PTS test AVRCP/CT/RCR/BV-03-C
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/249e2bedfacf51fc6c89f43a0adb9a12d761c2b7]
+Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
+---
+ profiles/audio/avrcp.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 326dfda..557ed97 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -2466,6 +2466,24 @@ static void avrcp_parse_attribute_list(struct avrcp_player *player,
+ 	}
+ }
+ 
++static void avrcp_abort_continuing(struct avrcp *session, uint8_t pdu_id)
++{
++	uint8_t buf[AVRCP_HEADER_LENGTH + 1];
++	struct avrcp_header *pdu = (void *) buf;
++
++	memset(buf, 0, sizeof(buf));
++
++	set_company_id(pdu->company_id, IEEEID_BTSIG);
++	pdu->pdu_id = AVRCP_ABORT_CONTINUING;
++	pdu->packet_type = AVRCP_PACKET_TYPE_SINGLE;
++	pdu->params_len = cpu_to_be16(1);
++	pdu->params[0] = pdu_id;
++
++	avctp_send_vendordep_req(session->conn, AVC_CTYPE_CONTROL,
++					AVC_SUBUNIT_PANEL, buf, sizeof(buf),
++					NULL, session);
++}
++
+ static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
+ 						uint8_t code, uint8_t subunit,
+ 						uint8_t transaction,
+@@ -2483,6 +2501,13 @@ static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
+ 	if (code == AVC_CTYPE_REJECTED)
+ 		return FALSE;
+ 
++	/* Abort fragmented responses as reassembly is not supported */
++	if (pdu->packet_type == AVRCP_PACKET_TYPE_START ||
++			pdu->packet_type == AVRCP_PACKET_TYPE_CONTINUING) {
++		avrcp_abort_continuing(session, AVRCP_GET_ELEMENT_ATTRIBUTES);
++		return FALSE;
++	}
++
+ 	count = pdu->params[0];
+ 
+ 	if (be16_to_cpu(pdu->params_len) - 1 < count * 8) {
+-- 
+2.34.1
+
