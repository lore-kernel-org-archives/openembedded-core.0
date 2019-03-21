Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79EB27CE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:31:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q1so6408052wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0gUGPTBDnDc/fdYxg/9v2OEiYyg9NfpZl4ePC/Ue5+k=;
	b=ZihF3fAmA/N7hwynPpAZmtjAyTRPwbX9bpc8NaqYEpCGenN+tHPQpDXhMJ5LzoWvC9
	Q6B3pwd9BGNoQtYhmY72wTr1Dgrbi0CMRfjCkO7xCdQ9XTZE/zarRUO4mSOsuKEUR4CI
	Kll67QAO9/mFOVmVwBrn/T02kYID/d8HK8ua1EdDUxk+Cn8S3tKBbi12bjrRH9u6iDZU
	1HK+6Wz2zO2OWHFswjqk34e+h3UJg+athfbXkAEzd2YRSz3t4d4sIbt0C085tQCWEPuF
	NRlQUqDfLRGjy0TQybKOHuF9XcjcN1rYl4GJGwJbc082Anf4DpmbS7iPmLNKeWP2pY0a
	+woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0gUGPTBDnDc/fdYxg/9v2OEiYyg9NfpZl4ePC/Ue5+k=;
	b=jcz9tf7ljzfAA74uy/8aEtYT4nCd8tSLd4u4znCyRzGUrGDH5ZDL1o0juWJpThgpnK
	fCrbMLB3hZYhYQsxo93qTulbk/pxmDhn8hjvc75X4gSEWmOpsOVmiZqZ2tbjlYQ4w7e8
	C467BOPWJYxU33rqb3vmBkTEcanbDZ0Za/6DB/yyKefEP2dGBgG/gDlN6ZhN/dJcJ2px
	n+NC0C294QvP1Um2WW0ln44wfNIsyqLWbRS9aVsOG4wjzhutBxg0lhid03+FH/6ugnG7
	gakZ2gkoUATSmDSkimJ2zWfQYx0HAyNyagPHLpvIWt7tl3djzD8X1JKj8MNQT0+hhQQx
	eQyg==
X-Gm-Message-State: APjAAAXfKRByOPcTgEWTy3wnN4TzyaVx4CSrbHZEBorVwd+I6Shy6GKW
	ibwbd/CV0zaPE7TLwXqh8IA9WY/lYrk=
X-Google-Smtp-Source: APXvYqwh6SYcUfChHRx9NSU2VtVqMPBganvE0EHmyiMAAuaRb9PumvAgWIPn2sY63mkmxryhI0r4HA==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr2524946wrr.190.1553171516086; 
	Thu, 21 Mar 2019 05:31:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y5sm1193969wrw.23.2019.03.21.05.31.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:31:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:31:52 +0000
Message-Id: <20190321123152.3238-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: fix CVE-2018-14647 in python-native too
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
X-List-Received-Date: Thu, 21 Mar 2019 12:31:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
index f00153f0eea..26d67df6b83 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
             file://0001-python-native-fix-one-do_populate_sysroot-warning.patch \
+            file://0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.11.0


