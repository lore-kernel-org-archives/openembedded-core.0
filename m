Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1AE8601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:05:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6585w2c029806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:05:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:05:57 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jul 2017 15:58:13 +0800
Message-ID: <cover.1499241206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 08:05:58 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a distro feature openssl-no-weak-ciphers to make openssl disable weak
ciphers support, including:

* des
* ec
* ecdh
* ecdsa
* md2
* mdc2

The following changes since commit 4b1d270602a0542eef1b497eaf15bad2b747686f:

  bitbake: bitbake-user-manual: Removed and replaced broken link (2017-07-04 16:05:22 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/ciphers-weak
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ciphers-weak

Kai Kang (2):
  openssl: disable weak ciphers
  bind: disable ecdsa if openssl doesn't support it

 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 1 +
 meta/recipes-connectivity/openssl/openssl.inc    | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.10.1


