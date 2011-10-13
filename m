Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJcd-00043l-Ib
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:47 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MPihrbamQ2Ev/+A35rxoLB7noQwaJO0FUENiHafLL4M=;
	b=YP44PxWrT0qURamAFomq1mYMQeFmHp8bcGV+bGfKCwWvW416I8WXGKll/EjvGXkKC+
	LHv3BK5ByfCUYr43tKK5byWEMx0cTTLCv1ooP31H2cGPKBlAXoHslNz0sAfaRcIh1+cs
	d5UZBO6nwnBzi4OomDnwoOHH8Wyo1tgKLAdI8=
Received: by 10.204.133.77 with SMTP id e13mr2331315bkt.94.1318505586063;
	Thu, 13 Oct 2011 04:33:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id rc12sm3255831bkb.10.2011.10.13.04.33.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:33:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:36 +0200
Message-Id: <d693215f618e5d80fab17501d1ef80ab680affff.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 18/20] mesa-git: lower D_P a bit more then all mesa-dri
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:19 -0000

* it needs to be done in .bb because mesa-dri.inc is included after
  mesa-git.inc
* lower it for mesa-xlib to same value

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri_git.bb  |    4 ++++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 7ba3117..ce1c8c7 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,4 +1,8 @@
 include mesa-common.inc
 include mesa-git.inc
 include mesa-dri.inc
+
+# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
+DEFAULT_PREFERENCE = "-2"
+
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
index 7f827a7..97cac51 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
@@ -1,4 +1,8 @@
 include mesa-common.inc
 include mesa-git.inc
 include mesa-xlib.inc
+
+# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
+DEFAULT_PREFERENCE = "-2"
+
 PR = "${INC_PR}.0"
-- 
1.7.7



