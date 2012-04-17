Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SKGbx-0001sV-SZ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:10:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3HM1UZB019059
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 15:01:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Apr 2012 15:01:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 17:05:51 -0500
Message-ID: <cover.1334700265.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix incorrect update-alternative settings in matchbox-wm-2
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
X-List-Received-Date: Tue, 17 Apr 2012 22:10:58 -0000
Content-Type: text/plain

This looks like it was a simple copy/paste induced error.. fixed.w

The following changes since commit 89788fbd10fdfbbe54927339d7ec516d0e4d7ef5:

  libproxy: Allow to build in non-gplv3 configuration (2012-04-17 14:08:27 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fixes

Mark Hatle (1):
  matchbox-wm-2: Fix incorrect update-alternatives

 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.3.4



