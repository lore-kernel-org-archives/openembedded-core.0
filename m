Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T3tqS-0005Al-HN
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:10:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7LIwSaZ002160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:58:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 21 Aug 2012 11:58:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 13:58:23 -0500
Message-ID: <cover.1345575401.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1 denzil] Fix for generation of russian locale
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
X-List-Received-Date: Tue, 21 Aug 2012 19:10:32 -0000
Content-Type: text/plain

The following changes since commit 95756cfbb7a9348b23cb46a49a5509e57e973faf:

  valgrind: fix default.supp missing issue (2012-08-21 11:19:26 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/denzil-eglibc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/denzil-eglibc

Jeff Polk (1):
  recipes-core/eglibc-2.13: Patch for locale-base-tt-ru packaging

 .../eglibc/eglibc-2.13/supported-tt-ru.patch       |   13 +++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch

-- 
1.7.3.4



