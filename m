Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2734.1795167907159640906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LywKk1IV;
 spf=pass (domain: mvista.com, ip: 74.125.82.182, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so1020508eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 01:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795167906; x=1795772706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY5YlfXJ7sAVZ27zIvUPc1iaZW7pido0aJu+qVrkaY4=;
        b=LywKk1IVrHJ1s6ld8GUun6wpQuZdrvBlOPvRHhWO60PThq0Sh3hkTxgK0fouCd7Ff6
         McQFei6xmhJDdbxtjhXygw/YSdN2q8WuUqSsNSfPkrv1o7aGuqeOAM8VCdqiveIOa2jM
         HYcqupC3pBnXjjhBrFnnHPR7Iii+96d2yb+60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167906; x=1795772706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY5YlfXJ7sAVZ27zIvUPc1iaZW7pido0aJu+qVrkaY4=;
        b=MzSb8DYVtC80KNt0FIQv8GgKI/4e8lSijxoMP00IorXFhCjVDBXCsoPc2icB9pDiLN
         YeswhLvkrJTuDajHdIdncKyWZgcuEhsXFyB5a5pDnm4Hm0E9rhPE/E8QG9koCPJCYy0o
         Sd1g9fsnYsNH9/oO0ROd5IVSqGnUHQdyEuMXdda7usdSzN+QtJjQFWy4jGj/BbSxy9JG
         F7EsFKU5NDVysedJvSvu169GbXTR3aUpxAbc1l75a9IOh8GISl7GKiohbeNDxaWnDwSS
         xhOEg68PeB8xBTqr3zlJbouD6d/KExvCDlqNVDhEGjgGmTLxk5gWiWUAgN0AvTqNuJNb
         eplQ==
X-Gm-Message-State: APuU4Z+ZGaR5IRcK3uFW6h5m7NiOJDTndziunI7v2sDA25q6toJW4bQS
	mdhoSS02+KuxwWv05je2kMnTkf1fDviVxnkcc1Jix0ORey8j4w70o0l8bp9WRgFuPGrAonN0/9f
	hbmnqNws=
X-Gm-Gg: AZFdTZflpWj9gx+wYztn1Hn7rtF2fTUrE3ZJg3UycIqZ4zWZtEVCQ83AvNnN9KAuXUE
	A4hUUG/wviPBdWKwxS84lP9HCNkP3DkwIEHKhmb81mUvPu2ujoOdPGq57fX0WtSgYh4XGCYeBOJ
	MCnQvMQy7byJq8vWm6EprCFzxkyz7ffHm/LUXrNpK+Z0cdjM1eJmTe0XuTlquvelX2uEoAUPvfB
	d1CPAkfWSrRZzoEDxJeI4eeik1XIwFxrat6mgc1gckqcbXLJG2987rcR0YM1yLWrrBiDsfNFS2W
	cVVXCa1YvN8jgSnaZ6wDoznX4MAXwwcLXdfCivkdeF8KK3PWoqAwMiGl32geZmK75FpnE0Yg9GA
	WmrivVXx3dZ3eZrQcAb5W0H1cFjEYyAwMBU8oifm0Pn5cy9QoHalh4PcFdNbhBrfoTAhUy0sLm4
	c+/uM6iKqh8ng0/yEDRUCUJvZg4XuCR4W0/30AC2xvr29JQITNhyA9GVHpe6q4MTSJgpBSnu89l
	nel/PRh4DhxCTFM3NKQwd49wpUmH05ncc9VYuQmWhml1QBFJeIwmfcuepsZnl64o4kW/6/LwOaP
	y3H/RzKPsirqFk5lwbObuD+WuuCOhmdFd2K7o2zIfptB
X-Received: by 2002:a05:693c:4196:10b0:378:314:402d with SMTP id 5a478bee46e88-3856eb4068fmr2680492eec.14.1795167906329;
        Fri, 20 Nov 2026 01:45:06 -0800 (PST)
Return-Path: <vanusuri@mvista.com>
Received: from MVIN00352.mvista.com ([2401:4900:1f29:ccc7:8a94:96a2:5354:9da1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm11117286eec.3.2026.11.20.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:45:05 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Fri, 20 Nov 2026 15:14:52 +0530
Message-ID: <20261120094452.50074-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250756
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index eb43970199..59cc50dedc 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026e"
+PV = "2026f"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
-SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
+SRC_URI[tzcode.sha256sum] = "5a18da01393679ef2559214dc687563f7f3d05691f6f58b7fbc0166f3e796cd6"
+SRC_URI[tzdata.sha256sum] = "01b4a91cec5167ed48c11e8ab78f2048cead78ce94b0cafcad0ae8c5a3044d3d"
-- 
2.43.0

