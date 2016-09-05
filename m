Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2553B773BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 16:28:48 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x187so3347984vkx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 09:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=IVICfvITZMcV3PRY7RZ7xkx2pENTYEYvQWxwOiAqTyE=;
	b=LYsuZtdKcasRfWqd18xkge0sIOrNh49n0F/zloI/9c9yMEJFI9ET8UzU4PM1XOe0Wp
	o06QvQIayHVqihliwkwvcN6wJ+nBfKFczhrJEcjAlvXIZF5nou6tVTTdvGrnrQ5XRI4i
	raIZXHLcptipDVdKNBPHAjIbVEefpKNwgetHXf1M2+X6AdM33zueS1euMLppFLb/hGvu
	NODqPAmfxhDMEKD/gGspFqRVaCYqh/0kk8aTtzefr6Dkoo/LDJsIhsE2eiAYNFnV5sUz
	taIJuytUBif9ha6QKrCD7bXjvlZhOmKDR9yCEch8YNRSVDRdYHpO949w6ysnOZZlFwLV
	3cWA==
X-Gm-Message-State: AE9vXwNJ+j3XMl/BH8JAibWBsA4gOJHpyx1Dwtg+Ml8D0aLhHbIPM9oAcRYIs7NQtHslfA==
X-Received: by 10.31.56.201 with SMTP id f192mr23040726vka.6.1473092929363;
	Mon, 05 Sep 2016 09:28:49 -0700 (PDT)
Received: from localhost ([179.105.254.222])
	by smtp.gmail.com with ESMTPSA id d6sm4305993vka.3.2016.09.05.09.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 09:28:48 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 05 Sep 2016 13:28:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  5 Sep 2016 13:28:43 -0300
Message-Id: <20160905162843.30209-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lttng-modules: Bump to 6e4fc6f3 revision
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
X-List-Received-Date: Mon, 05 Sep 2016 16:28:49 -0000

This moves the recipe to the tip of stable-2.8 branch which allows the
use of Linux 4.8 while keep us on a stable release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 96bd945..6d596a4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
 
 inherit module
 
-SRCREV = "e36de50dd09527901339797a61a0a40d241c1a6d"
+SRCREV = "6e4fc6f36d68fb3c8d40113f8670eb6e9c8ffd76"
 PV = "2.8.0+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=master"
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.8"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.9.3


