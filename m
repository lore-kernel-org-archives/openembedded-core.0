Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21FBC6F534
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 07:17:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s237H28L001042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 23:17:02 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 2 Mar 2014 23:17:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 15:16:48 +0800
Message-ID: <cover.1393830830.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/3] readline: upgrade to 6.3
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
X-List-Received-Date: Mon, 03 Mar 2014 07:17:03 -0000
Content-Type: text/plain

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/readline
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/readline

Hongxu Jia (3):
  readline: upgrade to 6.3
  readline: update configure-fix.patch
  readline: drop
    readline-only-enable-meta-key-for-a-single-call-read.patch

 .../readline/{readline-6.2 => files}/acinclude.m4  |   0
 .../readline/{readline-6.2 => files}/norpath.patch |   0
 .../{files => readline-5.2}/configure-fix.patch    |   0
 ...ly-enable-meta-key-for-a-single-call-read.patch | 114 ---------------------
 .../readline/readline-6.3/configure-fix.patch      |  35 +++++++
 meta/recipes-core/readline/readline_6.2.bb         |  22 ----
 meta/recipes-core/readline/readline_6.3.bb         |   5 +
 7 files changed, 40 insertions(+), 136 deletions(-)
 rename meta/recipes-core/readline/{readline-6.2 => files}/acinclude.m4 (100%)
 rename meta/recipes-core/readline/{readline-6.2 => files}/norpath.patch (100%)
 rename meta/recipes-core/readline/{files => readline-5.2}/configure-fix.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
 create mode 100644 meta/recipes-core/readline/readline-6.3/configure-fix.patch
 delete mode 100644 meta/recipes-core/readline/readline_6.2.bb
 create mode 100644 meta/recipes-core/readline/readline_6.3.bb

-- 
1.8.1.2


