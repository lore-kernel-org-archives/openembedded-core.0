Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7977BE41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 09:24:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O9OLB9027775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 01:24:22 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 01:24:21 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 17:33:00 +0800
Message-ID: <cover.1548322104.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] eSDK.py: avoid error in tearDownClass due to race condistion
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
X-List-Received-Date: Thu, 24 Jan 2019 09:24:21 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit ba0b32ebc3520c367915657b8fb8878be5bfde92:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:07 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/eSDK-race
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/eSDK-race

Chen Qi (1):
  eSDK.py: avoid error in tearDownClass due to race condistion

 meta/lib/oeqa/selftest/cases/eSDK.py | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


