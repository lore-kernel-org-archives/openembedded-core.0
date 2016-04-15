Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 407CC6FF30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:13 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id g185so16937358ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1XXKQr11/blKvJPIcCMaCKoYkoQs+bpiVQuwTTqh728=;
	b=Z14V2hsMpdisnUjhlWVDU/O71D6NGddDthWpI30nPVeJV1acXlws4kAaGhnuMRx2B8
	7kpKVtavolgYRG0u9XblbcmOXZyvkoCcVgCnK6a1j1jFSNq6GudVD+U18uUurIMm3nVN
	nLDhd/It7Y5BpEG7myVROaMb2GBQSN6+sPcJxvZ0XReMBKCn6pGwRJvA+4HuWZrZxZ16
	triH7isyL/HspdpdqK+SDt11N3SzU9JH/ibW8s7/XSDN86LC9grrS2JLHyuNSeFDLV5x
	wLvPIYMmYLESQFu8ksiZHH9+lbM4tRS3e6OqYhZDTbQfEYKuC0vdgvs9c5y4cJJUR67k
	gp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1XXKQr11/blKvJPIcCMaCKoYkoQs+bpiVQuwTTqh728=;
	b=RmfSPM99T7puUTLdEJINq+TVkaF1/RCc6H4xMaaFNWiX2MRzWDY4aUYCZQu0pf82e3
	9b1FRBnZzRd3z8W+ifdXDk4FHPfzG9g/jzCP+mPSMgEGUeOcfGRO6xHsC+T6XCcdeEuV
	PIkQBTfEdaz/Ohvb9/LZlqJnwFifHWXSA14F+ZISAwOPoQUBOR+blSO1j3JSXWcJK7T+
	13TjvtL1XhwpCijhFHCR3C0IFJ6HlrI2MQVq3darBO3taWj064L4m4Grjrp9JBosHH+9
	2JXQOQ4SPMBrtvg6p3S/cfqPYB/1i1Da1PvCEIHTscdUZKZ/Qpk76yMwIUDhoo78Z6mJ
	jCXg==
X-Gm-Message-State: AOPr4FWwPoA0tCplPIzKhRG9y9RukWdClyXZP1UScoa3liH0x1/QXIW8n39vyjS04zPMug==
X-Received: by 10.107.132.78 with SMTP id g75mr26465773iod.50.1460764814556;
	Fri, 15 Apr 2016 17:00:14 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:55 -0700
Message-Id: <1460764798-12701-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 4/7] gnutls: update 3.4.10 -> 3.4.11
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:16 -0000

* Version 3.4.11 (released 2016-04-11)

** libgnutls: Fixes in gnutls_record_get/set_state() with DTLS. Reported
   by Fridolin Pokorny.

** libgnutls: Fixes in DSA key generation under PKCS #11. Report and patches
   by Jan Vcelak.

** libgnutls: Corrected behavior of ALPN extension parsing during session
   resumption. Report and patches by Yuriy M. Kaminskiy.

** libgnutls: Corrected regression (since 3.4.0) in gnutls_server_name_set()
   which caused it not to accept non-null-terminated hostnames. Reported
   by Tim Ruehsen.

** libgnutls: Corrected printing of the IP Adress name constraints.

** ocsptool: use HTTP/1.0 for requests. This avoids issue with servers
   serving chunk encoding which ocsptool doesn't support. Reported by Thomas
   Klute.

** certtool: do not require a CA for OCSP signing tag. This follows the
   recommendations in RFC6960 in 4.2.2.2 which allow a CA to delegate OCSP
   signing to another certificate without requiring it to be a CA. Reported
   by Thomas Klute.

** API and ABI modifications:
No changes since last version.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.4.10.bb => gnutls_3.4.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.4.10.bb => gnutls_3.4.11.bb} (60%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.4.10.bb b/meta/recipes-support/gnutls/gnutls_3.4.11.bb
similarity index 60%
rename from meta/recipes-support/gnutls/gnutls_3.4.10.bb
rename to meta/recipes-support/gnutls/gnutls_3.4.11.bb
index 73f1fc0..4203548 100644
--- a/meta/recipes-support/gnutls/gnutls_3.4.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.4.11.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "fe9a0dc5adf205122f01a3e7dac5f8dd"
-SRC_URI[sha256sum] = "6a32c2b4acbd33ff7eefcbd1357009da04c94c60146ef61320b6c076b1bdf59f"
+SRC_URI[md5sum] = "4da148b5a0048aaac4961e2d9ba95798"
+SRC_URI[sha256sum] = "70ef9c9f95822d363036c6e6b5479750e5b7fc34f50e750c3464a98ec65a9ab8"
-- 
1.9.1


