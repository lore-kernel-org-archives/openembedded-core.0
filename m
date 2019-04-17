Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E34527D24C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 03:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3H385CP002792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 20:08:16 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 16 Apr 2019 20:07:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 11:18:50 +0800
Message-ID: <cover.1555471115.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: fix ptest failure about 'dc'
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
X-List-Received-Date: Wed, 17 Apr 2019 03:08:26 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit c23c8ebc7f66a92110bfc9e3c4d633a432d1353b:

  core-image-sato-sdk-ptest: Try and keep image below 4GB limit (2019-04-16 11:10:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-dc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-dc

Chen Qi (1):
  busybox: fix ptest failure about 'dc'

 ...ix-two-test-case-to-also-depend-on-DC_BIG.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.30.1.bb        |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch

-- 
1.9.1


