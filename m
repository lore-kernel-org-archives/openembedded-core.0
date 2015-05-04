Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128B865D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 20:55:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t44KtpOV022934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 13:55:51 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 13:55:50 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 15:55:48 -0500
Message-ID: <cover.1430767796.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.6.5
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
X-List-Received-Date: Mon, 04 May 2015 20:55:51 -0000
Content-Type: text/plain

This fixes the spammy message about "quasi-mismatches" for directories.

Actual change:

-               if (!!S_ISDIR(by_path.mode) != trailing_slash) {
+               if (trailing_slash && !S_ISDIR(by_path.mode)) {

Seems pretty straightforward, right?

The following changes since commit 9484fb04c0ed8b3e08c6773662dc7a0f01cb39a8:

  directfb: Improve CFLAGS handling for x86 (2015-05-03 11:42:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo165
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo165

Peter Seebach (1):
  pseudo 1.6.5: less pointlessly chatty

 meta/recipes-devtools/pseudo/{pseudo_1.6.4.bb => pseudo_1.6.5.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.4.bb => pseudo_1.6.5.bb} (77%)

-- 
2.3.1


