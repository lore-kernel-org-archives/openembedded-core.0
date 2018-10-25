Return-Path: <christian.meusel@posteo.de>
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by mail.openembedded.org (Postfix) with ESMTP id D330E6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 16:49:04 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1C1352400E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 18:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1540486145; bh=bZaRvLTaWvrudD42b7T9LmbscEJDCnsDrS8IRqksfPY=;
	h=From:To:Cc:Subject:Date:From;
	b=WlWQyvs+irMjJzTt7Zs3B0qep9VY/oKMdi7043C2tlF/yMVzvn5MiiLW5mVEGQI08
	WYDRlbZ2oLN3N6qG1bRzjMNmtZBVHIPIaYEMfwpiViKTgIvzAUUuLhCDc3f0DBjcZE
	PfoVkn/xCe3YI6joKsPwdAjFdYVX9x6Q7T9udwKxL5mIdyeFjpGD9t4yjxWXIS85XS
	icQPn9GwY8Ms48pTVcAHG+Jit+av3gPX3ZMbXgx7Nxma5ch960rEgKoXzSDl/d2ynx
	J7b9XuP7tJXoIaT6kbU5LS8Qg1Ytk7+hIUpEsWl4BOpeZOxkjMnqRGlxukil0iRYXy
	WxxpKBxHoYwcQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 42gtPX3nBFz9rxK;
	Thu, 25 Oct 2018 18:49:04 +0200 (CEST)
From: Christian Meusel <christian.meusel@posteo.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 18:48:54 +0200
Message-Id: <20181025164854.8375-1-christian.meusel@posteo.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] gitignore: Ignore repo tool directory
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
X-List-Received-Date: Thu, 25 Oct 2018 16:49:05 -0000

This reduces the noise produced by 'git status' and 'repo status' when
orchestrating the layers with Google's repo tool
(https://gerrit.googlesource.com/git-repo/).

Signed-off-by: Christian Meusel <christian.meusel@posteo.de>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index d8f2259228..d0e6b2fb89 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,6 +2,7 @@ bitbake
 *.pyc
 *.pyo
 /*.patch
+/.repo/
 /build*/
 pyshtables.py
 pstage/
-- 
2.17.1


