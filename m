Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SXrVi-0000rQ-JI
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 12:12:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4PA2TxK004469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 03:02:29 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 25 May 2012 03:02:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 18:02:37 +0800
Message-ID: <cover.1337933617.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 25 May 2012 10:12:43 -0000
Content-Type: text/plain

The following changes since commit 6558abda67956e4fab1304b0cdf03c65f18fabd5:

  qemu: disable vnc-jpeg compression (2012-05-24 08:53:57 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/ipk_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch

Robert Yang (1):
  opkg 0.1.8: respect to the arch when choose the alternatives

 .../opkg/opkg/respect-to-arch.patch                |   47 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    1 +
 meta/recipes-devtools/opkg/opkg_svn.bb             |    1 +
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/respect-to-arch.patch



