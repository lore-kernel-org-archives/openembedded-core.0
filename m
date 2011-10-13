Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJam-00043l-DM
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:36:52 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cyOMoF6GWmD0MP46WM9r/rtHFplidC6fvkpILzyVyIU=;
	b=KNvRITgFFL78HjRpTysSS67KSQk+YGsJrFku4rnzVAfiaEicbQ1mGlfeudWUpYfLhv
	HSnFBnQBU2T2oKElNOFDde+P612WeHQLa0wGTHwS03e7RgmIdUPYJ1BBpl2lXgQghi6h
	h3mQlnmolsGgZe7Ia8i4Jy8ERCxLt5DCXtA9A=
Received: by 10.204.153.217 with SMTP id l25mr941227bkw.0.1318505470677;
	Thu, 13 Oct 2011 04:31:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm3255887bku.9.2011.10.13.04.31.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:22 +0200
Message-Id: <7deb35c1e08bfb7a74abe2a2107cdc24c18ee59e.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 04/20] mesa-dri-glsl-native: fix LICENSE
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
X-List-Received-Date: Thu, 13 Oct 2011 11:36:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mesa/mesa-dri-glsl-native_7.11.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
index 07247d5..07b0761 100644
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "gl shader language specific build from mesa-dri"
 HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
-LICENSE = "GPLv3"
+LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
 
 DEPENDS = "makedepend-native"
-- 
1.7.7



