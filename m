Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30998.1795560775921376695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=VwCHjyEY;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb606491faso27816635e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560774; x=1796165574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RgGoxuCmiTeGiu3qW5aB2fKNU7VicF7cYF1wHPw+uhU=;
        b=VwCHjyEYxxyr7fcpd2o1WgMGAk/DukAcPQj0r7ZvsZpvP+uHgSmA3uJDXA+pJcdBPd
         cnizdfM1zhrCwfDQi8EaOfBO5vNBNjulAqffOIhXiyP+Dq7pqcsrtbiGJxcwm1IXAS+X
         LbPsdhBAmfSmJncRyePEc5lYZQvgBI54UTvrc/foKYDGADtP55NNmcVKdDy1KJNHy1gN
         zCnYfdcFiSqkqREzENtb40Win1yLKrBHNbauBau4hFsYP6kQYYwD4gFL6i+8193b8/sE
         DUKE04zrKyFHZT349oNF1KG7ib0S/PIGbKawl5164hLwHtGdIGj1/EGRwql8VyyS1fZP
         /pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560774; x=1796165574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RgGoxuCmiTeGiu3qW5aB2fKNU7VicF7cYF1wHPw+uhU=;
        b=y2Tkpxhp/x/s7xHTX3SU+jH2p1gAIqNp+JrKG0ZIXuo0nqj4+xhSSzsmDnXe+Ter3C
         QojTWziJcVq3dlXpv0Xt40tR7jDNlr8ReoUpZ+j7DoeCOufBcKlZaAO4bmXW0j3epBJ1
         3bdy/q9XGKG4t+aNU05KfqmOJotDaNnMHQ69TfBTSkEKUJh9c1QNfW1oHwPbAyLQ3/pW
         8uAlS8qQyn+3t7+72JpClDCrlBAxENba56jzBALr24HSdhqSqOgjzheIkHvyryvRmykC
         MA5HGXsClrfupYzmfyG2iKV/2LnZwGzGOqzByc6dvaY6nDv7BNKUhcq2u98RqluTeI2A
         shww==
X-Gm-Message-State: APuU4Z8Afzg6lPsue3PJlSvyXB/BJWsEEqqIf1ZiWYaNhBj2+HvKnGWA
	wqNm8bHrFUGcDucctZLNgYcqUl5xqsuIpoxPbhiGyimkxwU07/NY8syZhL/Q0kFCxB+5dDnbruM
	IkDYVxR4=
X-Gm-Gg: AZFdTZdMQfIo9PaYolKa+BFPgLVXbEjI0srLEfxb7Gw10Uk5ARZ9BYmMxnrv6ili/tS
	ZxpYUT4lcd5KiEgUInhmDCDkrpFucnYqGA+QOmyyhWBFEuSjp4eLTFG5Xk5oOCliS0dOxHzK6ww
	JKwtyGehlCb/GJpLU6/lC3YexSU0UY4ZhfGsYVxkZiE2ryAdJ70/37zB4ZqRLJS51DFnY3ZxtV1
	HA9K3wqw73f5u0y3SCHV1MRFdM43W56jj3h3P9ly+nySpwyHMy7tLtQr0yb/zunguG1F+iSzzuW
	adI+3dvP01sqmdJ5kDPeQE+RJo2RZaxNmO6Gfx20l/MvkxjMBq5tPS/h7cVn3D4q+SmYFT7VZe/
	KyTiDmgAcSqUci4tRG36I2WO201Psl4JIm9e8wb8VKpfiysLKZLxkgKnMsc+VHDIlWS9akqL3K8
	h7B/k1ughzMdHxVVa/jRBQLi4rn/laYLfKObVkVkLJZIHqqDs3/pDCPJuIPfw5ACCyFxZgz1f7H
	AmTaG9HeY4jLy/kmC8HiNzTtu8Ip/Kqj9VGhdsuKzI2bon2YDWGfTAwJ+C7WVRqnKA6ir59KBmr
	IsMZ7z4qiGDQKn4EF41OUHKRJVpyASkuI3+jw6dcEGyE4gUrl4jUpnCGiDFUCS/uw/MQbuAsV8z
	Bjv4N2ME94dcb4BKNjHKQ0dCcgH4C
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr331623895e9.22.1795560774201;
        Tue, 24 Nov 2026 14:52:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/21] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Tue, 24 Nov 2026 23:52:37 +0100
Message-ID: <49fb90798d707358ee9fe1308c37f4f3af58bb26.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251122
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index eb439701997..59cc50dedc6 100644
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
