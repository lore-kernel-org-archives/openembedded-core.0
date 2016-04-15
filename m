Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7006E682
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:15 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id u185so16836652iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l6vbsVDtH4fRvOdChsG2XtBHGcZSdrHEoYgVj0v37vY=;
	b=Zt6UvaYlHOgu6IE5MT6IzTqZ3cFZj9mEkKSBN5syZrDuOnh70fU6vKpQvrwy+Lrbi1
	sLZ7rgFo5Z/LW9k7q/Mu+uqVLY4O4kW+SJBS9lp6UAV2mwVJk9JBdOwrAnp8T3I1+16a
	A3LSstxbsi320821Iu+qzymKjIMTUESgtGuEJvLmt/92R6WS6zN40ZWQ4hAFFVnxt8nd
	PP3zcREVUOQyWhcAUK1k3x66tUwMIN89Yfq2zFdi+mcew9Mb+BHQ4JGszBMcdSrZJ0bA
	VfXMtGn7dhKde+sWElfY9bJQD/0WXCpRGfRyqCbEqUFBjaAr8USJimyb5hSWCXyY8Ww1
	grng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l6vbsVDtH4fRvOdChsG2XtBHGcZSdrHEoYgVj0v37vY=;
	b=LtohA8A7Rf0kKY2IHTjKc5ByiIhndNCyeWsfLKZrdc5HTLSOw4nE7/HUn+xQwZpMjf
	JgqsGF6VprPQUhiKGwqqRmO9cEWIaexLeLmGsMQPCPFeCKs5d3coasYengw5+iuGDPV5
	6BAP23jOjrhCqLaLWB+SBcVDmvSVgZLQAYufvec835UqvrzkmdOWt++VIDR0Te3/6QXc
	jMcyUTW9a8O3baEIrFcYRFwC2VCcFPuCYAuB/smTCQQe/RaIUoVQisHDQ2PNp23/hPDc
	TL/LklxN5p21z6Yk6PnOktvhQsrqNrZP6mvDlNWUyURS5gLaTzr40w0aomlseqhVcME0
	JrYQ==
X-Gm-Message-State: AOPr4FVUnJOVyRkTcm4LWmebMdIJ7jDeXrBvuU5fCkSFwR2ev5I6SFhu29V8+o3pBGWP1g==
X-Received: by 10.107.9.232 with SMTP id 101mr23963889ioj.49.1460764816319;
	Fri, 15 Apr 2016 17:00:16 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:56 -0700
Message-Id: <1460764798-12701-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 5/7] harfbuzz: update 1.2.3 -> 1.2.4
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:16 -0000

Overview of changes leading to 1.2.4
Thursday, March 17, 2016
====================================

- Synthesize GDEF glyph class for any glyph that does not have one in GDEF.
  I really hope we don't discover broken fonts that shape badly with this
  change.
- Misc build and other minor fixes.
- API changes:
  - Added HB_NDEBUG.  It's fine for production systems to define this to
    disable high-overhead debugging checks.  However, I also reduced the
    overhead of those checks, so it's a non-issue right now.  You can
    forget it.  Just not defining anything at all is fine.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.2.3.bb => harfbuzz_1.2.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.3.bb => harfbuzz_1.2.4.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb
index cfe885f..27001ec 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "da8d97e262e6ef8288e1ae76369421bd"
-SRC_URI[sha256sum] = "8216d2404aaab7fde87be0365a90d64aa6c55928e104557cfcb37b54a096cb8c"
+SRC_URI[md5sum] = "3898b890f13dce5ac7a01c5446021729"
+SRC_URI[sha256sum] = "449dbdf12a8f94aedbdefaac831d8b1bf45e7decaa9192eaa4f74104ef9de491"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


