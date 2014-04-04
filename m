Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 476586A9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 23:22:17 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so4082573wgg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FxVuUCisXEZpMbZPs8akHOtcZGPkm7DfetfE0yIv5MY=;
	b=WqaWXdVY7rDj5Y293KCaMn5K45hk+VtXrHhop2e8ORn/kIKka73VuSO/wNY82HIT1J
	Y4Op0Z9UMvZ6Jq+nTwQ4EHzmdpuMiV1SDoyjmfwSfLMrSlyt9g1wBz1TTEXKOseSKIH3
	R7fsfen9OPIRULv70cW31uWl6IKC5kvRi0pAbQJja5PZ8IhcCnK/5ncDpSJsdN5noy6C
	LgHLR+6902KL/4FrGIuZjUi7vwKXNquUoJoALTooRw5d/stZtijOEgDNEEPs2KuJXm0s
	0hAsYZPPELz8WgxcSPf2MCddDcQM2IDSC3kja0zXWqCC/laYclmDQVlJz4TMfU5DVx6F
	VQDw==
X-Received: by 10.194.80.7 with SMTP id n7mr23842027wjx.8.1396653738560;
	Fri, 04 Apr 2014 16:22:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm22710003eeq.33.2014.04.04.16.22.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 16:22:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Apr 2014 01:22:19 +0200
Message-Id: <1396653739-32752-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] test-dependencies.sh: Redirect stderr
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
X-List-Received-Date: Fri, 04 Apr 2014 23:22:21 -0000

* newer bitbake is printing some messages to stderr, we want to log
  them as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index ca7e687..d3212c4 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -137,7 +137,7 @@ build_all() {
   OUTPUT1=${OUTPUT_BASE}/${TYPE}_all
   mkdir -p ${OUTPUT1}
   echo "Logs will be stored in ${OUTPUT1} directory"
-  bitbake -k $targets | tee -a ${OUTPUT1}/complete.log
+  bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
 }
 
 build_every_recipe() {
-- 
1.9.1


