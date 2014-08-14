Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAF56084E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:00:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7EA0717007322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 03:00:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 03:00:07 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 17:55:47 +0800
Message-ID: <1408010149-1272-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/2] Enable aarch64 support for qemu
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
X-List-Received-Date: Thu, 14 Aug 2014 10:00:14 -0000
Content-Type: text/plain

Enable aarch64 support for qemu.

Use linaro prebuilt aarch64 for test. Test steps:
1 run native qemu with aarch64 image:

$ wget http://people.linaro.org/~alex.bennee/images/aarch64-linux-3.15rc2-buildroot.img

$ tmp/sysroots/x86_64-linux/usr/bin/qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt -nographic -smp 1 -m 2048  -kernel aarch64-linux-3.15rc2-buildroot.img


2 run qemu-system-aarch64 on core-image-sato of qemux86-64
$ runqemu qemux86 qemuparams="-m 2048"

When booted, run
$ qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt -nographic -smp 1 -m 2048  -kernel aarch64-linux-3.15rc2-buildroot.img

Boot could boot aarch64 image successfully.


Kai Kang (2):
  qemu: add PACKAGECONF lzo
  qemu: enable aarch64 support

 meta/recipes-devtools/qemu/qemu-targets.inc | 2 +-
 meta/recipes-devtools/qemu/qemu.inc         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.9.1


