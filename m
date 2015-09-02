Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 780837702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 23:46:03 +0000 (UTC)
Received: by qgt47 with SMTP id 47so16852224qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HC8tT8mqJox7wh2wiCgOglrCVuWkHFeXh03G+ZmPesA=;
	b=f+QaVwMCM3XF61OQW3hnpxOwYufPthZ0gK1V9QD1kQfZdrkgeN7AIt8KUvEkn1PV6W
	ta2BLVdIK2vkFWsT5QesmqthxEHo4c81utcLOfVJY11N+s7kk2E83PgSrx79ZTlXQB4Y
	77c8XcEMXxEFfxd3QF+8/0y+8A3mZixKcrkErKNDWY4UUY0EdAI0VkYh/mtsPZV6TnVP
	V1AkQngVY1asQhM+k/up60a7Jy4GS0KJKfxWv1C8K2R6BQnXp0kTIRWqfwVvPpOvQffu
	nGQl8XDWQSfz23yGRjV9eCLxits/QD5cWgEg5G4ZaCS3W3ffJk+5iWL8zRnSXJUyLYf/
	D5Gg==
X-Received: by 10.140.164.7 with SMTP id k7mr64507750qhk.40.1441237563222;
	Wed, 02 Sep 2015 16:46:03 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	130sm13709221qhg.13.2015.09.02.16.46.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 16:46:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 23:45:57 +0000
Message-Id: <cover.1441237371.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH 0/1] Binutils/gold fix
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
X-List-Received-Date: Wed, 02 Sep 2015 23:46:06 -0000

While building QML apps using QT 4.8.7, there are problems seen in libQtCore
random hangs, crashes due to memory consumption etc. This is particular to gold linker
tested on minnow

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/gold-dynamic-list
  https://github.com/kraj/openembedded-core/tree/kraj/gold-dynamic-list

Khem Raj (1):
  binutils: Fix symbols with --dynamic-list when using gold linker

 meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
 ...-list-so-that-symbols-not-in-the-list-are.patch | 131 +++++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch

-- 
2.5.1


