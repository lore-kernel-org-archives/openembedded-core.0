Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC227C7A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 05:41:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x695f5Kd024912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2019 22:41:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 8 Jul 2019 22:40:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2019 13:53:27 +0800
Message-ID: <cover.1562651589.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sysstat: use service file from source codes
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
X-List-Received-Date: Tue, 09 Jul 2019 05:41:04 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 4a68a44f56c725914cfa721993a2ea8a3dc6ebd5:

  cve-update-db: Catch request.urlopen errors. (2019-07-05 12:00:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysstat-systemd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysstat-systemd

Chen Qi (1):
  sysstat: use service file from source codes

 meta/recipes-extended/sysstat/sysstat.inc             |  8 ++------
 meta/recipes-extended/sysstat/sysstat/sysstat.service | 12 ------------
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service

-- 
1.9.1


