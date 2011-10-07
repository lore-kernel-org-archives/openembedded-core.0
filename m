Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzg-00062B-P4
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:56 +0200
Received: by mail-yx0-f175.google.com with SMTP id 17so3905500yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vyzM6g2aOOkmkNmDyVVLRk4/lz7WZkvCLhjCAaxNuY4=;
	b=vQ2VJSlD8lZiR/I5AbWIGrFlrDcGGGLx+WCDyJsCLRSSGI9RM/YRLsYjmz/dbUbu3p
	IOm4cbY/K2xEXs98g4hpjuX5nO9FLjvM9m9U+nBkezO2FufgjPcVwpI7ff0nknCkVGNg
	fiP9SsRxNIO9PgwKfhUur0xVa4N7sJzJ3w5X0=
Received: by 10.223.61.146 with SMTP id t18mr11949295fah.34.1318007301462;
	Fri, 07 Oct 2011 10:08:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm13623589fai.8.2011.10.07.10.08.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:16 +0200
Message-Id: <d1c6daeeea1e0ad50a76f776fcdc3277c011f324.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 21/31] xorg-driver-common.inc: bump INC_PR to rebuild drivers agains new xserver-xorg ABI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:13:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index da3a90b..097060e 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "1"
-INC_PR = "r15"
+INC_PR = "r17"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
-- 
1.7.7



