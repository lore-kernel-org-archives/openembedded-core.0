Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4765.1792538577413047787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=ut3h1GFw;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so667225e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538575; x=1793143375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4oKVVORVt0IlZBUsroZsd+SseiUWFv5sj8mPT1SmJ8=;
        b=ut3h1GFw1BBXmWUImG8twt0F5epDpY9GZ9Ob5NjJrCWDkMznF6jVJBSZc/pry0qpX+
         IEBlSGl39tZkFoCV2FngibgrSe+RmUessCpDlG6WeWS8cRA2sBqUSo5O+1dbG0oen65t
         v6b2H++106WEu7WhTCizd8i9TlF5Xjy2zttzHPsI8ctFck1bR32LyXobTRmYiEat5OAE
         rwYkZ5tZCmfkcALla2UcI10DLduPgqpNH+NZZKEmCj0FVx+V5V6TLsCD9TFEvxvm/glK
         zFkY/9wY5QjYceqmhEQFHb3RZGkIOFKQX+9A/J1jaUc+/uUTcuZ34iE+0VzTggdw0fYr
         z/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538575; x=1793143375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y4oKVVORVt0IlZBUsroZsd+SseiUWFv5sj8mPT1SmJ8=;
        b=cfZ4WmeBytQUy96mPDSHoGDe6djK1bNEluJY8B1nzlV12EquNdQum4W1nZRwNo03ze
         EqUkh8SAIOfNb8qLmEbMP1biKq+JKqdVfL+m2x2JoB8PPkLp61Wcc6qlQvm/UaO97okS
         KHZ7Ug0qCvItCeq+lKnNvw3ng7uonY4+pWo0SDQCbEfz3xS6yXUWlHW9yC+pgnFp7R6Q
         zM3sYpWtiHI1LRe21T+anKdrNXMs9yjVM0voPJjN2sLequeBhVyDDdDaUeEb2E1mjyCR
         uUhzzBWxX6xyna3rGU1E9/yjgKEVi9Fo6j32ffLyYZaby0+CzjaguuA8hr0D5ylXVGYa
         Dieg==
X-Gm-Message-State: AFq9FYLsHZXkrlsfxo4Iq7svWgUzbAIEHHu+/YLPkZ3YJtivA1D0GCd5
	iaC3KYb1P/p20Xob9tCelAPCiEXjtkDpDcB8jVgRelk8agLXLQemMM56/ux9yAkphKCwZGilVc2
	VYeUjIJg=
X-Gm-Gg: AYBFou0M/+fjo/+PbC1ygkq8daaIYXD6sOe36NG1KaC2qpqYQmgIxYG1rXwIe6s8nfO
	rhNk5fV600wwEJoElpA/xbAzK6pUEf7ZJq0tKSCjW9f8mPZKWR/6/Rh8Zkr68XFBHZ9ExFsxu8Z
	OpLoJY+107c0Qaixcr8AqQ0+O78nzhuCF1QiGKsdTjbrrCDxZT4NUbfa/dDD0AnxoS3WlgHL1vy
	7qwhDPPVe0a5V9OCA3wf65CoVy4jbrMjJyW9WTtP/8uE9m0HH/YBZBXcxtp4AGZ6XWPVYIObYoe
	MSlGIiWydFiCQY2KwgarsVbrGq+cZB7dSihpmpZZoNfwEnpO0OjFoRKMrkhDC1WbGINm/IBkxBh
	noGlXcYAjWB/Rh5S7QRXxZLoE249Jolm8QWGhbyGY9QVZ1Zy2rGCytZBaL3dkMoSUPZE2iQs6eu
	2tMMuYYjz/hW3PE6VoxhOQmxFblnS/HHtD+UkS2aodgMsU3dMi/ZGkvhS4AIENoSsxcgzYECRqS
	f+sOzgVICXh3qkdMqT1Ny72ioKVrCAzaeunz1iZRp0nopP1StfBMs+DMJ1TvkD5q3JovDaUSqyo
	l4Wkizg3b7/tYq1YP3fbk3ZWiHTO4oIajJ8DZUTfZBL1aG2uysBeBtnQaSE8pPuoKZZRuyKys2b
	N
X-Received: by 2002:a05:600c:b86:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a1fdd2fa6cmr3723605e9.14.1792538575522;
        Tue, 20 Oct 2026 16:22:55 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/25] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Wed, 21 Oct 2026 01:22:17 +0200
Message-ID: <8bc3f14380f03e1c5dbbe6db5c4d001220067d22.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248326
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 6a65f2deb22..eb439701997 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
