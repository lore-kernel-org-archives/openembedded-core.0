Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id BADF66FF78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 19:01:18 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ho8so80619324pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tS61JcaIHTc0h6n0oyHYIsc+2ccxNccAsi2E+l+lwOA=;
	b=PKmJKrbfaumIO/AfURgJWqrs78E3pym5U38arwYwtbRAihoLd37Qgej4onRjiGc6o0
	D7kZi59Ms6N7jlPfaoMCXZsXOIA1ex84K19iC8XL6sMbtJiXmwau2Xix82+16NVtEnAf
	2HANx/8pcngPh49pdznLZbPbesP2AnKzSdGtpgkpTllKQbHLrLgDmub8nNkcuJ6OI9S6
	0vyvATMcMoV2bmF9b4g1Uzn48OROzpFqy7ZrjOByffDI/OhlXWRgzqVi0ZdUFm6eevRo
	kDPOdzWud8XOwHZGdHcCd1+eQM3xXCTJ+ckKq6FJatgOcfQBKcShyX5O1cntgjyyTXfv
	/S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tS61JcaIHTc0h6n0oyHYIsc+2ccxNccAsi2E+l+lwOA=;
	b=heAtsTY3rOmsmSNXMLj0mndvRuqmSFwmbVy09a9KsN+v3T6qP+eI5ZkV1+xsrInMTS
	z3s3GK6JvNr0NOJnT47z56nejyndoQVTCI4g8Ipe0Z/kHNEGKSbpEtF88+dCCRFFKe5+
	UiMNDpVGy3+zChuR3tA2GNtyyA7NFcpcbPd2vSpEnCgwslBWOADEqpMUl31zwDwktkC5
	gWeUkd8YMAMyoHtIx8qkeLUqRiiXwsC3F2p4+/g5Yc5HdNrseNdXmYjIgQFyTLP8CrBq
	Cr3KWrYHsgJIJ+v2y0/l6RbfiKlMn1RpGSyioeKmIZdPr96AJY2bf7Z3cF1t9rZ5LM5W
	y/qA==
X-Gm-Message-State: AG10YOS2NtOVvQk9XC+mloeHOBNRnYwhL2yUHnueJbr3cBuqP2Ob81xaL4Uroha6Sr8UR64y
X-Received: by 10.66.218.225 with SMTP id pj1mr32467052pac.83.1456081278959;
	Sun, 21 Feb 2016 11:01:18 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	79sm31410836pfr.22.2016.02.21.11.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Feb 2016 11:01:17 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 00:30:52 +0530
Message-Id: <1456081253-27215-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Sun, 21 Feb 2016 19:01:18 -0000

1. The Cantarell font typeface is designed as a
   contemporary Humanist sans serif, and was developed for
   on-screen reading; in particular, reading web pages on an
   HTC Dream mobile phone.

2. Pango test case (test-layout.test) requires cantarell-font
   typeface. This test case uses 'Cantarell 11' font type

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../cantarell-fonts/cantarell-fonts_git.bb         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
new file mode 100644
index 0000000..127f0a1
--- /dev/null
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Cantarell, a Humanist sans-serif font family"
+
+DESCRIPTION = "The Cantarell font typeface is designed as a \
+               contemporary Humanist sans serif, and was developed for \
+               on-screen reading; in particular, reading web pages on an \
+               HTC Dream mobile phone."
+
+HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
+SECTION = "fonts"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
+
+PV = "0.0.21+git${SRCPV}"
+
+SRCREV = "611c169df5287c059d63b0c8f0570647c75c9189"
+SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools allarch fontcache
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
+FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
-- 
1.8.3.1


