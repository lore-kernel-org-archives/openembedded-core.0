Return-Path: <christian.meusel@posteo.de>
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7403960402
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 15:56:56 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9634F2400FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 17:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1540483016; bh=66Xqjdxva6xB36sh+fKRsShkujrpLBtvhBSQDnRdP0o=;
	h=From:To:Cc:Subject:Date:From;
	b=Kgxh+wV+QmTKCxY65ukJSvzSrA7mBUxKDuzuZG7/UkR5cWd1L+0NHwWPDg6vmDTcR
	/StYBs5Yk/P/laMZwuZGSEEqSmR4mLxTlpTW+uaefeBSwp6Yue9U1/fu3oqhdKDKc1
	bTyxSUZjbhDNDlFZA0nCYEy2F888yp0IzYuNWkPfg0dY566/kj7IDPRIFcd+hd84cp
	AHxqimtpNs48tVSvPVYbAFyATQ7M2oeXHas8aF3J0UGRksMYS9QSlVc0GpwDcWvhGJ
	xd9jpF+Q/EyLeGkC9EOomtRe+rCA8ojNJe/81b1fZojRm76d+6Dwk9/AA8TotQIozs
	r9xrMQQZqrIBQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 42gsFM2lH3z9rxc;
	Thu, 25 Oct 2018 17:56:54 +0200 (CEST)
From: Christian Meusel <christian.meusel@posteo.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 17:56:29 +0200
Message-Id: <20181025155629.5281-1-christian.meusel@posteo.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Ignore repo tool directory
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
X-List-Received-Date: Thu, 25 Oct 2018 15:56:56 -0000

This reduces the noise produced by 'git status' and 'repo status' when
orchestrating the layers with Google's repo tool
(https://gerrit.googlesource.com/git-repo/).
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 94894d498c..57dd439401 100644
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


