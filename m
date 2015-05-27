Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id CEE48756BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:49:14 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so94512466igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZQ7ONc+LY49jgZ3QLyuAycR7952B7U1kJdln+HJfVHk=;
	b=QPRTDxS1qEc3rLiBYKn+rEp17d1h6UBi4hIedsN9He/wra7LiIHZB8PlY/OgXmjIOH
	YGlQu73xB0vH9jUubn5ZxdcbAC+OWaoH2TXtFf0HqMyZy596Nco7HOpllopz4Q8kvbvj
	UAH/+eobmVnJNmIKWLWglJp1BPpAvbL39qNiW327re6DHfjj0pqGtzUgNTXTl0AbyLJ3
	PZopqZRaetDR4lemU9Vg0xi/weRH33iixEP9+uJ1VRzd5OMQNHQaXXDOpfAIP7byXZa0
	s8kikZzOkCMsDMMp74PKDo3GuSY8683yrGp3cXaKE+4fHNrw3NGKO6ktDR4kDZwhahLI
	WKfQ==
X-Received: by 10.43.76.195 with SMTP id zf3mr5171289icb.62.1432752555593;
	Wed, 27 May 2015 11:49:15 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qs10sm211381igb.14.2015.05.27.11.49.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 11:49:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 11:48:50 -0700
Message-Id: <1432752530-20335-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432752530-20335-1-git-send-email-armccurdy@gmail.com>
References: <1432752530-20335-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gnutls: control zlib support via PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 May 2015 18:49:15 -0000

Remains enabled by default, no functional change.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 87f275a..e9b138a 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "zlib nettle"
+DEPENDS = "nettle"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -34,8 +34,9 @@ do_configure_prepend() {
 	done
 }
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "zlib"
 PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
+PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
 
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
-- 
1.9.1


