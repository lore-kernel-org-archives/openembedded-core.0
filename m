Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpNpq-0003k9-F0
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:09:54 +0200
Received: by ggnp4 with SMTP id p4so2530179ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 10:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9GlI7toUpyr9m9sgJz8YoTrMBQ1WNHUewbJo9yvv+bA=;
	b=GJ6kq3EMGMFKbatuY/ZAbv5QT3EQk5pthWxfuhIzLLA2IGEL3++vk4Rkxe5kAplHWL
	VBP8Vj5BWfcrV5aUnnIR9ZVsqXifWAo0UhlZGvfvz11m79YuQRPXjrm1jS+RCQTHkm2r
	17RhptVIlpwUFfStl3ESZTDBGaahnwhaeWTLns8IG1OctMveVF7GkPNeqGLq1qZ2+e/A
	/unm8Tgnwv5ytWJXfaltryxNfpAwUK2xalQZjOMZuIx5LzUey/nUU7l9MAxVGxYYVsPS
	yCpJ3T7vhnqIP8cJLKthwTBs440DUlQbwo6/IUpTV/jAu6WtvGAxPg6rKY/h7eysn4E4
	kJqw==
Received: by 10.50.89.199 with SMTP id bq7mr8473515igb.52.1342115920537;
	Thu, 12 Jul 2012 10:58:40 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id dw5sm12369igc.6.2012.07.12.10.58.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 10:58:39 -0700 (PDT)
From: andrei@gherzan.ro
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 20:58:29 +0300
Message-Id: <16418209b96e9a5d79efe74290d13a67c9aed91f.1342115559.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342115559.git.andrei@gherzan.ro>
References: <cover.1342115559.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmY3B//XFr1dv8ZBEyZW0q3eEG1FiepvAp6EG+PMbKF1R8Z28U+FEOp94dRWHMf+SGzziug
Subject: [PATCH 1/2] connman: Update to version 1.3
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
X-List-Received-Date: Thu, 12 Jul 2012 18:09:54 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)

diff --git a/meta/recipes-connectivity/connman/connman_1.0.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
similarity index 82%
rename from meta/recipes-connectivity/connman/connman_1.0.bb
rename to meta/recipes-connectivity/connman/connman_1.3.bb
index 926d22e..1e3d138 100644
--- a/meta/recipes-connectivity/connman/connman_1.0.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -1,7 +1,7 @@
 require connman.inc
 
-# 1.0 tag
-SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
+# 1.3 tag
+SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-- 
1.7.9.5



