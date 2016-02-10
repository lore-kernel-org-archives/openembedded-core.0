Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 033FA731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:44 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b35so1746379qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HS88LeE91kZ/qYR3r6g83Q7Jmkdv2x0VPoXUpqRuqR8=;
	b=hZuX/YFU8g4izmy1OtboiP38v4kWsjhYI5BJYfiB/WBoSaojxKND6gTInxivedsuzm
	FiwXVq0bWQtGWdddIMjZnxSsMpy2vcQ8veGD4TpqHqpg/S9TdtE3uVg4jEjaoTYHtKyH
	VJB9zdIzrW9Jb56mnGwQZLvn3v6Eh6SZHjjM3iuRcIMimLj2dG6vHEZCb545m1EZmY6d
	WzaZdFm6vVrRb1lRwKLlyiNr3Q8PsJ6hm7PryTcEPeSUics+hM9jPPa+0GREFf4iQ5rA
	9rPGbzymyh6fDWGMgpaSlvJXEKuiiRT2fZWuNVKuPkl7V4zC279DjFdgGt9MGZZ+CDOi
	Js9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HS88LeE91kZ/qYR3r6g83Q7Jmkdv2x0VPoXUpqRuqR8=;
	b=Hs9/gWclEVPRyjY5hg/BKgPIYslP3t+kE15NCY1tgUNcMsZGPyic9KY7AdUWyaroao
	BaPcdjRtmhv2LpM7LuVFTzHpUvVzNvVSYDFoUyMmOO72+svRu/GvFz9NIl30Hev9eJmN
	7fXZiacyUsIHV+oG17A64v6f5x/Eb5ec+yw0kGsob4t65jwvuZR6iOjKkcxB0X3YafaL
	5ZaxN3+291+8RLBnqnoT/Nqo8kgfgGqDfvy2gLAhtATn4iw7uhwbpHiNxkrXxa3Hz9I0
	VTpXdIpsvwMPrQ69fujeHsgv6nyQDDnGgkviz+nj5IpalvNOf1vAkdiXUh8U/RIs+cZ1
	y1JQ==
X-Gm-Message-State: AG10YORy2UIpXp0K/hyxrhZ5xuCvWUE5Xe891ewVbgpD3gsXvnG6eP7AW/cewwSVOPW08w==
X-Received: by 10.140.92.181 with SMTP id b50mr42950277qge.44.1455126225675;
	Wed, 10 Feb 2016 09:43:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:36 +0000
Message-Id: <560761eaf2192aa517529410a976a57a0db3e8e9.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 9/9] nettle.inc: drop duplicate LIC_FILES_CHKSUM and SRC_URI hashes
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:45 -0000

From: Andre McCurdy <armccurdy@gmail.com>

LIC_FILES_CHKSUM and the SRC_URI hashes are both set from within
the recipe files, so should not be duplicated in nettle.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/nettle/nettle.inc | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
index ba97ddb..af51fb6 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -2,10 +2,6 @@ SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
 
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
-
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
@@ -13,15 +9,12 @@ SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
-
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-EXTRA_OECONF = "--disable-openssl"
-
 inherit autotools ptest
 
+EXTRA_OECONF = "--disable-openssl"
+
 do_configure_prepend() {
        if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
                cp ${S}/aclocal.m4 ${S}/acinclude.m4
@@ -41,5 +34,4 @@ do_install_ptest() {
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
 }
 
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.1


