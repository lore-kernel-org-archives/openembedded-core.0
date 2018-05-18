Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3465E74C7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 03:43:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4I3gdbP020800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 20:43:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 17 May 2018 20:42:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2018 11:44:49 +0800
Message-ID: <cover.1526608575.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] oeqa/sdk/cases/buildgalculator.py: skip if gettext not available
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
X-List-Received-Date: Fri, 18 May 2018 03:43:09 -0000
Content-Type: text/plain

Changes in V2:
* Fix to use hasTargetPackage instead of non-existent hasPrefixedTargetPackage

The following changes since commit 13cc30cd7de4841990b600e83e1249c81a5171dd:

  local.conf.sample.extended: Drop obsolete rpc and libnsl (2018-05-15 11:07:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/buildgalculator-gettext
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/buildgalculator-gettext

Chen Qi (1):
  oeqa/sdk/cases/buildgalculator.py: skip if gettext not available

 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


