Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8D037F134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:22:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 62so2388029lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jxpUcM6nCNTDq3ObmMkFsrKP9YbNcjl26fNoQqtof8E=;
	b=FI9fVNRvD2oFkx2I5sCK2nzS3U6tO0wKNN2/vh9hZ3nKSJXgi3tGtjWUgBvu/7EBZl
	q7rQKNyCCCxw8exlZz7jZjDOyXHKjjXq1LslSKlHN7iaj+AbSEezdpdRmC18LFdCb6oA
	FjO9PROaMX46Ga0eHakhgJTpAlJyYnWjAFKxEB71MQdIs4mzqIUjkT6P8skajeZ4/1vT
	QF1jFW78NZkZbaFvTCSfetr2dH/KhSSN9IsVD5U0VTF5+ahz9Oyh+o4jxj91UJbuTaj4
	WUP9/zp2MC1aNrZh50d7958F/NpMGrLLjZOjLstxqwZdDPE9TvLnOju+CIIYkCdiYBd6
	pN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jxpUcM6nCNTDq3ObmMkFsrKP9YbNcjl26fNoQqtof8E=;
	b=qEd6ZxXztswFvQnbSaUTJyG6JZIbNYV+0AbY7mowkTd2Fqgd83uvjcp9EpQk+3R6p7
	kXSPc6ECXRyYLcn/hf27STWOhWr0ST1hAetS+Wu+kof4cPBJVlhwnjuMAgk7sJ/z6hDc
	wzm2JNWIWzJkOuFZl16CSSQJT7FeG3dlPjkGy+GLKszZKpEAjYFfEn+jMeMFU7y+9e1V
	qrTgRPZen4hrKVSiHyeOzV7OTng0yEygo3UH3N4MrbyxB7ihgiSLA9V+qPmG9+2Jx/NN
	mRYGUU0uBbSP+AOlXpBI7tqoJjYRoeYTMR6lqrx03iX6fNa1jrllQ8tJuNS8Gzwl+KIK
	A72g==
X-Gm-Message-State: APjAAAViiyIlOckOCAbeilGFfrvNYYUZMYpHJZnn4PvqwBQNPEStcJKW
	Y5ODmyvNBvtyllPC4WDQZrQ/vBDx
X-Google-Smtp-Source: APXvYqxz4/heXMxlrdyxgWSqIJOr0QSy+3AedOnxUd4Ll7pINZp2gc821w6n6kfPJLTXFSB4pN7iqw==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr5394944lfh.177.1562962948899; 
	Fri, 12 Jul 2019 13:22:28 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z85sm1608746ljb.101.2019.07.12.13.22.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:22:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:22:15 +0200
Message-Id: <20190712202216.29218-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
References: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/3] xserver-xorg: update to 1.20.5
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
X-List-Received-Date: Fri, 12 Jul 2019 20:22:29 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{xserver-xorg_1.20.4.bb => xserver-xorg_1.20.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.4.bb => xserver-xorg_1.20.5.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
index ad99d6bece..79fe0666c3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
@@ -5,8 +5,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://pkgconfig.patch \
             file://0001-test-xtest-Initialize-array-with-braces.patch \
             "
-SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
-SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
+SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
+SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


