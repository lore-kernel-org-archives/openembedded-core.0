Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B5A5F7CD51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 09:10:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,427,1544457600"; d="scan'208";a="55605325"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Mar 2019 17:10:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DAEDB4C5345B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:10:10 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 1 Mar 2019 17:10:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 17:10:29 +0800
Message-ID: <20190301091032.2745-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: DAEDB4C5345B.AA2B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 0/3] at-spi2-atk related upgrade
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
X-List-Received-Date: Fri, 01 Mar 2019 09:10:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade at-spi2-atk and it's dependence.

The dependencies are as follows:
	at-spi2-atk[2.31.2] depends on atk[>= 2.31.1]
	at-spi2-atk[2.31.2] depends on at-spi2-core[>= 2.31.2]

Zang Ruochen (3):
  atk: upgrade 2.30.0 -> 2.31.92
  at-spi2-core: upgrade 2.30.0 -> 2.31.2
  at-spi2-atk: upgrade 2.30.0 -> 2.31.2

 ...i2-atk_2.30.0.bb => at-spi2-atk_2.31.2.bb} |  4 +-
 ...-core_2.30.0.bb => at-spi2-core_2.31.2.bb} |  4 +-
 ...001-Switch-from-filename-to-basename.patch | 38 -------------------
 .../atk/{atk_2.30.0.bb => atk_2.31.92.bb}     |  5 +--
 4 files changed, 6 insertions(+), 45 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.31.2.bb} (80%)
 rename meta/recipes-support/atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.31.2.bb} (92%)
 delete mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
 rename meta/recipes-support/atk/{atk_2.30.0.bb => atk_2.31.92.bb} (86%)

-- 
2.20.1




