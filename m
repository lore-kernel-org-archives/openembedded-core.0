Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAD4F6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 08:15:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8K8FPaK007816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Sep 2016 01:15:25 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 01:15:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 20 Sep 2016 04:15:22 -0400
Message-ID: <cover.1474359109.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Tue, 20 Sep 2016 08:15:26 -0000
Content-Type: text/plain

Boot a target environment with rpm:

1). With option '--nodigest --nosignature', installing package
with bad signature is successful
====== 
root@localhost:~# rpm -ivh hello-bogus.rpm
error: hello-bogus.rpm: Header V4 DSA signature: BAD, key ID 09753bca

======

2). Without option '--nodigest --nosignature', installing package
with bad signature failed
======
root@localhost:~# rpm -ivh --nodigest --nosignature  hello-bogus.rpm
Preparing...                ########################################### [100%]
   1:hello                  ########################################### [100%]
======

BTW: the package with bad signature hello-bogus.rpm in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10308

//Hongxu

The following changes since commit 49a7839e602eac2c43415d9c8f17ad8315fd1da5:

  build-appliance-image: Create image in correct location (2016-09-19 08:58:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-rpm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-rpm

Hongxu Jia (1):
  rpm: make install with --nosignature and --nodigest work

 ...0001-system.h-query.c-support-nosignature.patch | 75 ++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

-- 
2.8.1


