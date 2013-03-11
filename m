Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UEthr-0005dN-1V
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 04:47:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2B3UfQe024805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Mar 2013 20:30:41 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 10 Mar 2013 20:30:41 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 11:31:16 +0800
Message-ID: <cover.1362966448.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] Split do_package_qa in insane.bbclass to be a new task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 03:47:31 -0000
Content-Type: text/plain

Hi Richard,

This patch is try to accomplish Yocto #3190, and you said:

"
The sanity tests in insane.bbclass need refactoring to make it easier to extend.
In particular, some packaging tests are currently ending up in package.bbclass.
These should be in insane.bbclass with hooks added as appropriate.

Further, all tests should honour the settings of QA_WARN and QA_ERROR.
"

do_package_qa is splitted as a new task run after do_package. Then 'inherit package'
could be removed from insane.bbclass, and do_package_qa doesn't end in package.bbclass.

I know this patch is not enough for this feature, but I want to make sure this is the 
right direction and hope to receive more guidance.

Would you like to give more guidance?

Thanks a lot.

Regards,
Kai


The following changes since commit 93ec7b4d1550e07caec86e2998d0f94a01c7e785:

  xserver-xf86-config: atom-pc doesn't need a xorg.conf (2013-03-04 14:42:11 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/insane
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/insane

Kang Kai (1):
  insane.bbclass: make do_package_qa be a task

 meta/classes/insane.bbclass |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

-- 
1.7.5.4



