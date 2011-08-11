Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0m-0005kr-7Y
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:44 +0200
Received: by ywe9 with SMTP id 9so1520703ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dZYxvDNpe+OP15rAXZMP7PtJEz/DrooHg4OqpvoQGyo=;
	b=BISz6l917TTE/rEXjQUO+2AaDMYO3uIAT+vgI2ba7JnVAl1QIq+kQEMVOw04Ui9tTf
	0RrCoSdAHnYIsD1Xwnps2PfBmfQaiCfiG1vY0FzA2nMzOUvDCpw+4u96EA2g6ZXYTXVj
	avGfmnMvfUgQrL61hpNl/8gRdRVUdzBvNG20w=
Received: by 10.151.122.13 with SMTP id z13mr672124ybm.269.1313087111876;
	Thu, 11 Aug 2011 11:25:11 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:50 -0700
Message-Id: <98dc6c460de3a807b0f927e915ff7590bc51480e.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/7] nativesdk: inherit relocatable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 18:29:44 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/nativesdk.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 152d053..a495555 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -1,3 +1,5 @@
+inherit relocatable
+
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
-- 
1.7.4.1



