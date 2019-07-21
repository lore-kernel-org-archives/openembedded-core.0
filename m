Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABDA7ED91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a93so17848701pla.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=g53XFtPtxRxJQU1UwmD6ZlYdUuVdsYUCKpGsQclFLCzBe5sK9GXsmuRKj0b8nTmIVb
	IbgxO3GOC4x8teGWbP2miZISkffv/fE05NiDZU+E48tDr/y9+v+ziihe0SM+pv4LDZYc
	dYADJSVN2lDYZs/ul7oqYt70GCRgnawLLQmUZfQ6fCxqWxZHhdc1L2+NGHJXQAWSbcT1
	Hh1M0Q1DpwLfvJLTQ793p/5Pbu28LZrD6EqRti+3tRv/BgnpHJxTkbk7zXflwSdGmV6D
	eleEmCaL+8rz2BaBeIbku4ezvcBCe+X7eo8OfGz8rhCjLaY0O4P2IGHmNUD5GN/caFyj
	3h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=tRHgO1HjdSEGHDImx1zts8hAMliTDQdEZ0WdF7OIIefytE70vU7vxSjsfuxoowNBXF
	CLW0WnwC1d6csJBGGVYfOOpVprE0XeX5UstfXp+dHY8QwN0LiSfhrcNm9stgYPAim+dV
	D0IpBMi1h8ApWCIltc2+2CIG3K/OWW7keQItu9VFrmczE3e6QaimNa+dP5B82chJ3Uol
	3hqDA4C0SZ/RrRnD7Vc+CNuXQEmBT+H69oclRgVFBQiZ90frS0hcEEnJIdVmSy8+p3WM
	Muq9u6JdjWYVy6gwnKVZbaxPy9WHDX1cW6tRkDkpHbyGrEd8/Jx3aG67NAm+GV+NglzD
	1b4g==
X-Gm-Message-State: APjAAAWh6C0WyJSfBaK5TBmfgRyJTH3yuRzWgi5sGOdmL1uynjD0XLqP
	Ejf+UwLaQuVl/rROeFtkOveiGLGi
X-Google-Smtp-Source: APXvYqyC95XD2OOe1MohHEeDmPFTj4B+R+OBX0dbsdK5uv1UW3JfFyneO6srSlq50JqJjcPhUfFkrw==
X-Received: by 2002:a17:902:ff11:: with SMTP id
	f17mr71507084plj.121.1563719143500; 
	Sun, 21 Jul 2019 07:25:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:09 -0700
Message-Id: <c897b862c6cfaa341cc6155b2c9d98ea7ad02884.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 20/30] wget: Security fix for CVE-2019-5953
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:42 -0000

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


