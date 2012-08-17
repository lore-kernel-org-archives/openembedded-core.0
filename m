Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T2PIq-0001bF-Eg
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:21:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7HG9eQS011667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:09:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 17 Aug 2012 09:09:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 11:25:39 -0500
Message-ID: <cover.1345220525.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix broken attempt only installs with RPM
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
X-List-Received-Date: Fri, 17 Aug 2012 16:21:40 -0000
Content-Type: text/plain

The following changes since commit 99815eddd4e1eb5d939831704231537dd5a995ad:

  classes/chrpath: improve chrpath failure handling (2012-08-17 15:25:01 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/rpm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (1):
  package_rpm.bbclass: Fix attemptonly install failures

 meta/classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.3.4



