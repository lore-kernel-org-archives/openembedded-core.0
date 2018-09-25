Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 159C36010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8P8Coag015991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 01:12:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 01:12:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2018 16:23:56 +0800
Message-ID: <cover.1537863803.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] perl: fix race issues for MakeMaker
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
X-List-Received-Date: Tue, 25 Sep 2018 08:12:49 -0000
Content-Type: text/plain

The following changes since commit e3f5ceec690379d64bd38330111a32f6c8fc6353:

  build-appliance-image: Update to master head revision (2018-09-24 12:31:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/perl
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/perl

Robert Yang (1):
  perl: fix race issues for MakeMaker

 meta/recipes-devtools/perl/perl-native_5.24.4.bb   |  1 +
 .../0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |  1 +
 3 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch

-- 
2.7.4


