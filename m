Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6pMx-0002KB-Pv
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 22:32:28 +0100
Received: by mail-gg0-f180.google.com with SMTP id e5so336325ggk.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=buQT9FjuXiIju5M+D14lmW/JyfCalkt80RvFJG2FxBk=;
	b=qNVs0InVMk1oPhCJU87BrlWvJtxmQbI8DDz3FlqTKhthmGHikZr1oARi3HzPsMKz7G
	/dSTGf0ke/bAayTsoVHFkN7qY9lyJwIcY8dPxv4DIJRo5h8r9d3OvW67CX6r6VBxz8y3
	kBB/5Yk6oFUo3H0qMnZwi+ipdCeIHYZ8DlALiQDjaY5RErGG+7nKznMKV12zpJj7IXk+
	DHowL6nfUPHpX45hnrm1Tw2HQ4JoCpEcLLcBZ0JAsNOSI/Vm89VhEZHeYw0+95jScu0d
	zsA5R/psJ5zXZsist5hLIkfHUMnP8mo65jv8sJRdAdaCOJci2lWatVUT2jVh4XzcBeds
	RZNA==
X-Received: by 10.236.149.162 with SMTP id x22mr10543560yhj.37.1361049381971; 
	Sat, 16 Feb 2013 13:16:21 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x16sm100839942yhj.6.2013.02.16.13.16.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 13:16:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 19:20:42 -0200
Message-Id: <1361049644-27904-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] dbus: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Sat, 16 Feb 2013 21:32:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/dbus/dbus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 292ab29..cebab28 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 X11DEPENDS = "virtual/libx11 libsm"
 DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native = "expat-native virtual/libintl-native"
-DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
+DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
 RDEPENDS_class-native = ""
 
-- 
1.8.1



