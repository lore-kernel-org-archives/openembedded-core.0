Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B85787E621
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 20:57:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so7939470wma.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c7sDMzG+thIzBoLJtG0ki7nXfWV/VYDzHc71b6l591A=;
	b=KwXY/uRXMt86FSW/id7CaT0Z97b6Qe1DUqEC+BX/34HPSnJJ5GGia9u5yHXxTjkjF5
	X1mkbrcdqNKimZOOWqyuK6VLLe0ycAb4gMB4CcsaWhhf3+qSZStAHKjsxcGWhNi8cQ9K
	23lJJR3GyOQkAdkxD/6CXI9qg2nTiZM/ePiPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c7sDMzG+thIzBoLJtG0ki7nXfWV/VYDzHc71b6l591A=;
	b=KGI6RRNHXvnV9TCy4yfeVbWxjYV9eZy5OGiR9gvGTK5D0zjFwLtjclRCAZe3ds3+r1
	blVLDeThnvFtUa1EyuujGbMTovujT6PzEf3lOdNtnLDqtRAmPiTA6TEAT/Gswd7tG3AN
	ws7oAXjXPGhndKowDaNwCixlSioLybZ4/w21++zXdHZkAiYLeQZVLFYCifMLfh58iMYg
	8R1guyzScWh+zMpwEq7eY6wNgzPzIvwacWE+c3IiXsaywMT/uSVqCVPAQoO38OToSTR7
	eNZwtOUO2riOzWNjkp/Xa6geSfkCdZas7/oi3dh0n+BICZrSvBHEyDXfaGnRBS/IT7RF
	NnfA==
X-Gm-Message-State: APjAAAWrANHVa3QRVKA/D1xphFHUucM/xhP+rRAN9y2444FiMjPenAiw
	hr8VUTpCYiNTDTtKgVbZ5b8aK9a54Qg=
X-Google-Smtp-Source: APXvYqxY9WvFLf+iKhfL4HC6Kl9TclHczmXWSqrahSVrk30j8/bObLA5aBHe98nhT1Vh/elq/9U4Ag==
X-Received: by 2002:a1c:7605:: with SMTP id r5mr5231853wmc.68.1559422678997;
	Sat, 01 Jun 2019 13:57:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h90sm30439773wrh.15.2019.06.01.13.57.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 13:57:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 21:57:56 +0100
Message-Id: <20190601205756.14465-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: ptest fixes
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
X-List-Received-Date: Sat, 01 Jun 2019 20:57:59 -0000
Content-Transfer-Encoding: 8bit

Add missing quotes in ptest runner. Without these it runs all gnome tests
which is why the counts in my minimal image tests differed from those on the
main autobuilder core-image-sato runs.

Also fix an error showing in the ptest logs where invalid options were being
passed to busybox du.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 2 +-
 meta/recipes-core/glib-2.0/glib.inc           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 8f082d34f60..fc50082c8e6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -2,5 +2,5 @@
 
 set -eux
 useradd glib2-test
-su glib2-test -c gnome-desktop-testing-runner glib
+su glib2-test -c 'gnome-desktop-testing-runner glib'
 userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 82107a8a188..385596c7544 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -140,6 +140,7 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
 RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
 RDEPENDS_${PN}-ptest += "\
+            coreutils \
             libgcc \
             dbus \
             gnome-desktop-testing \
-- 
2.20.1


