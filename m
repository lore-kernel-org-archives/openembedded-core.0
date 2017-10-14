Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B46C465CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:12 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l24so3443785pgu.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XIwCxcc8dLsE/PmGJ7mozh6qpNYh432De5yw3O0xSfM=;
	b=gIzvpra6e7TqhdxpW5FAI696X7VyCnm2fs4NshYwyVVLN3+eNKpnyj1aUGGGU1JQQw
	JDX5YWRVb3lJj8e02vOxAhX4hr+4grF8q3BUH5COCJEqwig6PAdjP2Oz2piWt7IDb52e
	MPg3QkNshtQ5CMe0GBK2M2+sUFWhWTDG3N5EyAIy25zh9sw1PJXD7EImqfMS81GFaPpp
	TE5c8YZEQlckjVLWAOXgpULkGeBJH9MW/mY8rXkmRuKPerxEum++1w0yX14JOAPhZmYx
	RZpfdvMhokfTbV5DvVWJKRS2/6ucBXvJrFDdRr2MKcbliF//wo0LmWfIPz2ZNdUcrQeJ
	Wyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XIwCxcc8dLsE/PmGJ7mozh6qpNYh432De5yw3O0xSfM=;
	b=NWf/ZErD41/nmV7z1da2Sj1JjGRk+4kay8nP38MppzydMRA2yMZ9DBsnmeHJBVkRrr
	O2kbAK06meDr0xYlikg3wKba5tLd9RcdnGA8x2g7MF6flyy+5b15uNzDsoJbVuirGeAW
	7vQpUiKzBI/YjQtyxsg7tuP0JpGxlnV4bPgx/9U/1DwZFGvbtKKMq+uDqueBHUd5H7hS
	Y5F53g77iBkuHNqWo/JSFAOwJJPIPzA4yj7csiSNL0AJkEQlidxvwjswphu+mFt6dRFt
	/v4was3V3npJbxQVJOcLulkms/F+dr1IB4cQXkVDGPmLb7EmWTHFUh0fbQ6pnJJrT1lf
	exMA==
X-Gm-Message-State: AMCzsaVl0Ose6tthJB9zbQY7oVOj9kFvAp3Get3OMwe4H8FNRGvkuQaP
	/LLyyvz50FOl8DziEcpZp17gJA==
X-Google-Smtp-Source: AOwi7QDj9/7KOcsmzLR6ZXYahsR+pT/bCjbPSqN1kqdWse9Jy3MLP0PW7iiiA14JoiMol46j3GzKIw==
X-Received: by 10.98.90.132 with SMTP id o126mr4311837pfb.137.1507996153649;
	Sat, 14 Oct 2017 08:49:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:55 -0700
Message-Id: <20171014154858.35123-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
Subject: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:12 -0000

Fixes failures like

test-main.o ../../libevdev-1.5.2/test/test-main.c
| ../../libevdev-1.5.2/test/test-main.c:24:19: fatal error: check.h: No such file or directory
|  #include <check.h>
|                    ^
| compilation terminated.
| make[2]: *** [test-main.o] Error 1

Change-Id: I73fce0532b91fe410d509ae55ff471ad2ea5d929
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libevdev/libevdev_1.5.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.7.bb b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
index f740da206e..4b54971b1c 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
@@ -6,6 +6,8 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
+DEPENDS += "libcheck"
+
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
-- 
2.14.2


