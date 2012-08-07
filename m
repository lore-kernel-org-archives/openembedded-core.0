Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Syirv-0007l0-Ry
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 14:26:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77CEq7a004179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 05:14:52 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 7 Aug 2012 05:14:52 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2012 20:14:22 +0800
Message-ID: <cover.1344341416.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Tue, 07 Aug 2012 12:26:40 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix the warning form pcmciautils building:

"WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libsysfs.so.2 => /usr/lib/libsysfs.so.2"

Just refer to Debian/Ubuntu distributions, install sysfsutils libs
to "/lib*" instead of "/usr/lib*".

[YOCTO #2907]

The following changes since commit 99e6ed0b468d0269c432e250e90e3d0d96b709f1:

  iputils: Break libsysfs dependency (2012-08-07 12:58:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2907
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2907

Wenzong Fan (1):
  sysfsutils: install libs to base_libdir

 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5



