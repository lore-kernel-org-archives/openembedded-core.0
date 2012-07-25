Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Stvnk-0001d5-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:14:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6P731eY020119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 00:03:01 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 25 Jul 2012 00:03:01 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2012 15:02:57 +0800
Message-ID: <cover.1343199345.git.Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Jul 2012 07:14:32 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

[YOCTO #2829] 

mtools commands use cp850 as the "mtools_default_codepage", they would
use this to do some coverting tasks. 

So, add glibc-gconv-ibm850 to RDEPENDS for mtools commands to run 
correctly.




The following changes since commit 0ffb02eec2beaea27ff0ec9d3d31b0a09e675a4c:

  documentation: Updated the h6 style to use a larger font (2012-07-24 10:35:34 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xouyang/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xouyang/master

Xin Ouyang (1):
  mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS

 meta/recipes-devtools/mtools/mtools_3.9.9.bb  |   20 +++++++++++++++++++-
 meta/recipes-devtools/mtools/mtools_4.0.17.bb |   20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

-- 
1.7.9.5



