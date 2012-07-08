Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFf-0001HK-80
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:27 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qmX8IvK6wmuYyIU9OlGJXIpSAQZH4RsSOOErxd/AyWU=;
	b=nVVxQrGfw+c2fypxu2XBrb011pLH1JFh+zMsZzOagxPsUZLdyA+n3asNsg67xvqr6F
	85/wMRpL8s4DRwa6qHHzftDFfh+cWdDICuov6ZfSvfM/O10E+U8ai23NE1/w+JlfKvv+
	bYPtjWfNyn99E5NBiSmox9s0WZSsE+rF4oyReymKwjUghYmXb1OXyrh29OlEmSKBWwwy
	6Jpt79Ux//2rGaX0ant2ahQG81W/6bhB5aBFEoxcAPScOb44HxTes/mhTI8TIbJHRUC6
	pL1kODixf2L5rfeNGoR7qMacWhPO+krGvdOuEvmHSRIvzVp9y2fPQXEvZ2DQbwAUuWcW
	TIsQ==
Received: by 10.68.223.198 with SMTP id qw6mr53187581pbc.94.1341763880933;
	Sun, 08 Jul 2012 09:11:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:28 -0700
Message-Id: <d688fd9b5b48a95fa46c8c80af78ccd8ba8b9e38.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 10/19] boost: Upgrade recipe to 1.50.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2012 16:22:27 -0000

1.49.0 is not buildable with eglibc 2.16 since
it exposes a define TIME_UTC which is also used
in boost until 1.50.0 when it was renamed to
TIME_UTC_ so instead of porting needed patches
we upgrade boost to latest release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../boost/{boost_1.49.0.bb => boost_1.50.0.bb}     |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/boost/{boost_1.49.0.bb => boost_1.50.0.bb} (53%)

diff --git a/meta/recipes-support/boost/boost_1.49.0.bb b/meta/recipes-support/boost/boost_1.50.0.bb
similarity index 53%
rename from meta/recipes-support/boost/boost_1.49.0.bb
rename to meta/recipes-support/boost/boost_1.50.0.bb
index 71fdc48..78ebf1e 100644
--- a/meta/recipes-support/boost/boost_1.49.0.bb
+++ b/meta/recipes-support/boost/boost_1.50.0.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://arm-intrinsics.patch"
-
-SRC_URI[md5sum] = "0d202cb811f934282dea64856a175698"
-SRC_URI[sha256sum] = "dd748a7f5507a7e7af74f452e1c52a64e651ed1f7263fce438a06641d2180d3c"
+SRC_URI[md5sum] = "52dd00be775e689f55a987baebccc462"
+SRC_URI[sha256sum] = "c9ace2b8c81fa6703d1d17c7e478de3bc51101c5adbdeb3f6cb72cf3045a8529"
-- 
1.7.9.5



