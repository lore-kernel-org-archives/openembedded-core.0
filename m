Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B49F77DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 23:50:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v1so2593796pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hIbgGI+XZ/hsFNWldRQsTQRry8DLx9vGXDj2tNmLP5g=;
	b=m0IxjZ439xRo2fT3P6FfsR0VRBbaHi3W67vw2vhp2lSNMh4n2zCSQZs++6epwIAh4H
	5rWsFoRVjRjXteCNnUYq5swnNmRFwKDKZNcGx1UvNVYogRqwxBHzwAIzvPveqpjQ4H07
	PMmrKVNnsJ4PQVT3TINHmR8vGB1BNZ9f3Bsgm5gYJlFVJwLLTSIUMifO1FcKUkeLPxzr
	Gki63TKi43Ee3cFfPit5h7ZGq7tjK9jxSdIh0GiCjOT1LJXnAVLWxxWJtjKfHqY6MFEk
	Yo+yLeIL73l09OFXXeJgeSJDtAt92yeGg8IG8CndoUYSHdlGBvdbEs5lD7VXFcuCKL1F
	hurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hIbgGI+XZ/hsFNWldRQsTQRry8DLx9vGXDj2tNmLP5g=;
	b=Y6c24byzgqiw1FnQDrujFpHsL/kTvVGP8Mv6zGq96Q1bicXadpP9ADK2NJmqI2Gh8w
	S4P2okHxe/gj41fSOfCmBtBhjOD45YWxNooEPZr/mgW4RfNZTy6PurhnWFy+i2cmBS50
	/OtG679CRODU2lMFtv0TMmhUwLN0F6/EjWdAbfz9KuRDIOiQu6JuvV4Ou9LMC9rTiB3S
	pY/StSaEe6mZliXzGr33i6T0VBVs0cXFAQgU77zpkUwE+CGxNCbuhJY/RGPQt2o+ONvY
	SnA4CuYoXwLio4NToxoCpC/a9mYjNKbgbV3n3h7ZmPrY4HblKeUwoszllUo+CcxqVj3I
	6WhQ==
X-Gm-Message-State: AN3rC/5IeFEsNuJRZFEyEAmw8R1CycI+ksGiGMNVN3sjWVj3MnISgvfg
	s0UTSBr4DH+s4A==
X-Received: by 10.98.199.18 with SMTP id w18mr8899567pfg.209.1493337035430;
	Thu, 27 Apr 2017 16:50:35 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id g7sm6840937pfe.6.2017.04.27.16.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 16:50:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 16:50:29 -0700
Message-Id: <1493337029-22362-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake.bbclass: use weakest ??= assignment for default OECMAKE_SOURCEPATH
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
X-List-Received-Date: Thu, 27 Apr 2017 23:50:34 -0000

Make it slightly easier to support situations where the default path
needs to be over-ridden more than once.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3f67091..f58ad78 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,5 +1,5 @@
 # Path to the CMake file to process.
-OECMAKE_SOURCEPATH ?= "${S}"
+OECMAKE_SOURCEPATH ??= "${S}"
 
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
-- 
1.9.1


