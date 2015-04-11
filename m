Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF1173D40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:57 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so37721168pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mT4vqk0NFf08qslwR6Dcoh4GlURsyJY5KprfosyO/Lc=;
	b=RgfhpJdCic7knm5cPLY2ngGkoh/+vC4F/9PY002RT4OpW7sREMKPDhjFxxdSOJyGNW
	gAl+c9kda2n8RAROda6wJsuR8XZCIJ165Oub+sgk1aTqliehpmKF91RUviceZe9Twzmh
	NCskvcCQ2n9q9Lwu6dWYdz9mQLwKzA8VxutIfhOrWTksmZGWCc6W+bOmEcyNIGno05c+
	bf2bUlXCgZoy1pcjznj7RIA4kqy5sj6UlcVpIPByOFjcUN6m1x7NJskKg0S/Pa7GQt9w
	UzX9jWAnFdxtTJzX0RsWfwPi1FFPcGWYnd19ytWTOkap7CDimk0C+hHVIuxfzCdIEjBp
	WQRg==
X-Received: by 10.70.88.203 with SMTP id bi11mr6583548pdb.121.1428715258825;
	Fri, 10 Apr 2015 18:20:58 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:36 -0700
Message-Id: <251a86ddf2c3ed0b7098fed2ab2088801db2173b.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 05/17] musl: Enable NLS
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:58 -0000

It supports it, so lets enable it even though
we can compile lot of stuff without NLS but its
harder to get them all compiled without NLS

Change-Id: I49a06c05b004654dabbef980c4e6ad991d581341
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 7c1c91b..1ddd58e 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-USE_NLS ?= "no"
+#USE_NLS ?= "no"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
2.1.4


