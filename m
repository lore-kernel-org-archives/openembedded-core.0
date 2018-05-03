Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03CE374825
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:51:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w438pMcK018309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2018 01:51:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 3 May 2018 01:51:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 16:52:51 +0800
Message-ID: <cover.1525337490.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] testsdk.bbclass: set PREMIRRORS for kernel to speed up test
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
X-List-Received-Date: Thu, 03 May 2018 08:51:22 -0000
Content-Type: text/plain

The following changes since commit b6bc5b2840246ac0f0e5d8cebcdffc1a0ca2518f:

  bitbake: toaster: add 'Sumo' to release selection (2018-04-26 11:43:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/testsdkext-speed
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/testsdkext-spped

Chen Qi (1):
  testsdk.bbclass: set PREMIRRORS for kernel to speed up test

 meta/classes/testsdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


