Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id A61E460616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 22:08:21 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so17662700obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yuWg4Byl6R+AN1tvDGE7KCXGr/09JRvd1eP63ijU/J4=;
	b=UoUlRYjU5kt7zipz54tzxqXIg166rwhaAgnwa4hCgtdXpPlzf4r2AQ1ZnVtI6pJUzY
	5a4dF6+Z1c8iKAJTSoifYZxMxB7AhwD4Hth7k45kBtGhBuf7W5rMr4qjDIYYKbNyQNm3
	clcmqSfXgBHJ+GYrAn8/TgS9xhzMXvHVDxFZo4LVyXvk5E0aexWWPCJgvZZGrHjWc3n6
	eE7ApghdDfIm1EIUNFN7f+nKRicrNYzdPOrK76OjxN/l+DJUengFI3gpRfhU0xycvbSy
	etsfoDEf+VL0NznlpvU+l+jOgHCSGnSOjbTzu0Vzh8mzFacgoY4YHsQyz1apFG0A5W2R
	hKbA==
X-Received: by 10.60.159.230 with SMTP id xf6mr48277156oeb.43.1449007702039;
	Tue, 01 Dec 2015 14:08:22 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	x131sm24520153oix.27.2015.12.01.14.08.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 14:08:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 14:08:14 -0800
Message-Id: <1449007694-27035-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-libc-headers: update default KORG_ARCHIVE_COMPRESSION bz2 -> xz
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
X-List-Received-Date: Tue, 01 Dec 2015 22:08:24 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc    | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index ba1bea5..2ba6ed5 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -43,7 +43,7 @@ python __anonymous () {
 
 inherit kernel-arch
 
-KORG_ARCHIVE_COMPRESSION ?= "bz2"
+KORG_ARCHIVE_COMPRESSION ?= "xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
index d816e5e..01037c1 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
@@ -1,7 +1,4 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
 require linux-libc-headers.inc
 
 SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
 SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
-
-- 
1.9.1


