Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 535457E34E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 01:32:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n27so424851pgm.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m3c1fWREmhAR9Aa/fqD3j/+/vDnTBnGCqfqwlRI7+4g=;
	b=Bcu5EQGfdAhJbDxZJ3fXKpsNx6u4QZ6GsHXkamQP6+OO97+20uNxCr3FGZteeg75V/
	PAVq+/ruq5yHo5es9jsVwzDI96Gwuc8AEKfbnrAqukxx7auwEukLTmorVpwrtA7cDrHD
	B0UUaiJL3aVY2XQgHQZVJo9PQgKdYIUC5Ak+0OgVxecSyNOdKJKq8o5w84ikMRhq5IHa
	nLp4c5qbbgTOKJsLxNdrXG02BIe45+BFajUpxDTzJPsS2R90DVv8j6Aezv/eXGMVDrPd
	CbhB6bnNIUCxAVEUNk3pyVx3lmlsiJF2rU1b/EO4ljBekAYURqwHMUFiq0P5EWsovEzq
	xiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m3c1fWREmhAR9Aa/fqD3j/+/vDnTBnGCqfqwlRI7+4g=;
	b=flTkdxDuwnpU9s3gLucC78k6yX6M6RJ5zB6AKhLExiBjrqQmF7W8QEBtYK2cg3KlIR
	/5lGJlCzVWJatzA4bsGohL7UYHRAa5sfyT/WbDm6MVnPKrWGGNx6I8nbQ1ibFEm3npxp
	HrioJNFrkKdFQkuGST2ihdXpUXYqdqXk2gE1SeQwKZ0i5MWjCfleHdly1Mmsz4wC0Ypq
	X6Td16jmFVxvLHXXzU4b1XUE0Dwi/Nn2QY7N4ILQv3j8X+prXlf5a8VJybSZjceo4pS4
	7NSyc/arrFe7Ka6pb71O3f2by2dhslPTM89JhiGsw7R54N75a/8nIy++aDuqtVRZc8nH
	7Jlg==
X-Gm-Message-State: APjAAAUVJNGKOz6x7Hk231ivYEt+C+m6ETQ6ivdyAkK89gzux6RgPXhG
	p7L8y28E90Egmtr+XqOG0Y8782qSQCE=
X-Google-Smtp-Source: APXvYqzibbAYS+xRuYFi46yVKBGmBfYbEqQrJpCcmw1ngKMUHVAF7nenJqU9Fg7aW7gKiKH6ltdZIg==
X-Received: by 2002:a62:ac0c:: with SMTP id v12mr9755915pfe.59.1558488756808; 
	Tue, 21 May 2019 18:32:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	p64sm34197147pfp.72.2019.05.21.18.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 18:32:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 18:32:26 -0700
Message-Id: <20190522013228.7591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] musl-obstack: Add recipe
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
X-List-Received-Date: Wed, 22 May 2019 01:32:36 -0000
Content-Transfer-Encoding: 8bit

obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
and other packages outside OE-Core, this recipe helps provide this
functionality standalone on musl systems, and helps in getting full
versions of dependent packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-obstack.bb

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
new file mode 100644
index 0000000000..9a9f04dac6
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
+inherit autotools
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.21.0


