Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SjndV-0005Sb-OM
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 10:30:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5R8JBrK013610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 01:19:11 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 27 Jun 2012 01:19:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 16:19:51 +0800
Message-ID: <cover.1340773014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] icu 3.6: do_install failed: Segmentation fault
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
X-List-Received-Date: Wed, 27 Jun 2012 08:30:06 -0000
Content-Type: text/plain

The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/icu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/icu

Robert Yang (2):
  icu 3.6: dropp apply=yes from path
  icu 3.6: do_install failed: Segmentation fault

 .../icu/files/larger-cmd-size.patch                |   27 ++++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |    9 ++++--
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 3 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch



