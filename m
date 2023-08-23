Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FA0EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:08:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8112.1692785298453408071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lkMW5FRl;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1692785298;
  x=1724321298;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S4fQUf7L0TB1IjE79zMUN7mScnIO061Na7ZbC76WyJU=;
  b=lkMW5FRlak07+NdOadpr56s9g+0lYTXlDsK2u+UNSObG/1ta3SCdiO9f
   CpU7UgpYrjdbeOfYIYbCnVokqhopHaO3uF4TS0sbK7t3ryrzWLYu7qrbj
   AaTLxNqShwLLOj/PkNVHyLGyO/rXuUZySzVQ/xlXPylhF6VZ8WYH3mQKI
   ugn7E6syV5ELQrLTcNlXMCzFyBy07U+XlvEkDxfFxBiVufnFF0AoyRG4x
   Ks0Dd6rJsZdAfUhQ41+3m+soUprytC6/eMR9DBf+c2iff4B7a2U2p7RjP
   MkFkbSYGjA8CLO3hu4/TLq5B9nk5vHgUoZ3zduiQEWQ3/scdyDuaxvCEN
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] insane.bbclass: Remove an unused variable
Date: Wed, 23 Aug 2023 12:08:14 +0200
Message-ID: <20230823100814.3999159-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186566

The use of coremeta_path was removed with commit 61a881fdbe (insane:
Improve patch-status layer filtering) when the patch-status QA test was
generalized.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 960dfc8924..2e53778934 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1342,7 +1342,6 @@ python do_qa_patch() {
     import re
     from oe import patch
 
-    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 

