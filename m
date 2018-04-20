Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C37B71AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 02:04:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3K24u3a005678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 19:04:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 19 Apr 2018 19:04:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 10:05:59 +0800
Message-ID: <cover.1524043165.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cross-canadian: fix do_configure failure when switching machine and multilib
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
X-List-Received-Date: Fri, 20 Apr 2018 02:04:55 -0000
Content-Type: text/plain

The following changes since commit d012a9acdc3dce014705224a1261145628e75931:

  scripts/test-dependencies.sh: remove (2018-04-13 16:58:07 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cross-canadian-mlprefix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cross-canadian-mlprefix

Chen Qi (1):
  cross-canadian: fix do_configure failure when switching machine and
    multilib

 meta/classes/cross-canadian.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.9.1


