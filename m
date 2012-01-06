Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Rj5JS-00061Y-1K
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:38:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q068UieZ022912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 00:30:44 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 6 Jan 2012 00:30:44 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jan 2012 16:20:08 +0800
Message-ID: <cover.1325837822.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Fri, 06 Jan 2012 08:38:13 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Archive the sources and build scripts for license compliance checking
by end users or legal departments.

The functionality is in a separate class which 'archive.bbclass' and the
user can optionally include it for archiving any packages.

[Yocto #1590]

The following changes since commit 5797feac5f06f5cc363869cd440b82b3eaafd456:
  Richard Purdie (1):
        image-mklibs/package_ipk: Remove bashisms

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1590
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1590

Wenzong Fan (1):
  archive.bbclass: archive work directory

 meta/classes/archive.bbclass |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archive.bbclass



