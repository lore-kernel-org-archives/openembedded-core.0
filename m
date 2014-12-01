Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 065E072313
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 06:01:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB161A6G027203
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 30 Nov 2014 22:01:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 30 Nov 2014 22:01:09 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 14:01:28 +0800
Message-ID: <cover.1417413565.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Change the way of CONFFILES handling
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
X-List-Received-Date: Mon, 01 Dec 2014 06:01:13 -0000
Content-Type: text/plain

This patchset include two patches.
The first one is the basic change.
The second one provides an example of how to fix CONFFILES in each recipe after this change, if the previously value of
CONFFILES in that recipe is not correct or redundant.

The following changes since commit 68ddb28a68ceb59cd1ed322c16143827ce1ac712:

  distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher (2014-11-28 13:59:52 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/CONFFILES
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CONFFILES

Chen Qi (2):
  packaging: allow globs in CONFFILES
  base-files: fix CONFFILES

 meta/classes/package.bbclass                      | 35 +++++++++++++++++++++++
 meta/classes/package_deb.bbclass                  |  2 +-
 meta/classes/package_ipk.bbclass                  |  2 +-
 meta/classes/package_rpm.bbclass                  |  2 +-
 meta/conf/bitbake.conf                            |  2 ++
 meta/recipes-core/base-files/base-files_3.0.14.bb |  3 --
 6 files changed, 40 insertions(+), 6 deletions(-)

-- 
1.9.1


