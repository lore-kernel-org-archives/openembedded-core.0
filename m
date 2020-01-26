Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7D7916B1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:24:57 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id w2so3760801pfd.3
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QXKH3OecF3DPEm50WN+O4Wr3yNy5zdzzYXgDxzPHXjw=;
	b=DAJGo1xLSd1is3i9ykKWE1NCNOK03TXKaAkXDDkpYEo9aCZ5iZun0W7EUCewUv3bLn
	qDcxrDU7pMzBi/l9iFbI6rTBS6yW7Unu2vtMS7xdlDfv1oFBzHGoKuGpu1EESzUkVFYF
	uxlm3SZx/OpXVmHmRIsGTZ9GMTFBet9x06ijFJ0XoxFEWOCbC1d6C9nU2zumIjvv9598
	6uTBrcOEnXlgDcgnxLaXXY9jASLksGAq6/elz078SEFdDCVeYR6VfFUhcYZw5QlCozRC
	thTIwcZoeavuuvDQcLSL09E4uRFSKBwK6dAtVjTz7kYt/oM7kTWLxjkhuFcx3UHCSyBy
	XGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QXKH3OecF3DPEm50WN+O4Wr3yNy5zdzzYXgDxzPHXjw=;
	b=V/L8BZqK3dVIfOddgNxDtwZYaI9VG0OiNogWEhWb2SWxAo6/ceLNIPJHL0jiUHMuyo
	M0tuDWC0HLXwubxHWzfUI4kZuUgdlAH2bcuuGal/oSH6RDcxBaImO7PuDZ3q/eSu1LWd
	35cUF2kAg8jt8nVMPqM/V4bWW+6Ft8YQwMO/BBjmX3SDJ8CMmKMlXfzjk+D8EfDCEKsX
	MJ8G5V6ktOd/OP4/GUFrFHMDxtS2eWeCvfymRZhtpjEeoSM/2L7pgzn02EjeQfcYUufU
	+EQBwXyj90JiMJ0w4aOR3gNIoBdwH2nZEx4qH6y3pA5fiZx+rO+KANvhiPx66xSSIi+5
	FdPw==
X-Gm-Message-State: APjAAAU0wJQBBJff8hCwhPdOCJQwYVz8/8reRLrCtWqwslIPIlsf3fkj
	XqlhXe8IWDVSx8EYR2OKGm3qcJk0
X-Google-Smtp-Source: APXvYqziOugQlFiHgM/3dsNVOj3wqUoxscR3Y6IUOCjhJ3BcwCBX20odpgq3N6ceU7gr7oTs9mz2hQ==
X-Received: by 2002:a63:220b:: with SMTP id i11mr14713713pgi.50.1580055898083; 
	Sun, 26 Jan 2020 08:24:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.24.57
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:24:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:26 -0800
Message-Id: <1b69d141b73e46cc377f8566868da44dd5b1ea42.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 01/29] python: Whitelist CVE-2017-17522 CVE-2017-18207 CVE-2015-5652
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
X-List-Received-Date: Sun, 26 Jan 2020 16:24:58 -0000

From: Adrian Bunk <bunk@stusta.de>

One Windows-only CVE that cannot be fixed, and two CVEs
where upstream agreement is that they are not vulnerabilities.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index b093ea6f09..5d280dc63b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -19,6 +19,16 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# Upstream agreement is that these are not security issues:
+# https://bugs.python.org/issue32367
+CVE_CHECK_WHITELIST += "CVE-2017-17522"
+# https://bugs.python.org/issue32056
+CVE_CHECK_WHITELIST += "CVE-2017-18207"
+
+# Windows-only, "It was determined that this is a longtime behavior
+# of Python that cannot really be altered at this point."
+CVE_CHECK_WHITELIST += "CVE-2015-5652"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
-- 
2.17.1


