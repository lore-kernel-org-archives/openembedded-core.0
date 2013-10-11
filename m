Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 464396CC7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 13:37:56 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u57so4140390wes.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uG/QcdHqtgzR9FB0vtQOxg0GCdrVhoj5q/xbHq78EzA=;
	b=ZUx1ufLQUmlrQNObuQUZmI+54wRiO7sgTZdRZdBxAtZcyRsCX49j6usjoUnjRhfAm/
	LBskn9f2zMNQAAQ1bA/TjBHKvY9EE/HSZ87GnTlo4tSBQXKnmmyiMbxG/JxZGNSxCU7v
	yuP4zpHea/s89QItvTNPVjMg05j/k7kPCB55yM8QC7b1ZAvNB3wlrYku2V6oUh2sdRps
	WHSGKQG5+HAarmrmtrESFKVQ05diXyEa8l2ZT3zjSxATIwmBMpDrshxxfjmigLv1gPLR
	DqgSQ4+ps62WMND1b+B+wa02g7x1Bf7NpWpYlGoEjH0gQ1xjoV08eEr9LZkEVPWQLxnM
	/gDg==
X-Gm-Message-State: ALoCoQlxyujtR1jkGc+G/EVOe+GywAKyiQeCQ+pY1f4RFzdw1KIxc3GHk10ovtcJHNU3/jFLYwJC
X-Received: by 10.180.13.174 with SMTP id i14mr3254087wic.49.1381498677753;
	Fri, 11 Oct 2013 06:37:57 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id ey4sm5790095wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 06:37:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:37:45 +0200
Message-Id: <1381498665-21514-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
References: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/2] openssh: allow empty passwords if PAM allows it as well
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
X-List-Received-Date: Fri, 11 Oct 2013 13:37:56 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
index 4f9b626..175e8f3 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
@@ -59,7 +59,7 @@ Protocol 2
 
 # To disable tunneled clear text passwords, change to no here!
 #PasswordAuthentication yes
-#PermitEmptyPasswords no
+PermitEmptyPasswords yes
 
 # Change to no to disable s/key passwords
 #ChallengeResponseAuthentication yes
-- 
1.8.3.1


