Return-Path: <kergoth@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C81C7719B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:12 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so77354119wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=51L/no2n18KDS1PQlaLFkuySvE6Zij6Rm4kWuR+4MVs=;
	b=YBdno0JqBG4ZJE3oxNhWotXR5jm9Wh0+YBpiA4fWCeB1HTB1o0eA/W1JEZTFF7B/EK
	O2bLhJkrSNU9KM3+wkpUShIXbWv/9L/yxrwV46YilaVoU2zLOIVgZKVEjeAkCmXWYAhm
	7LKgIrQoQFZBN6qTPVJgBKWyUky9pf+WVjkAGpCKg6VWJjI62dkwxh6yDS31QAnbmBO3
	ovUElP9sAkF5gEiixjKSFAgVhYzI6pDWlZ9Foaq2Gkod/ORREqzYeDvWi9SSeKojymEm
	8GAtGbUDp3vDWVcrdwH4PIqcXGK1J/OHSn8Yihb3VQLG6kYD3CegO53xzejRwwqlp5Ti
	9UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=51L/no2n18KDS1PQlaLFkuySvE6Zij6Rm4kWuR+4MVs=;
	b=l8tmbJra+xCMvnk5BTdg3X+W3V96jAX1VyHmTpD0u9FotaIErQ+ITT8V+M9hmXbaoB
	FoPPhnlSEsUqHB6FGshE+ejNXYGatAdA72BeYa1u4IHPdjLAd8jXch0460sox++YzyrG
	13aqsx9dDfTTl0hrA4uFfxiI6zu9n3cSdr8wS8vmpkxQfWS5cAat25fYql4elqKppg/N
	i5IvFPlhxdzKnC8WGv57CgBsonr3wB21357g7eXdNfWhgHMkSjfvCRDzOv3X9ZzPlx48
	NAI09+153seQj/f/m87m1GF2sffZuz5L6zNTVjSCyJP/uNRBuGSeF7+U2geDL1+EfNxJ
	3HUQ==
X-Gm-Message-State: AIkVDXKSm5fbxIciYQjmuVioYutcEFeuNIhaZrTbrGOYnfi3XjfxvI6NNGJT2z/uSOZtWw==
X-Received: by 10.194.158.229 with SMTP id wx5mr2224576wjb.174.1483570692586; 
	Wed, 04 Jan 2017 14:58:12 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.58.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:11 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:55 -0700
Message-Id: <fa3c45aa387da08e2a3c4831c30444191a943974.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

This group pulls in libglu, which needs virtual/libgl, whose providers require
opengl in DISTRO_FEATURES.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 734dda1..3aedf6b 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -11,6 +11,9 @@ inherit packagegroup distro_features_check
 # The libxt, libxtst and others require x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
+# libglu needs virtual/libgl, which requires opengl in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 #
 # We will skip parsing this packagegeoup for non-glibc systems
 #
-- 
2.8.0


