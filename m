Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BCAD771A34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:00:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9QA0vwf023992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 03:00:57 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Oct 2016 03:00:56 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 17:54:48 +0800
Message-ID: <cover.1477475596.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/2] V2: Fix qemu cve issues
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
X-List-Received-Date: Wed, 26 Oct 2016 10:00:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:

* correct commit messages

The following changes since commit 30d1af89ce2a2fb30f32a898ec12c9a51db57013:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemu-cves
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemu-cves

Kai Kang (2):
  qemu: supplementary fix of CVE-2016-5403
  qemu: fix CVE-2016-7423 and CVE-2016-7908

 ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch | 57 ++++++++++++++++++++
 .../qemu/qemu/0002-fix-CVE-2016-7423.patch         | 45 ++++++++++++++++
 .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  3 ++
 4 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch

-- 
2.10.1


