Return-Path: <gthomas@mlbassoc.com>
X-Greylist: delayed 326 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 May 2017 09:14:47 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 601A677E98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 09:14:47 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id C46DB68A019; Thu, 18 May 2017 10:09:21 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 476CA68A019;
	Thu, 18 May 2017 10:09:21 +0100 (BST)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 907FD67402EF; Thu, 18 May 2017 11:09:19 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 11:09:15 +0200
Message-Id: <1495098555-17751-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.7.4
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] openssh: Remove deprecated sshd option
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
X-List-Received-Date: Thu, 18 May 2017 09:14:48 -0000

The UsePrivilegeSeparation is no longer supported (recent SSHD always runs
with previlege separation), so remove this option from the default config
file to avoid this warning:
  /etc/ssh/sshd_config line 110: Deprecated option UsePrivilegeSeparation

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd_config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index d48bd2b..31fe5d9 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -107,7 +107,6 @@ ChallengeResponseAuthentication no
 #PrintLastLog yes
 #TCPKeepAlive yes
 #UseLogin no
-UsePrivilegeSeparation sandbox # Default for new installations.
 #PermitUserEnvironment no
 Compression no
 ClientAliveInterval 15
-- 
2.7.4


