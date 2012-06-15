Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SfT21-0005HE-Fq
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 11:41:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5F9Uosl002783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 02:30:50 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 15 Jun 2012 02:30:49 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 17:30:39 +0800
Message-ID: <cover.1339751573.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] lsbinitscripts: support multilib, link function and add the header for patch
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
X-List-Received-Date: Fri, 15 Jun 2012 09:41:29 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the multilib support for this package and remove the original 
/etc/init.d/functions and link functions to functions.lsbinitscripts.
Add the header for patch.

The following changes since commit 3f292735407e50eebb23044fa9f579906a94e800:

  gcc-configure-target: Fix sysroot option breakage I introduced (sorry) (2012-06-14 19:48:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/lsbinitscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/lsbinitscripts

Xiaofeng Yan (3):
  multilib.conf: Add the support of multilib for lsbinitscripts
  lsbinitscripts: Remove original /etc/init.d/functions when building
    an lsb image
  lsbinitscripts: Add the header for functions.patch

 meta/conf/multilib.conf                            |    1 +
 .../lsb/lsbinitscripts/functions.patch             |    3 +++
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |    8 +++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
1.7.9.5



