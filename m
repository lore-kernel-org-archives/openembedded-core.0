Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 340D96FF30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:11 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id g185so16937325ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YrMDUeMgx1iqy1p2lvVhuplmiIwceK2FRRwwlDx4qXg=;
	b=GwrKa37A4sCYiIZoEVV3yGHAGieXgLvwwwe8glYe/5/eNAroemXXH1gACK2wM8qyVC
	h6id9OqBCEV+pWRCdnjmPbpjlMYHWTSu1/rKJrTKhiH3JewCMXHd2OQq1AFWJgbTxMPD
	zoypMdUFYjGP9Yshaa3UYpYg+2N2GFeR0g46iEp1Z9/qSwemPGTDSTjtxRpCL4Nd9wl3
	ACYZlk2bNg50fGeA/8gV+dhXr5+eYWBtO8dAGhWxQjIQm7nSt8t7mNt7pAdzaOnL19sI
	/Dj2IbxToSOoP6dFjZh68p84lTWzpUC3zN2wUZmhh1JOJO6/WEl0/b3bFhAQ2jEX+LA0
	IOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YrMDUeMgx1iqy1p2lvVhuplmiIwceK2FRRwwlDx4qXg=;
	b=EgAvM5ZRXopKvU6MkwIFj5taiI3ywPMJDZczp2dZa/RMN32XU+LVqDo3FXNIqmUJde
	6v6vYNpJqUIEhdF6Ck6WDLmdok+0AfovrY5wOhPI80Hy5Tp3TjbRKM6eJMbCRMC8YkXZ
	+UdRa1Oies334AVs8qRhhtXLcE4Y06vBl6I6tIu7vv+pW7eIkMZ9RhD7cIFgYjeXN55y
	4FJtmR6d1hWIDc8TonkJDDsrwdhb+TY59QcXmvjCQSTc0O4NF1mQ7v1M1lTGhrHM/088
	iAB9xO9HQvbgL+eeeTXuMCybDzRcZuTuomcSKBkwi/UBkMgqtWBGdrvqPXxXmimYA59w
	DWow==
X-Gm-Message-State: AOPr4FXvNTeeY3FJHQ4plzxxS7rcr6Xfm5rgd9W52huNhOU7sHVzVsvnH7xJxBohkvBs2A==
X-Received: by 10.107.175.228 with SMTP id p97mr15801630ioo.72.1460764812641; 
	Fri, 15 Apr 2016 17:00:12 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:54 -0700
Message-Id: <1460764798-12701-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 3/7] gnutls: update 3.4.9 -> 3.4.10
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:12 -0000

* Version 3.4.10 (released 2016-03-03)

** libgnutls: Eliminated issues preventing buffers more than 2^32 bytes
   to be used with hashing functions.

** libgnutls: Corrected leaks and other issues in gnutls_x509_crt_list_import().

** libgnutls: Fixes in DSA key handling for PKCS #11. Report and patches
   by Jan Vcelak.

** libgnutls: Several fixes to prevent relying on undefined behavior of C
   (found with libubsan).

** API and ABI modifications:
No changes since last version.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.4.9.bb => gnutls_3.4.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.4.9.bb => gnutls_3.4.10.bb} (60%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.4.9.bb b/meta/recipes-support/gnutls/gnutls_3.4.10.bb
similarity index 60%
rename from meta/recipes-support/gnutls/gnutls_3.4.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.4.10.bb
index b652f6f..73f1fc0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.4.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.4.10.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "1b3b6d55d0e2b6d01a54f53129f1da9b"
-SRC_URI[sha256sum] = "48594fadba33d450f796ec69526cf2bce6ff9bc3dc90fbd7bf38dc3601f57c3f"
+SRC_URI[md5sum] = "fe9a0dc5adf205122f01a3e7dac5f8dd"
+SRC_URI[sha256sum] = "6a32c2b4acbd33ff7eefcbd1357009da04c94c60146ef61320b6c076b1bdf59f"
-- 
1.9.1


