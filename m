Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnEoX-0000VA-W2
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 22:07:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66JuZuB027470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:56:35 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:56:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 15:06:41 -0500
Message-ID: <cover.1341605152.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Small RPM package fix
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
X-List-Received-Date: Fri, 06 Jul 2012 20:07:42 -0000
Content-Type: text/plain

A couple of minor RPM fixes that affect non-default configurations.

The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:

  bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc

Mark Hatle (1):
  rpm: Fix PACKAGECONFIG dependencies

 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.3.4



