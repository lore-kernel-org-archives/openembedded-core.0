Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xc3-0005dU-9E
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:34:28 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fwXEPqK/HSxWenxjJBQ9WsL/JYUbhImM3m5OA2cXNGk=;
	b=F0ly/Z0qji4JAEyPHSquzNOPQHJixoD2RoyL4gwDUXslM5E/gJZ1sEck2/9rgt47QJ
	nXEFNiqOKSzH9l2RUAj6OKknd84ijtUB9ltc7v70DMr5gK/ncJU5E4cQSZITO1W2UN8z
	CAkUp1yztZnJbnVWif57qfv0avaI5wzmAxlwk=
Received: by 10.204.130.215 with SMTP id u23mr4798908bks.8.1317367740782;
	Fri, 30 Sep 2011 00:29:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm3929249bkw.9.2011.09.30.00.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:23 +0200
Message-Id: <f7457ea8882ead3006149cc3943c0d68079d233b.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/13] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Fri, 30 Sep 2011 07:34:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/glx-use-tls.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/glx-use-tls.bbclass

diff --git a/meta/classes/glx-use-tls.bbclass b/meta/classes/glx-use-tls.bbclass
new file mode 100644
index 0000000..7530872
--- /dev/null
+++ b/meta/classes/glx-use-tls.bbclass
@@ -0,0 +1,7 @@
+def get_tls_setting(bb, d):
+    # until we have no prober TLS support in uclibc disable it
+    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
+        return ""
+    return "--enable-glx-tls"
+
+EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.6.1



