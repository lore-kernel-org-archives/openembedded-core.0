Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlWJ9-0003Sk-BY
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 02:51:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0D1iM4w001092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:44:22 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 12 Jan 2012 17:44:22 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2012 09:44:02 +0800
Message-ID: <cover.1326418292.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [PATCH 0/4] [V5] lttng-2.0 new recipe
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
X-List-Received-Date: Fri, 13 Jan 2012 01:51:56 -0000
Content-Type: text/plain

V5 Changes vs all previous versions:
1 ) fixed all Darren's comments;
2 ) fixed all Saul's comments;
    +LICENSE = "MIT & GPLv2" for 0004-babeltrace..
    Upstream-Status: Pending for lttng-tools-fix-compiling..
    +LICENSE = "GPLv2 & LGPLv2.1" for 0002-lttng-tools-..

Thanks,
Zumeng

The following changes since commit 0f4d99d207b224bb9ce23de00a48f795ae20b3a0:

  multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zumeng/lttng-2.0

Zumeng Chen (4):
  lttng-ust: Update to 2.0
  lttng-tools: Update to 2.0-pre16
  lttng-modules: Update to 2.0
  babeltrace: Integrated from version 0.8

 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 +++++++++++++
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++++++++++++
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +++++++++++++
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 +++++++++++++
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++
 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   25 ++++++++++++
 6 files changed, 178 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb

-- 
1.7.5.4



