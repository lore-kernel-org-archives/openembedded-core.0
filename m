Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1125C786AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:33 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so8486063pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ow4y20A9ER5WAaw3iKoMp2Cgc8y9xRzxF6RJf31+w9o=;
	b=mGSpNPtjFZcWCViaxn+Qv/CXWAaJBQEVdoDpoYochh0ALuJUvNfnU4erCnn8ZtGIl8
	ZiKKdmTr2RQUhtoPT2riKR0Tj3IGouZkXLNdU1hU+WResrbWpn3oVfTIIW53WKOTD7CB
	2m8WClLHsPoaWzZWBJYbFfFWyPV9IxAe6aU4Vb4Bf7i1KL6B3l8OpppshONcjCH/SS2a
	HNB4PVsMxgsNmmAKRrDRtru0Ui9GmoAwH/QCf5eGcI+2dw/8dPBmDSbRKwpJDc0Itb6z
	qEVlL9pdZtQdXI8aa+h3S2o3Ls/0I+0CjmSTSkYkeV3+Zo5+OXoiEWKXhYFEgg6xNGkL
	PN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ow4y20A9ER5WAaw3iKoMp2Cgc8y9xRzxF6RJf31+w9o=;
	b=UHTvnAE5d5K3g1nq7zXLHZCGbxcoFumNweiSGt2bbeLrc2B14xb3+XUjPJYlIPmkjD
	S47P7aEaOpV/3vh1tw7icklNam6a38kbo3qgNDwuv5N1xhHf2dRNtb8zHPi/TfdELO5y
	N66wwL7cmLqXAyi9WDyEK8cZnOVTBI+Kw1qUsGke9i3YT3eAdiXYM/6orW7cO22l4noT
	ViKsvVpuvMkU5NJrK9WRuf6SORHwzQAbm0s16+Tq4K1yeL2YoPiD2PksNrtvQWGD6fnc
	MRjLwIHQXwE2Aj+k100NxPcn3J8+EX+4QcCD4QxeDJKxRNXYQ6YN8N1Caee1O7cr3MIb
	Yq3g==
X-Gm-Message-State: AJaThX49bOLezV2uY9tqO5SUkspy/uoaNBbgTFZjnWo7j8PZEUyP/G2e
	3+Yx05+Cgyty5u8a2kVqUz4=
X-Google-Smtp-Source: AGs4zMb+VYyj1XMV6cWhz1txYSBpJ6YVngHVCmA1z2J3/zKwAix3IjZRyxpoLb0eMedJ/3r+VFDyGQ==
X-Received: by 10.84.224.206 with SMTP id k14mr15556944pln.403.1511222855173; 
	Mon, 20 Nov 2017 16:07:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:15 -0800
Message-Id: <a5f87758e9ee7ea1eee0f3c546bd1ee39456886f.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:34 -0000

From: Armin Kuster <akuster@mvista.com>

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
 meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (89%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.56.1.bb
similarity index 89%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.56.1.bb
index 58f0531..2891a4b 100644
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
@@ -22,8 +18,8 @@ SRC_URI_append_class-target = " \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
+SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
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


