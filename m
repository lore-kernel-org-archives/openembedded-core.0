Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18FDB6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 08:35:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8Q8Zxef006564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 01:35:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 26 Sep 2017 01:35:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Sep 2017 16:41:37 +0800
Message-ID: <cover.1506415261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd-serialtty: allow empty package
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
X-List-Received-Date: Tue, 26 Sep 2017 08:35:59 -0000
Content-Type: text/plain

The following changes since commit f7c3a0267aeae74a216de9f081b2cb189388ad88:

  qemurunner: print tail qemu log in case bootlog is empty (2017-09-25 14:16:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/serialtty_allow_empty
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/serialtty_allow_empty

Chen Qi (1):
  systemd-serialtty: allow empty package

 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


