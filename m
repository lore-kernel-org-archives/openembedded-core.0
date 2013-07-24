Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8976B2CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:21 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so189153eaf.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nkfKAYzpjJDhBcsZFRMwB+RnDJ3DRjVn2NFGsNvl5Q4=;
	b=SELVNROYBpogvNkzvW0xl0RhRmfSGzXLk/9GhRxHPhsV3MJpNByxAN2b0f5tmO16Yj
	9bjODAItRlU6R23GKJ0mgQ+V5kM8UJJaLzigtc25T+qOOtzYAM1a0VX6gKTKNRONnEbv
	J5cBpTsjIjYnrLcIjpLfwUEzf3bM1JfcrVUTDZERhHx6jDkrA6tD9Y78551X6bqZB7U6
	06uiXATlGNs4u2/FtlnQS20+No9dOMQP/0QtlDGcIzon6aMpmD7V/rOLY5wepwF8E7Wy
	ApylKN10qVafSkG2YTT9YgsyenJee9DAHiCuAVzVmN+5+n6R1vIcuZJkrsY3YiHR+i5q
	xWZQ==
X-Received: by 10.14.203.194 with SMTP id f42mr37599972eeo.53.1374667341557;
	Wed, 24 Jul 2013 05:02:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm65650918eef.5.2013.07.24.05.02.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:25 +0200
Message-Id: <f077d06e783a9b5e9a425cbb0d65e57400c7f642.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/18] xkeyboard-config: add missing dependency on util-macros
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:21 -0000

* build fails without it
  configure.ac:7: error: must install xorg-macros 1.12 or later before

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
index df96c31..c60c7fe 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "9b1280d8ba40274a0f1567c94fca7501"
 SRC_URI[sha256sum] = "5e89bc182a10d53c3e83efc6c3546de0fe5504d91c3dbc80d55cc64ddab5643a"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native virtual/gettext"
+DEPENDS = "intltool-native virtual/gettext util-macros"
 
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
-- 
1.8.3.2


