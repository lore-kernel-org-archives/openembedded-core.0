Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 76F20799AD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 13:28:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 185-v6so8349317wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JqonQ47tIPoBnwHJEfPc4Ju1jUZrgQUaq8tvoj5/Mso=;
	b=x7cpjcKnIWRO+8GRorPWBheA5gooJFJtQpK6KiAnWETy1A7ycahZ8HK7ZDY0Kc3RKW
	iBnKfdsaThXQy+N10/TJrQ3PTqQhUXE5l+AXJnwyzlVQRJs7vIqH50VW0uWylx8yoYEV
	Y2riQPHO8/OCP080GgcHLMEZ4aujTma/BW364Luy2vZMnI+y+NGUnwHPAm0tJRPgC9h4
	2e1jgBoW/O1B4Fb0eFwaDCK2puwZdibUtZl3z+4JP5iKl23uhbiTbqOD1a9IlVTCjbR7
	e8C+73GEXQZ/C4zX5brR7LNU/pOPEVU1l9JyyrC3loDYHB+KuoFVUJTyNuxwDSJwDJE/
	WxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JqonQ47tIPoBnwHJEfPc4Ju1jUZrgQUaq8tvoj5/Mso=;
	b=loOMtjtAo03Px/KmH7SROdHaaJMvw3reUEP5mKp+/tcz+0b82MFd5KjwqR/nDsWOch
	ZC6EDe9WtO0Abiy/oajCnDFH2w0GdSylvUytkB1DAspUZ22P2Zr7AMeEsAyGzosjIZhf
	bCmn2qIu0ABO0mxjQfPMzXeonYR2DqCPFhKtm/FJbJHe4pdg89WR2pMviLiM3xdgvMa+
	9/ho5+tqKBH7lrq9dsYQvBxBJHsNHLqDbUobLMKirk0tiXq6/T4HHeKawcPQEIBejb5x
	xNwPfxnOnojGFM1r3yQNzOTQix3SSUuXgQ7ESlrP78EJDyhThEN48x9Qs6Pf/vr4f9CE
	MF/g==
X-Gm-Message-State: ABuFfoid+wtDJ/uYzZnfx11k8ydZ3V0IRo4+BRGTJ1/HSPyvHPVPpcMz
	XM2tZ6sOTYmfz+6G2fGIhLdTxfrX16k=
X-Google-Smtp-Source: ACcGV60HwXsSqEvXS+xS2vkkp+EYdJ5xK8C0kZvKVOJRc32mrS6mH0X5Rg9Cm2s/KOPLmgP1XAJxxQ==
X-Received: by 2002:a1c:b20d:: with SMTP id
	b13-v6mr15072298wmf.141.1539005318537; 
	Mon, 08 Oct 2018 06:28:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	134-v6sm3140118wmb.13.2018.10.08.06.28.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 06:28:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 14:28:30 +0100
Message-Id: <20181008132830.8087-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3: add ca-certificates to python3-crypt RRECOMMENDS
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
X-List-Received-Date: Mon, 08 Oct 2018 13:28:38 -0000

It's likely that the certificate root chain is needed if python3-crypt is
installed, so recommend it.

Also remove the redundant nativesdk-python3-crypt assignment, as the general
form is sufficient when class-extended.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 6085e36b7db..e1796581342 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -217,8 +217,7 @@ py_package_preprocess () {
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-RRECOMMENDS_${PN}-crypt = "openssl"
-RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
+RRECOMMENDS_${PN}-crypt = "openssl ca-certificates"
 
 FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
 FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-- 
2.11.0


