Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5698B78170
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 06:45:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c24so6074304pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 23:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7i73zzW+1n+gRqlC7JdWP+HKf8bvnU3xH5uiP4DYRO8=;
	b=uzeNIA3e2sD48FOdwQQV3hP3zliC9CTbfCIK0gxP4MgiGdBI1fe6k+W+QvbJ1s7a/G
	VH5yUFBeW5e35H/54DWO0nnzx8uGDFFuMlrzdtIzJvYYk8nFIeM+qB6WA3ikkyqPMyif
	rhGpbZwFAmL7+7OcpJ9Sn4t/VKSEw9DMPUWSz1NiEvgbTXIU5ojIkmwH37PObCUhW3GV
	MkIoAAhPYwmRZchDznV456Q303B79J6nlKKVYt9+3ssrIpidhHp7uLOMKXrJrwPihkim
	aKxb4Q5vwnT3RDHlq9mzP6HomPGyMya2NoOKbjxQFMhuGT90x6kc74k6BelxEJNeiLi/
	dXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7i73zzW+1n+gRqlC7JdWP+HKf8bvnU3xH5uiP4DYRO8=;
	b=prycUkU2glhVgixe5c2O5fjRT/ukewqHaU9x70rAK4TG8ON9DJb8GR9XJ+woWKnB/g
	ughtsiHceb0Z7e+2gw6QvqqyofIBcPz8b39ammeyI5X/K9E7YxfRpXNFtx/ulV3vgQtx
	iyLF7xhkTd2OUb+sXi4syIwr0GwE/JBKdIwDjOjBuiwRFZgNTixijzxylG6sKNtfkHd8
	+UiFqe8ST59r6x6cCJDj6a64+Bj1h67WcWJap8qlG3gthSn6O+0UZlEII7Ler3xcxCF0
	reVX7+JCrz/naiEunqMS0p+v+2P9uyldkX0NS8aIUxHSOkip9t1CEtV1CfGpPJgLZOLP
	irNQ==
X-Gm-Message-State: AIVw113UPnLWfbDDJ3FMeTk/Y0S9law+EFTnJbUv2ZWbyS5cxDa9OY65
	tzheuKz9rFUxPO4+
X-Received: by 10.84.210.130 with SMTP id a2mr8370938pli.301.1499928336910;
	Wed, 12 Jul 2017 23:45:36 -0700 (PDT)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	d89sm11544691pfl.7.2017.07.12.23.45.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Jul 2017 23:45:36 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 06:45:30 +0000
Message-Id: <1499928330-72330-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ethtool: Upgrade to 4.11
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
X-List-Received-Date: Thu, 13 Jul 2017 06:45:45 -0000

Restore SRC_URI address

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.8.bb => ethtool_4.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.8.bb => ethtool_4.11.bb} (81%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.8.bb b/meta/recipes-extended/ethtool/ethtool_4.11.bb
similarity index 81%
rename from meta/recipes-extended/ethtool/ethtool_4.8.bb
rename to meta/recipes-extended/ethtool/ethtool_4.11.bb
index afaf2e2..befe9b9 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.11.bb
@@ -6,13 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
-SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/ethtool-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "28c4a4d85c33f573c49ff6d81ec094fd"
-SRC_URI[sha256sum] = "1bd82ebe3d41de1b7b0d8f4fb18a8e8466fba934c952bc5c5002836ffa8bb606"
+SRC_URI[md5sum] = "8f1072679888c9335e49b17efb798b4c"
+SRC_URI[sha256sum] = "af2fd9692f3159d3ab1e41e6f9b7d8db2a4693f1cb22348c88ba89f70f0e6503"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


