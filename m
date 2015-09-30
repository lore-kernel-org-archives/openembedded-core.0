Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D64E777000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:54:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7sIjl003041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:54:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 30 Sep 2015 00:54:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 15:47:16 +0800
Message-ID: <cover.1443599169.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
MIME-Version: 1.0
Subject: [PATCH 0/2] Two fixes for fontconfig and iptables
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
X-List-Received-Date: Wed, 30 Sep 2015 07:54:21 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 4bc3f0994e68b3302a0523a3156dd0dca0cac7a0:

  bitbake: toaster: move clones into subdirectory (2015-09-29 14:11:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/fixes

Kai Kang (2):
  iptables: only check libnetfilter-conntrack when libnfnetlink is
    enabled
  fontconfig: fix buildpaths QA check

 ...check-conntrack-when-libnfnetlink-enabled.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |  3 +-
 .../fontconfig/fontconfig_2.11.94.bb               |  4 +++
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch

-- 
2.6.0.rc2.10.gf4d9753


