Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 53C267D789
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 16:00:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w10so8072005wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wXGvbbSvdM/uIlsP2KMucb3xXFCu+opcBTg9hF5ldUA=;
	b=DRmRrgb8NY25ZOC+mLt5DZVpwHwkYOzPtJftBobMGgFAVCWBEOlUzTtEykGKfESCqg
	f/t7RC9ro4KyKWV37Rq7dl4F0qx57rMdzbkjp+OqLAkkpPVJl0aFQejgV9nw9e9m7hO/
	zsqi66UiXsSQDuXxxYO8NnCgvbvZM2fxbST6Mypl27HXZo/7S0883SVBppLP5c/GrNlH
	KG2FStE9PLnwiDU2I/+EdWGUZ52+UVpFGZxEA8H2PaB91MLXgmSIwUyr88lL7ZnxUvku
	iIzkUMwjctsmZ97AiBZWygQu0p9oose/o6XIt8UBpagXaNSlhzRdhWSe/6gg8B34B1M2
	+XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wXGvbbSvdM/uIlsP2KMucb3xXFCu+opcBTg9hF5ldUA=;
	b=hRAt/QgRkGHN2HT2APMvKmUNUMaRXDCRWXVNQ2Yu9E58qmScqj6NydfWBNNtTUy96W
	lt0U8zOirOr52QNC+8Must586RUAGSFgIpB4KWUC5q2FlwwGpnMDvPLYtBiKwQ6mY0HU
	UNfvFM3oTTC0kU1lLt6pAqNS7EqBIiaFJmKBAroD5gs8sSTbPL9S9/F+Ya6mIIxTOQU9
	HLl0m09HC+zZmLaMch+hIbhOLhSahRo/tl79y76NEs0yXd3Xc6JL+Dhz+Tr58eeGXDKF
	Psy1lrOkgP3CYglLogqoLXDX5xAUM7zb1YwlMzlpaS5EoicYOh22EYG6fJOsFgttF64Q
	UZPg==
X-Gm-Message-State: APjAAAV4OXVEVzQdiMQSvnw+Y8bWBYUyRWrbRhIYtBzYrXk5ONkrnrR5
	HReA4fRNl0+W29WyCDXSM/lBm4BZsXMbpg==
X-Google-Smtp-Source: APXvYqxjnjZxWjf9Q55gdxw/LcQxHs+ShWmOkRTotGJmU7vTq1EniPK8F9dWOLSzdonA6ufPbY9jjw==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr30838646wrq.48.1554998442696; 
	Thu, 11 Apr 2019 09:00:42 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t15sm39633779wrx.22.2019.04.11.09.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 09:00:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 18:00:37 +0200
Message-Id: <20190411160037.21952-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: add a tr-tr locale for test_locale ptest
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
X-List-Received-Date: Thu, 11 Apr 2019 16:00:42 -0000

With this change, the ptests do not fail anymore,
except for the three failures caused by the 5.0 kernel regression:

- test_ssl and test_httplib lock up, and are skipped
(there is a separate patch for it)

- test_asyncio fails but does not lock up

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 28f128d488b..71a6c103166 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -284,7 +284,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
-- 
2.17.1


