Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7D617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:08:39 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so8602565wes.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xM0SjFw/2rF/T/gz/wp4fJ1Pmc/2u0fTlmtbG3t9wfI=;
	b=GpENK7RW72vFCpyvVN+P9bJaarihb2SAnm076wiPLSNjrzxS/qOS8XbO0tCChKOzZ4
	32C8EpTbYz8EAOsWzVa/aSi2nSGZpoRl8QDaDYZDH6OYjyGxkSzvElNuL3jDPU4r2UA/
	Q99bXK2isQ5Ap+mcNHbfxHLYmPq6UuzBtTwHKq57KsXHOvplZA9BRWZ7+By2LARRycl7
	4yX5NzB6m+ZGqXMJidm52DOg7akmWephgotNdcj8JULe6vfuA4TtfG1PgyvFH+fh9ONN
	sx2STMS2vY7lBxrFjqRhrUQe6iiGCcjYNhJZkuQZvNN3VTkWs1/DVM2lUYvk1Kxk1eNW
	4BCA==
X-Received: by 10.194.71.11 with SMTP id q11mr11658852wju.33.1407766120671;
	Mon, 11 Aug 2014 07:08:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm1867468wjd.30.2014.08.11.07.08.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 07:08:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 16:09:13 +0200
Message-Id: <1407766153-19712-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
References: <3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
Subject: [PATCH] SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts
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
X-List-Received-Date: Mon, 11 Aug 2014 14:08:49 -0000

* update-rc.d now adds initscripts dependency even to allarch recipes
  making them effectively TUNE_PKGARCH, "fix" it by excluding
  initscripts from all signatures

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 18609dd..6b0f806 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -30,4 +30,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   udev-extraconf \
   packagegroup-x11-xserver \
   systemd-serialgetty \
+  initscripts \
 "
-- 
2.0.4


