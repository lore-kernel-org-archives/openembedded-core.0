Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0175D60721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 15:19:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n129so67165687wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NgmWwPHaSZJRc5EFCP0rkfzASiEFxnWWLIAn1A7rqWo=;
	b=h71WZzM6isNJrqECgB6lqkFxWsvubAfvyh3liKRnEUuD0pWk24QM/ZUOj8vFkGfjrh
	iWMPLbt8cvswzgTx/J1ClJBAdzp9iebFhStoS12wGbH/fnp6eiOXbce0RviKZV8eunN9
	kWrRkJ1JfqKX7f8yTGfTLgvaowEs4R+AFZZUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NgmWwPHaSZJRc5EFCP0rkfzASiEFxnWWLIAn1A7rqWo=;
	b=CyjjgllsnJGjpzlBTuKvMA3t4YS+mhERdIfbwVqRBOEtFSt7viexggfBvFofcVD7Jr
	ZOt48TdKo0F970i54BbRphICl5QCRzoS+3f0iZnh8SCw0V3PZL905utMBt1P0R0Vm3U3
	yAe7e/DTQaLMZlZ7K9wb8OhD07GWDu32DtFo1Vb3bgS39hyByE9IVta9QdafH92dIjLh
	C72xv54EehixAu2k2AoI66QUhRZqllerfxH1Y64iUT0X+muoeq5KuU1h3N/baA3UGG7K
	wG4+F2lWFCpYmUNL57Bvp1RPf6pG3w4wulgarX5Ev96nBDWdgZEXWXpjjRfWuISFyAED
	CWZw==
X-Gm-Message-State: ALyK8tJlIr49JMqj/sD1dARNcJuL+jprWjQNIKQHfD8GJwe9KGdQG1O6Rz7GIkWbgpQ7RbyR
X-Received: by 10.28.31.68 with SMTP id f65mr3957397wmf.45.1464189543769;
	Wed, 25 May 2016 08:19:03 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by smtp.gmail.com with ESMTPSA id
	q76sm25373166wmd.6.2016.05.25.08.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 08:19:02 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 17:18:01 +0200
Message-Id: <1464189481-20683-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.8.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [krogoth][PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Wed, 25 May 2016 15:19:04 -0000

Upstream in 5.33 btmgmt was moved from experimental to common READLINE section,
in commit e4f0c5582f1fe3451d5588243adba9de1ed68b80, but this was never updated
in the recipe.

This is a backport from master branch, commit
28777e593d3dd3a5d0ee2effcdca6a971e2887f9.

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


