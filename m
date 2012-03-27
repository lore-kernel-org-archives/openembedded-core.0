Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SCSzo-00026G-OK
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 11:47:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R9cIRR003980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 02:38:18 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 27 Mar 2012 02:38:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 17:37:16 +0800
Message-ID: <cover.1332839233.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nspr 4.8.9: failed to build on x86_64 board
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
X-List-Received-Date: Tue, 27 Mar 2012 09:47:21 -0000
Content-Type: text/plain

* The test info, tested on:
  -> The hosts are:
     Fedora 16 64bit, Ubuntu 10.10 32bit
  -> The MACHINEs are:
     qemux86, qemux86-64 and qemuarm

// Robert

The following changes since commit d3e0beed9eef53018158c9f999cd20b44629aa61:

  guile: Deal with hardcoded path issues (2012-03-27 00:29:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/nspr
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/nspr

Robert Yang (1):
  nspr 4.8.9: failed to build on x86_64 board

 .../nspr/files/fix-build-on-x86_64.patch           |   51 ++++++++++++++++
 .../nspr/files/trickly-fix-build-on-x86_64.patch   |   62 ++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |    4 +-
 3 files changed, 116 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/fix-build-on-x86_64.patch
 create mode 100644 meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch



