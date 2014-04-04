Return-Path: <freesilicon@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id ECD9C6E881
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 07:48:08 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id q5so682302wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RzBTgr9kAd8GTe6dLMOySJtdJLYr2H+fBk6Nfbw+YQs=;
	b=g2b9z1MUUIM+GQ7cQSq1LcfZCMzkQ83i7/yq4md8ZTwaKpPw9vZ+ypg8bX6kXvdlsV
	p/+NTHyJVs3DrUKDDVz6ue+mipy/2cyWImmFVgMzAial6nKRU6YTfxeTdLiW/+185Whw
	Jm9xrMnXfAyZWS/repZqT8+6cbV4OuZKBKic3srvdQU2InXb5uN/OdYKsw/fTSvDg8q+
	8gg/YUC7ZIKsB1SET6Wp91QQHFv31qtp9Em/M3hBXXdLKzFPdabbXo6X1PkgYTglVxC5
	ObUbSnH+cUGROx0HXwLdMwuKpKVwliUQetphRLblyw2KB92/WN14tB0TZH0eSJt+IpQd
	JlHQ==
X-Received: by 10.180.101.230 with SMTP id fj6mr2157838wib.27.1396597688901;
	Fri, 04 Apr 2014 00:48:08 -0700 (PDT)
Received: from crde-port-20.crde.local ([195.101.177.85])
	by mx.google.com with ESMTPSA id r4sm11234439wjz.28.2014.04.04.00.48.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 00:48:08 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 09:47:42 +0200
Message-Id: <1396597662-31152-1-git-send-email-freesilicon@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] SDK default deploy directory
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
X-List-Received-Date: Fri, 04 Apr 2014 07:48:18 -0000

If the user changes the DEPLOY_DIR variable to set up a custom deploy
directory for images, packages, SDKs as explained in the documentation,
the variable SDK_DEPLOY does not take it into account and fallback to
TMPDIR as default. Therefore, SDKs were not found in the correct
location.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 81da206..10d04ed 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -24,7 +24,7 @@ inherit populate_sdk_${IMAGE_PKGTYPE}
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
-SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
+SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
 B_task-populate-sdk = "${SDK_DIR}"
 
-- 
1.7.10.4


