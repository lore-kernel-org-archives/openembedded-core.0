Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id ABD526B403
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:13:08 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so4849792eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9IOq7HIgGtgSftV6ljKqF6d4jFwm13VdR+MdZvXFSb8=;
	b=RtVtUdeT0lXpXYROgvD8WennNqQWHRpf/z+FrwkjDyJwyzC3ZP08airVgA40p6+vrD
	QJCxgvnsYd3Ijfq7UQwgKn6f/inpWOg9om5ETTTvFEm44KoMu8q6S/E1LvkZPRR7KHV5
	ufJiaIKK2jX4Zz2V0qLvInDmfRWx5xDmkjCZ5BhUvQAOvrQ6vQ9QcHc2fLbYww2dTQK3
	OtGyKOP3d6rsT5rAKm/xdciKdsD26aP5H5x+tTNfwfIAyo+YxLjNIVsbE15Q9ihy1AAD
	qYWnauyLO41t3S646FcKEjMIsv2F0x6Px8ZE4BJVQkuMEHwhhPl/CQe0FZhkD+jB45Fs
	dweg==
X-Received: by 10.15.42.206 with SMTP id u54mr290726eev.94.1376478788693;
	Wed, 14 Aug 2013 04:13:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm67256800eev.14.2013.08.14.04.13.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:13:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:13:53 +0200
Message-Id: <1376478834-12858-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] xeyes: add dependency on libxrender
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
X-List-Received-Date: Wed, 14 Aug 2013 11:13:09 -0000

* fails without:
  | configure:10604: error: Package requirements (xrender >= 0.4) were not met:
  | No package 'xrender' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
index 7b68e6c..96ea030 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
 SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
 
-DEPENDS += " virtual/libx11 libxau libxt libxext libxmu"
+DEPENDS += " virtual/libx11 libxau libxt libxext libxmu libxrender"
-- 
1.8.3.2


