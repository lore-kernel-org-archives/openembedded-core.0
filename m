Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B41DC771A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:11:24 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id wg8so1543564obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ew44OWQkWi/fQuf1mINuZjzTJDrnLfifGpiFJ120f9Q=;
	b=sYI/tj8mQt0WIx5DX0cOJb/MCRaxdFOmhvCz7/AsRzS4l9kBauS1ng5qvqxfgNBFmb
	NjQWG87fxEwABqmZmnOA2If0OmUBt8FP+gw5zq2vXy3RwR1elssBhdtFFrRRNPOKsAky
	rt416e59fKFn8VWn/W4aU6QcnrkL2SLHSeKYauNBeBXRfWq1BQHXn2UQ7UHJmzkuJS/E
	gmPlsWAhUywHfFy9k457I42K7wqjf4Z2JTRPu8giHnfBNrMM3nkl3EN8+Hmj5dD7KBKs
	EejUr/6tCQPDbwPw2TBJ+DdP8PWjM+3oW33Wf8q4+Z2frk42SDkU7CjJYx85jPFMAiFE
	JQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ew44OWQkWi/fQuf1mINuZjzTJDrnLfifGpiFJ120f9Q=;
	b=E4FL/jDFtbjyFa/VQFiIUtzKx6y2nvw/KSTOJhlS3EHLh17IwTShlHXzKs953vccZj
	MUKzgt3fyAHJSQsYeDBNfk1YrPVzFi52PPE/EcjgP+essUG3G4Hv9eTM6EruMG4W3ulQ
	WIyAVZRHuyLw1woItWV3VHK4+zlJ9Nyo3ztRwkuBiOjzBxtQBvEl9P2qxWFgiU+kV+mq
	yeavtuPgCTb9MHlwxx56bIiL+Gpmnzj6/tFoIRT5E2jLsyd2rHcg0qvhp/t9Xq6cZg2d
	NOBNw+QfbbIs4Dnvszpg0XkmpaKHTdz/N5y3H78siuhCVIrwr4JxyYg9oMHVpII4QVx0
	gDLg==
X-Gm-Message-State: AG10YOSAq94KOoWNCCxFqm//lc4/rl9SBxTm4nByNYjDRSwiAGrZBSX4OtNtgI33+A1wTw==
X-Received: by 10.182.79.103 with SMTP id i7mr318563obx.41.1453947085303;
	Wed, 27 Jan 2016 18:11:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q4sm4448874oew.6.2016.01.27.18.11.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:11:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:11:11 -0800
Message-Id: <1453947071-13364-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
References: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] glibc-testing.inc: drop pruning of PATCH_GET from the testglibc script
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
X-List-Received-Date: Thu, 28 Jan 2016 02:11:24 -0000

PATCH_GET is no longer exported by bitbake.conf, so no longer needs
to be pruned from the glibc do_compile() environment.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glibc/glibc-testing.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-testing.inc b/meta/recipes-core/glibc/glibc-testing.inc
index a9bbf37..0a42ae7 100644
--- a/meta/recipes-core/glibc/glibc-testing.inc
+++ b/meta/recipes-core/glibc/glibc-testing.inc
@@ -22,7 +22,6 @@ do_compile_append () {
 	sed -i -e "/^'/d" ${B}/${HOST_PREFIX}testglibc
 	sed -i -e "/^UID/d" ${B}/${HOST_PREFIX}testglibc
 	sed -i -e "/^TERM/d" ${B}/${HOST_PREFIX}testglibc
-	sed -i -e "/^PATCH_GET/d" ${B}/${HOST_PREFIX}testglibc
 	sed -i -e "/^PKG_/d" ${B}/${HOST_PREFIX}testglibc
 	sed -i -e "/^POSIXLY_/d" ${B}/${HOST_PREFIX}testglibc
 	sed -i -e "/^PPID/d" ${B}/${HOST_PREFIX}testglibc
-- 
1.9.1


