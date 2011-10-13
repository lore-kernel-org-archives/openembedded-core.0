Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJcN-00043l-TP
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:32 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Dok90q+X/Jmbw2dNwqtfP5z15Ya35DF67LfZGP5VN7o=;
	b=EUxflHPS/lFNwcta6GHze0Kl8mVDeZXdBBG/JHSbuY2Lgn8wyqPkdE0SzstFu77WSu
	jALQxerTZa+NobDcKh6vSdw35xecKf6AsNbYRXfGvUYhxSxWx5RNBlFhEy8F7fpZbkVv
	R4Gq5xLIYKCJzolgPQ0WvG6CyiS9ti+6iUcM8=
Received: by 10.204.135.65 with SMTP id m1mr2315951bkt.85.1318505570323;
	Thu, 13 Oct 2011 04:32:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm3248105bkq.11.2011.10.13.04.32.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:34 +0200
Message-Id: <17ae829df96cfe4e63f63b6471363b5cf2a7f931.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 16/20] mesa-dri: drop COMPATIBLE_HOST, swrast should work for everybody
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:00 -0000

* and more machines like om-gta02 have own DRI modules too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
 meta/recipes-graphics/mesa/mesa-dri_git.bb  |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index f9c6d89..5d25127 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -2,5 +2,3 @@ include mesa-common.inc
 include mesa-${PV}.inc
 include mesa-dri.inc
 PR = "${INC_PR}.0"
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 1485213..6a7ab76 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -32,5 +32,3 @@ do_install_append () {
     install -d ${D}/usr/bin
     install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
 }
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
1.7.7



