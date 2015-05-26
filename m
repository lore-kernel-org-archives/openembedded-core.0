Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFC2D755CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:20:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q7KNYd016613
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 00:20:23 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 26 May 2015 00:20:23 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 May 2015 15:14:42 +0800
Message-ID: <cover.1432624313.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/2] Upgrade libav and fix one qemu cve issue
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
X-List-Received-Date: Tue, 26 May 2015 07:20:27 -0000
Content-Type: text/plain

The following changes since commit 971ce829df02cf6970d2a4af377704b8930feee9:

  bitbake: data: Move warning code to the first loop for performance (2015-05-25 09:00:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/CVEs
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/CVEs

Kai Kang (2):
  qemu: fix CVE-2015-3456
  libav: upgrade to 9.18

 .../qemu/qemu/qemu-CVE-2015-3456.patch             | 92 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  1 +
 meta/recipes-multimedia/libav/libav.inc            |  2 -
 .../libav/libav/libav-fix-CVE-2014-9676.patch      | 98 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.16.bb        |  4 -
 meta/recipes-multimedia/libav/libav_9.18.bb        |  6 ++
 6 files changed, 197 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav_9.16.bb
 create mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb

-- 
1.9.1


