Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F094A60125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 07:12:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA27CvGP012075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Nov 2015 23:12:57 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 1 Nov 2015 23:12:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 2 Nov 2015 15:12:50 +0800
Message-ID: <4e960b4b187cd48e690046bd856103ac87fc2485.1446448302.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446448302.git.hongxu.jia@windriver.com>
References: <cover.1446448302.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] default-distrovars: remove less from WHITELIST_GPL-3.0
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
X-List-Received-Date: Mon, 02 Nov 2015 07:12:59 -0000
Content-Type: text/plain

As oe-core commit 37c8c2c5f6937520eaf9f5d981f9315e36eba4bb and
fa7bdf96b8eb8b5078db38249c5c60ec511c35c6 said, Mark Nudelman
(author of less) has given permission to utilize a generic 2-clause
BSD, so we remove it from WHITELIST_GPL-3.0 which caused
a QA Warning while INCOMPATIBLE_LICENSE += "GPLv3 LGPLv3 GPLv3+ LGPLv3+"
...
|NOTE: INCLUDING less as buildable despite INCOMPATIBLE_LICENSE
because it has been whitelisted
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 8366904..8866f0d 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -24,7 +24,7 @@ IMAGE_FEATURES ?= ""
 # This is a list of packages that are used by the build system to build the distribution, they are not
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
-WHITELIST_GPL-3.0 ?= "less"
+WHITELIST_GPL-3.0 ?= ""
 LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
-- 
1.9.1


