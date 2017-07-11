Return-Path: <lans.zhang2008@gmail.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9055B71AB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:43:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6B4h9HB025546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:43:10 -0700 (PDT)
Received: from pek-jzhang0-d2.wrs.com (128.224.162.208) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 10 Jul 2017 21:43:08 -0700
From: Jia Zhang <lans.zhang2008@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 12:43:02 +0800
Message-ID: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
X-Mailer: git-send-email 2.7.5
MIME-Version: 1.0
Cc: Lans Zhang <jia.zhang@windriver.com>
Subject: [PATCH 1/2] gpg_sign.py: fix overwriting the RPM macro __gpg in a wrong way
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
X-List-Received-Date: Tue, 11 Jul 2017 04:43:09 -0000
Content-Type: text/plain

From: Lans Zhang <jia.zhang@windriver.com>

The RPM macro used in --define option should not be prefixed by %%.

Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
---
 meta/lib/oe/gpg_sign.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 7ce767e..c53df54 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -36,7 +36,7 @@ class LocalSigner(object):
             gpg_args += ' --pinentry-mode=loopback'
         cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
         if self.gpg_bin:
-            cmd += "--define '%%__gpg %s' " % self.gpg_bin
+            cmd += "--define '__gpg %s' " % self.gpg_bin
         if self.gpg_path:
             cmd += "--define '_gpg_path %s' " % self.gpg_path
 
-- 
2.7.5


