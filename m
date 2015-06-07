Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA5897580F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jun 2015 07:56:24 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHH97210; Sun, 07 Jun 2015 15:56:22 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.158.1; Sun, 7 Jun 2015 15:56:17 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jun 2015 07:52:17 +0000
Message-ID: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5573F926.00CF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 817bf996226149bb3f20d2d54f89d67f
Subject: [PATCH 0/3] busybox: sync and backport some patches
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
X-List-Received-Date: Sun, 07 Jun 2015 07:56:26 -0000
Content-Type: text/plain

First, synchronize the patches for busybox_git, which is not used by
default although.

Then, backport two necessary commits from upstream.

Junling Zheng (3):
  busybox: sync the patches for git version
  busybox: fix double free error for ifconfig
  busybox: fix the wrong help text for chown

 .../busybox/busybox/0001-chown-fix-help-text.patch | 34 +++++++++++
 ...ix-double-free-fatal-error-in-INET_sprint.patch | 67 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  2 +
 meta/recipes-core/busybox/busybox_git.bb           |  4 ++
 4 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch

-- 
1.8.3.4


