Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAFE701F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:53:25 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so1416453pad.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 18:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KbXB9Pycd136zJQJSDiZHHCUePQ+y72HCtmCzhYSrww=;
	b=A2nRhqoCkQPiVqtdF9MNSBoQVghH/chjWzc1DgDpeV9ooDL9va7f97lC1597ABO6Pe
	wYejk7h4lX7cNnrNCVVAFfDq6dMhpaYyHgSpauLOTfqn2iiLAhoacF1x819my3+Z6C2H
	r6YEYXXWh/vJuPmR8ZGocongLPkeEyTKso02bPTtsi/GEt7RyyB/+EMqAX2yAFmqnCP+
	irD5tsBdKKKtPhihunGtePl1FCmtdBQN1uVqs5uDjUmeT0arULPRIbAPNEqkXTVNqTeE
	x/m48DduKqpmyIVcUwy7dOYtZp2Ui41YpKTJpoiiKuBr4mMrmAOEGt0oEW0aK76c1hPu
	HpYw==
X-Received: by 10.66.191.230 with SMTP id hb6mr14073032pac.72.1411610006995;
	Wed, 24 Sep 2014 18:53:26 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id hr1sm531900pbb.17.2014.09.24.18.53.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 18:53:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 12:04:54 +1000
Message-Id: <1411610694-12155-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] licenses.conf: remove link to deleted License_Audit wiki page
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
X-List-Received-Date: Thu, 25 Sep 2014 01:53:28 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/conf/licenses.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index b1d5480..fe96066 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -49,7 +49,6 @@ SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 #
 # We should NEVER have a GPL/LGPL without a version!!!!
 # Any mapping to MPL/LGPL/GPL should be fixed
-# see: https://wiki.yoctoproject.org/wiki/License_Audit
 
 # AGPL variations
 SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-- 
2.1.0


