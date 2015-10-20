Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96706770CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9K9Pr03017328
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:25:54 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 20 Oct 2015 02:25:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 02:25:50 -0700
Message-ID: <3308987e7fd99e5ebf9e812966c5cf3719ce2271.1445333081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1445333081.git.liezhi.yang@windriver.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] prserv.bbclass: remove it since it is null
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
X-List-Received-Date: Tue, 20 Oct 2015 09:25:56 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |    1 -
 meta/classes/prserv.bbclass  |    2 --
 2 files changed, 3 deletions(-)
 delete mode 100644 meta/classes/prserv.bbclass

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09230b5..a86b680 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -39,7 +39,6 @@
 #    packaging steps
 
 inherit packagedata
-inherit prserv
 inherit chrpath
 
 # Need the package_qa_handle_error() in insane.bbclass
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
deleted file mode 100644
index 139597f..0000000
--- a/meta/classes/prserv.bbclass
+++ /dev/null
@@ -1,2 +0,0 @@
-
-
-- 
1.7.9.5


