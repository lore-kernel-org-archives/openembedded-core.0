Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5EE60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 08:40:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11102260"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2016 16:40:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id ED09D4623464;
	Mon, 19 Sep 2016 16:40:17 +0800 (CST)
Received: from localhost.localdomain (10.167.226.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 19 Sep 2016 16:40:20 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 16:39:49 +0800
Message-ID: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.93]
X-yoursite-MailScanner-ID: ED09D4623464.AC561
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: jsmoeller@linuxfoundation.org
Subject: [PATCH v2 0/1] To make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Mon, 19 Sep 2016 08:40:31 -0000
Content-Type: text/plain

There are some problems in spdx module(spdx.bbclass).
1. The newest version of spdxi specification is 2.0. But even spdx 1.1, yocto+SPDX can't support well.
2. It is complex to build a Yocto+SPDX environment.
3. Creating a spdx file spends too much time, especially for large software.

To improve spdx module ,I change the spdx create tool from fossology to dosocs2.
With this patch:
1. Also gets license informations by scanner from fossology.
1. Can support SPDX2.0 SPEC.
2. Because dosocs2 can work on directories, so there is no necessary to pack source code before do_spdx. It can save time for large software.

Lei Maohui (1):
  Make yocto-spdx support spdx2.0 SPEC

 meta/classes/spdx.bbclass | 505 ++++++++++++++++++----------------------------
 meta/conf/licenses.conf   |  67 +-----
 2 files changed, 198 insertions(+), 374 deletions(-)

-- 
1.9.1




