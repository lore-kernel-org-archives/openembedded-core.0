Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B480B731F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 15:56:58 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so112637002wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=gZqKRzhokNXWFEqNeZKX5SxUsA+yVpqP5/B/IxHs7no=;
	b=PBGujjQJ8sZ19XMEgm8zo0QjLs3yUK1SrAl61k3qjTeAj9qegEhJz8tqKjPmJN8rDI
	a8TT3MYqlNzXheIpm2m5ETAcROtYs4FNl+GVJlLgu5yADEqJCKqaz4fY4JMYBSqUCDdg
	kkXmBmpNx0ucVlr5xqYtZxqlvMFLUqhBKMtdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gZqKRzhokNXWFEqNeZKX5SxUsA+yVpqP5/B/IxHs7no=;
	b=d8p3c5hOaVJC3aeBeufl+yRQz3CYxpQJkw2SU+/JXlMya9enp4aXus2s2Vd86gR4/6
	GZt8Z+m8ghcUjEYPyHXrlCpRKJyJ4btVxbEh+JzlVbxqDOJOM3bx3O9s2T8bT5vMOGCg
	fROZLItKc6SiZc6IXQCRWh3ayBM8ENHS4QIELO50bltz/L3jHePCYxFwhNOjGX3+OD7K
	L6n0gpCyJubT/Fowh0OF9u/bBPkn/1QrPbk9cmg24f6toCoUfSxi4PostwA2TSnalbbP
	6kO8uVldiuTaqjleg6dsN2vRqnSYABMlBVmt6tNzF9kzsteyIVdFRtF76gJGV9WKlEDE
	tZFw==
X-Gm-Message-State: AOPr4FUYNxNFlU6e3PKUIX9cFG/KmpNuXs4FRslWJGfZ33/SMWdB9Ck2xFKX7YZd4xiSO74R
X-Received: by 10.28.154.2 with SMTP id c2mr20281600wme.9.1462204618855;
	Mon, 02 May 2016 08:56:58 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by smtp.gmail.com with ESMTPSA id
	xt9sm31057029wjb.17.2016.05.02.08.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 08:56:57 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 17:56:32 +0200
Message-Id: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.8.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Mon, 02 May 2016 15:57:00 -0000

Upstream in 5.33 btmgmt was moved from experimental to common READLINE section,
in commit e4f0c5582f1fe3451d5588243adba9de1ed68b80, but this was never updated
in the recipe.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
index db20f79..d7a9940 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
@@ -13,6 +13,7 @@ NOINST_TOOLS_READLINE ?= " \
     tools/obex-server-tool \
     tools/bluetooth-player \
     tools/obexctl \
+    tools/btmgmt \
 "
 
 # noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
@@ -37,7 +38,6 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/hwdb \
     tools/hcieventmask \
     tools/hcisecfilter \
-    tools/btmgmt \
     tools/btinfo \
     tools/btattach \
     tools/btsnoop \
-- 
2.8.1


