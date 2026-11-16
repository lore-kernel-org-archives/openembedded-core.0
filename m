Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31636.1794845357078760590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WxvWAPEX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7EAB11A169C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C8E86023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9102D11BC0D5C;
	Mon, 16 Nov 2026 17:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5eZCc3AdH/ZoNFBOU9VFpsnJRGE9u1X+WEiihLqjyaY=;
	b=WxvWAPEXrkUQXkVbdNXPK4GPCdofKOkBSK/TcdDe0grnUXxRWfHaQT4IhMU2r41MYlDd+v
	vnbdg9UpPZ82vqQ5VNkS9a0hws1y9ZO2+4+hNcpA9Yv5B6peS0pWGYUsjueRhrOjiYhkeV
	YtbBSXO3+PoxhHBWx6f5vkUbqVPVQeWBkZtCKkEiSc3qIbAs9ElufsrkC3vXylbyHzEcNA
	K5UEUXb8JZP6VX8Mjt4G4tAw0PKL/tDuNOPnZ8wGWE0/WcQLHttq6V8OwTw46vaREFf9N0
	mPzr0LyidUkubAEPBBoAV/Mh6SGcFvuSehALVZf49vM6R3g9WheNPXYC2YumFQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:05 +0100
Subject: [PATCH 07/13] lib/oe/go: detail map_arch() parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-7-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XcEyZAOjR3hj+4RgSZm9l9g6PfrNuh4CPWLUdIOiTgE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqfDymKV3oE7Ht13dAL0xfvhuwSUDjIrZ0CP
 87QdTUrdjGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnwAKCRDRgEFAKaOo
 NosfD/9llY0FJsDu1PvPND2Fn0Ms6rwK2Fs6HSzZq3w+408OTT/s6RB6DqL5xepLbE5VHPjkZbx
 QS2iK3srbRlJos3bTqVVjUiz2CjoySgRz/Xj0owhmG29DRd6JmoCzMe79r/DUtlDVJ97LqyGAk8
 yeX/ePjQrhMY3u+kliuDeJjJcQn86Awrp2CizvW8GXY6CP/U37PHxISsRo6wD9rpqYlsIMag8rr
 i5pvKWAV0lfCFDQcInafy/0s384NsHKT3u0k9mE2iY/BPbHIX0d6PSDhTvtWJeSp7OSKm9K1kru
 f9hG9ZOQsZnhZElqnnAG+6rRlSmCyyh8epEeQqm2s4RQpRTC3FViZn2eL+VAGM7eE0vBw+OQGUo
 gXbBLl5bfsVoKoSSIxkRW0T22VMFq6+KNGH9dK09Wmu/hF+dPRJ+n5dgxcAVajE1XhtRZvLSCWY
 ihVvPm/TCJYwT3xaIOwOMqbQeHS1lFXB9P8wmq8Zt0eX+71cJR5Sk/1hvA4nqTY4lac9cGvXxoN
 vT2OnQBD2fjaJikOoOsOoj5FHhekRENohfiOBbWEwLb2tHc3fOlXUv9TGH64R4o6IVVOxvVlT00
 GxreIOEdBqDcf287kvJR58meCW0++QtAhQMZgEEHmGZcfRDhXjPNrDxlHj2mbHpXGpabJWlUpXh
 dpBDBv7s6b+30yA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250357

Detail the architecture parameter for map_arch(), which should match
TUNE_ARCH.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/go.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index cbcf80f0b1..2a2cb7e75a 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -8,8 +8,11 @@ import re
 
 def map_arch(a):
     """
-    Map our architecture names to Go's GOARCH names.
-    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
+    Take ``a``, the architecture name used in OpenEmbedded (see the
+    :term:`TUNE_ARCH` variable), and return a string for the mapped architecture
+    name from Go's ``GOARCH`` names (see
+    https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go
+    for the complete list).
     """
     if re.match('i.86', a):
         return '386'

-- 
2.56.0

