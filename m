Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3B6B6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:04:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3L942P6015453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Apr 2015 02:04:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 02:04:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 02:04:00 -0700
Message-ID: <cover.1429606943.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] bison: don't depend on help2man
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
X-List-Received-Date: Tue, 21 Apr 2015 09:04:02 -0000
Content-Type: text/plain

Sorry, I wrongly removed this patch when upgrade bison.

// Robert

The following changes since commit c9b06c79ed8a082d1b385e9f61721aeeda9bf1af:

  init-install-efi.sh: fix gummiboot entry installation (2015-04-21 07:19:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bison
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bison

Robert Yang (1):
  bison: don't depend on help2man

 .../bison/dont-depend-on-help2man.patch.patch      |   46 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |    1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch

-- 
1.7.9.5


