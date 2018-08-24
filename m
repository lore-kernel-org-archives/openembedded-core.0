Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2F8A795C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:06:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7O76sRC008248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 00:06:55 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 00:06:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 14:29:24 +0800
Message-ID: <f5dd46d682cbe4663cdd7e9b88010614254e8f88.1535092036.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535092036.git.kai.kang@windriver.com>
References: <cover.1535092036.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: make SSTATE_PRUNE_OBSOLETEWORKDIR could be overwritten
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
X-List-Received-Date: Fri, 24 Aug 2018 07:06:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Define variable SSTATE_PRUNE_OBSOLETEWORKDIR with '?=' in sstate.bbclass,
then it could be overwritten by user configuration.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 084d631523..ecf08fb2d0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1040,7 +1040,7 @@ python sstate_eventhandler() {
         bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
 }
 
-SSTATE_PRUNE_OBSOLETEWORKDIR = "1"
+SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
 
 # Event handler which removes manifests and stamps file for
 # recipes which are no longer reachable in a build where they
-- 
2.18.0


