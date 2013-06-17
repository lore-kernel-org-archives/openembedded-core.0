Return-Path: <paul.betafive@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E9D406098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:22:27 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so1454500eae.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 17:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YMbQ/59932m0JK5HTppoptAd3lEP5C/NrNJeFbManBY=;
	b=B4BKPnduYs8fGPgofZPmMxaDOycR4FP0EeEVebF31ek/ugyItG8cIkYcyhxzAg8TeI
	04B9h0OdG/PYorQS+vVlZs72xYwf3YzdbnqjLodAUezMD02VlRNlujUZC5aJd1u4iztw
	JVJctJRUeeq6bQmyxwqFdQHR4VOOV+VTrSKhZLHfIClKkUAkNRuHXB5eYQfMrftwwyf0
	Itj9MidFLdAZDqhXhwR9Wug9a3Pa3pfiWQJLL6A+c0cBz01ZnwAVqwiI0/LSlVLP3mzm
	3J0wh6DhuqbyJqmXgKKBGnSV0XsguP9IdbKDakUuTLRLun/39RKQ9OtDx/nMwbeLs04x
	V/2A==
X-Received: by 10.14.110.66 with SMTP id t42mr13974353eeg.48.1371428548436;
	Sun, 16 Jun 2013 17:22:28 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id b3sm2702254eev.10.2013.06.16.17.22.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Jun 2013 17:22:27 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 01:22:03 +0100
Message-Id: <1371428523-21377-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
References: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] opkg: put libopkg header files into libopkg-dev
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
X-List-Received-Date: Mon, 17 Jun 2013 00:22:28 -0000

The header files for libopkg belong in the package libopkg-dev rather than
opkg-dev where they are placed by default.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 3b8c4e8..f2c826b 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -42,7 +42,7 @@ RREPLACES_${PN} = "opkg-nogpg"
 PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
 
 FILES_update-alternatives-cworth = "${bindir}/update-alternatives"
-FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so ${includedir}/libopkg"
 FILES_libopkg-staticdev = "${libdir}/*.a"
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 
-- 
1.8.3


