Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqTQK-0005ex-VE
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 19:52:21 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so6590038lab.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AfsTaWEsGCo/JsZZvK0k1j5+CfCckQdTZiwhQo8fy04=;
	b=kv3fAXckoWRs/5Di45wjORPbnTgfBrrO10ivzJEHXjuOQoGBK38qQv9jwqTFG3y8u4
	oNjlam8kkBB0wsWiX19jHvZMYnvnuuX8myOt30HnqwyYgt6jhytGQ6Vgx9+DHsTcos4K
	4/+2o++2u/U2qaRKcbeZwaEFyW+SoLOVKFy9zKtItdf+YZF/a6ZW3ztjUJQX2KNJuK2J
	LQRSjogDoPl408eZ/BlaQ8lD0MsDO7gE0i3QNLgkQv35rvW/82UPhpReJ2kufNrZnQxU
	5MECq1f9EtYUhXi8QzpZuHVFh/wl3QVqOUcij6ATCnLnn38IaD86P8eSPF29ynCGwe/G
	xlwg==
X-Received: by 10.152.162.1 with SMTP id xw1mr44850026lab.3.1357151838380;
	Wed, 02 Jan 2013 10:37:18 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ox6sm17626109lab.16.2013.01.02.10.37.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 10:37:17 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqTBj-0006CP-9k; Wed, 02 Jan 2013 20:37:15 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 20:37:09 +0200
Message-Id: <1357151830-23755-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357151830-23755-2-git-send-email-cazfi74@gmail.com>
References: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-2-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 2/3] gmp: update SRC_URI and HOMEPAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 18:52:22 -0000

Fetch from gmplib.org instead of gnu mirror.
List gmplib.org as homepage instead of old broken URL.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/gmp/gmp.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 789d6d0..823811f 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -1,9 +1,9 @@
 SECTION = "devel"
 DESCRIPTION = "GNU multiprecision arithmetic library"
-HOMEPAGE = "http://www.swox.com/gmp/"
+HOMEPAGE = "http://gmplib.org/"
 LICENSE = "GPLv3 LGPLv3"
 
-SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}.tar.bz2 \
 	   file://configure.patch \
 	   file://amd64.patch "
 
-- 
1.7.10.4



