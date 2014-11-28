Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F14A723C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 07:59:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAS7xt4g007353
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 23:59:56 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 27 Nov 2014 23:59:55 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Nov 2014 02:59:53 -0500
Message-ID: <cover.1417161489.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils-native: don't install groups
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
X-List-Received-Date: Fri, 28 Nov 2014 08:00:00 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This binary is provided by shadow-native nowadays. Fixes:

  ERROR: The recipe coreutils-native is trying to install files \
    into a shared area when those files already exist. \
    Those files and their manifest location are: \
      .../tmp/sysroots/x86_64-linux/usr/bin/groups \
    Matched in manifest-x86_64-shadow-native.populate_sysroot

To reproduce the errors:

  $ bitbake shadow-native && bitbake coreutils-native

The following changes since commit 0bc03af7ee6112fa0af0608b02f715ec8495e4ff:

  maintainers.inc: update maintainers (2014-11-26 17:06:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/coreutils-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/coreutils-native

Wenzong Fan (1):
  coreutils-native: don't install groups

 meta/recipes-core/coreutils/coreutils_8.22.bb |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.9.5


