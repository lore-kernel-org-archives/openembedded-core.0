Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id F130F7D4DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o25so4710563wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DP9gkBZ0QS3eV0UU9cObdwlPqWzcrGyJ/0rF5WBQFkY=;
	b=aOrfEk19puO8pTcyfHF0EIMyoiUSTPFF3MMybxvOcvtGH/m3Vvei6kRPZaTdzrLsuN
	55h2TLoHSdu6rbH2JygNvdeRbDhUF1cRfGcKsblezYfJM88gbnVx1BaiRQbgCRUgxpYf
	oygpnw47ziGvdSDfUwewxD4WqpOsBdOM1iW8AFcB6Otd6Acv2PRAGlWdLioGzOs7gQpT
	bwzAMkC8wSWov3qrsWAI8xu+DXhX5GRFptw1uDI+s7U68pRGt3e3FB90arGDHM+dSmn/
	J2YGn9ybIFWfxxpIIsUx973bXfwOnmM3fRo3Ba0+3Fnpbt+zfwrlIZ+uNKd1kR2ndmTM
	Mmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DP9gkBZ0QS3eV0UU9cObdwlPqWzcrGyJ/0rF5WBQFkY=;
	b=LAzyf7zVhNsnvgKyuwQ3ROa9BKKVB0ht9C6f0n74Kp2AH5ASgMUjOdRtrLv73ocr0a
	GZie8/bMPtgFWT/0a1ntzXD4L8T8BQRux7KiooqMmqUUMIZXlywkMqBm9e3k2Gj42E0O
	BudUYEPC9903VHKuc1snPjG1dmSSigaUA70GPeHadDnpQf9y/0QBPbXu4L28wPDYv1+O
	h0w5jCkMqRLibY6YGfoLNCFHniScBTGFL4kudDVsspoIfRsWd1ZSDRW9cTOOeuWsT2Zv
	htneKdEZ0g/dYqCeB5WUx8FQy2W0xWW5e7oJDZDrogPVatrrY7KGgSBbFBNPCpLty8Bq
	+RyQ==
X-Gm-Message-State: APjAAAXY7YxZPmYpuA417P8ZrGHNRmjV+wPUsthQXxRlHAHLegGpzoh8
	DTTtH4647ZRu0mG2NhbidGfuWQLvHLc=
X-Google-Smtp-Source: APXvYqyno+wfIDxY+gejpiB0V2+xYf3kbhjjVh9ABF+l0ST+ywztlI+T+XgveUij24xJdJSkz3mEwA==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr5862632wma.129.1554416215013;
	Thu, 04 Apr 2019 15:16:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:38 +0100
Message-Id: <20190404221644.20496-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 3/9] docbook-xsl: neaten documentation
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:55 -0000

Tidy up the install task and don't version the directory under ${docdir}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 07d32ce9795..036fc15dc9a 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -42,14 +42,11 @@ do_install () {
 
 	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-${PV}/VERSION.xsl
 
-	install -v -m644 -D README \
-		${D}${datadir}/doc/docbook-xsl-${PV}/README.txt
-	install -v -m644    RELEASE-NOTES* NEWS* \
-		${D}${datadir}/doc/docbook-xsl-${PV}
+	install -d ${D}${docdir}/${BPN}
+	install -v -m644 README RELEASE-NOTES* NEWS* ${D}${docdir}/${BPN}
 
 	install -d ${D}${sysconfdir}/xml/
 	install -m 755  ${WORKDIR}/docbook-xsl.xml ${D}${sysconfdir}/xml/docbook-xsl.xml
-
 }
 
 do_install_append_class-native () {
-- 
2.11.0


