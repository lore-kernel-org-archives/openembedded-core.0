Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB726FC05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jun 2014 14:30:08 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so3676814pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jun 2014 07:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zeL811A3GkS8WWTOdVKLtsHIt8sqL17i96MgIE0fGTk=;
	b=nN8MksgU3aRqToxqA8ukP07YiWEw38tPeT/mOaKhR5D2XOMNQjbkV9XobnoJeaVVO0
	c96croPKEwKOImoIozrqgf3VdcN1Ff/FpWMXEGyi8OQAKbu08irMEmlO5pz2BQRf0m1t
	y/jshkSMNZzDb9Rc7G2vDHZjT6dfX3wfHcIYREZeisjB4/hJTPC+AdvQ9xdSoxcXvaol
	iALSHASqxcURLS/ysQAqMEN+5v+Z+hnfJPoqgagDv1bNN0uYRsDtr1vRSA3Yb+rfZoj1
	TAt22d5U07x8H1U3OwyaCjbJo4qJ/uQ1cXfKX1n7NcKmQaF7BZFZToEMpvZk4nYQMpv5
	5C+Q==
X-Gm-Message-State: ALoCoQn8fkgfBsAoIujmr5h6YSuNXPgJKGFFHzFQdYfcZGpPQyGfWpJWVhd4ziGmMYkiPjszP10U
X-Received: by 10.68.94.66 with SMTP id da2mr12199802pbb.106.1402151409661;
	Sat, 07 Jun 2014 07:30:09 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id x5sm49319421pbw.26.2014.06.07.07.30.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Jun 2014 07:30:09 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Jun 2014 07:30:06 -0700
Message-Id: <1402151406-14527-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cups: Fix build failure
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
X-List-Received-Date: Sat, 07 Jun 2014 14:30:15 -0000

The follwing error was seen when no crypt dependency was included.

In file included from cups-private.h:29:0,
|                  from attr.c:26:
| http-private.h:83:24: fatal error: gcrypt.h: No such file or directory
|  #    include <gcrypt.h>
|                         ^

Add bcrypt to DEPENDS

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fd88552..249eac4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -1,7 +1,7 @@
 SUMMARY = "An Internet printing system for Unix"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
-DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
+DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb bcrypt"
 PROVIDES = "cups14"
 
 SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
-- 
1.9.1


