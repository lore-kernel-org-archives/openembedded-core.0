Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UMsCu-0000Hm-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:48:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r323VCpm012832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 20:31:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 20:31:12 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2013 11:31:20 +0800
Message-ID: <cover.1364872107.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/2] make rpm-postinsts installed on target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 03:48:24 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 92aeb31341b28b193d616ab5cf38af1b9673e37d:

  qemuimage-testlib: Fix quoting issue (2013-03-30 17:26:56 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rpm-postinsts-problem
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rpm-postinsts-problem

Chen Qi (2):
  image.bbclass: allow override for ROOTFS_BOOTSTRAP_INSTALL
  rootfs_rpm.bbclass: make rpm-postinsts installed on target

 meta/classes/image.bbclass      |    2 +-
 meta/classes/rootfs_rpm.bbclass |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5



