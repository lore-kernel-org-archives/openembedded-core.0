Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE16374B02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:46:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w442k3BT010868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2018 19:46:23 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 3 May 2018 19:46:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 May 2018 10:47:58 +0800
Message-ID: <cover.1525401100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] testsdk.bbclass: set PREMIRRORS for kernel to speed up test
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
X-List-Received-Date: Fri, 04 May 2018 02:46:33 -0000
Content-Type: text/plain

Changes in V2:
* Remove the 'protocol=file'.

The following changes since commit b6bc5b2840246ac0f0e5d8cebcdffc1a0ca2518f:

  bitbake: toaster: add 'Sumo' to release selection (2018-04-26 11:43:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/testsdkext-speed
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/testsdkext-speed

Chen Qi (1):
  testsdk.bbclass: set PREMIRRORS for kernel to speed up test

 meta/classes/testsdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


