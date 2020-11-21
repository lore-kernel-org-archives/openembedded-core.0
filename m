Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.1633.1605928302446742613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 19:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=Bz+2jkof;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 98E35223FD;
	Sat, 21 Nov 2020 03:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605928301;
	bh=ZV5LsmOEr2lFr8VR6poHBMn+uAFRKaqlULR/asFwmeE=;
	h=From:To:Cc:Subject:Date:From;
	b=Bz+2jkofazFqwruhQ79S6XdTaIZ4OjC2WJv4zKQI8FvZfOCNqWHxckWKzuMjCfYSW
	 lb+dNwydStj9GzWYSN+4z5apcrq+pI58U0bH7DT68QcX+lUK+xqBETv1JAalw6KixD
	 1OP+qUamRhMZqPfkiVlmQSPsgJHo6eCUQafV8Meg=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v2] heaptrack: add bitbake recipe
Date: Sat, 21 Nov 2020 03:11:36 +0000
Message-Id: <20201121031136.21075-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Add this useful tool to the devtools list.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../heaptrack/heaptrack_git.bb                | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
new file mode 100644
index 0000000000..143274d816
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Heaptrack"
+HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PR = "r0"
+
+DEPENDS = "zlib boost libunwind elfutils"
+
+SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
+
+SRCREV = "f8d9e665196614b606eaab9c6fc81d65a88a2af1"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += " -DHEAPTRACK_BUILD_GUI=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

