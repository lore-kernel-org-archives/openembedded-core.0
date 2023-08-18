Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B068C05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:48:12 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.9135.1692359289657392332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=je/fr8dj;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692359289; x=1723895289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K1MS+VbTFMWAG+FPeKOpmk19nIRjOUaBAG7ge3UUdXg=;
  b=je/fr8djKTth+pUhq7eA/ZZ45JtNNOnNWul8EXnmQ0yblc0vRwVOZAOz
   n/f3ni5uLY87ZmFQnn/eRMEN+z8DpgfR96YbyT/3LWvFlmb20KDw00c+V
   c9Fzcc7papgNHipB51jShXjk/rgevmQovmMmxSabaKKTgcqREG7MK7Z4A
   gjX89hJuH1TPFUQCh1UabKzngc4GY0Qd8UwRyBCwnjbeVRz52/yPQkG/z
   hzBHyN7dLx5O4lBfd3R6+YH1QOEVAw/IVz+GrWPs073OHQme6BfVoVOL+
   WOJmczcwuPll/vALKGAbolWWMBI1smVHcwhTew9J+s1R2jBFM/2lZDqC7
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,183,1684792800"; 
   d="scan'208";a="32514429"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Aug 2023 13:48:07 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CF1B6280075;
	Fri, 18 Aug 2023 13:48:07 +0200 (CEST)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH] bitbake: fix typos in string literals and comments
Date: Fri, 18 Aug 2023 13:47:55 +0200
Message-Id: <20230818114755.3237201-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186362

Replace 'iff' with 'if'

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 bitbake/lib/bs4/element.py | 4 ++--
 bitbake/lib/ply/yacc.py    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bs4/element.py b/bitbake/lib/bs4/element.py
index 68be42d138..d59be6fa85 100644
--- a/bitbake/lib/bs4/element.py
+++ b/bitbake/lib/bs4/element.py
@@ -1002,7 +1002,7 @@ class Tag(PageElement):
             "'%s' object has no attribute '%s'" % (self.__class__, tag))
 
     def __eq__(self, other):
-        """Returns true iff this tag has the same name, the same attributes,
+        """Returns true if this tag has the same name, the same attributes,
         and the same contents (recursively) as the given tag."""
         if self is other:
             return True
@@ -1019,7 +1019,7 @@ class Tag(PageElement):
         return True
 
     def __ne__(self, other):
-        """Returns true iff this tag is not identical to the other tag,
+        """Returns true if this tag is not identical to the other tag,
         as defined in __eq__."""
         return not self == other
 
diff --git a/bitbake/lib/ply/yacc.py b/bitbake/lib/ply/yacc.py
index 381b50cf0b..5863500571 100644
--- a/bitbake/lib/ply/yacc.py
+++ b/bitbake/lib/ply/yacc.py
@@ -1536,9 +1536,9 @@ class Grammar(object):
         while 1:
             some_change = 0
             for (n,pl) in self.Prodnames.items():
-                # Nonterminal n terminates iff any of its productions terminates.
+                # Nonterminal n terminates if any of its productions terminates.
                 for p in pl:
-                    # Production p terminates iff all of its rhs symbols terminate.
+                    # Production p terminates if all of its rhs symbols terminate.
                     for s in p.prod:
                         if not terminates[s]:
                             # The symbol s does not terminate,
-- 
2.25.1


