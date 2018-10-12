Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D858D60596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:19:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C2J3Qt026863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:19:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:19:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:24:49 +0800
Message-ID: <cover.1539310768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Three fixes regarding SDK and testimage
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
X-List-Received-Date: Fri, 12 Oct 2018 02:19:02 -0000
Content-Type: text/plain

The following changes since commit 793a82c2da639088884c93595e6a3f28e5e3d747:

  oeqa/manual/oe-core: Drop image build during taskexp test (2018-10-11 23:06:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/misc-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/misc-fix

Chen Qi (3):
  ksample.py: fix error message
  packagegroup-core-lsb/-full-cmdline: add bzip2
  nativesdk-packagegroup-sdk-host: add nativesdk-flex

 meta/lib/oeqa/runtime/cases/ksample.py                                | 2 +-
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb    | 1 +
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb | 1 +
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb          | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

-- 
1.9.1


