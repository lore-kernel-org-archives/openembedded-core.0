Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1F926B50B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 14:14:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBDEEP30011286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 06:14:36 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Dec 2018 06:14:14 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 09:14:09 -0500
Message-ID: <cover.1544710323.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix build errors for x32
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
X-List-Received-Date: Thu, 13 Dec 2018 14:14:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit e235a9e18bad4758650c11cd98133de695b72bd1:

  bitbake: bitbake-user-manual: Added "usehead" parameter. (2018-12-10 20:32:05 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/systemd-req
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/systemd-req

Kai Kang (2):
  systemd: fix compile error for x32
  lttng-tools: fix compile error for x32

 ...hanges-type-of-drift_freq-to-int64_t.patch | 49 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  1 +
 .../lttng/lttng-tools/x32.patch               | 28 +++++++++--
 3 files changed, 74 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch

-- 
2.19.0.rc2


