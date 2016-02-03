Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 215226FFCE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 21:17:16 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n128so19903009pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QbG3h6JDvtoswGGNCcq9HlOqNyqM1CMsBGHrMxk9kmU=;
	b=QAkUV5JxGeKUiynk4XwUTCX4U7I9PZt5vA8DfZXLADDLx/Zllyq2uD6OQ2CtklomUj
	WIBqyTCprqAkQR0+G8FWD5Ant7i080lgR0H3QuUKEqOEGv3KL2bYv6mEZc5NZC6P0R6C
	2DfwThTzS1DKaOr1RAXyiDSvXVu/7qsydvElNgyacJQBDblh/F+BBCrqXOZCvEGL7UJa
	aWqVbrKtUAhrNObBDRWacYmOSjkUWyrDFTehLJ3ozC7S+dmFE2fgQNsc+xWLJ/Mhwe0G
	6Gx2Jf42xpxf6ZpzjriK27tnpBiXGrBuaGsLa1d0IitAOr4oE5c/mrS9vJgx2wGPwtwC
	CVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QbG3h6JDvtoswGGNCcq9HlOqNyqM1CMsBGHrMxk9kmU=;
	b=DirMDnnxPKFEH9Hga2NF3G6yq6KcxbpxaBgUCXMuyTbam5fbwbXvydZxIXvKu2q0Or
	3XWY3NQU+M89odyx0lbnQPz9mP3WuTOxRx/h8xOkP/u6jI/LeETCFQp96YjIOmv/NWoi
	zUiW6+CthElNJPNHOmLl/S3OJx/FuDFE3RmElrLDKN6ExKTN5tLynxKG5zjb7D83NS0W
	qzAPPKlopR7E3QF/Sa+bV90fMdC+2reHdDhi0fUxCXFeO+S1CptQp6MQAuZkyGZXTIOM
	3whwL8mp75XxWoMaPyQ8KBelVpLlcuEjyydBHAxupTKjvDHNvBKSEHX7+FYesnIeKcWd
	kFXg==
X-Gm-Message-State: AG10YOQX5qXBdnpaoxfkfS4GcE0c+TITiKzKxPhQIkbwsoFYuevMC0TO2r1QjGgAKgqqWA==
X-Received: by 10.98.32.5 with SMTP id g5mr5790140pfg.74.1454534237650;
	Wed, 03 Feb 2016 13:17:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	70sm11894896pfc.69.2016.02.03.13.17.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 13:17:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 13:17:11 -0800
Message-Id: <1454534231-20079-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnutls: update 3.4.8 -> 3.4.9
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
X-List-Received-Date: Wed, 03 Feb 2016 21:17:20 -0000

This version fixes bugs in the current stable branch.

* Version 3.4.9 (released 2016-02-03)

** libgnutls: Corrected ALPN protocol negotiation. Before GnuTLS would
   negotiate the last commonly supported protocol, rather than the
   first. Reported by Remi Denis-Courmont (#63).

** libgnutls: Tolerate empty DN fields in informational output
   functions.

** libgnutls: Corrected regression causes by incorrect fix in
   gnutls_x509_ext_export_key_usage() at 3.4.8 release.

** API and ABI modifications:
No changes since last version.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.4.8.bb => gnutls_3.4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.4.8.bb => gnutls_3.4.9.bb} (60%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.4.8.bb b/meta/recipes-support/gnutls/gnutls_3.4.9.bb
similarity index 60%
rename from meta/recipes-support/gnutls/gnutls_3.4.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.4.9.bb
index 41eb91a..b652f6f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.4.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.4.9.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "a26e6dd8d5ad92016e3f068795b89624"
-SRC_URI[sha256sum] = "e07c05dea525c6bf0dd8017fc5b89d886954f04fedf457ecd1ce488ac3b86ab7"
+SRC_URI[md5sum] = "1b3b6d55d0e2b6d01a54f53129f1da9b"
+SRC_URI[sha256sum] = "48594fadba33d450f796ec69526cf2bce6ff9bc3dc90fbd7bf38dc3601f57c3f"
-- 
1.9.1


