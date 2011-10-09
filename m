Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RCnYd-0004lI-OI
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 09:12:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9976gUB016444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Oct 2011 00:06:42 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 9 Oct 2011 00:06:42 -0700
Message-ID: <cover.1317030097.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Sep 2011 17:41:37 +0800
Date: Sun, 9 Oct 2011 15:11:45 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] lsb: Change link of ${baselib} to lib64 for 64bits system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Oct 2011 07:12:24 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Binaries of lsb test suite need ld-linux.so* in /lib64. 
for example: 
Target$ ./lsbcmdchk 
-sh: ./lsbcmdchk: No such file or directory 
Target$ strings lsbcmdchk | grep "ld-" 
/lib64/ld-lsb-x86-64.so.3 
"lsbcmdchk" from lsb test suite is a binary program. 
A new modification to lsb_1.4.bb caused that binaries from lsb test suite can't run because binaries of lsb test suite need ld-linux.so* in /lib64. But the link is changed due to adding multilib. I changed this link again



Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/lsb64
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/lsb64

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  lsb: Change link of ${baselib} to lib64 for 64bits system

 meta/recipes-extended/lsb/lsb_1.4.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)



