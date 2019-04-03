Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 29F947D3B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id w10so22400168wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DP9gkBZ0QS3eV0UU9cObdwlPqWzcrGyJ/0rF5WBQFkY=;
	b=lxAh2sYlddrShh9c1ZVxca4Uz++MZd7gwop8DDUSnjFCfH9WFIh0QVe+0/WvAbSoy1
	8R+J7xEsMBCrDtmCeaDQRTkipwhdk+6dHQKZ7+BLVtS97KhwBglI/4cpcFgWV5vcsjjG
	SfYeu+MgDbEpLAIf8NStPM8mgQ8WTOwpCS5VArPlKBu4j/pwPR3tXUkRStE9LPgJSDKk
	kTQ04iQspcNTY7wufZEHSfNDwYT4q8xysENhynuJuxdfXIf/LNLvvYA4UGCKUNx6BbdX
	4mTkUU+FInqdw9ZXaje0420f4ewfDm/vCS4wNbkzpMRBbdCDyS5xD8SVseDmfIhQfTsj
	ud5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DP9gkBZ0QS3eV0UU9cObdwlPqWzcrGyJ/0rF5WBQFkY=;
	b=BQRBIvWJOKW2i8KlNMxCKJ3vUdWz0QY10BmGQpx3LyUdwWNPgqMgy/KRW2iLmOEymy
	V+sL9oANrWkjY0ZkHJ8G1Bct/pfqP6IWmXFPkCJA9WWK4mzHJfcxhgcKVUp78eNyK736
	EDjtrZIjWVT9QMGPMFWMsSlwQtfh+WULYtrf616KrC/sUdwEVDam5JcfPK+dIJNAZZ97
	Wi0YasgoKA14Q4O5He2NDp1rtRh+DbsVAq6rKtRdtSHQWAunb8BCQopLfaDKyw/IbDX5
	EX4PZuW0Pz8OUMFT1SUhN8/Dm6Zy9tP3MRQt2bQqQ/XuvZCXkwa2kN0/zvLJ4v81O0Uq
	E8/Q==
X-Gm-Message-State: APjAAAXuuSGwzWzBDkhEMS7bfoJL61CbFmd9OW3MycJLzcPyp9A0dyh5
	ZthdTWud6wnWri/IJqv4FvrWB4lO/qY=
X-Google-Smtp-Source: APXvYqzrsbYcPwV41ajx4xqGDbrQqjKTRkySxV1ukSz/Q05gqIKfn475tiFyVfQpk9qrPRMOrL8PAw==
X-Received: by 2002:a5d:6883:: with SMTP id h3mr447474wru.215.1554311058964;
	Wed, 03 Apr 2019 10:04:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:06 +0100
Message-Id: <20190403170412.23568-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 3/9] docbook-xsl: neaten documentation
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:19 -0000

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


