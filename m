Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 10C37601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 05:10:58 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e127so23619071pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 21:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KhpwGdRJC4iI2v2tUj3XmcsWSFv22+5s/jlwCBFNWfk=;
	b=luqmaia0m92/1J9IqpWpi77Gwt0bo3297UdZk3Zrw5emvnEgCfXRULsIbQ9dnFZyZG
	OeHkbxhnoG0DKvhxWBfiV7eIAMwgsyA9Epdf3i4DsU14IeYtW+KHFzogU01N6Si+LJMH
	qtVP+JpcuzVyciKRqohscXIUx2FVjsbJnYsHRvlRujdEC9l4XSm9jdPVPDsiCGfPdsZ+
	f1+2RwljzIF6N9Dzh1RjcrX7xJdAfWehjekJxiZEydtjqbM8CPMn8sMANzV1K1Lk+EHs
	4JmwYqRFX0WXHyg8sLgEbUdp2C6RpoA2/SPOgxOcsVGVGGTD4yUNsHmmd9yCFtOturax
	AhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KhpwGdRJC4iI2v2tUj3XmcsWSFv22+5s/jlwCBFNWfk=;
	b=mgfkwvEEgtib3TzMxBZSEfWcPvKQhlCFCEN0aqdp5aoV/SqUjKAyiVm5XZmEWQjX9t
	Sd+riSur73WLT8w+YdzRtdjO4hSfP62a/eQarpJyUnIQvHHQZs11grSqoYQhHLl5mJm9
	h7mtGbepggu/afSbOjJblpGPwOkatJPxQfgA56lhIu6IQlcns059YSlPQGptndP/ggZp
	9Kl/Bs7twZYm4VsRVOPsglFAg8VUPB7WFlUOQlas37HT7QbJV1ipgqz8Z9RCLKdJjHmw
	CKbsDHYMRLfew3svzNEg33r8JmMEfwgxtBuVk41cP+NDqeP4618eNlNRzPBhF/nVn3Dn
	LFsA==
X-Gm-Message-State: AG10YOQ5yb8KqbL5te7mmw6ppACSMBPTtJTNx1RCQw35GZPHzO0ASyjaGe6nIEM4wgZbPA==
X-Received: by 10.98.89.215 with SMTP id k84mr64228349pfj.66.1455167459143;
	Wed, 10 Feb 2016 21:10:59 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id z5sm8768198pas.29.2016.02.10.21.10.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 21:10:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 21:10:52 -0800
Message-Id: <1455167452-4244-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] db: update HOMEPAGE
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
X-List-Received-Date: Thu, 11 Feb 2016 05:10:59 -0000

The previous HOMEPAGE is no longer available.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 meta/recipes-support/db/db_6.0.30.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 3dc1da5..c724f04 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -10,7 +10,7 @@
 # same system at the same time if really necessary.
 SECTION = "libs"
 SUMMARY = "Berkeley Database v5"
-HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
+HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index eac84b8..9505def 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -10,7 +10,7 @@
 # same system at the same time if really necessary.
 SECTION = "libs"
 SUMMARY = "Berkeley Database v6"
-HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
+HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html"
 LICENSE = "AGPL-3.0"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
-- 
1.9.1


