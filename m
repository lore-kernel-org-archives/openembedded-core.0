Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89DE077E88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 07:42:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19007744"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2017 15:42:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 56ADD47C7C62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 15:42:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 18 May 2017 15:42:06 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 May 2017 15:40:30 +0800
Message-ID: <1495093230-84780-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 56ADD47C7C62.A6E74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3 0/2] upgrade libx11 and libx11-diet
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
X-List-Received-Date: Thu, 18 May 2017 07:42:07 -0000
Content-Type: text/plain

1)Upgrade libx11 from 1.6.4 to 1.6.5

2)Upgrade libx11-diet from 1.6.4 to 1.6.5

 .../xorg-lib/{libx11-diet_1.6.4.bb => libx11-diet_1.6.5.bb}           | 4 ++--
 meta/recipes-graphics/xorg-lib/{libx11_1.6.4.bb => libx11_1.6.5.bb}   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.4.bb => libx11-diet_1.6.5.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.4.bb => libx11_1.6.5.bb} (47%)

-- 
2.7.4




