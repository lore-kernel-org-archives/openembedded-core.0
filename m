Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6E65E7FD96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p17so4302586wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nNif5kzkOLQ04/D/O1N+c078N3FG6ur4b4lqRr1eyCk=;
	b=Pg3vaAOCaSWR8JawD9Sn2bDgGxBvaop5T9OMuItK7M8qBMrJdWRqwdc8E9MkIUjFAK
	ZkRjqal/cDmp/qYQowCGDIecggmw8tyi570NRecim9SwPKF02iRqHMOfdk6QvDk4VqCO
	Cnhdfj5MenR/QrSBATBzNsun0XxXstJXAyICfclAsgHFCNmh7YgLgAO+w9FSnM+dKy7i
	reLo7bd32yzEFl7S+bMQ9vqcYp90xdKTx1UF5mJ+yxW23g4XbLgWtg8Dym2/Wc751Fgd
	z8Hs0LezHxDWkwskgIqOFD7a8wYkCGTwOwuo4zhar0vVCqOtY12j1/hfFCfG1J+qTrB3
	lSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nNif5kzkOLQ04/D/O1N+c078N3FG6ur4b4lqRr1eyCk=;
	b=tDsWP/b5L+zvhJUAj4uItEMU9tiD1tNWenad7y6OrjJZXxNd2M+NqbEDncQFxqnbPt
	BO+/PzQrcPHrgOP6XvKoW4O5Oo/oAN9I9c+VgdeV9Qlv3GXXKK4kkE8DZFJc2N+yY+2x
	BS/ul2pVUMiYMt386j6vyWkUt7RahmrhlIouhlm9Pcz+tMD+We8U6EP8dlVvYo6yeuG5
	LhUxG/ZQukhUF7YxscQpN0zc0hEIVRwaL56gSpRPkZKuFgvwaDcnPrEauwkNc7tvyAZz
	pi5FQSay5a9KOdPaIlad1/c77v9vHl2jyzGhFK+CcPkYMbduIoDQ2vI7bF+21/I/MvPG
	+vFg==
X-Gm-Message-State: APjAAAVMLUfeK0jKOZ0bEjsK36XZal+yWvg4CKjIlkI9S6gNIqne5wl6
	mUNPZZrIkJjk7l8nloA9LqVwx1G+0IU=
X-Google-Smtp-Source: APXvYqzmR0HLuEjGICVFGGYJOMOVH7XX1B1lDYxefWs9VlkTkg4cetkwkNbmyKnZOnsZv7CzKAG0kA==
X-Received: by 2002:a05:600c:298:: with SMTP id
	24mr6453207wmk.141.1578601598985; 
	Thu, 09 Jan 2020 12:26:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:18 +0100
Message-Id: <20200109202623.28936-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] insane.bbclass: introduce a warning for mime missing in inherit
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* looking through layers it looks that usage of mime.bbclass is somewhat
  orphaned
* now that update-mime-database is called once only at image creation time,
  costs of mime.bbclass are limited

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f856cf6a2b..442e9e5113 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,6 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
+            mime \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -185,6 +186,17 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[mime] = "package_qa_check_mime"
+def package_qa_check_mime(path, name, d, elf, messages):
+    """
+    Check if package installs mime types to to /usr/share/mime/packages
+    while no inheriting mime.bbclass
+    """
+
+    if d.getVar("mimedir") + "/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
+        package_qa_add_message(messages, "mime", "package contains mime types but does not inhert mime.bbclass: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
+
 def package_qa_check_libdir(d):
     """
     Check for wrong library installation paths. For instance, catch
-- 
2.21.0


