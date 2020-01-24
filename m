Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4F90B7FD70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 4so1286741pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UW/ED1djnbn8Y8CrDr1rSsxO1He8TEIcXpWyxeLw+Js=;
	b=Pj0nXMQh0aH7zOo9zgIK+PM2/pRC3CSfWFmy/JytVjjuKqe0yrwkHpCFXFMI8BVKTH
	eKkMPLWu8r+el7rNQe4K8wz5bBeRSt8Xdst1tKnChEXzUF3vP5gZ/JJj1AMmEobkGWAs
	q2G7VgO6fyHGluGPerhGszTNmrt71i5211QNiBQLu4EF/GpLDffUYYbVzp5DtE/QZ/vt
	ez7hqmKhFlNAr884tqmTDHxafULz8Rkn3i5TdnrZXoA7A8i78GcjZF1I20tSseVl8dFk
	iAEQjOzK7gz/zEmLfqXewuzHQ3bHb/gt6KX+1mTswiEwT4Yz/wHtF0QXKRktgGhCW9/K
	Dzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UW/ED1djnbn8Y8CrDr1rSsxO1He8TEIcXpWyxeLw+Js=;
	b=Sn3LmqjKYaX8Hvss96PTSCKcPdTxmyyg4C+cLBbe1X1SmI1jcnMyVhVumDv0blk6Xj
	aTiMszCxnOlZgbK48SQ2Wip+AxvGR44UBsm/aqzPm2LdL25ME0Sxmtro3M/PIMeVb4kK
	yQI8QCAzEV2B+8vVZcbtuzyBf6QOZi+n02vJEih94dI4Hg09SCiTrpnO024+T8wqRyxz
	42Jgfstd2GED9FPlIPSx3FuO6sxn3+BNUuofdQNQiWNMQCzLfchKlSQodGNKk9gCGjty
	eCS7871SUdsn5jQMmb8y9WxYcyuBWRGW6ZadLCec2HxJlD7SnF+8kCaQh0Eu4xYx+EMl
	xHIw==
X-Gm-Message-State: APjAAAVUqIK2Q9ZPzZXmc1pv7AkBrHroVzTsM+I0JSMOJOGdV5XfM2bK
	A5yiZSUJDLc/zUD6Zblnt8KHIYeVVls=
X-Google-Smtp-Source: APXvYqwtp7c5rPC9OL1TJp4TECnTd+MTCGIgB6JeDUP7N6jWNKkwRNTuHd1OLzeH2utTr/SWe7uieA==
X-Received: by 2002:a63:5657:: with SMTP id g23mr4605758pgm.452.1579880892933; 
	Fri, 24 Jan 2020 07:48:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:09 -0800
Message-Id: <20200124154810.1760420-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124154810.1760420-1-raj.khem@gmail.com>
References: <20200124154810.1760420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 5/6] gnome-menus3: Depend on py3
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
index 3f441d915e..24d6451969 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-DEPENDS = "python libxml2 popt gtk+3 gnome-common-native"
+DEPENDS = "python3 libxml2 popt gtk+3 gnome-common-native"
 
 inherit features_check gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
 
-- 
2.25.0


