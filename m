Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB1DE771CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:46:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0S9kdt4006566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 01:46:39 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 01:46:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 01:46:36 -0800
Message-ID: <91634146b612d3b83a57b7bb4bef944fb2cde167.1453974352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453974352.git.liezhi.yang@windriver.com>
References: <cover.1453974352.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] autotools_stage.bbclass: remove it
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
X-List-Received-Date: Thu, 28 Jan 2016 09:46:45 -0000
Content-Type: text/plain

Not needed any more, the autotools.bbclass can fully instead of it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/autotools_stage.bbclass |    2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta/classes/autotools_stage.bbclass

diff --git a/meta/classes/autotools_stage.bbclass b/meta/classes/autotools_stage.bbclass
deleted file mode 100644
index b3c41e4..0000000
--- a/meta/classes/autotools_stage.bbclass
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit autotools
-
-- 
1.7.9.5


