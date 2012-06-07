Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScZ6f-0003MB-Hl
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 11:34:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q579Nm7u022167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 02:23:48 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 7 Jun 2012 02:23:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2012 17:24:38 +0800
Message-ID: <cover.1339051007.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] opkg 0.1.8: do_fetch failed since no checksum specified
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
X-List-Received-Date: Thu, 07 Jun 2012 09:34:17 -0000
Content-Type: text/plain

The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/opkg_sum
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/opkg_sum

Robert Yang (1):
  opkg 0.1.8: do_fetch failed since no checksum specified

 .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 --------------------
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    5 ++-
 2 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch



