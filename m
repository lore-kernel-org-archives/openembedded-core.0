Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U09zw-0002Em-Ub
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 13:09:09 +0100
Received: by mail-gh0-f175.google.com with SMTP id g18so28502ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=4AthRLiv6h5l5pvXxnoWhRQxXmwnaRga8KywoM5MGE8=;
	b=rwAUbPPQFAFL5gAb/sbKg5jbGZioxLZA020u0ZEuvZ2bVoR5/NuJmCUxRR91qatAKx
	7e/lQD69aI0SSLqSVHp7fuI9ufBRJe6f08EBhhf5xbvWASW6FMWMm+pN5NnI3xzoveSt
	fM3hkntORNsJREcLLTF0FOlF0X+1R2miO1DnA7oi873R92D5ZlL/DQCImxzsTFPQ8+Fg
	I9JEQZ7QEo6S8f2lwCrFRtCZ2I6/68sk/AfbiL48N8LlPHId3EMzT7aE4tEnnFPmhkJO
	L+fipfj4wnYWIV3aOZM8QaqHsYY5FHHJxIqIVPCvq63NPV55ZA8+9gxD8lVpFLFDtNAE
	DiKw==
X-Received: by 10.236.166.226 with SMTP id g62mr660773yhl.74.1359460408916;
	Tue, 29 Jan 2013 03:53:28 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id z6sm7037801anh.13.2013.01.29.03.53.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:53:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 09:57:45 -0200
Message-Id: <1359460667-26291-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
References: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] mesa: Add virtual/dri provides
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
X-List-Received-Date: Tue, 29 Jan 2013 12:09:10 -0000

This allow for use DRI alternative implementations as done in some ARM
SoCs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1ff08fb..d93835c 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -11,12 +11,12 @@ BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
 
-INC_PR = "r9"
+INC_PR = "r10"
 PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+PROVIDES = "virtual/dri virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
-- 
1.8.1



