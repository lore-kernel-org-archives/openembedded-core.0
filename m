Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 515117317E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 07:05:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1G75aBN017071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 23:05:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Feb 2016 23:05:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Feb 2016 15:06:04 +0800
Message-ID: <cover.1455606321.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: fix problem with acl for 6.9 version
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
X-List-Received-Date: Tue, 16 Feb 2016 07:05:38 -0000
Content-Type: text/plain

The following changes since commit bd06944249c3de3f629c013e14f446464441c4da:

  lib/oe/terminal: set workdir for konsole terminal (2016-02-13 08:27:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/coreutils-6.9-acl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/coreutils-6.9-acl

Chen Qi (1):
  coreutils: fix problem with acl for 6.9 version

 .../coreutils-6.9/coreutils-build-with-acl.patch   | 28 ----------------------
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  3 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch

-- 
1.9.1


