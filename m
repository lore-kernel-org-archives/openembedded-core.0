Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScWRY-0005W9-BC
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 08:43:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q576X7O8020490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 23:33:11 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 23:33:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2012 14:33:56 +0800
Message-ID: <cover.1339035261.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] apt 0.7.14: do_compile failed with gcc 4.7
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
X-List-Received-Date: Thu, 07 Jun 2012 06:43:40 -0000
Content-Type: text/plain

* Tested on:
  Ubuntu 10.10 (gcc 4.4.5)
  FC 17 64 bit (gcc 4.7.0)

// Robert

The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/apt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/apt

Robert Yang (2):
  apt-get 0.7.14: hangs at runtime
  apt 0.7.14: do_compile failed with gcc 4.7

 .../apt/apt-0.7.14/remove-redeclaration.patch      |   32 ++++++++++++--------
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    6 +--
 4 files changed, 23 insertions(+), 18 deletions(-)



