Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39E6677147
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:43:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u786hAh1015907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 23:43:10 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 23:43:09 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2016 02:43:04 -0400
Message-ID: <cover.1470637742.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Mon, 08 Aug 2016 06:43:10 -0000
Content-Type: text/plain

The following changes since commit 5b61fa04a335a4fdefd435dc25d4bac41ee21e39:

  bitbake: toaster-tests: fix URL given for Chromedriver download (2016-07-29 09:53:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-bash-ptest-run-intl-failed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-bash-ptest-run-intl-failed

Dengke Du (1):
  bash: fix run-intl ptest failed

 meta/recipes-extended/bash/bash/fix-run-intl.patch | 116 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch

-- 
2.8.1


