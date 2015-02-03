Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F18CB6E65D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131CNPW012998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:05 -0800
Message-ID: <a1bc8702d8c0287fb9ca1d477e6c9e1601c9ebe0.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/21] grep 2.5.1a: fix unknown-configure-option
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:22 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: grep: configure was passed unrecognised options: --disable-ncurses [unknown-configure-option]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/grep/grep_2.5.1a.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 1ce112e..178fc31 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92b
 
 inherit autotools gettext texinfo
 
-EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
+EXTRA_OECONF = "--disable-perl-regexp"
 
 CFLAGS += "-D PROTOTYPES"
 do_configure_prepend () {
-- 
1.7.9.5


