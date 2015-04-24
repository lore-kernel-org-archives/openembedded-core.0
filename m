Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED4B46E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 06:50:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O6oDoq012204
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 23:50:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 23:50:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 14:50:20 +0800
Message-ID: <cover.1429858183.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Two fixes related to uninative-tarball
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
X-List-Received-Date: Fri, 24 Apr 2015 06:50:13 -0000
Content-Type: text/plain

The following changes since commit c9b06c79ed8a082d1b385e9f61721aeeda9bf1af:

  init-install-efi.sh: fix gummiboot entry installation (2015-04-21 07:19:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/uninative-tarball-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/uninative-tarball-fixes

Chen Qi (2):
  uninative-tarball: delete the packagedata task
  populate_sdk_base: avoid executing empty function

 meta/classes/populate_sdk_base.bbclass      | 6 +++++-
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.1


