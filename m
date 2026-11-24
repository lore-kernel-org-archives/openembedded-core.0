Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31025.1795560752751131600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=nPbd7Mo/;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2673686f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560751; x=1796165551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MxrYKrt5umAdFPsLmC8B5eU4e+Ige+fMcsdWskpfl54=;
        b=nPbd7Mo/wfRwK7cQGJRwuvZe46jm5rSrnhlyF6m7U5I3u10b2kiciaC/01pinRKtRL
         n2501UBgNBDQmXieD8tkNrfTCEmr/utesYzSjXysShp7Orl//RfoFPqHXTUFvl+WNqll
         bjePf5bqKOugPerrVwyx28U6ljXvT+g801X6Wu718zDfVe1+r1F6fSaWRcH2HYv7SPLg
         Le9dllGmsrwVDviVi5usO4ymnSKkQ4KtMt2bgHfd+0WrXOqVzoj8qxGRBItGJuPuxE2Z
         Ruzagpt6bgKoiqpdKHyJDUiFybT/m6peb1Z3b9sn6pdNOKqBsLecWSk+ZIHzkZM7X0y0
         HYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560751; x=1796165551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MxrYKrt5umAdFPsLmC8B5eU4e+Ige+fMcsdWskpfl54=;
        b=LsmCki4vE6AwmJkXeTYlW5LUwlzhItdsDhREbw+aprBRU8jeBb+UGGobMuG/ZK8CYB
         BeVOAbEuoXsP8sAKKCJyWaVppps6w0PWu4LDnQsuB7LRKJVMpAoTPJTAGcqYOlUsEAbm
         MCfrYjNcpmQGLVa5twnCftY5qqEUG3h+qRGcrYX01ulb6IbrWylWTSpf/BCzKvmM5H5W
         MrNewr+GccpaB2SKJGVCvbWnMRR9BVNsDcpjWQc864vaXguZOAJodDskMj9WuFSWtZo2
         ZSvz3VWGCKu5L2hLCBnnk2+yXt7LJ1zjPnhXP2OZmIjI5yDKzsKUbBGoAujbkdZGUoLN
         9C/g==
X-Gm-Message-State: APuU4Z+qdOUdG6lx7sihqGfQNQ6a8Zg2M4WTkp1QwPn2SV5+uhTftmmh
	x3RJ0QCrNEBgnW5d3e6dqrwCuJD/Y4zAnjzWdmIvtroIopDQkR7tE2j4y8JKtszjGYkScSi/XVU
	uNNaXJZ4=
X-Gm-Gg: AZFdTZcU5tWrLM0O+IEimZX76HlOZyScVdVXAqQjxjFYKdb8nzSEX/A4BzF9ORTFdpL
	Qhg9nKxP595Na72qzTGVKPh6rXy/nUdqJytUNmfxW47mzQ/6BkOCQiQ8R//NBtjeG4tfiNccBMB
	VkgkjYTJGV+bzMXMJM+wekTvaOwRuiVkItKNzfzMOrsue/VhgGz6Ssr4J3drGrk4AM4d0BNztBd
	m4yxq791vbQNbXKU010+uuNg0OZe8Gua+ChJzwx3SC7IekgELr+QISpR97aSMGiZtyO5h/jFkvQ
	sJXjWiK/Ex8mT5OL+nh9XryrFiv8Uc8NbXmxjaDLYeOY92H8OxYCrmREYDM8U8SB3DnQ50+ct+n
	roymEvE+R15IA2vY+iIUGDTjWUO/2mTN33tMA2IYP4uwQkNp1QEdVaUGu5rVvRjK9R1WVBtjoEf
	1wJJQPN1PwvksHL9DHDAjBWoWa09KCtG4ltfm8IS06xrXM3HJNoWg6GFsLRX4sjFvqZxdtVlUyO
	aZC6ccVMMCmAVPYYLDGQL3IzvtcfheJbdde706S569b+lwH1paHu9ZTa39sa19BLG3je5SYAXMQ
	fxKqoL1rNo0dDimsA1tttaO5IULzbexFcBg+8Mje/RaFsuvV2PylfwXUdAD2rJJEqLKm+48EVmV
	vddVD4koNhyGYN70IC7JJ6y7TZkwg
X-Received: by 2002:a05:6000:1788:b0:492:3176:3d6f with SMTP id ffacd0b85a97d-4abb400aefcmr30038100f8f.47.1795560750999;
        Tue, 24 Nov 2026 14:52:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:30 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 20/21] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Tue, 24 Nov 2026 23:51:27 +0100
Message-ID: <f9f66669318a33495422da6251dedbb2506b57e7.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251100
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 44872c3637f..d8dd7a3bce4 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
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
