Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 923BA75ACF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6Qchs022600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:38 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:32 -0700
Message-ID: <470b45f7752d5b2de5b46b65164a5b472ad2e96c.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] perl: remove default byteorder from config.sh
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:36 -0000
Content-Type: text/plain

Fixed test case:
Failed test 146 - single result for config_re('byteorder') at ../lib/Config.t
      got "2"
expected "1"

There is a byteorder in config.sh-32/64.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl/config.sh |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index d80f0c0..9fb5042 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -83,7 +83,6 @@ bin_ELF='define'
 binexp='@USRBIN@'
 bison='bison'
 byacc='byacc'
-byteorder='12345678'
 c=''
 castflags='0'
 cat='cat'
-- 
1.7.9.5


