Received: from mail-ye0-f171.google.com ([209.85.213.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6pN2-0002KI-ES
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 22:32:39 +0100
Received: by mail-ye0-f171.google.com with SMTP id m8so788773yen.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 13:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=y1JzWpYBtj+q/7xboXoyBOv/N1+uKz5MA//nlPA7/tE=;
	b=xNAFD1lxXG9DTOIHU94ZrR/oGWSgJlzI6XvlJwT8sUOjx/issghsFBAQGtmBJfSYOe
	/mbRqm8nWhEe19vgcojYbVZqAIGrBs4XPqjd3TAK5+rN5cOsl7qki24IBjMixudBY4VY
	Rs11ZI31dtl7uiBSw5MFxSXwYaQpFcHw/7QePfw/0kq26DrMTJwNrKtxioUhv+TmB6yk
	2DPR9SXR1md1Mr0ErhljjzRFGuAZmRQVQqYNYuwSHvBBZlpoHc+ywEDLJl+9VO0Yfcbj
	gxu/ZqXoF7U4dZPhH5LTVFguor5QQuslTL8ODJSP9GvVFnesAlCwNdnS6byI5SEZk3yM
	oY9Q==
X-Received: by 10.101.11.37 with SMTP id o37mr3055357ani.42.1361049386508;
	Sat, 16 Feb 2013 13:16:26 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x16sm100839942yhj.6.2013.02.16.13.16.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 13:16:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 19:20:44 -0200
Message-Id: <1361049644-27904-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 21:32:46 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index cfc6fd8..564f1d2 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
+DEPENDS = "nativesdk-zlib nativesdk-dbus ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} qt4-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-- 
1.8.1



