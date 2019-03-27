Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7CC360125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 12:59:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z11so16176763wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ke6LSH+CyB3Bm/u381j9hKq80LSUnq/dSJcKHQiOCR4=;
	b=OAbFVxtoH/lLTYMxmJOHxpVfFRmDYNUd5ZbCQC5lLSpM+wZHKVT1qU0f72jh3cxAQU
	SDdXPQR8lbnKbhPHoDNpNLxp0FvDqhe4fQ+fZTdJAS8kUmJDKz6Yj6zXrCxzP+IMYGwG
	/dCiyhatjoc+RHrxy6AmVNz0v18EMtjHToBY8D1sSFrbAX7gsMpRwy5R6UOON5CmGI2V
	YOG8aMRntbmYIWyLMrr2DSLnAKfFOea7CVLccI/WikodtjCTLS/cwpQH3MSMxOdwTiir
	n72fYEVBUZRx5+fUEoVmybOY8fp9OsBCPbsb/sJGaqxb8ppxQMVWBbx9f93ws+gKrK3Q
	qupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ke6LSH+CyB3Bm/u381j9hKq80LSUnq/dSJcKHQiOCR4=;
	b=Q3U3LNUsloZ1JvNy62iMGc4st9EorRaUmHQxa6P0DkXj0eXIlKXV4dl2KL7lwYGGLR
	bqzYJ39ENUae9t45tLFIbvZVKR8Vq3USXfF8kxSXmHqM84KSG/jmHxdmNkGULuSjrzGJ
	QetsUpTTDDQ9FEc+xHkdgX/fdoph97bIXfl1pQaB9khd6kSEl3FOeg0LenuWY+OULMJ3
	BbibkCPjxbJ6vZ0OpynGuaOAwQniKC2mpLRrClpEc4gXj3DdKy1IgFvnZ5aFdbfoCBnf
	1C8FauWtNQiZZFtkUZF/U1raFtCnOcYqEuZ8fGat5a3qWUAPdxR7krUfDdNF9iKO2Qou
	i30w==
X-Gm-Message-State: APjAAAX3jWoRmOH+GtYSANPJmPDD3E7CHgjtje6YAZWws8t+qVejQ8CX
	duNyqgY6wAdmJBmTKwEBJeOf434W
X-Google-Smtp-Source: APXvYqxyyhTTBj1OFy/Z5EMM4LKFSZIExfNY+VZLOstwQ1LUUNfSODMLyTiZFnZXIuofdo6r3ZkLjg==
X-Received: by 2002:a1c:7611:: with SMTP id r17mr5267212wmc.98.1553691567227; 
	Wed, 27 Mar 2019 05:59:27 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.2.55])
	by smtp.gmail.com with ESMTPSA id
	x14sm12419412wmj.3.2019.03.27.05.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Mar 2019 05:59:26 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 13:59:23 +0100
Message-Id: <1553691563-28778-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Wed, 27 Mar 2019 12:59:27 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 60499f7..85472a8 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -20,6 +20,7 @@ DUMMYPROVIDES = "\
     libxml-parser-perl \
     perl-module-bytes \
     perl-module-carp \
+    perl-module-config \
     perl-module-constant \
     perl-module-data-dumper \
     perl-module-errno \
@@ -35,10 +36,12 @@ DUMMYPROVIDES = "\
     perl-module-getopt-long \
     perl-module-io-file \
     perl-module-overload \
+    perl-module-overloading \
     perl-module-posix \
     perl-module-thread-queue \
     perl-module-threads \
     perl-module-warnings \
+    perl-module-warnings-register \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-- 
2.7.4


