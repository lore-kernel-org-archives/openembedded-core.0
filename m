Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 398B765F98
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 07:53:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s467r2bG012126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 00:53:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 6 May 2014 00:53:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 15:53:11 +0800
Message-ID: <cover.1399362735.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] mmc-utils: fix compilation failure for mips64 target.
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
X-List-Received-Date: Tue, 06 May 2014 07:53:04 -0000
Content-Type: text/plain

The following changes since commit b77494025b3d47fd5130ae6c445ac84cabb1f91e:

  sstatetests: Use TUNE_ARCH instead of TARGET_ARCH (2014-05-04 17:36:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/mmc-utils-qemumips64
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/mmc-utils-qemumips64

Chen Qi (1):
  mmc-utils: fix compilation failure for mips64 target.

 ...mc.h-don-t-include-asm-generic-int-ll64.h.patch |   28 ++++++++++++++++++++
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |    4 +--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch

-- 
1.7.9.5


