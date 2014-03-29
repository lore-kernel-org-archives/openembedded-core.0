Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 32E2060E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 19:52:27 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 142so1956460ykq.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 12:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=51fTx7rierdALdrqhig0H0ukA7QluMzqSzK9JX7+TYM=;
	b=oYmjcs052Z5hvrMw3aSggGrH+MY/5oXWP47VD2OoQHXzIA9TQftYygpSsmveERL7MX
	g2OGSVO2DC+g0ROSY4pl3IhY8CwIowZk8brtjlsGodUKqmhHlw8yl3WcRq8gTaDSu4nN
	py3/978j40H8H+g5Y3hoPBXDrfOLztEHEubP8AYzi9IuNK1p67ve4oIgL0QK4fdN5E5i
	xmCAAYnkirXjVGW4GM2EP+0ck51Fyx0iXbD6G9e97fWm9Bfjo1wY5jKjOMAZsN7rEyaf
	lPSBLFzFgx54tYG8d0Xq4ty5zGzuW2fOToTpMJFJmGoZ0ViQBpwLJ8M146PfTC3/vW0l
	feiw==
X-Received: by 10.236.71.100 with SMTP id q64mr3834347yhd.133.1396122748106;
	Sat, 29 Mar 2014 12:52:28 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	h23sm15625383yhf.34.2014.03.29.12.52.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 12:52:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EBBD919E27CFC; Sat, 29 Mar 2014 16:52:23 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Mar 2014 16:52:22 -0300
Message-Id: <1396122742-27434-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] packagegroup-core-tools-testapps: Move piglit to X11TOOLS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Mar 2014 19:52:28 -0000

piglit currently depends on libx11 for build so is not buildable in
x11-less distros.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d8a7306..08acf6d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -26,7 +26,6 @@ KEXECTOOLS_aarch64 ?= ""
 
 GLTOOLS = "\
     mesa-demos \
-    piglit \
     "
 
 3GTOOLS = "\
@@ -34,6 +33,7 @@ GLTOOLS = "\
     "
 
 X11TOOLS = "\
+    piglit \
     fstests \
     owl-video \
     x11perf \
-- 
1.9.1


