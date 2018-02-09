Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A510C60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:46:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w197kT81022849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Feb 2018 23:46:29 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.244) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Feb 2018 23:46:21 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Feb 2018 15:49:31 +0800
Message-ID: <cover.1518162342.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: fix hostname conflict with other packages
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
X-List-Received-Date: Fri, 09 Feb 2018 07:46:28 -0000
Content-Type: text/plain

The following changes since commit 44ea6ded0e8e73f5258ce55bd1b851e24243b76a:

  bitbake: bitbake-user-manual: Commented out Placeholder Paragraph (2018-02-06 18:10:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/coreutils-hostname
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/coreutils-hostname

Chen Qi (1):
  coreutils: fix hostname conflict with other packages

 meta/recipes-core/coreutils/coreutils_8.29.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


