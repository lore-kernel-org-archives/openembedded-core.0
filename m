Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 162AB7DF72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:20:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E6KLtR018845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 23:20:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 13 Jun 2019 23:20:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2019 14:32:17 +0800
Message-ID: <cover.1560493910.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] oescripts.py: avoid error when cairo module is not available
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
X-List-Received-Date: Fri, 14 Jun 2019 06:20:20 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit e00d88475d0ed7b161f5f58dd13bc9a72e3efdf9:

  bluez: fix test case failures with GCC 9 (2019-06-12 21:08:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oescripts-cairo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oescripts-cairo

Chen Qi (1):
  oescripts.py: avoid error when cairo module is not available

 meta/lib/oeqa/selftest/cases/oescripts.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


