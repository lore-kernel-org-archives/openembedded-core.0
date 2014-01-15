Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0544A6AE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:17:38 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id l18so1189682wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 18:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VpzS/hJ3Fld4o6n3F5je88SgQ4B9Jx2Ws6/+gPWU7Xg=;
	b=GqXVPL0FVvapzjAgKY9r9v5POr/2nufwkzyueJuW37GZgpoP1mFXXrD82gkiHfG3dY
	rzRox9cTFg6gxQUh6cBZvjztXg5SzMdGnZ47Ms6jV41i/5ELH1c4IwoL7jHsRWiBuVOc
	GlA4s5UBZwRfImFrDJsV6sG4lo8Rz8FCuiZtUC/Dzvn7B2LOfyJAWYgBZgUTTVNVsXRa
	+WNV1NYCxDBXUUY0b7ECPKWkGbd35QuqD1HXnpqB03etxN8kd/0pOGWijcu9+Akjv6vZ
	K91qZhJQB6UopRi3cMUyKYa+w6ZF1zRZY14/V6b0jMQb8pjGIeLbTq7Be3AqxyL7FdND
	QmJA==
X-Received: by 10.180.11.34 with SMTP id n2mr23725311wib.40.1389752259356;
	Tue, 14 Jan 2014 18:17:39 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id gd5sm26004632wic.0.2014.01.14.18.17.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jan 2014 18:17:38 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 02:17:24 +0000
Message-Id: <1389752246-4296-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 1/3] opkg-utils: Upgrade to latest git HEAD
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
X-List-Received-Date: Wed, 15 Jan 2014 02:17:39 -0000

The latest version of opkg-utils PROVIDES virtual/update-alternatives via a
script copied from opkg.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 714fc51..4ae6970 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -4,8 +4,10 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
+PROVIDES += "virtual/update-alternatives"
+RPROVIDES_update-alternatives-opkg = "update-alternatives"
 
-SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
+SRCREV = "fd4a3a4c20ada47b19e89849ddb6ff87904f01d2"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
@@ -21,6 +23,9 @@ do_install() {
 # Avoid circular dependencies from package_ipk.bbclass
 PACKAGES_class-native = ""
 
+PACKAGES =+ "update-alternatives-opkg"
+FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
+
 RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 RDEPENDS_${PN}_class-native = ""
 
-- 
1.8.5.2


