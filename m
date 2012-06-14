Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SfG7q-0006Vx-A9
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:54:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5EJhxG0024228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 12:43:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 14 Jun 2012 12:43:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 14:50:58 -0500
Message-ID: <cover.1339703427.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix incorrect busybox alternative
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
X-List-Received-Date: Thu, 14 Jun 2012 19:54:38 -0000
Content-Type: text/plain

The following changes since commit ba380813c0198f95b1e786aa7f49b80c68cfe9b9:

  gcc-configure-target: Fix sysroot option breakage I introduced (sorry) (2012-06-14 19:48:07 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc

Mark Hatle (1):
  busybox: Fix syslog configuration file

 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.3.4



