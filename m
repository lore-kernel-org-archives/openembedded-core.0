Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDz4-00062B-H7
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:18 +0200
Received: by yxj17 with SMTP id 17so3905500yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9Uo7SELtZhOyJVy4IhMtaMI8CvviPSpaKWifopQU95A=;
	b=HLfu2I+fsjcRJ4BobgICCL3sttPqtG3zROs+zmM48g3q23QSIkG76p3US5xWEl/D4l
	XfhpmdLYDaEHucK9t7Exq2IIiiJDsBKk4JcXJe+7JZBZuEWm+808wCtJwQ87WsWk+8TA
	R9h046hb2J6MX0/KdZ3syztfrLFwJ8wDk66K0=
Received: by 10.223.5.139 with SMTP id 11mr11903403fav.21.1318007260905;
	Fri, 07 Oct 2011 10:07:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y8sm13618372faj.10.2011.10.07.10.07.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:11 +0200
Message-Id: <738d05c113b09fc60e0defef703576df6c6c3518.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 16/31] xserver-xorg: remove COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 07 Oct 2011 17:13:19 -0000

* ie om-gta02 has mesa-dri module too
  so this should be limited in mesa-dri only

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f734873..01cdd68 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -11,6 +11,3 @@ EXTRA_OECONF += "\
                  --with-pic \
                  --with-int10=x86emu \
 "
-
-# Due to mesa-dri
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.7



