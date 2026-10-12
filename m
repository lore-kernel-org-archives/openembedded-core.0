Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9038CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:24:28 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11172.1791804266889452718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X6gy0x65;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so4124473eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791804266; x=1792409066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrG5EMRFXXDtNaEa0xHFrVzcNXR0vwmiN5TqPUq0ilw=;
        b=X6gy0x65C/WeDe5+Ox4Tb7zzwkIVZFGcKu1g/y0N6rlxPuCty0WGLAWvK7rj6KnJ8b
         x9nAkBB1GiklBRsYoOcfZqf00qlcL1jyyioX5MmplAQSfM2B8lO3HYxuvOIIwh7XROXu
         d3lXZwgNNlkfRaG7+QtDIh3gT5KMYz/xSfnBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804266; x=1792409066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrG5EMRFXXDtNaEa0xHFrVzcNXR0vwmiN5TqPUq0ilw=;
        b=WKGA2jxVRLAxH58+oJhHFVppjKz9c+8lNxm2uNQmd8Hbs0sLwTzDtuqQksoO66MIKu
         p7dGYBAmM/n29myGymfZrSUpIHqjQgwC4XYpZOI0WS+HTGwF5dQGVfTPkSzLIlM61d0b
         f970G9wvbzYWC6LMGlaRd2QXurtZjJsTcQpU8X34sHASpChj4GyIZd4KggwkzBWNwvWk
         jiBJqYonnzSlRJN82Z9kqVFJVTSw+MZZ88Q30SqcZ7qlkMtvq6Huia10cJhKB4D8dpFN
         0LX7O9Gi7vS4008bQPEYK0kfbIWOaG/NT8Gj3tE1xthBSSHbNw2N2WxGmjIeD00gfWTA
         Wg0w==
X-Gm-Message-State: AFq9FYJNZxX8ODi4U1UeK4YZE+UHWwt/zqPZ8rEQoUWwd4pGq2Og7WjF
	gTu1jvNPqkA4C3mYfAKUrjRqhzSSd3Zrg0WcnF+RA5gjf+f7jbqgq5IWIY+iWNivZ8NE4u2CXFi
	eG/r3y+M=
X-Gm-Gg: AYBFou2hxI7VLDL2RNeThSQjNkQdo+APaWvI+mGp6NtarDQgohPnX3DXdX+jJ7ouLZm
	e5BZRifLOGEeL859Qa+oEhsIiRgMNgVEQzRA41Hc4PVKjyf+fh5yhaDMrrKdVbU3+qgStmqj8r/
	3GH+/3hBx0tJfT9fAZ1LOhL/aAdIGcDLolpNUDTDNuUzCVU1efHhsW8798gojkVvhFQ2zO02cS9
	Zh6qdV5A3pb030Ey+Bd9P974Cdo2ApqYM75RHVYI41LBY/5ivlLSLdigWdHPkKDHO/C3FS3QvoI
	4dMTVMMfbgO8g7mTfsWZ6jkDO5npcRhnB5obgTvO9/4fKwTHWhlLcchwjZgFYxWOPQkP5AXspAR
	l+0sY4uMmT1mEyZ4fVNORX+Mp93Qo/abyw9PM0KdXoZYWBOVBQPFu3hFcVVL9VN024dUlg5s90G
	BiYAkgR9sBjzyPogRNCTc9ADsQgLa0MIXJRjooKVIpWZPAY3wWU1/PnPBNFE0z5B07AbCSRYcKg
	DyLbeBVqA==
X-Received: by 2002:a05:7301:1:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-35b09bd1510mr2420978eec.2.1791804265813;
        Mon, 12 Oct 2026 04:24:25 -0700 (PDT)
Received: from MVIN00352.mvista.com ([106.200.30.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm18097459eec.4.2026.10.12.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:24:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Mon, 12 Oct 2026 16:54:12 +0530
Message-ID: <20261012112412.1467751-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247638

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 441dc9be99..704d6b603f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
-- 
2.43.0


