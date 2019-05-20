Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B56807E0E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:13 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d18so14810161wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VtO86MZqDqIRT3dh4jwrO8mTIi6FJZ8899BM8mrTe24=;
	b=Cqvd80jfLsPmQgA9bepHZzbittqNpc1P0pAhdPWORtnmKMbwr4wnPmEqF3APwe8gfB
	r7suCWSjYevUHut7B/k2q4GG7IdQk4NnZ7EB9o3fAakoyRJlb92UnBng0UXmP00PbiM8
	ZjNb6vnhFkeJIhrXGZdOajozY0rNqXDkqBG7cGsNBJ1NqY6jk9vkuC3cb/BF4DixHADD
	o5a7SiN/zXLPyI0XNtrNPprXlgerqWdYz+bplxE52GjhyNNTF4JlXM+toYJpY9e3GNjB
	UQ7EJtbdhD/9OtKDvxOXiA9RoLHRh9Xzen8YiIg9Xs6/0aoiP+5JW+TTIIu7mkqy9Qbb
	hISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VtO86MZqDqIRT3dh4jwrO8mTIi6FJZ8899BM8mrTe24=;
	b=DKFfpkPy7nUiGHej2tXWZ8JRPIlSYy2EuqXhRPbBAL/yXOuPB4TYeYmmE2xZ2A3ZL5
	kCmQilkOdgECBmAqliZYW73NhTyNLxmsBdnfsD0KkEiVSYXpq5ct4GcLRkgs1cvCZtCK
	6Mqni6pE/BECGjP8jzwyXnUZ8NdgaPQlzQ2KIUnAXL6v4HfQoGcFgMTSBLsA+qP8Zbx4
	4q7NfDhRwGr3wP+7zGstZjeT54/mQ6BvwSYZxhn29yPveZIw6wfcnTs3lQwpIZ6kj0h5
	lwZXn2eshE09lDbcZbAjiI4jwxHMA12+EA/KshsWRcB0SfLVu4y0vgytmF5ItYFYaNir
	dwhg==
X-Gm-Message-State: APjAAAX2eEYRDmS0SsPBp+2NjOk7yKOxCEu6rTQ3TpMt+ck+SC0UWOpL
	lGFPuehamcP2A+qswgnS7S8IOAMz
X-Google-Smtp-Source: APXvYqyMnu9MZpK6kw4dkRbGj5j9OEoy1WUMQnMGjMK36GBtEhZswLWAFzcQTT+Qwnk4qY8NJ0BPaQ==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr32093307wrn.241.1558361534311; 
	Mon, 20 May 2019 07:12:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:25 +0200
Message-Id: <20190520141125.10805-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 42/42] btrfs-tools: update to 5.1
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
X-List-Received-Date: Mon, 20 May 2019 14:12:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_4.20.2.bb => btrfs-tools_5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.20.2.bb => btrfs-tools_5.1.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
index a1e7309664a..8b4178d6dec 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "5c748404b97035463c79ba4e5fd41b6858535509"
+SRCREV = "43013422dbce4bcc9ed77cfe65b294caa0985ec8"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-- 
2.17.1


