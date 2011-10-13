Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJcG-00043l-8T
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:24 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YHJWhtryzslgizgMh9CF5Q5j/Y3EP3xnFV1T7Cchaxk=;
	b=A15IlOR8mBdgd6SRQyiJnkS9r7yy2PXz86+Nyr71oFN7lNxoPnlnw0epwJyW+FLNZ7
	y0sIzn23FFau2jKmeqZx8JdAQvJovBu+WDr3h1bC2daJr1TfteNgrmdmxcas1V7iR0Zd
	BtlbjwYR/fZO6lr59xpTLV3NtKUpahxItlnSc=
Received: by 10.204.141.142 with SMTP id m14mr2293827bku.89.1318505562529;
	Thu, 13 Oct 2011 04:32:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3302050bka.0.2011.10.13.04.32.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:33 +0200
Message-Id: <d94093d6f0979eb53ee82687b1117b39d3a03352.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 15/20] mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging each lib in separate package
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
 meta/recipes-graphics/mesa/mesa-dri_git.bb  |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 11fdc9b..f9c6d89 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -3,6 +3,4 @@ include mesa-${PV}.inc
 include mesa-dri.inc
 PR = "${INC_PR}.0"
 
-LEAD_SONAME = "libGL.so.1"
-
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index aaa3073..1485213 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -15,8 +15,6 @@ PACKAGES =+ "${PN}-xprogs"
 
 FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
 
-LEAD_SONAME = "libGL.so.1"
-
 do_configure_prepend () {
     cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
     touch ${S}/src/mesa/x86/matypes.h
-- 
1.7.7



