Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id E604960FA7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:11 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2266592eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=tVeLLnlD7d0z4AEQ12aTCt4pRwJRnrfqdxFoslFi5Fg=;
	b=vf55Wqf5Uj20POpmwXm8wRCqEnri7XTDqg9zkZYNNWsCol8PE5knJxU80AgnCZ/ea3
	gB15FlT8iSNjAkkH8CzEn+3l8bEb/eIu6SQD2OhC4L1ieXOim8j0ZW/wxPrO6uyMYNMQ
	QmXWHej1fQmSuHPLj1tuvIpG5sUwm/N5ymnLp/ajHl3ntbHlWM7ZA2TQQlHFsDezdgoG
	sXdm+e2CUh7I+L5aQnS5OFwrgt9lDPJp89Fl5JcsP9HedRqUQt9v9PBp0i8PQpxDk8//
	UQFLB31/qZ5ewG1Cd8OxqcnXBaGwGwu4IqC6xZUKyJPHAYB73JUvzhQWKWW1qZhv8Nmn
	V1oA==
X-Received: by 10.15.51.74 with SMTP id m50mr2631073eew.58.1380975793523;
	Sat, 05 Oct 2013 05:23:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm39207751eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:04 +0200
Message-Id: <17b3268715fc0735d702e72d0d3fe24e34bb478e.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 07/14] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../telepathy/telepathy-mission-control_5.15.0.bb                 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
index aa776a1..f1a1320 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
@@ -14,6 +14,14 @@ SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4
 
 inherit autotools pkgconfig pythonnative
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
+
+# to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
+PACKAGECONFIG[connectvity] = ",--with-connectivity=no"
+PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
+PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
+
 PACKAGES =+ " \
 	libmissioncontrol \
 	libmissioncontrol-config \
-- 
1.8.3.2


