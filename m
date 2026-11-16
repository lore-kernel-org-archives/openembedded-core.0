Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30989.1794845353761927360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wlYyQ45i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFC2C1A169D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C76C76023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D82511BC0D5C;
	Mon, 16 Nov 2026 17:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=63UKRsUAMNhEFRaDD3C2kk8yJztFO8phRJk/6OBRS1M=;
	b=wlYyQ45iMAraXVsZwtk9CAdaQDIGqlZ+C7CXykBDZtewQzkhnuvFmjDWvEgTnhRAaLSdC9
	mS5iDCL8KposTLJKyf8jTVDmGIQ9vS4H4TCFnRPoCjFOr4QeH97ZW3ColaqSRgby2a/hYj
	D0xwzR1drRCzzL3wCYMtXEPpjJ6w+rVjMOXI57gIk8RB0now4Z11laGy6izU40ADuY0Zfc
	p1vP+W7cwLLWWPuvFyouRCpJyM4D+0UjYlqpSxSyqgXaPodqYwmWGvO8sHvomfUtML6R0O
	CSXkLD8usemmXLfhnks1OkmIJ0rOjRfpRzD86A6HzlYERUsVKBWjmuG7F04Wxg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:08:59 +0100
Subject: [PATCH 01/13] lib/oe/path: rename "metadata" parameter to "d"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-1-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=889;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xuxTw7BM6wp9e2uzkdVZc6od/sfjSLubfUUjRQ1WS80=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqdUSWdTM2h+1EsSX9fg3PgaikriuvpICXiE
 EN9/qChHu+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnQAKCRDRgEFAKaOo
 NkKiD/4pgr/54jKTY1T1bxM4HGb9f+o2VjUZoR9xOnvH1QJVot/IRlge7GeDmnnId45y+drUlD9
 Lu7beaCsI6GlLh/WwSEr1QUqJfQHi8RZR3QVXF8QzQaEd8WtsGeSxDaUAQ7FAeTA4M3pBj/A3WJ
 phiRdkt1uZx9eEmcKcK0Pf0kFFNfL3nX6aQGuVf9myHta8UZA2cdWZvA6jv4ZWOs7uzkThfpYMJ
 c0oZl+IFsCtVKXmwAx/1Ye7HTtYhK9XFRQNpNiQkoQBsOci+cjifCSn+RA+gw2GLufk4wiowE44
 UyjpsktAgWOVzYhtII3EWnnjLSwh9J+Nw7SpVB4mzn3ZZHQ2E1qPC2hE2AeQ1jMvHWmQB772xiZ
 ZaKYxsEzc1UZGm/bl0v4NJnJJItlXWsCvocaPcd7A4xT+dLr2Brxewjp48vyz7WmOzDDsNI3RCu
 7hB5yPkkyPmfHhZM7hANPU2pIBL4QxkeovkTDaqpyjIr4jrhMXMJlQJ899/gOHqSBmU0giXXOM+
 tCWLT4571+8McAreIf/gdoTNQ4wJ1t499qHjYikS3BECHPFEyDl6FdZLhuuoIP94JtEoBGE6NPF
 AR7Je5n4BJHs+stgKGGIZxDLgGKLwZCozoUORrLiNEzZMiXPCLT2cv7oriOwQeFp7q1Q3Z7Sq7Y
 h2Q5o4dBLC3scbg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250351

Using metadata for this argument is confusing, as almost any other
function in the oe library uses "d" to denote the datastore. Rename it
to "d".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/path.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 88d256f00b..8fe5bbc7fb 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -81,9 +81,9 @@ def replace_absolute_symlinks(basedir, d):
             os.symlink(base, path)
 
 @bb.parse.vardepsexclude("TOPDIR")
-def format_display(path, metadata):
+def format_display(path, d):
     """ Prepare a path for display to the user. """
-    rel = relative(metadata.getVar("TOPDIR"), path)
+    rel = relative(d.getVar("TOPDIR"), path)
     if len(rel) > len(path):
         return path
     else:

-- 
2.56.0

