Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7041973CF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 00:05:54 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nKjb60PKrz3hjQL;
	Tue, 22 Sep 2015 02:05:53 +0200 (CEST)
X-Auth-Info: BcWcp1zd31MCQDwVWaBxXNoDF2pLXWbR8OTo3UgZKIk=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nKjb52m33zvdWt;
	Tue, 22 Sep 2015 02:05:53 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 02:05:49 +0200
Message-Id: <1442880349-6206-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0LbcO+Wz8=GwYKbM+6WiVaeOVqZo6iPo+gpErg1V0NH_LQ@mail.gmail.com>
References: <CAJTo0LbcO+Wz8=GwYKbM+6WiVaeOVqZo6iPo+gpErg1V0NH_LQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH] openssl: Add mapping for nios2
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
X-List-Received-Date: Tue, 22 Sep 2015 00:05:57 -0000

Map nios2 architecture to linux-generic32 target.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 53dcfd9..8af423f 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -118,7 +118,7 @@ do_configure () {
         linux-*-mips64)
                target=linux-mips
                 ;;
-	linux-microblaze*)
+	linux-microblaze*|linux-nios2*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
-- 
2.1.4


