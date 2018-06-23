Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6744D75449
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:53:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424591"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:53:41 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 475CB4B34D54
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 18:53:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Sat, 23 Jun 2018 18:53:41 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 03:52:53 +0800
Message-ID: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 475CB4B34D54.A73D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 0/8] [PATCH v2]meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Sat, 23 Jun 2018 10:53:41 -0000
Content-Type: text/plain

1. To make dnf work on cross-development environment.

2. To enable runtime dependencies for dnf-nativesdk.

Zheng Ruoqin (8):
  [OE-core][PATCH v2] slang: add nativesdk
  [OE-core][PATCH v2] libnewt: Add nativesdk
  [OE-core][PATCH v2] libnewt-python: Add nativesdk
  [OE-core][PATCH v2] libnewt-python: Add PROVIDES for nativesdk.
  [OE-core][PATCH v2] createrepo-c: Add nativesdk
  [OE-core][PATCH v2] update-rc.d: Add nativesdk
  [OE-core][PATCH v2] rpm: Add DEPENDS for nativesdk.
  [OE-core][PATCH v2] meta-toolchain: Added dnf-nativesdk into
    cross-development toolchain.

 meta/classes/toolchain-scripts.bbclass                             | 1 +
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 4 ++++
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb                   | 2 +-
 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb             | 7 ++++++-
 meta/recipes-devtools/file/file_5.32.bb                            | 2 ++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb                            | 1 +
 meta/recipes-extended/newt/libnewt-python_0.52.20.bb               | 2 +-
 meta/recipes-extended/newt/libnewt_0.52.20.bb                      | 2 +-
 meta/recipes-extended/slang/slang_2.3.2.bb                         | 2 +-
 9 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.7.4




