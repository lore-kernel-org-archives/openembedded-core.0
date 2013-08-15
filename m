Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6A56B8D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:12 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so181242eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ZZNHjk8z2vIXAoZI3MwmyjFCCwdzl1QYCljOe/7P0VI=;
	b=yL/+v7LIDVlrcbjf9fYHbiHlxqErFaeRT+35JdXBIwxjg1DG5VS4bD+vuHiHYBezig
	y08xgRBKYxOLzv7sw4PNhdDQ+Wz24PTuSU0S1f6g4iOeQUOa5EA8L8LQatbjbIEFuC0W
	aSjpAYYUQzGr9RvbPnRcKszt4GIoKE9MfyQAyCQJTPPrwkK1mR9ETafKm0uZEMoTOGsi
	zc7Jg4s89FuzswhzweCUsbEQMHUgnS4BihCpl3BD/fFj+KJ4ylfaE529ZjaEexxHS4Pp
	chn0NCcfzldi6Y3nsrHpnGSJZKQ5gpkmDOWptHl5jOGuf81/DNbZUto0ZhjZNTG/rkdW
	SlRw==
X-Received: by 10.14.102.72 with SMTP id c48mr2832479eeg.52.1376551393491;
	Thu, 15 Aug 2013 00:23:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81958743eex.2.2013.08.15.00.23.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:27 +0200
Message-Id: <63f21e22c7075015ed26dd61a0bc6114a116fe54.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 16/33] xkeyboard-config: add missing dependency on util-macros
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:13 -0000

* build fails without it
  configure.ac:7: error: must install xorg-macros 1.12 or later before

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
index ccb9f74..8579b24 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "e66d567d85a954d589c5723fb0e1f3dd"
 SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b2078ae"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native virtual/gettext"
+DEPENDS = "intltool-native virtual/gettext util-macros"
 
 PR = "r0"
 
-- 
1.8.3.2


