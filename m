Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T0wQt-0003jE-1Q
	for openembedded-core@linuxtogo.org; Mon, 13 Aug 2012 17:19:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7DD4Sr1014073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2012 06:04:28 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 13 Aug 2012 06:04:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2012 21:01:15 +0800
Message-ID: <cover.1344860952.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: openembedded-core@linuxtogo.org, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] qemu.inc: disable curl for qemu-nativesdk
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
X-List-Received-Date: Mon, 13 Aug 2012 15:19:55 -0000
Content-Type: text/plain

The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:

  foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qemu

Robert Yang (1):
  qemu.inc: disable curl for qemu-nativesdk

 meta/recipes-devtools/qemu/qemu.inc       |    4 +++-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)



