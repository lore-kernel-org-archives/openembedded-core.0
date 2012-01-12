Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlBBT-0004Xg-52
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 04:18:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0C3B3W5019816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 19:11:03 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 11 Jan 2012 19:11:03 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 11:10:40 +0800
Message-ID: <cover.1326337436.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [V4] [PATCH 0/4] lttng-2.0 new recipe for merge
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 03:18:35 -0000
Content-Type: text/plain

Hi Richard/Saul, 

This is the clean thread of lttng-2.0 for merge.

Thanks,
Zumeng

The following changes since commit 0f4d99d207b224bb9ce23de00a48f795ae20b3a0:

  multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0-for-merge
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zumeng/lttng-2.0-for-merge

Zumeng Chen (4):
  lttng-ust: Integrate into yocto linux
  lttng-tools: Integrated from git repo.
  lttng-modules: from lttng-modules 2.0 git repo.
  babeltrace: Integrated from version 0.8

 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 +++++++++++++
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++++++++++++
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +++++++++++++
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   28 +++++++++++++
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++
 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   25 ++++++++++++
 6 files changed, 179 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb

-- 
1.7.5.4



