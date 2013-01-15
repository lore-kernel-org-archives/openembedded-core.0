Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tv30U-0004AB-6K
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:40:35 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so729692eei.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 01:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=l0w84b/gtycmRNq7tRnRbOb0qZSM0b07KbwWUXQurCU=;
	b=Ihx4opwd2k3GrIUW9ISLu3hz6OBsjakDiJX46Z8OaGapQp4RpycNZjfAeXE3b0zZRx
	wPpvJCq3sF7wJ0jR3+6vQpXj/V9Ugba9vb7aGZcpMpRi6Ao/cVLSqH8EZrOD1g4l0TJJ
	qRfRLideoVeRlHD06lTg1xK0hgLx3ersaHvZN9SIKPH67fyPw7v6cJvibVOpt2fTI5va
	kFr8d8jUgozWcH5j8ndtRM6lze8QYQ9Tb9pxtGyXn6RGq+xj7+0aomnuG8bD07N44OQh
	sTK5bABm5HjJXA2Ndz0dXO+RotrNIf9SEWWESqpBX5DowNzxbW4ef2HooKcvVIHumguC
	IjLQ==
X-Received: by 10.14.221.5 with SMTP id q5mr239243090eep.33.1358241914163;
	Tue, 15 Jan 2013 01:25:14 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm24802960eep.12.2013.01.15.01.25.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:25:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 10:24:40 +0100
Message-Id: <1358241880-3921-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
References: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnFN1LqJf6SDOSLarwuElDR2U654O2E7QDmbXpizAFelf/X/6yTzSwqyRSklBGJKOlrTBfr
Cc: scott.a.garmin@intel.com
Subject: [for-denzil][Fedora 18 fixes][PATCH 4/4] libtasn1: Upgrade to 2.13
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
X-List-Received-Date: Tue, 15 Jan 2013 09:40:37 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/libtasn1_2.12.bb | 22 ----------------------
 meta/recipes-support/gnutls/libtasn1_2.13.bb | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1_2.12.bb
 create mode 100644 meta/recipes-support/gnutls/libtasn1_2.13.bb

diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
deleted file mode 100644
index d0b4191..0000000
--- a/meta/recipes-support/gnutls/libtasn1_2.12.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Library for ASN.1 and DER manipulation"
-HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
-
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE_${PN}-bin = "GPLv3+"
-LICENSE_${PN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
-
-PR = "r1"
-
-SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
-           file://libtasn1_fix_for_automake_1.12.patch \
-           "
-
-SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
-SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
-
-inherit autotools binconfig lib_package
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gnutls/libtasn1_2.13.bb b/meta/recipes-support/gnutls/libtasn1_2.13.bb
new file mode 100644
index 0000000..891c5b6
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1_2.13.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Library for ASN.1 and DER manipulation"
+HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
+
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
+
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
+           file://libtasn1_fix_for_automake_1.12.patch \
+           "
+
+SRC_URI[md5sum] = "df27eaddcc46172377e6b907e33ddc83"
+SRC_URI[sha256sum] = "a56e46483d1d42fe44ba58c9758620844042468d7c2d75f6318cdf3222745a91"
+
+inherit autotools binconfig lib_package
+
+BBCLASSEXTEND = "native"
-- 
1.8.1



