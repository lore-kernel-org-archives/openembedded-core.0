Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF61D7EF28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:18:23 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id r9so35758742ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C5WZHef+xtnqTIIuVTuDwOI1swrT55dKtHAahOwixek=;
	b=PzdqA9LJqIq4CL7+RFH+4Va/JmH2gWZKMDmNHqi3aEuh+EddfrwnkK3D4nQH7GrvoF
	0pFX5MsdMjzpkobkwIdS5FzC6lttsp0LsDiVDKQ5vTCQPi131TF7Qp9fHI/EEJydZoxv
	csD9+/+irQSZmH6M+O2XyWwjQ0QbAuCSxwbVqPdKbEVJ06pMVcgqOGQIEKJjyYAITkKE
	E/turq3iRKoSZ/lGyZAojej5GEKEgt6SPrlvY4hMUwshHrKvNV/N5VidSEM8l9LKvnZH
	z3v80u9vrNqg9vIMiahS9tZBztHFD9hmK2+iAuZBy0pmVQ9z2cm8ECCC+1UaI1STEpiI
	6oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C5WZHef+xtnqTIIuVTuDwOI1swrT55dKtHAahOwixek=;
	b=nlpkxniRJvVdm4xaYNPsIP7Vhu6IyPP/rFQ1MTPt1zyD/3k19YdMWfFB+NRssO6J6h
	cPIJVy7B81+kIeaPE35PlcvFLZrfEoThZZvLKTjk88PD0uVxI0Sq4JCXk6qlMzRD1yMQ
	wfIRYaTD2i3ilg8hKTn32QmAYegHRd7L2s0VsWEctzYDD9e/CIVBF6Bd5byrWj9iY2Nu
	RqBl0lv+7KOFjqPTDM87nnZpopsmnTiBctRUCDuLhn94/SR3PJBtQ6PzV1daVQEfNWt/
	//QRIDi58vPYRb4nnwI+QFSCBWDS7Bl4s/Oyz2HkPRp4HCZZZkzh7bTy1IGNb9Io9PTa
	e3Uw==
X-Gm-Message-State: APjAAAVZCb2/DTwxFmK/UgvRF3NCD/tu7ETyo+qEoUC1Z2XeJFguvyX0
	b+NfqOqMggtUspeV1HpealKYLOb0
X-Google-Smtp-Source: APXvYqxpjgb2KhozbqHA6YdEogM5g1FnxLXyCeXEuPYLbmEH2e5WvRgOCZk7vwJflSO9/MOUxXb2FQ==
X-Received: by 2002:a2e:9250:: with SMTP id v16mr34398151ljg.89.1563754704228; 
	Sun, 21 Jul 2019 17:18:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5771826lfc.73.2019.07.21.17.18.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:18:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:18:09 +0200
Message-Id: <20190722001812.14947-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 3/6] python3-docutils: update to 0.15
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
X-List-Received-Date: Mon, 22 Jul 2019 00:18:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-docutils_0.14.bb => python3-docutils_0.15.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.14.bb => python3-docutils_0.15.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.14.bb b/meta/recipes-devtools/python/python3-docutils_0.15.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-docutils_0.14.bb
rename to meta/recipes-devtools/python/python3-docutils_0.15.bb
index 81a449d646..f5c3f5d707 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.14.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.15.bb
@@ -7,12 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=35a23d42b615470583563132872c97d6"
 DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "c53768d63db3873b7d452833553469de"
-SRC_URI[sha256sum] = "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
+SRC_URI[md5sum] = "f51729f19e70a9dc4837433193a5e798"
+SRC_URI[sha256sum] = "c35e87e985f70106f6f97e050f3bed990641e0e104566134b9cd23849a460e96"
 
 S = "${WORKDIR}/docutils-${PV}"
 
 inherit distutils3
 
 BBCLASSEXTEND = "native"
-
-- 
2.17.1


