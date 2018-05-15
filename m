Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA5B174DF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:47:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4F9lGTV013165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 02:47:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 May 2018 02:47:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2018 17:17:00 +0800
Message-ID: <cover.1526375750.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] diffstat: fix wrong evaluation of CC
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
X-List-Received-Date: Tue, 15 May 2018 09:47:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 5479654eeaaa0f81bfff54ca49369c87f1658705:

  rm_work: Stop appending _setscene to do_image_complete_setscene stamps (2018-05-11 07:49:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/diffstat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/diffstat

Kai Kang (1):
  diffstat: fix wrong evaluation of CC

 .../diffstat/avoid-check-user-break-cc.patch       | 26 ++++++++++++++++++++++
 meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch

-- 
2.14.1


