Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Soxo4-0004vI-Hs
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:22:20 +0200
Received: by eekc50 with SMTP id c50so367358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/v4r+XW6BlXos8tYSrTlIsMY34rEPzMA+3FfzXQyXug=;
	b=d5PUXOZdrOQbmJ5YhLoTUCHFqtQi0nbs4FgCE6PhPsUD//m5r/kiY3+GeTGFJ2KjPQ
	WoHf7kGhbXhky/UseOvNr0CsPUE9ho5fzlMg3znqUxkoTSAvjEAypfkuN2F7FoMohBzv
	8PGvd/5dX4zTvArrVQcMD/p1Pjjuja0cbpR3lm9R9SztRQX2Szmy7UM0qYbUhptEJxu5
	6MmNk+bFB+zByaOnnAzAgDncxKaixxRRbi8OvS3I5FNpzhnSzLcBXH1xQLexNTZkQ7Ux
	Pr+ofZa3KW6dADzoue7przrWA9rBPdshNRA7FW3KcNFw7yUCsC1B4/Nu4s22cRWUxv2u
	fVfA==
Received: by 10.14.188.129 with SMTP id a1mr11684281een.10.1342015866022;
	Wed, 11 Jul 2012 07:11:06 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id o16sm6177076eeb.13.2012.07.11.07.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 07:11:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 16:10:54 +0200
Message-Id: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk9ZROw+1f68H5lsL+MfaUIK+XLTbw+uw7W2k3+Hx4HP+qULmbO4lksU29g0wHliMOXrlP1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] xz: update to 5.1.2alpha
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
X-List-Received-Date: Wed, 11 Jul 2012 14:22:20 -0000

This contains bugfixes from the 5.0.3 and 5.0.4 releases

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} (86%)

diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
similarity index 86%
rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
index 7fa7177..9d68720 100644
--- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
-SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
-
-PR = "r0"
+SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
+SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
 
 inherit autotools gettext
 
-- 
1.7.10



