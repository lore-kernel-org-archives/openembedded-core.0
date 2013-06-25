Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF00618B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 09:09:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5P999ci014988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 02:09:11 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 25 Jun 2013 02:09:09 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2013 17:08:36 +0800
Message-ID: <1372151316-24566-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH] cleanup-workdir: fix typo
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
X-List-Received-Date: Tue, 25 Jun 2013 09:09:11 -0000
Content-Type: text/plain

Fix typo.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index b2408fc..8e6bc43 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -174,7 +174,7 @@ will be deleted. Be CAUTIOUS.""")
         break
 
     for d in obsolete_dirs:
-        print "Deleleting %s" % d
+        print "Deleting %s" % d
         shutil.rmtree(d, True)
 
     if len(obsolete_dirs):
-- 
1.7.5.4


