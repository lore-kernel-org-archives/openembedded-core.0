Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 20DA17D32D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:38:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a3so1519486pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WbY46uMcCp97CnzqG8XhqUO20RDSjPeln2xh7bI+GAo=;
	b=cyjUYjx6WIkOGNa01ECaqBb3bPALf0C1FgHCKZjLpZuDq9wNCmusZ6kYOLSyVZC+f6
	Of8d/1sXdNpxPOOoMWqWeH3qoerPe6a6ATXoHy9avd/Ux2+YxLn6BWFgEy9OAHG3RdAY
	9dsTw4fs0f3cg97u3dw1dzR3wkx7EgZqORyen3YZUmibB/CTY1GQRKLgVeLGQOFQlucg
	UV1426t94wIKnD71O/kPFr74XmZN2fRmQ7vYcj84+KB6Bx98/2ZCH8vmpPQrWl8hqHAK
	lvb9CPE+hfmSa3mSkwYzyNRPNzICl8Zj2nIiBvgRJMyRYzXa81dZPQZquvwwJINiCx7B
	PfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WbY46uMcCp97CnzqG8XhqUO20RDSjPeln2xh7bI+GAo=;
	b=KsnrLmH4SQ3GC4kimSxMwhKGgX/X+wVuPSIraMeARdWfo63DLJs1V+o7C4+3iPFSnw
	O1yLIpARrZchaA8cUWgaj0Kh34xTLfeIQap1PdEK1bSsXweTy9rFxRDBE+jrtvntLPpp
	7tPOW3X5CX6Bb1p65JDG5KvV3050RGQxOBkZYBXvL1ClqXxP6Fa6LNAw1zxWGtYpWbka
	o+LuBXHlP2WLrURmoA+CQF9BQ4hH/BHwXh8h3EniXs2xiYgVrLwFRLvUimBF/SBt/65Y
	mvf5MX/c6sS/i3NrHlQ/5n4ge+AkH2D1uuXJ4yKfNRr5I3d5dAUGMOixZ1HSW9IQOAao
	WKHA==
X-Gm-Message-State: APjAAAVsbPYwXTUagw+65oryiZ8CMt5DvTdlNHQpE+WTKl6wI8hkWXX6
	4hdFbRo+1AQ3uOkEf2CbzqJkm0sozAI=
X-Google-Smtp-Source: APXvYqwoBhm62V7Zxqa42YTMT1j7/4AKNszN5iAFaQUIhpZw++un+sG+4Y6cfgf+HL9bsxYyCbXgLw==
X-Received: by 2002:a62:5f02:: with SMTP id t2mr57231425pfb.7.1558539525679;
	Wed, 22 May 2019 08:38:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	w6sm30001490pge.30.2019.05.22.08.38.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 08:38:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 08:38:37 -0700
Message-Id: <20190522153837.18578-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] musl-obstack: Add recipe
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
X-List-Received-Date: Wed, 22 May 2019 15:38:45 -0000
Content-Transfer-Encoding: 8bit

obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
and other packages outside OE-Core, this recipe helps provide this
functionality standalone on musl systems, and helps in getting full
versions of dependent packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Inherit pkgconfig

 meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-obstack.bb

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
new file mode 100644
index 0000000000..3003935fe5
--- /dev/null
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2019 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A standalone library to implement GNU libc's obstack"
+DESCRIPTION = "copy + paste of the obstack functions and macros found in GNU gcc libiberty library for use with musl libc"
+HOMEPAGE = "https://github.com/pullmoll/musl-obstack"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
+SECTION = "libs"
+
+PV = "1.1"
+SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
+SRC_URI = "git://github.com/pullmoll/musl-obstack"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.21.0


