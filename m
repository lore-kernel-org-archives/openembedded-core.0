Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE65571BD9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:57:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB71vgxG014377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 17:57:43 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:57:42 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:57:39 +0800
Message-ID: <cover.1481075716.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] archiver.bbclass: fix some errors for do_ar_original and do_ar_recipe
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
X-List-Received-Date: Wed, 07 Dec 2016 01:57:41 -0000
Content-Type: text/plain

The following changes since commit 9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a:

  bitbake: ast: remove BBVERSIONS support (2016-11-30 15:48:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ddk/fix-some-error-for-archiver-bbclass
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ddk/fix-some-error-for-archiver-bbclass

Dengke Du (2):
  archiver.bbclass: fix do_ar_original error for matchbox-desktop
  archiver.bbclass: fix do_ar_recipe error for bonnie++ and
    libsigc++-2.0

 meta/classes/archiver.bbclass | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

-- 
2.7.4


