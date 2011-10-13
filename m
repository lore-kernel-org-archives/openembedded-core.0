Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJct-00043l-Jb
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:39:03 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=scVsYV4Hk4ZsX6+evpt4MgkP12lsP64U2NfHnKALdxs=;
	b=oXDQAWjCPYRrbTsBr04TuK+jJ8BcFEGJ3IIhFjK1RGncczkmRb8LKBP08xlKc7ceMP
	s4ovdSujisumOMrHmWgpF18YGCc0aUkTXPFJePsMcR+MwUfpDyloVQo39ZsOr2xbhd+V
	+Ni3LxzXgIwY+iOaWpZLbN3AnIvKiBzZ7T7qw=
Received: by 10.204.145.15 with SMTP id b15mr2457538bkv.52.1318505602086;
	Thu, 13 Oct 2011 04:33:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm3268821bkv.8.2011.10.13.04.33.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:33:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:38 +0200
Message-Id: <a054cf4e1168e4af1c809ee7b5cdc500005e31b4.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 20/20] mesa-git: fix LIC_FILES_CHKSUM
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

* only wording was changed a bit and GLUT is not named explicitly
  $ diff docs/license.html 7.11/Mesa-7.11/docs/license.html
  41,44c41,44
  < and licenses apply to different components.  For example, some demo programs
  < are copyrighted by SGI, some of the Mesa device drivers are copyrighted by
  < their authors.  See below for a list of Mesa's main components and the license
  < for each.
  ---
  > and licenses apply to different components.  For example, GLUT is copyrighted
  > by Mark Kilgard, some demo programs are copyrighted by SGI, some of the Mesa
  > device drivers are copyrighted by their authors.  See below for a list of
  > Mesa's main components and the license for each.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index c9b17a9..594d9b8 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -3,6 +3,7 @@ DEPENDS += "mesa-dri-glsl-native"
 SRCREV = "983fa4ad523535debf2e94cf6ac1fd4c5630c0d2"
 PV = "7.11+gitr${SRCPV}"
 
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git"
-- 
1.7.7



