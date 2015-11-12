Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 588FC7724B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 21:00:46 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so75978481pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 13:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dP3J6KKX0qHJTUq8EkX/TpZZXlCXXkErKO5Dm8U0quk=;
	b=okTKQ9QNkNZaDaF7y6pnm/HY7eJE7zLCJkHb/UBmQxaPnF5dDunYaf6i3Rpj/WApv6
	t4X595rYtI3gnFWj7C4IQvFE2U+R0iCMveAT+ijWnxRFUD3jxpMgtzwNf6+ri5YEyPkZ
	W9pOLKiMrLehDpBp9NyaAm5hDhlR7uiCsRKX1U/UUcwJq1pIuoV6RRU47p2VBTIdd0aF
	Cb2bAkfeIz9FTCMp1K8yA2cCfJpTDYDpO1Qhv1kVrWQg3kVpgP6znXoPcAdw8DnjJI/Z
	Hc4P70ei8nVgjwau/00eQ15zcCmOgMHEeb1vQPyOeMv3/1U5CvUe0V1ioZ8bhLOr4ZjA
	IBBg==
X-Received: by 10.66.254.73 with SMTP id ag9mr26267379pad.116.1447362046673;
	Thu, 12 Nov 2015 13:00:46 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ir5sm16388088pbc.13.2015.11.12.13.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 13:00:45 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:00:39 -0800
Message-Id: <1447362039-16268-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] boost.inc: remove unused parameter from get_boost_parallel_make()
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
X-List-Received-Date: Thu, 12 Nov 2015 21:00:50 -0000

The bb parameter seems to have been accidentally left behind after:

  http://git.openembedded.org/openembedded-core/commit/?id=1ff36aaec25a7ee89514366fe484345e8d1d7b64

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 3288e84..a1b434d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -114,7 +114,7 @@ BJAM_TOOLS   = "--ignore-site-config \
 
 # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater paralelism causes bjam to segfault or to ignore -j
 # https://svn.boost.org/trac/boost/ticket/7634
-def get_boost_parallel_make(bb, d):
+def get_boost_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE', True)
     if pm:
         # look for '-j' and throw other options (e.g. '-l') away
@@ -136,7 +136,7 @@ def get_boost_parallel_make(bb, d):
 
     return ""
 
-BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(bb, d)}"
+BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/example/user-config.jam \
-- 
1.9.1


