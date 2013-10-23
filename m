Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5B46D096
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 07:18:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9N7IgQa017595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 00:18:42 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 23 Oct 2013 00:18:41 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2013 15:18:03 +0800
Message-ID: <cover.1382512567.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] Migrate lua from meta-oe
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
X-List-Received-Date: Wed, 23 Oct 2013 07:18:43 -0000
Content-Type: text/plain

The following changes since commit ffb440c37c3491fa5d9a1408341f7c15eacdc9ce:

  midori: exclude from self-hosted for mips64 (2013-10-23 07:18:54 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/lua
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lua

Kai Kang (1):
  lua: add lua recipe

 meta/recipes-devtools/lua/lua/lua.pc               | 11 +++++
 meta/recipes-devtools/lua/lua/uclibc-pthread.patch | 13 ++++++
 meta/recipes-devtools/lua/lua_5.2.2.bb             | 49 ++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/lua.pc
 create mode 100644 meta/recipes-devtools/lua/lua/uclibc-pthread.patch
 create mode 100644 meta/recipes-devtools/lua/lua_5.2.2.bb

-- 
1.8.1.2


