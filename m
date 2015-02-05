Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 85C4972DE9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:06 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so10920897pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7Ho3Hl0Tm4iriRrw09mqIG0y0Bx9/kfXsM43b5R5lPw=;
	b=vVTujyEju+8T+5SkeIOQ6WbWvD6lde6edzbFN0WNPssX9jSHSX49FWTJqSWrTAF3eO
	p4+aqwp0Pmq02WlW0i/T98pjWqhmVPP9/0LTTklGtr2Gaxqhb+d8zEOqyB5RNGKKwsnl
	ovjwkKLDY4wG/kOUmIxh8WdIai9YuZ2FUz4xAylYwSdOrhkSvzdlt5bc9/Y/xq7G5ddq
	xqxuvagRev6lgh0qdJd+bUC+CpY7A+NyW9FN9QIQo0ONY7rwehw8XWVJ1HM0hWdZaOXy
	GceH7bpa4MEKSJLhbt480mD2twOYilbTUbhZwqhG8m5d4xa7nt6abNCvTUbDp2Kt6W3L
	yZFg==
X-Received: by 10.66.65.203 with SMTP id z11mr6517260pas.99.1423152367731;
	Thu, 05 Feb 2015 08:06:07 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:05 -0800
Message-Id: <6f7bc27b7785d6f53f4de6d3ba71d4bffeec0fb4.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 57/61] security_flags: disable PIE on expect
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:06 -0000

From: Ross Burton <ross.burton@intel.com>

Disable PIE in expect as otherwise it tries to link the shared library as an
executable.

(From OE-Core rev: fe1f5c90eede593100fe57630d39cf329e59ef8f)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index d6f7e9c..5becfae 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -27,6 +27,7 @@ SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.9.1


