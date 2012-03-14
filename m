Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7kPb-0006SI-36
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:22:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E9Dfee012022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:13:41 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 14 Mar 2012 02:13:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:13:20 +0800
Message-ID: <cover.1331716010.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] aviod creating invalid symlinks
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
X-List-Received-Date: Wed, 14 Mar 2012 09:22:27 -0000
Content-Type: text/plain

The following changes since commit 81379dc141e245307ca391a02b7490b199128991:

  dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gcc

Robert Yang (1):
  gcc-cross: aviod creating invalid symlinks

 .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.7.4.1



