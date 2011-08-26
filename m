Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QwsnJ-0003NI-5Z
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:33:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7Q9Ste2001793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 02:28:55 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 26 Aug 2011 02:28:54 -0700
Message-ID: <cover.1314345568.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 26 Aug 2011 15:59:28 +0800
Date: Fri, 26 Aug 2011 17:29:41 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas, eglibc-gconvs and eglibc-charmps to variable PACKAGE
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
X-List-Received-Date: Fri, 26 Aug 2011 09:33:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The above variables lost their function, which caused no locale resources in an lsb image because locale resources were splitted from eglibc-package.inc and put into "eglibc-locale.inc".
For continuing to effect the above variables, I move them from eglibc-package.inc to eglibc-locale.inc.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/eglibc-locale
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/eglibc-locale

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas,
    eglibc-gconvs and eglibc-charmps to variable PACKAGE

 meta/recipes-core/eglibc/eglibc-locale.inc  |   20 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc |   20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)



