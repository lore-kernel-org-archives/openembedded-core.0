Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSDVc-0004Mu-QI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:29:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49KJNI7028405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 13:19:23 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 13:19:22 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 15:19:20 -0500
Message-ID: <cover.1336594657.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: Avoid empty $PATH components
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
X-List-Received-Date: Wed, 09 May 2012 20:29:17 -0000
Content-Type: text/plain

Empty components (including $PATHs starting or ending with a colon)
have the same harmful effects as a "." in $PATH.

The following changes since commit 8de7f8045f28aecfe796afcdb013c557ce9d1372:
  Martin Jansa (1):
        kmod: fix upgrade path from module-init-tools

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/cleanup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/cleanup

Peter Seebach (1):
  sanity.bbclass: Detect empty $PATH components too

 meta/classes/sanity.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)



