Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbuzX-0004iR-9f
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:48:50 +0200
Received: by mail-wi0-f182.google.com with SMTP id c10so1101896wiw.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=FULzt5QwrXC6xDJISM0XYCifGd2wcgMdUJc4YplwreI=;
	b=RTHLabld6g+OL980FqKcFhjM6lRNBc5Wx9+F9wE8Isrc4LRHo3JBqHddbybI7q072f
	y7bk7wqys4RoV+eiBP8TNdQQVyqUvyUwh6H4wFBXpP1Ya2H4joqMHEsR98B1NX2IL8bx
	zteaCij5Rj0dLBAlZaLP2aqCXa9ncqxrBP+sfkSLdn1Qd30KTzAF6VIvjy3MFQFzJPFN
	LEMG4+04LRDs5CdDRaofKJV9hlOfFfMivSsSyncaGf4B2+OsdZvr78MrXmth+HmrPyCh
	3mO2NrXU7mgNbGjgqOo7xAXTTEzk0OKs6pq7xAQ+SC3xGMePuWmw6J5xUxXIffaepQH5
	tfWA==
X-Received: by 10.180.39.137 with SMTP id p9mr9503778wik.27.1368459037356;
	Mon, 13 May 2013 08:30:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id g8sm17746881wiy.4.2013.05.13.08.30.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 08:30:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 16:27:30 +0100
Message-Id: <1368458850-5309-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm+BzCrilUx581IfwwJplJgNCk7uNFsYRLhQGi+1k8Dpm831WIMrsRBlRJdIkEGPORbaGR1
Subject: [PATCH] glib-2.0: drop dependency on python-argparse
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
X-List-Received-Date: Mon, 13 May 2013 15:49:00 -0000

Since 2.20 the use of argparse was removed, so we don't need these dependencies
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
index a042972..0afb73b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
@@ -2,9 +2,9 @@ require glib.inc
 
 PE = "1"
 
-DEPENDS += "libffi python-argparse-native zlib"
-DEPENDS_class-native += "libffi-native python-argparse-native"
-DEPENDS_class-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
+DEPENDS += "libffi zlib"
+DEPENDS_class-native += "libffi-native"
+DEPENDS_class-nativesdk += "nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-- 
1.7.10.4



