Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54485705CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:34:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEYsB1012909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:34:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:34:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:34:53 -0700
Message-ID: <cover.1405434689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel.bbclass: add perl python bash to RDEPENDS_kernel-dev
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
X-List-Received-Date: Tue, 15 Jul 2014 14:34:54 -0000
Content-Type: text/plain

Send this patch in another thread since it is special, added:

RDEPENDS_kernel-dev = "perl bash python"

Now the perl-dev, bash-dev and python-dev will also be pulled in since
kernel-dev is a dev package.

// Robert

The following changes since commit fa325e44f5b429b4038022b31285af9c94672943:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:19:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kernel-dev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/kernel-dev

Robert Yang (1):
  kernel.bbclass: add perl python bash to RDEPENDS_kernel-dev

 meta/classes/kernel.bbclass |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


