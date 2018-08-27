Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0241A78F7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:38:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 207-v6so7448018wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZVfYfqQVUMI9rwLanXUK7qylhD/sMwu20Vq8wxX3MC8=;
	b=uUBiQPETy2kHCrm2Dyawid8sUFCpMlqKdVkDw8utYXbJYivnXwwfCYFpVUmZ/lP7Kh
	BxbkQjDb9AeaQff9a+eZMMSq/27VkGpkf3WmVy475wSy2eD6cVhbvnpoe6gSZlnTTvnS
	ejOJ5LztQFdqMr54PiVCGt8kf9sPao9QtqkyQYwxWkNOUAfbd7WBqFqZVVKsJ9fL/YmQ
	LJRMvwmI3uUS8cxGYQQtbJ+5ddv2ud1ahnRPb6yZJwGm36gIze1GzYnnqpje+td7t6PO
	cmcQXh9zqXN3Cprseu3ThuP2PkagQEnZA+UiHHz6XMbVxEzKkrpjFbkKcIAGlprBtRAG
	evAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZVfYfqQVUMI9rwLanXUK7qylhD/sMwu20Vq8wxX3MC8=;
	b=VPmgOSQjnS4eP9vW70s0zX53xniDCgL2TazwCLTE4rdYWdQCGaCLjFezO8CEK/EZsc
	6q7Aaobqd6foXaHn9rky+YS94qrtgnbWGtvBbiwvahEYzJOWSIo6qpkLskU5+koR4Uae
	udnjyhGE9aE2GpL+9nriT9k0nh32UkYNqKS3XLnrElqB4UL6efVPIOTS0HlOO+76zI5T
	JfeafCFJsZ+qAPc8QMa3JW5UiNpKRUxubh9C/8sZmHsw5G79GAYWWPG6SpMNtvtYREvS
	VBHoHH/CGw2+FXqYE3Q9hU4NlLHc67e5STlgCitRatu79QrXjtAwrGE3UoBK6ERso7rn
	vfmw==
X-Gm-Message-State: APzg51D+/iukWdTJKIY9d+5ksS1IG9dvNVIbu47dWwlAEDdK7oKAnY/0
	nnagMpx9L5JfntR/nzPE+nOOTH/1/EY=
X-Google-Smtp-Source: ANB0VdbYnCgspyQuzKDwoxWeCKRMGQs/DWdMQL/WcGGGogHvm8XrS30CrwdH2iFHSvqRXzx4I16GxQ==
X-Received: by 2002:a1c:be14:: with SMTP id
	o20-v6mr5115607wmf.73.1535359128414; 
	Mon, 27 Aug 2018 01:38:48 -0700 (PDT)
Received: from localhost.localdomain ([80.215.33.180])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm15856607wmm.0.2018.08.27.01.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Aug 2018 01:38:47 -0700 (PDT)
From: vincent.prince.fr@gmail.com
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon, 27 Aug 2018 10:38:40 +0200
Message-Id: <1535359120-26088-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][for-sumo][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Mon, 27 Aug 2018 08:38:48 -0000

From: Junil Kim <logyourself@gmail.com>

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index abe015d..f4033f7 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
-- 
2.7.4


