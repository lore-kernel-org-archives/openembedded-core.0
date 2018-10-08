Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D7B4578F79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 10:58:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 61-v6so19561810wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aN6CvEIXv0l3wcElppOO1Uill0OQUDtkKlRUglBk40k=;
	b=g+sfz2QVuzzZFJbh+EaFcGV/VbsvPK8HcaSQoefPkq7ILMGvTMWuwj4dpABuLg0jYD
	xhapHNWVaxLNO6wh6IyfoEP9U6wEIp4Zaem0re3up4WJetSDW/PuE9ZT8zYMZyo4eem8
	IhktniOZfRiJhBDCSw/niZAbmRq+GZSzw7MzxoD1qslPK8hRN/6f7gkSA13ih4IBSiku
	cVLUr3QCVthygn1tMTbkDjLFblEPLmu82fmm/YLUDvT1fdDTRr/HqDFG3BLQ9hq1O4UY
	8SSu8/ru3A0BciHH5xils6wyu3+3aSHKoBe84bhv7osAa7S1DWBiJc86tVKsERaB7b1L
	igPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aN6CvEIXv0l3wcElppOO1Uill0OQUDtkKlRUglBk40k=;
	b=ra1sSK5aQDvRZ/aixYcOfnYwclwf9IPi+MBsnjt5S3K5sWuh0ufMn2W1G2/8bw5q5n
	a75eKWTQXA5qIqWCRxq9dSjWvZByx90UXptAjos0EtCMW8qlU7o5FuBVvnTiJx4vCuRY
	b+2a9uo9qnBwAMBR7dwLWRr2qIzpbRoPuRrHVJ4Q0Ke/QmBNxfhU1MHa+XK3qgrxupTz
	qJpB0Cqx0wUVq7K5XfHjV5INg9b8AzoAfvyXakDVaj6nbSu974JnkWjbcEXSFZ2IFm17
	61jjsH1fhzpvSjyj7T97/cqEx8BQlERA+Q5llfV3JQKIXNs/1fQkb1O2rsUybMpcSfwo
	5tgQ==
X-Gm-Message-State: ABuFfoi3iF1vwcizw/DCsDUJnujxK4gokB1nszd8u2CmNxmwb2mmVepw
	wVmUT0x+dH9qHor3YAJyitFhzdAWF1Y=
X-Google-Smtp-Source: ACcGV61xymkrrRM7LmcYNBTQCDx4poVyKLTCL1FDEka0GYMJkSQlPqmPEOHsqofyji8EQ01Enqcalg==
X-Received: by 2002:a5d:450d:: with SMTP id
	s13-v6mr15805132wrq.82.1538996315049; 
	Mon, 08 Oct 2018 03:58:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m143-v6sm6147049wmd.29.2018.10.08.03.58.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 03:58:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 11:58:32 +0100
Message-Id: <20181008105832.30378-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsoup: upgrade to 2.62.3
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
X-List-Received-Date: Mon, 08 Oct 2018 10:58:35 -0000

Freeze-breaking upgrade for a security bug fix involving cookie URLs, and a
number of static analysis fixes.

Drop CVE-2018-12910.patch as this is merged in 2.62.3.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsoup/libsoup-2.4/CVE-2018-12910.patch       | 32 ----------------------
 ...libsoup-2.4_2.62.2.bb => libsoup-2.4_2.62.3.bb} |  7 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.62.2.bb => libsoup-2.4_2.62.3.bb} (87%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch
deleted file mode 100644
index 158bf930934..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-CVE: CVE-2018-12910
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From db2b0d5809d5f8226d47312b40992cadbcde439f Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@igalia.com>
-Date: Sun, 24 Jun 2018 19:46:19 -0500
-Subject: [PATCH] cookie-jar: bail if hostname is an empty string
-
-There are several other ways to fix the problem with this function, but
-skipping over all of the code is probably the simplest.
-
-Fixes #3
----
- libsoup/soup-cookie-jar.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
-index 2369c8a7..b2b78909 100644
---- a/libsoup/soup-cookie-jar.c
-+++ b/libsoup/soup-cookie-jar.c
-@@ -307,7 +307,7 @@ get_cookies (SoupCookieJar *jar, SoupURI *uri, gboolean for_http, gboolean copy_
- 
- 	priv = soup_cookie_jar_get_instance_private (jar);
- 
--	if (!uri->host)
-+	if (!uri->host || !uri->host[0])
- 		return NULL;
- 
- 	/* The logic here is a little weird, but the plan is that if
--- 
-2.17.1
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb
similarity index 87%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb
index ba3e86a03ca..aaa3cc51036 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb
@@ -9,10 +9,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://CVE-2018-12910.patch"
-SRC_URI[md5sum] = "eaf99b04ac8968ed2b26f2509ba75584"
-SRC_URI[sha256sum] = "9e536fe3da60b25d2c63addb84a9d5072d00b0d8b8cbeabc629a6bcd63f879b6"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI[md5sum] = "dfbf30af5fb6190bfafc5aa6abcc9dce"
+SRC_URI[sha256sum] = "d312ade547495c2093ff8bda61f9b9727a98cfdae339f3263277dd39c0451172"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.11.0


