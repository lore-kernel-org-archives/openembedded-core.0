Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SklUC-00043W-1G
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 02:24:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5U0DTnA009513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 17:13:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 17:13:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 19:22:36 -0500
Message-ID: <cover.1341015667.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] SDK related misc changes
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
X-List-Received-Date: Sat, 30 Jun 2012 00:24:28 -0000
Content-Type: text/plain

Two minor changes related to SDK generations.  One is a bug fix, the other
allows for better control over the per-file dependency generation.

The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4ac:

  mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (2):
  libc-common: Allow debug package to append, not set depends
  package.bbclass: Allow a package to skip per file dependency
    generation

 meta/classes/libc-common.bbclass |    6 +++---
 meta/classes/package.bbclass     |    3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.7.3.4



