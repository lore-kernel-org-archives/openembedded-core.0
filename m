Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id F13396E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:37:20 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id yy13so78179911pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z617q+c0H0S+iLPjF1N1P7nfgy1OIaONjXPLWbTMvsE=;
	b=U03YUAaMiGFR7IrLwlXQpzYihdZ24xY3qj3OKUMz3FFpWU+Va1yBcc0vZVaXjJptMz
	PrpLvz1lVONw76doaixRNtA+By8KubQnP8lJ9qxkcBe27TcrmsZu+y8hXsVAjoU13oN8
	dk/ZrMATQhqLLrsxqOx4aT6IihXL7I0erJf/zgAGnFKDeQjXYgEgmyqVhoSGuN0PfuZa
	1iUJVs3/i3NbYujTVfCYwUAUclFuwzBAfDMq6jj62ND4BLMF6Eu0TElQM/M/HYVLGZZq
	UxOh3i0iD827QbuFA2pEVhcxbiupCKYprucV+jqyg4lGfk1sMou3lkGRFK8gzRY0mkKM
	VmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z617q+c0H0S+iLPjF1N1P7nfgy1OIaONjXPLWbTMvsE=;
	b=QCYL97ECUmyusGu/py0H90Vl6B5tmhw3K1pim+YMy3kMfMZLIvrXPF0xsfXZH0c5ZE
	KsBh5hgG8r7kz0ENivJWsvaFqo32lbbF0eaLbMKEyHgFq/AZAHpz8afbSRGaJ2e4aDKg
	Bb1Ei6eGBhrqG0p2w28qHzKG488Uht+q07eR7Mvu5p/8txXf8ClCDKRES637KoobVnf/
	/kUFdcy7PUfIM7r7vMMY7VVPUVc2BzOkwrxtp6meDDdK3LzCNGyruicDWe4z0lXeapPe
	5AVTzk8M8Cu9Yz3FsGqD/kxAX7sXDhxng1BpIhxPQCQkneSHRcPiD3n9kX/4BZwnIhbr
	kTDg==
X-Gm-Message-State: AG10YORny0mX9iZ62TYqEJ83YeQNlV6Zl7dnDt/9n+aBxHH4orScE06jcnouhHyi9znD+g==
X-Received: by 10.66.148.99 with SMTP id tr3mr44996153pab.19.1454960241512;
	Mon, 08 Feb 2016 11:37:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	p8sm45216471pfi.34.2016.02.08.11.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 11:37:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 11:37:15 -0800
Message-Id: <1454960235-18413-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] nettle.inc: drop duplicate LIC_FILES_CHKSUM and SRC_URI hashes
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
X-List-Received-Date: Mon, 08 Feb 2016 19:37:21 -0000

LIC_FILES_CHKSUM and the SRC_URI hashes are both set from within
the recipe files, so should not be duplicated in nettle.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
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
1.9.1


