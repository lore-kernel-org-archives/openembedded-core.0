Return-Path: <christian.meusel@posteo.de>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8397478F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 16:22:25 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 73A19210D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 18:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1540484545; bh=aBartWRNrR2aqW+mg09Cd3BtCDarS3cJqfTj4NLS/30=;
	h=From:To:Cc:Subject:Date:From;
	b=RoDeZKerJfAHFZ9KJYg5fgrxpjyOzRqvBKOwTwOMf1dE6VLv9gJUDFgdUj8FJIVTm
	pMQFwKBR6XEW2ElsQdvgz17VHasl4sFa4Aq3XMx6kPXqsE72IDTEfTgdGnea9CsGgN
	To3C36CdOjPpaYmsUqzE6k0Pj8MH6pV7bfSu0BNwtAAm4HntaFiDoB692vU8BMGQ0p
	HKmxOIp5wNUz1BFdkb2TUtAEQruw4C414oRiB0BnFsZ3iAOA7JKHXA+KFy4ybw9Ptz
	aORSfSEioub4K7v7Sa4J75VC5hRmH2CgeowHyyAzSngGYbkS8z4dZeuKRADk9SXsyu
	jW3NaFwIBMVKA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 42gspm4VQQz6tm8;
	Thu, 25 Oct 2018 18:22:24 +0200 (CEST)
From: Christian Meusel <christian.meusel@posteo.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 18:22:09 +0200
Message-Id: <20181025162209.6702-1-christian.meusel@posteo.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] gitignore: Ignore repo tool directory
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
X-List-Received-Date: Thu, 25 Oct 2018 16:22:25 -0000

This reduces the noise produced by 'git status' and 'repo status' when
orchestrating the layers with Google's repo tool
(https://gerrit.googlesource.com/git-repo/)

Signed-off-by: Christian Meusel <christian.meusel@posteo.de>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index d3ef473b04..ad1cb83abf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,6 +1,7 @@
 *.pyc
 *.pyo
 /*.patch
+/.repo/
 /build*/
 pyshtables.py
 pstage/
-- 
2.17.1


