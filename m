Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgR-00012z-Rp
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:12 +0200
Received: by obhx4 with SMTP id x4so5080055obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xFAid3nFC5MRYJuzgeMNcukfKXZN8lSQ9QafXwcYbws=;
	b=rD43eXwTyynfVqIeGezfcPWcy/7txn7LKphhZ7IAOzCbkWPfgr5yxMLFI7kgkKpbeb
	dne4FYE+b6jWHaBU3X381evDGNkGppg7zmFnCzNRZOoOO2x6jhiWeTMNfndzcKNshhAq
	nvqBzCvis0Ed1Pr/4wrMBg8gpiJRVy1GZBzRSw6bDb3/btx5NUAI6w/I6eUuDil0qkmp
	94DPCj3nupW9KCW9pg0BNKolylSovqq4V+FViljp6jtcecMczuU0Wz85zDjEV+IhK0If
	csMcbUndx4JM6mpay46tqn5FBbV2xk3CGVvIu2yjADPX92RVdxLFZbRngj93QuucrKUF
	bFvA==
Received: by 10.182.222.2 with SMTP id qi2mr34845762obc.27.1335888131680;
	Tue, 01 May 2012 09:02:11 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:40 -0500
Message-Id: <d616cdfe116596ffeea294bcd406c90cf60c6e4f.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] mesa: add missing flex-native/bison-native deps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 16:12:12 -0000

From: Christopher Larson <chris_larson@mentor.com>

A quick glance at configure.ac shows that both are required to build mesa, but
we were relying on their being built implicitly via other recipes in the
dependency chain. Make it explicit.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1c376b7..f697e67 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -19,7 +19,7 @@ PE = "2"
 PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
 
-DEPENDS = "makedepend-native python-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
 PROVIDES = "virtual/libgl"
 
-- 
1.7.7



