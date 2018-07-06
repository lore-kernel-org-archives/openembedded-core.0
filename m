Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A59F078A9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 19:06:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h20-v6so9139702pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wnzSFpWkXxp1qgCBX+N6LlMFr4MP9y+7+SpkARCwI6g=;
	b=BdJpOcJmhMCrwpWHfxw+KzyuEONhyW0vuA8FeIiAtwWH+Gsz97XgUAaF2ULjrqUYhH
	wFJPB4cwnP896M0hrh9NCE3ETg9QW3C9/aKuJa6H/k9kbfEvjbSeIyp+xefMhuMPzwtp
	Fn85wXFJooBlOCAm7Wt6fR0EzezFMQxwRFNfR6nB4ryirxMyaV7r2dXMkjX0TqIcKqRA
	sq27XWkrgShk1zaSG22LkuTPkjm8fZ4/cXYOM1ylsUPL9KyYCYeL6Xbj3Y/2gkAU3CnS
	Frl6MsjFj7w7A6Xx8Ym48JFK0ol7faUUEdsNRBC/H+C6M+B9k1yosQvb68XgNXRnmpBH
	8RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wnzSFpWkXxp1qgCBX+N6LlMFr4MP9y+7+SpkARCwI6g=;
	b=imcMSnA4ZPF2FtOD7F98NtPqSZ0QxsqnZkzxT+wvd4NwZXvdscw3oJdKhUUJtsWzeO
	dEfY9c6i3wMYCKu9K12IemkXFfBY5Dh9XWFcjbZjcwgbSZH4wi/q4vFatG66n4BG0Y8j
	9jKHBdvkwtOmQkDqD7CdJyBNbNRHSsWip2UPkb95PAxtvF0ag3KCo8fvTKv1UXrej1nC
	DLT3ppvyBm6nV8OPpJcL95skNP9oZOyM6Gs7/yOwwNZLaPlfLXBJfC01oPeB4hy2rP+c
	PLO5tcF5piA/H6PIS/Zwl10koHBPDJTeiqwcKNz+aPHZBwcdFkg9nhPAjMdvGehYoEaF
	X/+g==
X-Gm-Message-State: APt69E1v7OTtBjI2XvCQM52U0JSDdaw2Y5n3ylGghqsjlmi00TzvAg9+
	JrqaoZNnt1q7IM0YlaLWfhrnAw==
X-Google-Smtp-Source: AAOMgpecgmBwGxQFTKYGtWaZUh00rdGbRSp/0Z0TZGofJJt9MjCOqBF1Jgjsr1fKQxMrttl+wmmaEQ==
X-Received: by 2002:a63:b74a:: with SMTP id
	w10-v6mr10321703pgt.266.1530903962666; 
	Fri, 06 Jul 2018 12:06:02 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm22272773pfh.86.2018.07.06.12.06.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jul 2018 12:06:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 12:05:54 -0700
Message-Id: <1530903954-20926-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
References: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] openssl_1.1: minor recipe formatting tweaks etc
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
X-List-Received-Date: Fri, 06 Jul 2018 19:06:01 -0000

Drop redundant setting of S to its default value and re-order
variables to align more closely to the OE style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 39 ++++++++++------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index ac2ad81..80f11a2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -8,21 +8,28 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
-SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
            "
 
-S = "${WORKDIR}/openssl-${PV}"
+SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
+SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
 
 inherit lib_package multilib_header ptest
 
+#| engines/afalg/e_afalg.c: In function 'eventfd':
+#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
+#|      return syscall(__NR_eventfd, n);
+#|                     ^~~~~~~~~~~~
+EXTRA_OECONF_append_aarch64 = " no-afalgeng"
+
+#| ./libcrypto.so: undefined reference to `getcontext'
+#| ./libcrypto.so: undefined reference to `setcontext'
+#| ./libcrypto.so: undefined reference to `makecontext'
+EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
+
 do_configure () {
 	os=${HOST_OS}
 	case $os in
@@ -118,17 +125,6 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
-#| engines/afalg/e_afalg.c: In function 'eventfd':
-#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
-#|      return syscall(__NR_eventfd, n);
-#|                     ^~~~~~~~~~~~
-EXTRA_OECONF_append_aarch64 = " no-afalgeng"
-
-#| ./libcrypto.so: undefined reference to `getcontext'
-#| ./libcrypto.so: undefined reference to `setcontext'
-#| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
-
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
         oe_multilib_header openssl/opensslconf.h
@@ -152,10 +148,11 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
-
-FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
 PACKAGES =+ "${PN}-engines"
+
+FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


