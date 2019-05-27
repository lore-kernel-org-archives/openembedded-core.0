Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 666527E14D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 01:22:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4R1LgUb014245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 18:21:57 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 26 May 2019 18:21:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 May 2019 09:33:20 +0800
Message-ID: <cover.1558920694.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] systemd: avoid musl specific patches affect glibc systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 May 2019 01:22:06 -0000
Content-Type: text/plain

Changes in V2:
* change to use libc-musl override for SRC_URI

The following changes since commit 06381a917e7e7648ace4746cbda55dcd138a64ec:

  perl/modules: Add various missing ptest perl module dependencies (2019-05-22 07:24:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-musl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-musl

Chen Qi (1):
  systemd: avoid musl specific patches affect glibc systems

 meta/recipes-core/systemd/systemd_242.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


