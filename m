Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4047DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l2so14793203wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ftRfGxdBJT+99sQO8E6+WQFGCCkvx6E+Shf3kld6pYk=;
	b=AYCpgis/xl32CFEnDKEFsA4+gwAK2vB17Ul9SyYTPI05j03oRVnQNB/6lsyTygnsso
	TUMDNb/fYzfe+4wuuakWqTB14Uw+phPB6vtbz6xOrpa/Yd94t84zulwZlq7wb8ReXbNh
	PbRypHrm498FoolNCA/sbTH0dqEKMUuOTA1hkCvOGlszMgHVZAC8FnWJRk1DA/5PWRoo
	ZWeNtjR1NsmRttRxRQN8QZaWCC28WYeaCOFqa5YzhFl9TxeuRWxzW0tQlbOQgfRhAW8o
	7zVNNDTRT1R4kcGNQxaPe7mImtj/SW5uxbBpwyr0Xv99jTsiSAZStAOnSgs/96kZz2bX
	RCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ftRfGxdBJT+99sQO8E6+WQFGCCkvx6E+Shf3kld6pYk=;
	b=LKHlE7F4Z4X/yLqLtcde3IlBKQDAKbstBPVBFvJsw5Atg6OydydPWIJM0OdofSj4A4
	2K2W+VHDfOdTZKv5HlxhClbNpQLCbzUCK2pGxxK/M7I6pO6C/BfjDhzELYEgSZiEsqfF
	rX3MddQQbbFq21CcegDfDZBXiRJUQhX8SVPY5hK6OWp+ALH5rsEmYZBmkXSW/upqri8/
	tmf9MkfHwnxNvc9X5aPolp5P3DIDwRdYa75EjO3w2wm3yUvV7m7G/IY/y5aYj/fLpcDP
	E4/N4wOP5QMKGyuy9NqSu7XUdYTeDbz6UMdE6wSNDDi6ZSoZfH23IEe29IDGbQNhj6cY
	NjUg==
X-Gm-Message-State: APjAAAUVK+GYHtdyD6qsrdQ9PSmt6IaB9I2gcR2NmuYPkywHyEXe3ZXh
	3ROC5WYu8tpyMSt5MYTYKbJgdcrq
X-Google-Smtp-Source: APXvYqxC0bTkFWgahPLxT5oIFURpMGnCy/9adihl3fIGIFri0Tu1SQK2gjPWmSB6xzDMHy3vD5xuQA==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr2997624wra.132.1558361509081; 
	Mon, 20 May 2019 07:11:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:59 +0200
Message-Id: <20190520141125.10805-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/42] alsa-utils: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Mon, 20 May 2019 14:11:48 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lsa-utils-scripts_1.1.8.bb => alsa-utils-scripts_1.1.9.bb} | 0
 .../alsa/{alsa-utils_1.1.8.bb => alsa-utils_1.1.9.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.8.bb => alsa-utils-scripts_1.1.9.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.8.bb => alsa-utils_1.1.9.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
index 96d54e593ad..03b5c8de30e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
-SRC_URI[sha256sum] = "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"
+SRC_URI[md5sum] = "5ed21c3e296c06046cc986e732f625f6"
+SRC_URI[sha256sum] = "5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.1


