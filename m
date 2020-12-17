Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2604.1608173537016503916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=q4aFLXL7;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7313720B717B; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7313720B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=bjyVIngxWhHI/r34pFKQsUqqa98h8itCnsVlHh9uNHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4aFLXL7XMn6ZWQjOXQ3iyDqVFzWeYR+YubKbixxQJEbWnlja8zAV4+aZ3FCY+sy3
	 nxqL6JWkyvMFzZU6A2gf6TDC6YvpX07278EimiW2iyBnPHzWnmZ5pJVA363BRa2yCR
	 2Caxd9tOqu20Dl7HkZmGTYrCDcE/VVlIz/dzb6Ps=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 1/8] classes/kernel-fitimage: add variable for description
Date: Wed, 16 Dec 2020 18:51:35 -0800
Message-Id: <384aea84fb802a2cb20101887b6c6d82e438ef17.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a FIT_DESC variable to make it possible to change how the
description is set in the FIT image.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index bb2f3c4..f121eee 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -72,6 +72,9 @@ FIT_KEY_REQ_ARGS ?= "-batch -new"
 # Standard format for public key certificate
 FIT_KEY_SIGN_PKCS ?= "-x509"
 
+# Description string
+FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
 #
 # Emit the fitImage ITS header
 #
@@ -81,7 +84,7 @@ fitimage_emit_fit_header() {
 /dts-v1/;
 
 / {
-        description = "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}";
+        description = "${FIT_DESC}";
         #address-cells = <1>;
 EOF
 }
-- 
1.8.3.1

