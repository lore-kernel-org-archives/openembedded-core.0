Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5202B600FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7mGwd024546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:35 +0800
Message-ID: <cover.1372386599.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] base-files: media directory cleanup
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 10e44f162c8ac71965faaeb70b8bfdeb264ba76c:

  bitbake: bitbake: python funcname can not include special character @ (2013-06-27 10:06:09 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/media-dir-cleanup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/media-dir-cleanup

Chen Qi (1):
  base-files: remove the unnecessary /media/xxx directories

 meta/recipes-core/base-files/base-files/fstab     |    1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb |    7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

-- 
1.7.9.5


