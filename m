Received: from mail-ye0-f171.google.com ([209.85.213.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U78bZ-000770-DA
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 19:05:23 +0100
Received: by mail-ye0-f171.google.com with SMTP id m8so894710yen.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+59q4I+YAybH1DwSoFShApqobKHOC644SikaKBZ/YT0=;
	b=uR/m7ycswYX7h2D+V22okvmVgGbl2NPGFxyPKjHqzwn66tlGLjWv50nVGpZ+EQytXe
	IahSrbGVFyUhCAR7teSTWuGPhacrOzr9hPFMdkdeiDE+z6T0bQ5Xdg4D6cbfq/6GWEMt
	z/jSJn58TP8PYP1cqzdmu1E5N4wQoHwOqpvfoJZAPZr4tyCWFIidWXfmxRBJZLknnvk9
	txtt2zGeWlnwOnHIrFvB2SumJ3S4dd9OFj9C1EvTE6Qtt8LbDcdFSLRPc7SQT9eggEos
	5OgsS37US2Mmq+XZVIemaaCbOWReqenJ5hvZy23n/T6kMmBphM7cBkZM1z8A5zhI32A7
	56bg==
X-Received: by 10.236.149.8 with SMTP id w8mr15711124yhj.71.1361123322321;
	Sun, 17 Feb 2013 09:48:42 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id j1sm108579298yhn.3.2013.02.17.09.48.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 09:48:41 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 14:53:11 -0300
Message-Id: <1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 4/5] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
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
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index cfc6fd8..d7ce8dc 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
+DEPENDS = "nativesdk-zlib nativesdk-dbus ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '', d)} qt4-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-- 
1.8.1



