Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4397BD97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:54 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y15so1664268pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=DFM5ywRicuNaT/xG4AZ27Ps/lcC3nqNxH+cHjdMi1Q0rpv0rD3GraQpW8pLBqevL9C
	5v3J9EvFeoJwXDHfaJcTgIHyHdj0rMUZV3+nysjO0LvwEwDp2glPpRXRoC2XjSi3rtNE
	iLEiNC4zSh5VYjCm+VcJWjZsFZqxTQFkorFJHmPp/zwn09RThdaodBRhXB58SucXWapU
	46b0QnUSRSBiukRuJ3lvyZqkyvW+BjaeiXg/e0gC4Sj8xB8cfQ5Nm7h3OJ7aMdB9I9zQ
	lnjp0TYY32OPDHMyjAWytJcbbtRBkbKY26eojsctwgJyilTOY9qyZoDcXoYab3Gj10Zr
	wS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=qSYwlc5sc7/L3iTQCaWMSlSOdwGvrZMio+Om0vlSjzAoenR0l52OTZiy233+eZcaAi
	ftH5DESlaNk5yv8h1AjHnmWS1IQHHoFKbeFLYN2CCNnWZs/BDTpWESqJefZHW4wia90F
	piYFIVuyel+x8T1y9q/I9aCVP9W9paN8SxpkVSCjhFnAlZGt4MyVGIrxqW5aprwNyhKt
	ShHeLHF+o4AaRbz4h7l2hEDbVywezPU36MuZUKfZs0GRkUA3+tfd1KVC2mkE/rzPiuGz
	uFte2dPYjjQkUkpcJBqrj2YJE6Iu51w/ob88bwtKHy0kw1AGVYk+ZeqiqNcaQ8OCOtKB
	W8dw==
X-Gm-Message-State: APjAAAVvIOzvf/LQ+CdOgZ0MdDqz63SupxfYDO8YDhbWe2RkEsCXlO3v
	MpnyJJq9594HRtgXoI/jlRBGNN31QqA=
X-Google-Smtp-Source: APXvYqxW1zuCTeuG/koXQfKcukJ+xkUv2udTLVuYDKS/dZ0w7KmcK1NYWkxtPH2+STH9bxJEbDk5ug==
X-Received: by 2002:a17:90a:22ef:: with SMTP id s102mr90127pjc.2.1561568035077;
	Wed, 26 Jun 2019 09:53:55 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:21 -0700
Message-Id: <c897b862c6cfaa341cc6155b2c9d98ea7ad02884.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 20/25] wget: Security fix for CVE-2019-5953
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:54 -0000

From: Armin Kuster <akuster@mvista.com>

Source: http://git.savannah.gnu.org/cgit/wget.git
MR: 89341
Type: Security Fix
Disposition: Backport from http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
ChangeID: 1c19a2fd7ead88cc4ee92d425179d60d4635864b
Description:

Fixes CVE-2019-5953
Affects: < 1.20.1
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-extended/wget/wget/CVE-2019-5953.patch | 51 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.5.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2019-5953.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2019-5953.patch b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
new file mode 100644
index 0000000..e43e8e5
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
@@ -0,0 +1,51 @@
+From 692d5c5215de0db482c252492a92fc424cc6a97c Mon Sep 17 00:00:00 2001
+From: Tim Ruehsen <tim.ruehsen@gmx.de>
+Date: Fri, 5 Apr 2019 11:50:44 +0200
+Subject: [PATCH] Fix a buffer overflow vulnerability
+
+* src/iri.c(do_conversion): Reallocate the output buffer to a larger
+  size if it is already full
+
+Upstream-Status: Backport
+http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
+CVE: CVE-2019-5953
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/iri.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+Index: wget-1.19.5/src/iri.c
+===================================================================
+--- wget-1.19.5.orig/src/iri.c
++++ wget-1.19.5/src/iri.c
+@@ -151,8 +151,11 @@ do_conversion (const char *tocode, const
+   *out = s = xmalloc (outlen + 1);
+   done = 0;
+ 
++  DEBUGP (("iconv %s -> %s\n", tocode, fromcode));
++
+   for (;;)
+     {
++      DEBUGP (("iconv outlen=%d inlen=%d\n", outlen, inlen));
+       if (iconv (cd, (ICONV_CONST char **) &in, &inlen, out, &outlen) != (size_t)(-1) &&
+           iconv (cd, NULL, NULL, out, &outlen) != (size_t)(-1))
+         {
+@@ -187,11 +190,14 @@ do_conversion (const char *tocode, const
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
++          logprintf (LOG_VERBOSE,
++                    _("Reallocate output buffer len=%d outlen=%d inlen=%d\n"), len, outlen, inlen);
+           tooshort++;
+           done = len;
+-          len = outlen = done + inlen * 2;
+-          s = xrealloc (s, outlen + 1);
+-          *out = s + done;
++          len = done + inlen * 2;
++          s = xrealloc (s, len + 1);
++          *out = s + done - outlen;
++          outlen += inlen * 2;
+         }
+       else /* Weird, we got an unspecified error */
+         {
diff --git a/meta/recipes-extended/wget/wget_1.19.5.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
index e37d8c7..920b74d 100644
--- a/meta/recipes-extended/wget/wget_1.19.5.bb
+++ b/meta/recipes-extended/wget/wget_1.19.5.bb
@@ -1,6 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2019-5953.patch \
           "
 
 SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
-- 
2.7.4


