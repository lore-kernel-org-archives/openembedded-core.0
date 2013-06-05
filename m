Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C97256A53D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:15:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r552FlCJ015460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 19:15:47 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 19:15:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 10:14:05 +0800
Message-ID: <884eefa29e2c1ae9bc90623e4edfdc2c58a98b4a.1370398286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1370398286.git.liezhi.yang@windriver.com>
References: <cover.1370398286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] multilib.bbclass: fix the PACKAGEFUNCS_append
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
X-List-Received-Date: Wed, 05 Jun 2013 02:15:44 -0000
Content-Type: text/plain

The PACKAGEFUNCS_append = "do_package_qa_multilib" lacks a "space",
which would cause unexpected errors.

[YOCTO #3190]
[YOCTO #4396]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 4dbec73..9337f65 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -103,7 +103,7 @@ python __anonymous () {
     clsextend.map_variable("USERADD_PACKAGES")
 }
 
-PACKAGEFUNCS_append = "do_package_qa_multilib"
+PACKAGEFUNCS_append = " do_package_qa_multilib"
 
 python do_package_qa_multilib() {
 
-- 
1.8.1.2


