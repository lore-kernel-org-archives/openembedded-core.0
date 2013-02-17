Received: from mail-ye0-f181.google.com ([209.85.213.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U78bW-00076p-Aj
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 19:05:23 +0100
Received: by mail-ye0-f181.google.com with SMTP id m11so880308yen.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=VbG6i5oTcFU0NQgXej5KizJYwzgFgcSTAC2cPtpn+10=;
	b=BKcxydJcY0LrnFnermIKGa3fl/faHJUIPde2PKs2QhI+oLKap6PHrj/+KMNIPiDvYc
	MENHmxirv0l5gKJmczLFy6DnOd+zOA7hGW5rHZznXow4KuEoWryfRoVqjGhZMFF19jwi
	NU2B5UWEYjhBVKWrfZ/nouF+5jOqk4+Vqak6+GwC+2xjdzaZgeL3f8eYFdAuCjEvizI4
	XleOdfb7XpFDRBSg36HP1dgZvZ6ezclQLyMClNLiTSytm6zrvj89bDdsGYdY/1wbOOsf
	GF6dwtPZgYnLXJDetlwk5PRBn8Y35InKZjKbGsdG1yODqk1TVp8QaQpY2CzyziEtGMde
	1vNg==
X-Received: by 10.101.129.39 with SMTP id g39mr4366974ann.72.1361123319206;
	Sun, 17 Feb 2013 09:48:39 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id j1sm108579298yhn.3.2013.02.17.09.48.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 09:48:38 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 14:53:10 -0300
Message-Id: <1361123592-32572-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/5] libsdl: Use 'virtual/nativesdk-libx11' instead of hardcoding nativesdk-libx11
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
X-List-Received-Date: Sun, 17 Feb 2013 18:05:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e25c597..5776617 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -16,9 +16,9 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
-- 
1.8.1



