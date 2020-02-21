Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD5161750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQMP5nBdz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322321;
	bh=AoQ2oxVFiiB2BXgARfEQlhvGNiCSxmrOFo7FDq8C4hA=;
	h=From:To:Subject:Date:From;
	b=Rho+Sz2QwdJOY4j5Yyh0O0PNELK99MdyWwKBdsE+Os3mBY/LhWMGrb65vNkIOXRFr
	F6yIqYZqXpROHmaDm2p0X0uPr9ZWLpDIYE8mH9vl558cBdWg2RZkogDK4KD192FT13
	rKUMzu+TxEHb4s3hjAHINFiLOawmQ1DzOFDrf2OAkf3XPVZ66vW2EI/Qaw5aul6xYT
	5olKvu0o4rkJCJG3ObspxBP1fElezgtqCXE1qUXaL9hkX8lz0HQ5sYBxyCkZe4iVrj
	IltrxpKDwJ/9ChsR/OS1xexfjCimtRqeRuBHrWo4dKVDccv0YTNLHHBcqsKsJJu/mZ
	UDfVoDTvctrWFpZTGXjbW+Acnrb0HczZpVb6KKYID1mVUvj4ih8D8XsfsyYb81ThVp
	kEoNEfhDfBrGyn6K1xpAD8POhHR3JEDf3GOPWgvMjj3jVulVyU3cF6vZzv2MJHVqHg
	2vlrSQwPgAqHkW/5v86rfQxFKR7+NtT6T1YKN2M5k9LYlzz28tnCCwFNIQniV/M/wh
	dqRFFPQ/TczrdaSNwf4AxjlR5ltsEdBi7b6hVBV27nqgJBjkUV8UTPoWK4TrTbWklR
	yzuGa/pPH1Xe1+vDLGIBd3yrdxP7FIsjLRvqmS6BPbvIPjctf1DD/kduhFZTEWVjDk
	bcj/2VHG2RHp5QIlhBvJEpc8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:58:39 +0200
Message-Id: <20200221215840.4363-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] ncurses: add CVE_VERSION
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
X-List-Received-Date: Fri, 21 Feb 2020 21:58:41 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Include the version number in a format that is comparable to what we get
from NVD.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
index ef6ca9879b..90f6b4695c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
@@ -9,3 +9,5 @@ SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+
+CVE_VERSION = "6.1.${@d.getVar("PV").split('+')[1]}"
-- 
2.17.1


