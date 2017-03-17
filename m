Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 83A3E71E52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 23:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3DE5220BAC;
	Fri, 17 Mar 2017 23:24:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id J7pamvxMlhMj; Fri, 17 Mar 2017 23:24:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 02675208FB;
	Fri, 17 Mar 2017 23:24:04 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7E3A31623AA;
	Fri, 17 Mar 2017 19:24:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 19:24:00 -0400
Message-Id: <1489793040-52384-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>, Christos Zoulas <christos@zoulas.com>
Subject: [morty][PATCH] file: update SRCREV for 5.28 to fix fetch fail on missing commit
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
X-List-Received-Date: Fri, 17 Mar 2017 23:24:08 -0000

From: Paul Gortmaker <paul.gortmaker@windriver.com>

Machines that cloned a while ago will have the commit, but new
deployments won't because it seems the upstream changed/rebased
and the old commit ID has been garbage-collected away.  Hence
the fetch fails to check out the named commit ID.

Both the old (gone) commit, and the "new" commit show the same
dates and commit log and point at 5.28, so hopefully this is
the right thing to do.  A git diff of the two seems to only show
a blanket uprev of CVS tags and deletion of a couple autogen'd
files, and no real source changes.

(From OE-Core rev: adb71e06768adadda7b69c3b5e81ca3ad67237f4)

Cc: Christos Zoulas <christos@zoulas.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-devtools/file/file_5.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.28.bb b/meta/recipes-devtools/file/file_5.28.bb
index e64a89c..048fb8e 100644
--- a/meta/recipes-devtools/file/file_5.28.bb
+++ b/meta/recipes-devtools/file/file_5.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"
+SRCREV = "acbaf156236cbc54b3cf3bc6cbf05d80cb196451"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


