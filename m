Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D09686B6B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:13:09 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so4849805eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LpgDYCIK7iKaJwpQ1yM27OqGlkUaUAoylfSstZTQXrM=;
	b=KY+NYgpTUge3cjzuCqpaI4V5ZrHgO4kRjqDRojqabM2jnSGAFLp2fFsPrI3VsrWGum
	XHsP7HBQXjMdEZnfspEg5rfnZhdTvL37AU9mraiAsIHNDvOD/R5aId9nD61UM52g15JY
	TkqfpcX0QEBjXl0vSuwHIrJh6KDexU5AAcRZhdtt3oj9mVWWIeGSSovki5Q/DWxAmXZ6
	JLCQowmZnDJ3HbCbjzMCADY69wM+8R4GE5M8VVNwSsfST9fsBhHEgxSyLbh9u7dV686i
	6v5XPAqs8AvmH6V3FpA2TpxEiGMQD4XMFikNFxt54yOJCYOZNIXxpa3nQAV7Aatd0R56
	MrYQ==
X-Received: by 10.14.47.73 with SMTP id s49mr2371031eeb.71.1376478790289;
	Wed, 14 Aug 2013 04:13:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm74237385eez.0.2013.08.14.04.13.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:13:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:13:54 +0200
Message-Id: <1376478834-12858-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] xrestop: add dependency on ncurses
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
X-List-Received-Date: Wed, 14 Aug 2013 11:13:10 -0000

* fails without it
  | xrestop.c:50:20: fatal error: curses.h: No such file or directory
  |  #include <curses.h>
  |                     ^
  | compilation terminated.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xrestop/xrestop_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 13a5e61..9600d09 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 PR = "r3"
 
-DEPENDS = "libxres libxext virtual/libx11"
+DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
 
-- 
1.8.3.2


