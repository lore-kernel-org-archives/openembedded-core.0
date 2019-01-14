Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id C948C7C0AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t6so23170012wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aABgEorm0guQ8NVj4cY6NmOhNP+lyCwljFNFDnwAVks=;
	b=QFP1XZ/72ipsXGET7WpdFH7XQEptsoSv2rEnGw1SMj6ztsbyKDH4SvkYlyKuipZc+g
	GFyXbP9riLeM2nQXPITwNjYG6tnWh78RGUjeHWpb0YeSB45Zwg2IWNeex8jsVAIUua4H
	IHNbHsn9d7Jece9BE3uqf19/tT2iT1t62MoyQKDSupggbcuBmYiPda4x3EyI7ofaGqcW
	Lzamm5VyOFulAacUuG2/HJpDkr3dBMaplH3QWecriNrWNN8KOLlzQ4OslDhSloDRARgU
	xz2hPjP5QZe9TRbuVcLIHXWXAw8ebxRR/aF7c1+NyUqnPDOm/EZfFj54c8ySi1sqXxSy
	Z30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aABgEorm0guQ8NVj4cY6NmOhNP+lyCwljFNFDnwAVks=;
	b=YQj4pxqRxonjG7qWc1/3gZ7/gQnZ9Fh3js7640Rq1oDD4OMwce/ajAIOirvdwBj3xn
	+oMNUjUNGuJhW9sP8JfVvgwdyAK2grn1zkXMwBgnEKxPdCJnyyCcJyNGHQeOjJK8sgq4
	wYxlRkiJzSM8pscVq2S/GRLb7M4mzuNh/DwLW/ZtQwAVLFpdg++g0EWP1vSMLzMR8Bjv
	fgH6KYC3hPsoTiuCQX2eRqxEo6PJfJ3mOAkF/yhgBHmEwZ4+yRAFTIm+CYi3Dt1e7gTD
	lvw1e9v7JeMNI+wHF53OLg1JShfr9q39p+aCcjRoRM05M6Lvq57MQOXF3gUK13DNo/JD
	lKRQ==
X-Gm-Message-State: AJcUukdXyxmkz0O3/o+YlNUoemB1/5btT2J2fUvhXW45OrdPkdNMfd/t
	wKq7NCl5uIxHnWX7Ahpf1q+yI+Gw
X-Google-Smtp-Source: ALg8bN6rTUgLxqo8W0wnbwu+M/xnyQ2iOf5PEAVbHUW2kmKyzUtzU4agqlF9JcbkV7K9f3ZYbnv2gQ==
X-Received: by 2002:adf:c846:: with SMTP id e6mr23697250wrh.243.1547478221194; 
	Mon, 14 Jan 2019 07:03:41 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:13 +0100
Message-Id: <7cff741d1306283af05fa88c00ed7f2a084af318.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 17/23] qemu: add a gettext-native dependency
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:41 -0000

xgettext/msgmerge is used during do_install().

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index db9c2245df9..6937bbc87b4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib pixman"
+DEPENDS = "glib-2.0 zlib pixman gettext-native"
 RDEPENDS_${PN}_class-target += "bash"
 
 require qemu-targets.inc
-- 
2.17.1


