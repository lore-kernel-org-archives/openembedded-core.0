Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 895DA7E724
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:46:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p11so1837457wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=h3ZX4Asa6KQlNFBQhVbsrndPwkEb1y+GXDqCeNmB2wc=;
	b=UM95F2qMP9B7U/FdobsXipaK61to06AhAP3YvYArSw7vGVsMHsJQCVSIXaWpBa1+9q
	FiSNyzmbU6TTnp4goPWyjRo72wpGMQOHgY4P/VBBplC0cYJwT6btDj2IC+a6Q6kuRNsi
	smeZ2gC5qc++n9ec8TDTFF6Mt5ACqUzHUF8A8khwg/GDjxRTUDSvYGxTA+oI8udBTLmf
	3ty9FeP0H2Gjm7Nt6CojGrcjDBL7rD8y1/2CpyLgEq/VDC0c42zHHKSv1GBcPJH/Sdtz
	vNfZQK0Q56WR+pYNgQdXJATTyO6p2apDF7nztRSx7qDDZsRbD9JPCPcY8t7QReplzxQw
	09ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=h3ZX4Asa6KQlNFBQhVbsrndPwkEb1y+GXDqCeNmB2wc=;
	b=AZqyXv+dS47y0hJMfgaoK8x0Fc83Z7yl/55nBF2A7GQMhC6OHWipNnXRhTAw7AbjUu
	K+6pwY3+ikUprhZTLDjtBL82QPD/2Xa9tCiowV9AOvsT5PyvzI4hIajZCPc6FJpa/z+4
	cNHxW/EiNd35IgEvzgWv/wHnE7zL2PdhnE6ggdL2MkmRHG0U5NzpNXzDb3U/vX4SWCww
	3EmRDZZH4MEHjV9BhAoMLPNi3tcQJeaOg0/LBWe7OT/iXSWHz3k4mB5rdQZMuaHNvwCI
	2GgSpNCHlDdl+pst/rzQJy1DnENUGDVqYsB5SE0zq1XxhvpPTW8RJo/1PU1Gwv5eDjPU
	NLHg==
X-Gm-Message-State: APjAAAXlkkDKpzuBHJLfVkmOlTVqs2brf6YOMwgq/iAoAiKf9eB6GduU
	68HrwVglQmX74yB+vQPQAy0EqWTvWzk=
X-Google-Smtp-Source: APXvYqwi/Nddmg7mnwv5DkF+nUn0YVhvdqtiTYM6Cp1W5o/6X636j0KT3/+deHQn1da1XoM0SnX+QQ==
X-Received: by 2002:a5d:4489:: with SMTP id j9mr18929710wrq.15.1561974401014; 
	Mon, 01 Jul 2019 02:46:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w6sm8560480wrp.67.2019.07.01.02.46.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 02:46:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 10:46:37 +0100
Message-Id: <20190701094637.2876-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] perl: fix Upstream-Status tags
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
X-List-Received-Date: Mon, 01 Jul 2019 09:46:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-enc2xs-Add-environment-variable-to-suppress-comments.patch     | 2 +-
 meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch     | 2 +-
 .../python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
index 07f153162b0..3a41820f46b 100644
--- a/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
+++ b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
@@ -8,7 +8,7 @@ ENC2XS_NO_COMMENTS environment variable. This allows enc2xs to produce
 reproducible output by omitting the name of the generating program.
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-status: Accepted [https://github.com/dankogai/p5-encode/pull/145]
+Upstream-Status: Accepted [https://github.com/dankogai/p5-encode/pull/145]
 ---
  cpan/Encode/bin/enc2xs | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index e70ff67f726..686cc7167bb 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -9,7 +9,7 @@ makes the file non-reproducible when building because ^X could be the
 absolute path to miniperl.
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-status: Submitted [https://rt.cpan.org/Public/Bug/Display.html?id=129866]
+Upstream-Status: Submitted [https://rt.cpan.org/Public/Bug/Display.html?id=129866]
 ---
  cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
index 8fcb3442228..957839bf3ef 100644
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
@@ -3,7 +3,7 @@ From: Inada Naoki <songofacandy@gmail.com>
 Date: Sat, 14 Jul 2018 00:46:11 +0900
 Subject: [PATCH] Use FLAG_REF always for interned strings
 
-Upstream-status: Submitted [https://github.com/python/cpython/pull/8226]
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/8226]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 ---
  Python/marshal.c | 9 +++++++--
-- 
2.11.0


