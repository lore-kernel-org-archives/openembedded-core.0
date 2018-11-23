Return-Path: <nick83ola@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 29B626BC85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:31:52 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id t13-v6so4808967ybb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=e3orRsLTCAEUv7gc9QmYvPvmg9LdHfL6qvjCA3GnWQ+adZQpTdETzPHe94CeL1W9AO
	5sw+SwEohOyKEnHR2icWuyGbzj7cNOhagpRHPLOUTwaFSa3C0rH2JNldkRoqyw8NxZi8
	B1nxmTrO/MqHEJe9fxHF/6GQ+SCTwgWnu6DHvpGF41T2vMeCkRGSQx57Z3VG8J6FfmKn
	fGdpliWK2XKs3spstsPOceHlSikSzZijYwsaj1XAjWEW7qJqQix9BwiX7Q06Jek7iu2M
	Efr7P4+GdoSWOq05TkLjXhjEM8C6/I4PH0ITOfIHFVRqFKasU84iKDO23rrZPitbOisj
	A4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=coClq3XYXtK3KOyq2gbNFX8itJR1TXy7sljXQZE6YWXzS+y5pbWx6moHe7pCmALDZS
	+XtJ4CLomcWCD8z5FOlxaDGn9hBx9+y7M1pLqr60+WNvbAKt9DmpCVAS6VFrj+KQadVE
	v1UvMq2Gs5OBfnJ/JpO5wfHEthkg/6PoP3+7eKZdIRGmLABRT3dCYcUKA2yiPL333X45
	hp7OQt9hgziPcCOXS2GXEDeM6WOc9NOJVgttIIJLInZr94UbmpIsgoF6LvAHorup6tPx
	YkhrkXCVdlVPJ84RjKI276L/OuG2tasYlhqOx1EJampgvmugJTZnmgYleOYIjBtT5jQM
	pnkQ==
X-Gm-Message-State: AGRZ1gLrw8uLAq1/vTRPi9BjNg20qgdb7yT8HPyFSva0KitjGkglYqZG
	jnyOeWrrZATuBe/cUr1Ihe8mJLXO
X-Google-Smtp-Source: AFSGD/VUdZp9/9zP1AOrMXjSKLo/fQjbwUZQ04emsfHueasKchzh4RQw5KizEmG5edhgi086NIlIIw==
X-Received: by 2002:a25:3c81:: with SMTP id
	j123-v6mr16047418yba.250.1542983513803; 
	Fri, 23 Nov 2018 06:31:53 -0800 (PST)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u4sm31334873ywu.92.2018.11.23.06.31.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 06:31:53 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 14:31:48 +0000
Message-Id: <20181123143148.9171-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] java-library: make easy to override jar package name
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
X-List-Received-Date: Fri, 23 Nov 2018 14:31:53 -0000
Content-Transfer-Encoding: 8bit

define JARFILENAME and ALTJARFILENAMES with ?= to make simple
to override them

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 classes/java-library.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index ce1cd28..c69cf6b 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -42,10 +42,10 @@ PACKAGES += "${JPN}"
 FILES_${JPN} = "${datadir_java}"
 
 # File name of the libraries' main Jar file
-JARFILENAME = "${BP}.jar"
+JARFILENAME ?= "${BP}.jar"
 
 # Space-separated list of alternative file names.
-ALTJARFILENAMES = "${BPN}.jar"
+ALTJARFILENAMES ?= "${BPN}.jar"
 
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
-- 
2.19.1


