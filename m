Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 345C0607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 06:22:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S6MPWL020721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 23:22:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 23:22:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 23:22:23 -0700
Message-ID: <cover.1475043600.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Wed, 28 Sep 2016 06:22:25 -0000
Content-Type: text/plain

The following changes since commit 1e13d1fd22186af5544e7248dc12635cd2f2e08b:

  meta-environment: ensure corret TOOLCHAIN_CONFIGSITE_NOCACHE value (2016-09-26 10:05:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pseudo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pseudo

Robert Yang (1):
  pseudo: add prefix for log and make log consistent

 ...er.c-add-prefix-for-log-and-make-log-cons.patch | 83 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch

-- 
2.9.0


