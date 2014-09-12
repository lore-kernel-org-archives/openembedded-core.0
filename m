Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7E371403
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 07:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8C7nSnS026490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 00:49:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 12 Sep 2014 00:49:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 15:43:08 +0800
Message-ID: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: jslater@windriver.com
Subject: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 07:49:34 -0000
Content-Type: text/plain

Add machine qemuarm64. The configure files are derived from linaro.

Update:
* rename genericarmv8 to qemuarm64 for coordination in oe-core
* include qemu.inc then remove common part of config
* disable using autoserial
* move arch-armv8.inc from machine/include/arm64 to machine/include/arm

There are some packages fail to build with qemuarm64, I will send pathches
for them in another series.

Kai Kang (1):
  Add machine qemuarm64

 meta/conf/bitbake.conf                       |  1 +
 meta/conf/machine/include/arm/arch-armv8.inc | 20 ++++++++++++++++++++
 meta/conf/machine/qemuarm64.conf             | 12 ++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf

-- 
1.9.1


