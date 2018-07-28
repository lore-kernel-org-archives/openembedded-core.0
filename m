Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2497F602D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:39:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u24-v6so2898121pfn.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m7OTL7D/YW357Py2eUwGxpEh/w50CBVyn4ISNtr1ENU=;
	b=bQ1E5Rtoc3PUQ0hMTqd/um1vQRiFWuyGhQUAl/NjtfiRrjNiG2NJSb9fj+jPxtry9+
	AVpb/k3WTD0L8g/RmfqXpXYgupJ1WuN5JcmftqStsTzN/Htm1JBe6b1V3rU2eJAKZeOi
	u5rhUUAetGTSdtMkumLEADDzDPElLJkl5K+iQd6T0dyZTb2RKx6fdEWgE5pu5/rxuDBX
	QnmSGW2WsN1bty0ii+W5VE/uDIT05LNic8HNC7k+OWpFEJjzZG8YQkWopoWFNWzkNnp5
	WOIvLsca83+EaWt6+NWVhyBCsyeIHeguhuVXp3NurwwrqBpj0GW7rbSS6Uoqmc8ucRzV
	Ex5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7OTL7D/YW357Py2eUwGxpEh/w50CBVyn4ISNtr1ENU=;
	b=TO8jIDFJfVok/0uwU2ALbdun6NjDc9JIHJjbAmN5VfL01/X4qwOUGocLQbywrMKDvN
	7ErKwjbCRxVkxmO2OAoO2Imv8DtW4ujqhMa7ZHhApysDW4WJQ6ffhevzpNlsexBa4Uwk
	y0sgs+hnV2lVABRzJdu4TTOuTj7ezJYJmevUD5C25jKi/dfN8hfNALSYfARBoFtkc3o/
	qOlHIHihU0eoeR5gAa5E6/HnFu/hBGVD6MkQZfG7qMI41fQzOglv0WPqi3V04CPIxSts
	s+IQ5AnrjO5GwUctAhHsUGAhcRLEZGirZyW02SvsyJ+pAbYEq3sqToJC4tzgTr4f5f24
	/wHw==
X-Gm-Message-State: AOUpUlEcF1C6DGaHrLQHnInM8MFRhWsBrVaLbag7ScQTgvbMu6YwaRs6
	lP8gDwpadZY4XvJ94fYgC+OqAS6g
X-Google-Smtp-Source: AAOMgpcDbJN53DBaRW9sTOmT1y8gJaQakhq3rdVxxtu4V5705LPUenz9RpmDIVEPlWDO3fIcu3i5QQ==
X-Received: by 2002:a62:1219:: with SMTP id
	a25-v6mr11954913pfj.104.1532810370114; 
	Sat, 28 Jul 2018 13:39:30 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm8102393pgp.13.2018.07.28.13.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 13:39:29 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 13:39:19 -0700
Message-Id: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 1/5] openssl_1.0: drop obsolete ca.patch
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
X-List-Received-Date: Sat, 28 Jul 2018 20:39:29 -0000

This patch adds a second line to the -help output of the CA.pl script
(which lists almost the same command line options as the line above
it but in a slightly different order). Although it's tagged as a
Debian backport, there's no patch like it in recent Debian patch sets
for openssl 1.0.2.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../openssl/openssl-1.0.2o/debian/ca.patch         | 22 ----------------------
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  1 -
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
deleted file mode 100644
index fb745e4..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8m/apps/CA.pl.in
-===================================================================
---- openssl-0.9.8m.orig/apps/CA.pl.in	2006-04-28 00:28:51.000000000 +0000
-+++ openssl-0.9.8m/apps/CA.pl.in	2010-02-27 00:36:51.000000000 +0000
-@@ -65,6 +65,7 @@
- foreach (@ARGV) {
- 	if ( /^(-\?|-h|-help)$/ ) {
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 0;
- 	} elsif (/^-newcert$/) {
- 	    # create a certificate
-@@ -165,6 +166,7 @@
- 	} else {
- 	    print STDERR "Unknown arg $_\n";
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 1;
- 	}
- }
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 9e5e7ec..ee1c1f7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -23,7 +23,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://engines-install-in-libdir-ssl.patch \
            file://debian1.0.2/block_diginotar.patch \
            file://debian1.0.2/block_digicert_malaysia.patch \
-           file://debian/ca.patch \
            file://debian/c_rehash-compat.patch \
            file://debian/debian-targets.patch \
            file://debian/man-dir.patch \
-- 
1.9.1


