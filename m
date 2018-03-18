Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0B0D788CD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 13:35:35 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l25so15464467qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 06:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ClLtNu7XQ3Hhvw7pnfRwORZYo6WISc3D82XYNGCnU+M=;
	b=LO7b636zhreAs7JDwWNjaZKIrzuYnGuMpEdwqosZwMZMWuR/9IjiFhit9O3BgVcFoA
	v/EquacpN2hR4pFSu2WyeLzTV2D271LdfVRJMahF+CTzmITOCynhFHOT+84J2xo/MMr8
	7O2TJz8WFIz4+ZlBlSsUzsjjlb0cwDYzUv0pGDhNjMx0bZbqIfxMrMKFAIBNNi7/tXa0
	HzKWPmbwbLYZg3gdMQWCsdAvoTVdCmnKu6EoJZdsBLP7xUa9JoWniXboeEPmcz+Nqjsf
	peXAR4eQxqR8+mtLLRMJBpFI+Eywz2KfUogazUGsKM2lKNoZKKnbCt+uD4Q+MqpvMytF
	pv/g==
X-Gm-Message-State: AElRT7HW5ERnnGG2yi7knA0IGZkKjnUiqaaHeaXZrJlV1cglHqDS9tP6
	ODzxvmzln5kDPECpd3ZREo8xNSz/
X-Google-Smtp-Source: AG47ELvSSvCTc2R5jD/k3zXUSpNMd8IyxFJJ3IDup8JjRUJ4GfZ8SIdJRSefEKPKvHvL0VrpUaiSjg==
X-Received: by 10.200.11.204 with SMTP id p12mr13251183qti.89.1521380136288;
	Sun, 18 Mar 2018 06:35:36 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r22sm8816450qkr.96.2018.03.18.06.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 06:35:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Mar 2018 09:35:20 -0400
Message-Id: <1521380120-11049-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pygobject: update to 3.28.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Mar 2018 13:35:35 -0000

Update to the latest stable release

Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pygobject_3.26.1.bb => python3-pygobject_3.28.1.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.26.1.bb => python3-pygobject_3.28.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
index 91f2d53..ad0117a 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
@@ -12,12 +12,11 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "d898fc768ebec7a9ed4e4270c6fabfde"
-SRC_URI[sha256sum] = "f5577b9b9c70cabb9a60d81b855d488b767c66f867432e7fb64aa7269b04d1a9"
+SRC_URI[md5sum] = "612e9e2863d117d810e78672f7bc3ad6"
+SRC_URI[sha256sum] = "42312b4a5015571fa0a4f2d201005da46b71c251ea2625bc95702d071c4ff895"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
 # python3-pycairo is checked on configuration -> DEPENDS
-- 
2.7.4


