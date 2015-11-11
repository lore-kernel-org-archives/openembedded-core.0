Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2C0A736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 06:58:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB6wNot007324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Nov 2015 22:58:23 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 22:58:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 11 Nov 2015 14:58:13 +0800
Message-ID: <cover.1447222992.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] flex: fix test-bison-yylval and test-bison-yylloc failed
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
X-List-Received-Date: Wed, 11 Nov 2015 06:58:27 -0000
Content-Type: text/plain

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/flex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/flex

Hongxu Jia (1):
  flex: fix test-bison-yylval and test-bison-yylloc failed

 ...fixes-Do-not-use-obsolete-bison-construct.patch | 81 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch

-- 
1.9.1


