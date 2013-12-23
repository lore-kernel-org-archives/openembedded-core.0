Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA9060CFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 08:36:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBN8aMaD011998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 00:36:22 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 23 Dec 2013 00:36:22 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Dec 2013 16:36:19 +0800
Message-ID: <cover.1387787578.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for systemd's ptest
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
X-List-Received-Date: Mon, 23 Dec 2013 08:36:23 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The current status for systemd's ptest is not good. It has only two test cases.
However, it's better to have something than nothing. So we need to make these
two test cases actually have effect. This is what this patchset is trying to achieve.

//Chen Qi

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-ptest
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-ptest

Chen Qi (2):
  busybox: enable SEAMLESS_XZ by default
  systemd: fix ptest to make it able to run on target

 meta/recipes-core/busybox/busybox/defconfig |    2 +-
 meta/recipes-core/systemd/systemd/run-ptest |    1 +
 meta/recipes-core/systemd/systemd_208.bb    |   12 ++++++++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.7.9.5


