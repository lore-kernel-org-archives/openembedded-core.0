Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 50FC678C57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 23:28:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e6-v6so4051316pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m7OTL7D/YW357Py2eUwGxpEh/w50CBVyn4ISNtr1ENU=;
	b=qwfTgML1GNbfV3DpFKd0XIiw14rlH/iAA7RCPx0jo+BUqmUxTuExtPPgixbq6hVovg
	E5Qpzu/M+KW/CEFvZpD2BWXr9AEdlKJ2h5hyq2OTorY75QEnr5NDrmPhNGFZubj2VC38
	od43HQVyHYnZcLOKOOOJwWiAE9dpg4lk22IMhLinVD2I8teqG27UsB2WPE5ExVQC7+hM
	Mklnx3Hs46WKRcipkvjQXZyHVmffUFsI2Uz8Ql+TC0AESvsvMUCpV2hAuKVllSd7wEhW
	hcz2Zu26KcN6TYjbcU7+XFkLNiuUE4cwTz7RGQu83dZaOcgQsUc3LzbqrWOIqp5Fz20T
	3nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7OTL7D/YW357Py2eUwGxpEh/w50CBVyn4ISNtr1ENU=;
	b=kULw0zpnaoV3rzdPnfMCZAc3iQO2mHss3evKhrLI5rTYtF5g2f3/HamoLlODBZ0mkm
	rjoIoWDv1M5Yqn93p5HZUP3SSUXaV6cWlq7sNY2Wj5R/vRjOJK9D+tsV3UO6IMqoA3RC
	kURA9i7EU9VVq0ioUviIpROyZTfmYTYg0qmGnCJ7tENXVKNysi9XRUeK8Z3kOlpqLB3s
	XFJxoUPrGPpnVxOC0drk4qOaj2JlZ3dlCDBipoiXbWpS+aqkr55dx0p3bS6SZneaatx8
	TEcV3Ly4uNLlDn680gAeLwEdwTJLjY+rcJYcwwDAPXrMfDQ6qMlGwHghFNJNQqWINZN+
	mOqA==
X-Gm-Message-State: AOUpUlHGdnyVI+2zzCsxvTwYTKzRXXJ9uoh9LjQ2qIU1pKy1llaHwgwh
	PivzuVFBIVPNkRpQR+SflFHVVqos
X-Google-Smtp-Source: AAOMgpdWW6Oeqg4AmBgaLq3b3UWy7PYgc+YRrL3YHw93llhDZqBKl+YUzIxbLcVkaDnHhXYxnzPdCA==
X-Received: by 2002:a62:3241:: with SMTP id y62-v6mr8591295pfy.4.1532734088869;
	Fri, 27 Jul 2018 16:28:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm7086923pfm.119.2018.07.27.16.28.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 16:28:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:27:57 -0700
Message-Id: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/5] openssl_1.0: drop obsolete ca.patch
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
X-List-Received-Date: Fri, 27 Jul 2018 23:28:08 -0000

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


