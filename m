Return-Path: <marc.ferland@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB406AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 22:53:34 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id u12so923021qcx.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 15:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=uXc7W0PglExpnBTd8fvJ7Rb542mJSHji+zJLoYY6kBc=;
	b=U8A5wmwohuYOWutub2wmREQqSVnhVeY7/uogJMWHGAPVeRYMsb4jUF48NT/2rJv59V
	HGGJ4l0Ls7wEc7osFYJRDLmHLeU/DWlO//ovyloYxzbMqH2Q8ATCz7Xhi58SZ+xzwHZS
	4dfNvldqiSGopjoRiqo7vw2RIkLiGF6LSn2jkpjmM7oPvEKjaIGd7BysU+6CpvAfMgZL
	iraJiUTNoNKtR7LAYsTZY4gUDAAJDVEic2LWHxVPJ3kvxTrdB0TUC3iowGEKDoRaZSXB
	+wdjddgl6Ak4PYA3sQ8bCpggvMtRsUigdOxti5bZCdqdvgGCofAvasQJwBFn1pwPzlEX
	/THg==
X-Received: by 10.224.60.133 with SMTP id p5mr14197729qah.101.1372373614841;
	Thu, 27 Jun 2013 15:53:34 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id m2sm7589684qat.2.2013.06.27.15.53.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 15:53:34 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 27 Jun 2013 18:53:50 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 18:53:40 -0400
Message-Id: <1372373620-14853-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] openssh: fix initscript restart command
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
X-List-Received-Date: Thu, 27 Jun 2013 22:53:35 -0000

start-stop-daemon should be called with '--oknodo' instead of
'-oknodo'.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-connectivity/openssh/openssh-6.2p2/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index cde52ef..6beec84 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
@@ -76,7 +76,7 @@ case "$1" in
   	check_keys
 	check_config
         echo -n "Restarting OpenBSD Secure Shell server: sshd"
-	start-stop-daemon -K -oknodo -x /usr/sbin/sshd
+	start-stop-daemon -K --oknodo -x /usr/sbin/sshd
 	check_for_no_start
 	check_privsep_dir
 	sleep 2
-- 
1.8.1.2


