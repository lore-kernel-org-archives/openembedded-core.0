Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 64A027E27B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:37:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h2so21690938ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=f3QpaXnz8TLPZ7fGgfLhZuvsCNAae/NAqdTLT/Tl8ao=;
	b=QmwZw5eXYGNnFGbdJ3i+iLcd2OiN0h71snGoPZ/4pRrD4QJtVNLLKd6k6DW9L5yGsj
	ur575asROdrrY/0Qv98Vxm4zLIkLkI2JDQ2sLIPepdYmidyNogcm3KuU8PHsNBfSPdzW
	fl5ZLBmdzhxYG+4Eory4LyMm9OZXCOHJ+EmbuFvgkh7deGXWwoj6OmPKxjlwIHscuF+5
	wmNRpLhrlD+zK9GUbbOFJRhOICJw7LX+5xqzlpKo1famj7RQkE9F5Q56zQGqx90LT1rs
	xaf5lDLxTcVOqV8PBAq658zh8YZLUhYdh59nYniLdhA7TsyoGeXyAy5IP4jZnDMRkwxV
	Wvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f3QpaXnz8TLPZ7fGgfLhZuvsCNAae/NAqdTLT/Tl8ao=;
	b=LQ0HsX6MD+1jIkET5Isf4V+YYatBJpRcdfYarg8lpyHQ23V5rK06+LddpxYV1mLq9d
	mfH92KPP/f3QF+LKDTz/KUNHsa1g0VSHV/f1SYTeHsJSmrA59ZQ90Mtwq09rUxoqLcxs
	F5juao3MdO1UnVmncBhpwJtOjYb2tYJKoLhLpCphmazT1t+3zXUkcfG1+LZKH8Baa5nD
	3XffBDgzafLXJs548EJ9PcniikeFvBrDVyVVE1y5gBswwEuk8sK+dNasoBheRY1ncZl0
	fSLYK6IOZxzYsLcljVkRpfJdc+TRiaI7cQXcZAzwTYBUn+soYKKBIZNdBFwUPBXU8OWq
	xE/g==
X-Gm-Message-State: APjAAAWQ9fPj7TLqNPlmWN43HwlXsTbC+SPQbFMiNrpgdTjUmpMijGsH
	CQEkr6gP0dzOBvro/sWOoSPhrhsDzDE=
X-Google-Smtp-Source: APXvYqwtvuEBEER4Lg6wpk1kxYOmg+MakCFPTDtB+9Nre7HxqnRCRKgZmsAE0ViVI1NTX3q7Eb9Tgw==
X-Received: by 2002:a2e:8805:: with SMTP id x5mr7050512ljh.102.1568403448611; 
	Fri, 13 Sep 2019 12:37:28 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	p10sm6513549lji.71.2019.09.13.12.37.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 12:37:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 21:37:24 +0200
Message-Id: <20190913193724.12154-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-dbus: update to 1.2.12
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
X-List-Received-Date: Fri, 13 Sep 2019 19:37:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-dbus_1.2.10.bb => python3-dbus_1.2.12.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.10.bb => python3-dbus_1.2.12.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.10.bb b/meta/recipes-devtools/python/python3-dbus_1.2.12.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-dbus_1.2.10.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.12.bb
index 8892d0fb42..d005dc4a90 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.10.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.12.bb
@@ -5,11 +5,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
-"
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "428b7a9e7e2d154a7ceb3e13536283e4"
+SRC_URI[sha256sum] = "cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260"
 
-SRC_URI[md5sum] = "5d21d5ae6423f0e41caa3400af44edac"
-SRC_URI[sha256sum] = "d4332bbd4a0054fa4010b259c293b84d461bbd9d7a8ef528157d151c0398d886"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils3-base autotools pkgconfig
-- 
2.17.1


