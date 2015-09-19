Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD8976F58
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 22:43:11 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nJRrb1HRHz3hj9Z;
	Sun, 20 Sep 2015 00:43:10 +0200 (CEST)
X-Auth-Info: csb0jyoGmDPRSjb6GfzH44BmYZPqZadj6lfuJbgBK30=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nJRrZ3zBLzvhTZ;
	Sun, 20 Sep 2015 00:43:10 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Sep 2015 00:43:10 +0200
Message-Id: <1442702597-5619-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442702597-5619-1-git-send-email-marex@denx.de>
References: <1442702597-5619-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 1/8] insane: Add nios2 support
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
X-List-Received-Date: Sat, 19 Sep 2015 22:43:14 -0000

Add support information for the Altera NIOS-II soft processor.

Based on previous work by Walter Goossens <waltergoossens@home.nl>
at https://github.com/wgoossens/meta-nios2 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5c8629a..0882d16 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -86,6 +86,7 @@ def package_qa_get_machine_dict():
                         "mipsel":     ( 8,     0,    0,          True,          32),
                         "mips64":     ( 8,     0,    0,          False,         64),
                         "mips64el":   ( 8,     0,    0,          True,          64),
+                        "nios2":      (113,    0,    0,          True,          32),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
-- 
2.1.4


