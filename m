Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86E1077E13
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 08:32:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p204so24743481wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ea+BlunKiM9uwIkvDgoqHvBvap5fOYV4iyD+xDjJ1zY=;
	b=ih+LO6pHRJucCqgf5zpcd6C/8cYec22Rr2C+bGv0QOR7dr6PNZ7+OO8n5QvQCPnU1o
	hFXWtX0ooQolAIhzREAA881bDMaB+SZzsa61MlzuvpEAKAmPELu6HHZRWr1oupxe2SIp
	J3AubdqlsoSkCsouZuYc3iKr09cBX2u+t+/HzFWQkkdF7iA0PS+yowoX0u3NwPSv983B
	aSfjicQc/Dq6nL3SJaqmIgWmreER2rVWloou9AP0AziIX+i8wjVqynj3fWF5QzYS40TK
	8YZz/oFxlAzYRO322LcYYduOTsPixd9MvdwePEeNsb3lwmNlHa5P4cpRS8trVkgMNdhr
	PAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ea+BlunKiM9uwIkvDgoqHvBvap5fOYV4iyD+xDjJ1zY=;
	b=WwQmqvUpcnbqToTJWZagVJ0poOQciGcNNfTu0f2UgIjQ11UBDC823ARKNv/TEkygBO
	RyAg84wa8r1UAZhwywQsxgf7F5AQsyCu44CPI4YVt+xs+FpcK6ZW09kNIpSWB5OEr+Fg
	NUwjHZfY/KTXF0UlOjgT1EOJrodFKjAzaFvnTJiEuHd0oyL1jvt6Swlt9WVViyqn0Bv1
	3Rrt1bM7FNB5nqVOek5CvX7ExsVrd1XAKY6oNavUzxfvGbtcQzjzTisKBNOQzSwBYPUF
	TEfYSLXcw1BlRAYApxrvu9h2LmA5aMcexD3tn8HzZMq+9Cwk8XcQh7bsBpYPk86ecWJC
	rpOw==
X-Gm-Message-State: AKS2vOwHgs5AdYfz0ZQZt7XnaqDv7pqgoCC4QU4XbczfsfUph/P6ThGi
	2sCmH/6OE99qwoPu
X-Received: by 10.80.138.34 with SMTP id i31mr17891419edi.119.1499157151676;
	Tue, 04 Jul 2017 01:32:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242])
	by smtp.gmail.com with ESMTPSA id l4sm8733946edb.35.2017.07.04.01.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Jul 2017 01:32:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 10:32:21 +0200
Message-Id: <1499157141-28480-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] local.conf.sample: drop image-swab reference
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
X-List-Received-Date: Tue, 04 Jul 2017 08:32:33 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The image swabber had been dropped by commit e18657df:
[ meta: Drop swabber ]

We need also drop its reference in local.conf.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/local.conf.sample | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 85c5e21..b754853 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -126,7 +126,6 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 #   - 'buildstats' collect build statistics
 #   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
-#   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
 USER_CLASSES ?= "buildstats image-mklibs image-prelink"
-- 
2.7.4


