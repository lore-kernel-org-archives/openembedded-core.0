Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F324979B40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:50:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C2oEUJ001051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 19:50:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:50:06 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 12 Oct 2018 10:08:43 +0800
Message-ID: <cover.1539309942.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/1] nss: fix non-determinism when create a blank certificate
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
X-List-Received-Date: Fri, 12 Oct 2018 02:50:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* update comment in nss recipe

The following changes since commit 8a2e53b525ebc4f50c7384af056cbe67a3913282:

  libxml2: Make it compatible with externalsrc (2018-10-10 17:59:09 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/nss

Kai Kang (1):
  nss: fix non-determinism when create a blank certificate

 meta/recipes-support/nss/nss/blank-cert9.db   | Bin 0 -> 28672 bytes
 meta/recipes-support/nss/nss/blank-key4.db    | Bin 0 -> 36864 bytes
 .../recipes-support/nss/nss/system-pkcs11.txt |   5 +++++
 meta/recipes-support/nss/nss_3.38.bb          |  21 +++++++++++-------
 4 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/blank-cert9.db
 create mode 100644 meta/recipes-support/nss/nss/blank-key4.db
 create mode 100644 meta/recipes-support/nss/nss/system-pkcs11.txt

-- 
2.18.0


