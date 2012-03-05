Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S4Yrk-0007tG-8f
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 15:26:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q25EHiOD024069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Mar 2012 06:17:44 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 5 Mar 2012 06:17:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2012 22:17:34 +0800
Message-ID: <cover.1330956344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Allow rotate log across filesystems
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
X-List-Received-Date: Mon, 05 Mar 2012 14:26:20 -0000
Content-Type: text/plain

This patch is based on oe-core, and the pull request is on poky-contrib

The testing summary:
1) Add the olddir to logrotate.conf, and the olddir should have a
   different mount point of the current log directory.

2) Run "logrotate -f /path/to/logrotate.conf" to force rotate,
   the old log should be rotated to the olddir which is on another
   mount point.

//Robert

The following changes since commit a439d32dd843d10a9f65cc858b02422fac7deb50:

  soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE (2012-03-04 05:41:11 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/logrotate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/logrotate

Robert Yang (1):
  logrotate 3.7.9: Allow rotate log across filesystems

 .../allow-across-different-filesystems.patch       |  154 ++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    5 +-
 2 files changed, 157 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch

-- 
1.7.4.1



