Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4CD61779
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PP3M5FjPz6L
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318783;
	bh=1uA4Su7awtiIhVHblcBLTqESnK4+LLos4sEnvzx++M4=;
	h=From:To:Subject:Date:From;
	b=rBt0vP+08D1DtisJqrCYjMIZUT+TmjP83TjBb5Lg1PY/2aRd0qj2UDhN2zBDF0ZeH
	uPb38xiXrAhX9f7qV4EmF3TkfNrfFjSGbetOGdbMhTLVEq50MvzeFvYn2I9an6PxLA
	tVwV9moZoSAQK+5jeUYw1L6GW0IRz7fvtenBaS/j7MIWDs+2PiiotEzw8CvstArvpH
	ClhpxLJ06CwDG2A1GjCpY9PX/sVa1ZOXJXK9Ege1/kWYa74MRkL+kX/rm5JYGNlUSD
	sqKRqh5ocN1hi91/vjC0eMkD93nSiOIlHVSZ7zOdxUyQB/NZS7j8R9dYNSAqhpeQl1
	JTPmC1aEErmTgM3/pdjSW1oF8aGwKZOTsXaZd+/WxjUvdKWNO/3ttXx74crZNo7LOd
	JWYTSJQ0WdRzwhO2/ofv2mFvhvXESCM3cbq+6X7GOnqjuIAB1JgcfObrlzj8hFzc6f
	jXxyCL0MBVO3lbKH96STx/ZHPNt9Y7qUjsu2jmZw6YJLE9kNKOvyT2VzOnwtjx6tLw
	rl+sk+VPa54grmar/Wgq357anu3uQsK7KFPPVVmQL3KWiqmaWPdVTAnLxsYpf5d9MW
	nMbUBEt7M3MGaL0tdyIDn0WElUGLJEEzhTjo0ApndK6/c3kzcZ9DzWlpz9+HXajR68
	ngoWQrER5h2/OBp+yIdFZWlw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:59:41 +0200
Message-Id: <20200221205942.27168-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] ncurses: add CVE_VERSION
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
X-List-Received-Date: Fri, 21 Feb 2020 20:59:43 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Include the version number in a format that is comparable to what we get
from NVD.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/ncurses/ncurses_6.1+20190803.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
index e638a3737c..c3a89f1c4f 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
@@ -10,3 +10,5 @@ SRCREV = "3c9b2677c96c645496997321bf2fe465a5e7e21f"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+
+CVE_VERSION = "6.1.${@d.getVar("PV").split('+')[1]}"
-- 
2.17.1


