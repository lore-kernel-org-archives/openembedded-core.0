Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 978A16BF59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:09:41 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so483908wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 03:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qKW1OdOrUQvffZgyZjsNUynpueiZhJ5Ldq2O9OQNyKk=;
	b=T+wNfbJrJJVple+UjLbhqQFFqSR81CRCFfNzuOPcVf+R1J0UuuorRo7wXIvkS4Ha7L
	9laADNjuA4GmKoU1uCur52G8/3N1INrvo8Ei9zT8al+DuJ06LkzCgegS1y41Raok1UKu
	9avUqggmUgseGKGVA+9Xj+oe75kRgoldrmTaMwtmF81NMoRcyHge2PB0oDDZsU7KcQWd
	MRm2VZ4GZt1l2n4gkekcSTgKn0EK5+dwJKBijOb5+VwjXtIp7vwlFjNqJIbBjqTo33Bq
	v+XEiT/FhYJOMeEag1k+Yo1dXWQgAjyP3do63/7jjONQDCN+hIh8lmcbDs/KG0fp2Y/t
	Y9Aw==
X-Gm-Message-State: ALoCoQk6p0ZGCt5QOGkfWOXRzZsATA5HtIbr0lK4D3cJ3hDhmlY2xdXZyxN/5p69zxQsikiGPSR0
X-Received: by 10.180.36.80 with SMTP id o16mr14078243wij.1.1381745382604;
	Mon, 14 Oct 2013 03:09:42 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id jf2sm32703285wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 03:09:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 12:09:37 +0200
Message-Id: <1381745377-6129-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCHv2] openssh: allow login with empty password
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
X-List-Received-Date: Mon, 14 Oct 2013 10:09:42 -0000

Currently both PAM and dropbear allow logins with empty passwords, but
openssh doesn't. This commit changes the default in openssh to allow
empty password logins.

This should be changed to be a global config option in the long run.

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


