Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53D8D6ACBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 08:05:46 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2118316wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Rgz3xpH8ex+7QiTFYIjiFU1EosAqxUZgFAtxvysmsk=;
	b=S7o7oKddwxGOV6MLjnc9FlqxpQLiI8dy9g0iK+zVNB459ciNVEKQBD/wWYnsvYInxL
	b3GBkE0GhycXXU47rAtsiu8l/EjI7tKENDi+W7KQk+TPBHOjEf4KIt7mi6uGekyKDjwc
	WOGGMcC+c8p95jzmJmRrLNIAEhp3Bbsj6r5wDgaWaXoAB209OX6q88BgYHKk449DuzS3
	b6qWdvX8H8Dmi/9HKgP9H67bO0URS0m28hN/LxcmlbgjxFtTZjRv9hDzmXHsacX3kpZk
	/BP83PVy7G8aKu7qn8ijnNKKR8tyqXWZ1ZLIOb/VLRPAuw4B7qcAtW0H9IZyFCLTJbWC
	S0Yg==
X-Received: by 10.180.20.40 with SMTP id k8mr14014092wie.54.1408953947299;
	Mon, 25 Aug 2014 01:05:47 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	ws10sm31919295wjb.48.2014.08.25.01.05.44 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Aug 2014 01:05:46 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 13:38:49 +0530
Message-Id: <1408954129-5915-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] autogen-native: inherit pkgconfig to fix a build failure
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
X-List-Received-Date: Mon, 25 Aug 2014 08:05:47 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

This patch is to inherit pkgconfig to fix a build
failure.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 .../autogen/autogen-native_5.18.3.bb               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
index 61bd21f..abc0a42 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "73d05a689105eb9b8be54f32498c99ddbd360776fc61cf45be6a2a4eb4
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
-inherit autotools texinfo native
+inherit autotools texinfo native pkgconfig
 
 # autogen-native links against libguile which may have been relocated with sstate
 # these environment variables ensure there isn't a relocation issue
-- 
1.7.9.5


