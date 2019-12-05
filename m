Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18C8A7F829
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g206so4389890wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+wUY615K4GCsroUa+5TB3tsJDpS2Dw07zJiWVEN8b6w=;
	b=S6DCy11ChNx6VGgss9I0dDajOUdqYK0FC7h9dXBXZEUBnBfysYitCiOso8AmMToBA7
	cBaL862sr7dufAFx0NpcZsME9IhxD69YuG2uHLAtXT5945SP+2hQGd2S8XN3At8zDgtm
	MzVtMEbRpP5gev0lAFZCZPLv+ScjQ+ekq98YReUTmM9G7j+N6C6Ic9tWtD1+DCc3Oawm
	IzUaOknWu6/3vAw473yufAmvSvq0b9+cQw4n1TzeMTf9rGZHH9NOeFppB85kC80jBmZ4
	HsHjYphzEUYkMsPwKRzYFTdgu73Np6c9D5SqohaVpQn3d5Xc2TkrysX2xyROX3zsLTba
	/Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+wUY615K4GCsroUa+5TB3tsJDpS2Dw07zJiWVEN8b6w=;
	b=LJpC+SyuiakhOPvfavim8X6uNZKcCMq/UrK9HgQ+KTmKWon8L6wQ7/hS/9dA99+Mf3
	NrrbFaEVk1x3ewws1wuwzwenf8daM98LYu1jNEUNzLf7nW6tT6f8Wainbr7TicabVMOu
	UilMCoYweIL1UXd14VIhspehQ4S4URGC8wt8vNm3VDgziB46RgN2LrInVskdKFFUhYsF
	23utg7IgtX4CCxxYK4kv8X/94OfeIiJrgGX/qLaydl17lzTm9rgEEZnO9lHjVwXK1BwB
	Pn9DteSAGHKRCNvKHjRKipxUWEtuB8o+6zQEkKNp/Fbv5DyekMAOabyxdF6WJ603Wijz
	hACQ==
X-Gm-Message-State: APjAAAVd1/Qt2vCosxrYN+UJXPh0pYq0+czzz3kX/KHyF/X30M5YIu2K
	KPN5WJ/c5DB4xPJxHBuTdQlrqm40
X-Google-Smtp-Source: APXvYqzhJIN/Xb579GT+Wm7tEstD7NS6TEbdo7INf+pW1AjRBhF0tssDrgC/ZJFTCX17EEKeEcIyQA==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr5990820wmo.13.1575560662498; 
	Thu, 05 Dec 2019 07:44:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:55 +0100
Message-Id: <20191205154357.121346-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/24] debianutils: update to 4.9
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{debianutils_4.8.6.3.bb => debianutils_4.9.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.6.3.bb => debianutils_4.9.bb} (87%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb b/meta/recipes-support/debianutils/debianutils_4.9.bb
similarity index 87%
rename from meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
rename to meta/recipes-support/debianutils/debianutils_4.9.bb
index a69d01e0f95..94ac34d15d5 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.9.bb
@@ -3,13 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20190717T213444Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20191205T090816Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "ca57cc6621275346d7d516ab0b5fa1f5"
-SRC_URI[sha256sum] = "2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221"
+SRC_URI[md5sum] = "bc599768703e594b91d8f6172ce82746"
+SRC_URI[sha256sum] = "20975c5cb8cb305f28c2ac35dd99fd9f594f25b6140b5d478a0a364e9fa8073f"
 
 inherit autotools update-alternatives
 
-- 
2.17.1


