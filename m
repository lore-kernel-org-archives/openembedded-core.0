Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E85F73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 15:30:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9QFUuOq018034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Oct 2015 08:30:56 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 26 Oct 2015 08:30:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Oct 2015 10:30:54 -0500
Message-ID: <1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
References: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [jethro/master][PATCH 1/1] local.conf.sample: Disable image-prelink by default
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
X-List-Received-Date: Mon, 26 Oct 2015 15:30:59 -0000
Content-Type: text/plain

Due to problems with the prelinker itself, we need to disable the
image-prelink by default.  This will hopefully be re-enabled in the near
future.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/local.conf.sample | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3ae24ab..9d1480e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -128,7 +128,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
+# that you do NOT run the prelinker at this time. 
+USER_CLASSES ?= "buildstats image-mklibs"
 
 
 #
-- 
1.9.3


