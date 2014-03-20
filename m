Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDC1A6F8EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:19:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2KJJ4k1025488
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:19:04 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 20 Mar 2014 12:19:03 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 14:19:01 -0500
Message-ID: <cover.1395342974.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix minor problem with useradd and useradd-static
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
X-List-Received-Date: Thu, 20 Mar 2014 19:19:06 -0000
Content-Type: text/plain

Fix a minor performance issue with useradd.bbclass, where it evaluated user/
group adds for nativesdk packages -- even though it didn't do them.

Fix a build problem w/ useradd-static, when in enforcing mode the system could
fail to build a nativesdk recipe if the specified user/groups were not present.


The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/uidgid
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid

Mark Hatle (1):
  useradd{-static}: Ignore useradds on nativesdk

 meta/classes/useradd-staticids.bbclass | 3 ++-
 meta/classes/useradd.bbclass           | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.5.3


