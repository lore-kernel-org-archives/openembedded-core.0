Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SV7W3-0004Fx-PZ
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:41:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4HKVd9v009079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 13:31:39 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 May 2012 13:31:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 15:34:19 -0500
Message-ID: <cover.1337286797.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix sed warning message in sstate
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
X-List-Received-Date: Thu, 17 May 2012 20:41:44 -0000
Content-Type: text/plain

The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:

  fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 07:33:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sstate

Mark Hatle (1):
  sstate.bbclass: Make sure we don't have an empty fixmepath file

 meta/classes/sstate.bbclass |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

-- 
1.7.3.4



