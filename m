Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD55873166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 15:19:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n129so67199835wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4zCtxXgBw/zQivFYf2ZD4L+JY36etS+7guuNfaSuvfA=;
	b=S62h1RQ8vwzC/BBOKtq7HUr0bikFXG+LaZTG+VS2wcbNV4bdxHajV6+NoFwD/2mQ1E
	24mOxGWHfLo5gimwse78BRt0iQbd1HSc3I2Km63waAMnnuN99yvnmh/8E0g5yqHhuDHH
	9eusH2sGgQQUg6mFlfEd/WNjoIv+ywbr7jVdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4zCtxXgBw/zQivFYf2ZD4L+JY36etS+7guuNfaSuvfA=;
	b=lYLhhWVl1jS5anvVrTH/3b3et33mJUuCGdIg3OLa/xi8aSTF0zGweK/4rKLFdL4Ony
	BnHedjZPwbOttFdyXJey7w32WqWK9fG+P2m3/Z+v5C+tvRKRjvRV3+7+h0EbA7ouLba5
	PaEr6cJH5bkaeL30lCBgxjwC2+rA+i2touuYGsU8lQ5VBHzgMioFPaWLO79wkzInf2Vg
	CyuTpplUWpWj1LUofCQI6/DZJUuB3sKiO3bwIEZbT9BrKM7xREGL/Zw0ouMm8LQsvMYL
	eKiiemYBy0iKPOZQm6x1Fffd+SRQjZGBpOYI4tOwzcuk9u5oP8Ijc6A/tkSA4NDOAdF/
	0fhA==
X-Gm-Message-State: ALyK8tL4kC+n6Yvcv1k2tKF32DTuvpdEUE3qoCVkXoi+iYiTH6imUgSGwUf+w7PqSoBNO7Yb
X-Received: by 10.194.231.196 with SMTP id ti4mr4942710wjc.41.1464189597531;
	Wed, 25 May 2016 08:19:57 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by smtp.gmail.com with ESMTPSA id
	ju3sm9383674wjb.11.2016.05.25.08.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 08:19:56 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 17:19:53 +0200
Message-Id: <1464189593-21117-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.8.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [jethro][PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Wed, 25 May 2016 15:19:57 -0000

Upstream in 5.33 btmgmt was moved from experimental to common READLINE section,
in commit e4f0c5582f1fe3451d5588243adba9de1ed68b80, but this was never updated
in the recipe.

This is a backport from master branch, commit
28777e593d3dd3a5d0ee2effcdca6a971e2887f9.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
index 23c7397..3084a64 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
@@ -10,6 +10,7 @@ NOINST_TOOLS_READLINE ?= " \
     tools/obex-server-tool \
     tools/bluetooth-player \
     tools/obexctl \
+    tools/btmgmt \
 "
 
 # noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
@@ -34,7 +35,6 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/hwdb \
     tools/hcieventmask \
     tools/hcisecfilter \
-    tools/btmgmt \
     tools/btinfo \
     tools/btattach \
     tools/btsnoop \
-- 
2.8.1


