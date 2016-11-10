Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 89DE360269
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:14:20 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id b35so10851921uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=/eiQQXWvODlfuD2v22idxkAfSYjRv1QwVnrsRiFfADg=;
	b=JnSSV0gtHEI0ZTfM02je3kJb/GEIl/VnThVf37RP2+F68EY9bzOfEuQjmIlqLp8RJO
	TysxPCeD8c9Fwheffr8LK8wsb9MqtCy7qLWbthAB/AVyBmWDxanWk3aCgO2GXqYBnIhB
	cIURPquvOv4aNVAbsF1GE1ZqrN4KlH2frkBE8seBodWYZjwu0DUw/O8ocJMbCvIxmfDw
	nuXKmiwN3fIt/ClodNvcFav3mafkuUp836/Qq60GK8CSWnK0DkV/I/IcrBc2F4BSYGqX
	Mtb/+Op1AdoGkt40BmwGOFW5R6mj7yKD2oYZWMfgLrRAJwjqQA8KTKO6hqX+4FPi8qUL
	ptCQ==
X-Gm-Message-State: ABUngvcmca1wgnsOW2YWDUqj+vl64VXP5kpxVJCQmJKlNUe7HsAMcZAxuCEyxN+zOpg22w==
X-Received: by 10.176.17.18 with SMTP id e18mr3150031uab.19.1478780062109;
	Thu, 10 Nov 2016 04:14:22 -0800 (PST)
Received: from localhost ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id r85sm996042vke.27.2016.11.10.04.14.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:14:21 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 10 Nov 2016 10:14:15 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 10:14:14 -0200
Message-Id: <20161110121414.12937-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] python3-native: Extend RPROVIDES list
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
X-List-Received-Date: Thu, 10 Nov 2016 12:14:22 -0000

This extends the RPROVIDES list to include:

 - python3-datetime-native
 - python3-enum-native
 - python3-terminal-native

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/python/python3-native_3.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index 594f15c..93bcc33 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -46,6 +46,9 @@ RPROVIDES += " \
     python3-compression-native \
     python3-core-native \
     python3-distutils-native \
+    python3-datetime-native \
+    python3-enum-native \
+    python3-terminal-native \
     python3-email-native \
     python3-importlib-native \
     python3-io-native \
-- 
2.10.2


