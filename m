Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D73F465E35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:41:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s537fFJo029881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 00:41:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 00:41:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jun 2014 15:42:07 +0800
Message-ID: <cover.1401781206.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: matt.cowell@nsn.com
Subject: [daisy][PATCH 0/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 07:41:17 -0000
Content-Type: text/plain

The following changes since commit af347d3298e15552d502d5b2ce497bbda9705bc7:

  binutils: Fix building nativesdk binutils with gcc 4.9 (2014-05-29 13:42:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/daisy-systemd-alloca
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/daisy-systemd-alloca

Chen Qi (1):
  systemd: do not use alloca() function in case of uclibc

 .../0001-journal-file.c-do-not-use-alloca.patch    |   54 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb           |    1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch

-- 
1.7.9.5


