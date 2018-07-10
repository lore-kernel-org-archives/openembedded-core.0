Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B0AFD74922
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 21:17:49 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b15-v6so19657358qtp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 14:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4oQta4g6pvVcHG7h1Mgv3tDOtMxGXDlkG4ncF1ZHMGk=;
	b=OAo5iv9DmJJgMKcXPt+kwpToK4IswvwWCcaKfm3s92aTzloBI8ePc1v20qY0PWrRBJ
	YUySxWeNl7b6hakdK05QdldbdXFP4tbS5f6tpfXY9Vm2ICpWPD3neorbkYFt9zI+QVad
	K5exzwU+7fq45RT0dNP7lTJT145/V2hHoV+bfQZLAC2ItftyE8j+S2znSNbXyXP6eM2b
	vb77r/Ni685XDqplfrp4ergNPKgFQrMerGD0UuKBWEcNBZK7S7B7Jh/nX5/4K7HF9LhD
	4ilWMbgTvr0QMxpPRLrnQDrgPq1NQRBeiSfm//TzxNHZFd0DMlBh9BL65DYD/YaDqT5k
	TwBQ==
X-Gm-Message-State: APt69E3NDbhydiODIW3Z4qH24VaZrTdtvERgednKkU9iTIPpABB/Gz/x
	ITfLX3yhZDsFYpNBj+2ZQ92bk2Hz
X-Google-Smtp-Source: AAOMgpd+pZxBfO8C/TThuMZaVuzzf5/diTPuZo9Eqz3msIEuf4ygPvYwdIWCgPUZ7gw5kLjBCwsCqw==
X-Received: by 2002:a0c:e885:: with SMTP id
	b5-v6mr23182597qvo.52.1531257470418; 
	Tue, 10 Jul 2018 14:17:50 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	s9-v6sm14248389qkl.65.2018.07.10.14.17.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 14:17:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:17:43 -0400
Message-Id: <1531257463-30860-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pygobject: update to 3.28.3
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
X-List-Received-Date: Tue, 10 Jul 2018 21:17:49 -0000

Update the python3-pygobject package to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pygobject_3.28.1.bb => python3-pygobject_3.28.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.28.1.bb => python3-pygobject_3.28.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.28.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.28.3.bb
index 97286f4..313af22 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.28.3.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "612e9e2863d117d810e78672f7bc3ad6"
-SRC_URI[sha256sum] = "42312b4a5015571fa0a4f2d201005da46b71c251ea2625bc95702d071c4ff895"
+SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
+SRC_URI[sha256sum] = "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


