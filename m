Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 723AD6C5C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u13-v6so9553953wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aVYlCtmdZfH6EGLasC1vFF/oW3XMPE5FHZx0e1QQXto=;
	b=bWXHOytQ7qp8q6XQjaxNcybyRotNG7wID6+y4NPxH1i0mSrUkcEF5pd3z3DPqm7F49
	DK5T+HTrggBCt1cq7rG9+LqZNHkrgA6iBA8iUMfK8/WBGlN5erghr2NMqVMdmnAN8yR1
	i+3ybIZseb70jurYvzLdOII4Cru2UpqBrN9KgY92vqTEBoTvLupsSPiV0kjlu1DTcLES
	4E2RCoeulUU8Y6eL1DLj5uuuU5g4isnIyHi+67Y7+YY9Q/NVpK1MVxRQnTVLALQarMXq
	tPiObiZqAnY9CGMzm6kq5d751FGy36rpoc7uYwnXjZNKYJx0vwLnw5NlpbU9ZwU1uwl6
	k7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aVYlCtmdZfH6EGLasC1vFF/oW3XMPE5FHZx0e1QQXto=;
	b=BJpPRnPK+dBNU4Wl8xbouuQjkh7y8UcBzIBS5/rIEBnvkiB5TN7LRPew4NowuZFV6p
	x6VT1vZflOr9z/04tLn1oZ8JHIoeNIsIDsMD/J8D1o9eO2WREg312J5yknMFLcN5cR6i
	ute/5lFcEDOYhkJCOERWTNSxJ7u1vtIsC4Av8ENcDDa2tbuE34d5TPH37nFFARmpnQyX
	9FkJTBsbKuRFLYWT0rEkmHnvZ++JYpiOUG6f6T8UN4CeYFGQSt0WLGpiNAzsWjGQeLdh
	xlpTjKLTgQxgb9ogoPJho2/u65nBIdLNPyK+li94fENNdTYYWMGh+n1pcwSAeULUNint
	tb2Q==
X-Gm-Message-State: AA+aEWaKN/4B7q8FXZcUQMp4Dcr/H65Z9m8ZMcRG8vK4CS/ReptTWu77
	OsM5d0u88eQ+Xp+EhQNGMb34FdNt
X-Google-Smtp-Source: AFSGD/XpyYJA0dTW1vazgPA0zJK3UUpTF38OvExg9v3W7dw4OJIxCg/851ANqhE9DqFLGZfn+q3yeA==
X-Received: by 2002:a1c:da0c:: with SMTP id r12mr1476623wmg.54.1542901317066; 
	Thu, 22 Nov 2018 07:41:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:28 +0100
Message-Id: <20181122154136.121480-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/16] btrfs-tools: update to 4.19
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:56 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_4.17.1.bb => btrfs-tools_4.19.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.17.1.bb => btrfs-tools_4.19.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
index 6b53fbcd7fe..9590a723d50 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "7faaca0d9f78f7162ae603231f693dd8e1af2a41"
+SRCREV = "d72d913291683188ddf5d758db02f1bc3b05d2f7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
-- 
2.17.1


