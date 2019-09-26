Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4052F7EC5D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:54:25 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f5so285444ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DyIFmOF+rRvFQh3n6rJbQ+qvmy0syTksGwKsMO/x6m0=;
	b=dpvK0e2tbY438eaNH8gMz+Ex8lcafee7Li/PsFh7F6d53nK5tCs2I4PkNc5MarNsss
	23kTye/0Y4WpthqnimscxR0fX6CjmqgC90iIfttfAGvxPdtmbvoUyicUIPA0YJsNYX37
	TrGYd73Bj2QvXrpScJQV6VamCUhkWRd3fbF9xsewOJQkOfj8psYsP3stVoe1Fza8xQ55
	6EcnuLECrW2SbGwIug94iABjhslyJqpQ+TfBGNYtDT9qiUmZ5R2cNDlTrWDkHJETLt+/
	wkgC8UyxLkzkfhl7xv5BFzOx3bdzZr0nbJRN8j4ylvZzznFobr/cpRANNEvoqY2Ar5AP
	Ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DyIFmOF+rRvFQh3n6rJbQ+qvmy0syTksGwKsMO/x6m0=;
	b=O9G1F6QpkDSb6ZbR/610HNnE4Cu9ZxV76rdgVr1Cru4SMu7YSFNnZdZB7O48np7Lz/
	i4WFYBwdLpL8fl4sCjEB0AGw4aZW1KQlJ6alvT93/MoHZmrNEn0f3OcRU+7ut+zfKQ92
	V0xRTn+DkMcyRh+dN8HuS5KdkRZ4ttR57Q/d1e+B85LgoIApABx25vl3SJ7oNCbGh/KD
	0u/+hca6TU31RcmX/KgqXsDfqycOIVikCaMFK8MVgDyj//zCqJZiV4eQEQMCSQplAVNa
	CtsVHfMb3BZbhy+Zf16JFRAQYBIB0qN0JkTBEG2OmAlnA2SKtFUG5bK74Od0z5GUI2qV
	j+4A==
X-Gm-Message-State: APjAAAWOMNDcarPzwvUGRdkYtJSMkUekAKbTKcOyitMZxW100/YMTBUu
	h2AWwMuWUuoGYN36239+wRx/TTBdetg=
X-Google-Smtp-Source: APXvYqwzpRglUUoNpGoCU1Q/0YdlmL3d3RpBKDzG5K1HcL6MYZ4KB/P1H8fX1zpgWM8yNfQDIyPakA==
X-Received: by 2002:a2e:9006:: with SMTP id h6mr691889ljg.42.1569459265552;
	Wed, 25 Sep 2019 17:54:25 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	i128sm104785lji.49.2019.09.25.17.54.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 17:54:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 02:54:08 +0200
Message-Id: <20190926005408.13055-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.23
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
X-List-Received-Date: Thu, 26 Sep 2019 00:54:25 -0000

Changelog:
- Add support for checking if uintset is empty.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.22.bb => ell_0.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.22.bb => ell_0.23.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.22.bb b/meta/recipes-core/ell/ell_0.23.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.22.bb
rename to meta/recipes-core/ell/ell_0.23.bb
index b3942fc30e..f6e91ef6fd 100644
--- a/meta/recipes-core/ell/ell_0.22.bb
+++ b/meta/recipes-core/ell/ell_0.23.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "a4e7d74404f11e71775b89f53a8f1c33"
-SRC_URI[sha256sum] = "3c1d6d997e17dfcbe4ebcd1331d9a7be5c64f2f0a0813bc223790e570d8da2e3"
+SRC_URI[md5sum] = "be8214ff5b37012c4314343c8e6bcf15"
+SRC_URI[sha256sum] = "2efd9f7cdf57dedb9f1ba81bec534a3e0432476b1cb35ec0bc69973772a5f89b"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1


