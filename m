Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3113778802
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 20:01:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a84so10620108pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kB513b75izIGsDp4HvgRtNXsTj3Q/lEq4oFwhj09S18=;
	b=Z9yFRBFEYWuvhsWeEG7NTtRoDypqAQ/mhk51GwMckHCvXSB7CTxlr+O1mYMIDVnUOO
	QWOViaA7go0HEh2j/V9Fi3vvOCDvWcxgXHj5yIGNlBlx7cs0E3MGDcYOmsXRKpO+8ujU
	N1fqZJIMNt2Hak09IdLN/xhNAe0/Ip/YgbpvRBPrh4x7229oZe6v+7rhcWgpWZRr9NYL
	AXdQaoZtD8NOHELKpisMagTvFMbydjKqDyd+AeiD8svqXlA0ibtkZTJd8HHPVNxU+hwF
	T5IPFb8Hk/YUlg3b97u9u2srR2LPPddxyYqzJxGMoVB2E6BdhRX0sP4oQqT7R9Ux2Txm
	xRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kB513b75izIGsDp4HvgRtNXsTj3Q/lEq4oFwhj09S18=;
	b=FlQikPPOQMvfWy1o8Elb0DDp1LTLNM1xVzAV7wGIZGGwTUgZ4R3KCFcGMIFLKYZpOR
	Os9KJ+YCOKm82IUo7TQ0vMvSXm2QQ+mKuEEkiX9jD03+oY9ffqneRQNFYS6UEqjma6k+
	hLxUjuChAuOgGWXEUS6qooKFNyLFUh6cIUUEgCpf3B8IWv9JSIXGgYT3h95JyTo+VKIk
	crjezb3/EyNrZRUyittbKKjSqxusQeNcZJhawLyFgHJLx/JDF5Q5cCc42op6bnM1/77F
	M+1Hglrly9Llsz5zxsXTHtx3VHDDCz8MfmcqcEa1yg0PcCTy5Tq6Oky65Kaqcq+hinCR
	rZrQ==
X-Gm-Message-State: AJaThX6DULsT7095pDptxoC+lNkzZf5RaUaB6fPqTUooA/xKTmOIHOTv
	Hhkb2e21s6hnM9nfzESQc5HUfQ==
X-Google-Smtp-Source: AGs4zMbt7uR/awHdXVKz+AARX33k1jv/ExATaRiSBXkeefcO5EW1Vl/1z2leYH6OixJvXt6XwwhA4A==
X-Received: by 10.101.99.199 with SMTP id n7mr18457374pgv.247.1511294507398;
	Tue, 21 Nov 2017 12:01:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	d28sm26770154pfb.105.2017.11.21.12.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Nov 2017 12:01:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 12:01:36 -0800
Message-Id: <a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511294278.git.akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
Subject: [PATCH 5/5] curl: update to 7.56.1
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
X-List-Received-Date: Tue, 21 Nov 2017 20:01:46 -0000

From: Armin Kuster <akuster@mvista.com>

v2] - remove inherit

curlbuild.h removed from sources

includes:
CVE-2017-1000257

removed patches for the following cve fixs:
CVE-2017-1000254
CVE-2017-1000101
CVE-2017-1000100
CVE-2017-1000099

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}                | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (87%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.56.1.bb
similarity index 87%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.56.1.bb
index 58f0531..830f350 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.56.1.bb
@@ -7,10 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2017-1000099.patch \
-           file://CVE-2017-1000100.patch \
-           file://CVE-2017-1000101.patch \
-           file://CVE-2017-1000254.patch \
 "
 
 SRC_URI_append_class-target = " \
@@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
+SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
@@ -64,10 +60,6 @@ EXTRA_OECONF = " \
     --without-libpsl \
 "
 
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
 	sed -i \
-- 
2.7.4


