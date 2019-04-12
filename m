Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2247F7DB50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 01:30:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3C1Tggs018976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 18:29:52 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 18:29:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2019 09:40:05 +0800
Message-ID: <cover.1555033053.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] runqemu: do not check return code of tput
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
X-List-Received-Date: Fri, 12 Apr 2019 01:30:02 -0000
Content-Type: text/plain

Changes in V2:
* Add comments in runqemu script to make clear that we are deliberately ignoring the return code.

The following changes since commit 9f7092416c40a96d9567bde99475de15a30e4989:

  insane.bbclass: Trigger unrecognzed configure option for meson (2019-04-11 21:15:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/qemu-tput
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/qemu-tput

Chen Qi (1):
  runqemu: do not check return code of tput

 scripts/runqemu | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.9.1


