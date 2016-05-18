Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35AB57705C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4I7hnJb025855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:50 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:43 -0700
Message-ID: <c2290591b4980081070a524be2daeb1de8f79e44.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] buildtools-tarball: remove nativesdk-python-pexpect
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
X-List-Received-Date: Wed, 18 May 2016 07:43:49 -0000
Content-Type: text/plain

It was added for testing, and not needed any more after:
4a8a74c62836a20610daf029d4cec0b3087758b2
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Mon Mar 21 02:25:50 2016 -0700

    gpg_sign.py: get rid of pexpect

So remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index e9578ca..dd28b96 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -12,7 +12,6 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-modules \
     nativesdk-python-misc \
     nativesdk-python-git \
-    nativesdk-python-pexpect \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
-- 
2.8.0


