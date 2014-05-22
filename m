Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6403060E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:53:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9rbeE025580 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:53:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P9pa6k61tXjP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:53:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9rZ8b025572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:53:36 +0100
Message-ID: <1400752408.17834.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:53:28 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gpgme: Update to ensure we pkg-config for dependencies
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
X-List-Received-Date: Thu, 22 May 2014 09:53:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index bb53e38..9d21ade 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -24,3 +24,9 @@ inherit autotools texinfo binconfig
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
+
+do_configure_prepend () {
+	# Else these could be used in preference to those in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+	rm -f ${S}/m4/libassuan.m4
+}



