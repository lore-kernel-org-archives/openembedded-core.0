Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 304D66FF6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 06:44:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB36i2Ph020839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 22:44:02 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 2 Dec 2015 22:44:01 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Dec 2015 14:32:25 +0800
Message-ID: <cover.1449123744.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] packagegroup-core-tools-testapps:disable kexec for for mips64 and mis64n32
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
X-List-Received-Date: Thu, 03 Dec 2015 06:44:03 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 698c74c373110ed081a7586e21d4a27b8b44c89b:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:32:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/pgroup-testapps
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/pgroup-testapps

Kai Kang (1):
  packagegroup-core-tools-testapps: disable kexec for mips64 and
    mis64n32

 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.6.1


