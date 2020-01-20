Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88BB87FCDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so301453wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HfS4l3oGnPluRww4HkZx2STg/N4i/ypegX0FaVuGmtE=;
	b=tUz6ziyCd1F8Sq2J+mHF+rvr2DA8QrFWFkw1/N/ejV2B2Y1iSRoM3nSD0q+cuvHT0U
	OBjrzk4mlngG2VpSzef93vho0bTieH2Y4aaokKN/oON0QSRNduwrC/pjFbcowt8P3Jad
	TKfYTpfzsjzgMvCNW8uFuAGgMh/dVp7xQKV6lpVHNyeI1Z9CKJVWJyyMGCCeIANjXAA8
	RjRetg6By+vtYqA+mtf2lbbu/OJiAMt7FmYWlluHAweMJRPGBAngDA7EvukWsnx7cJT7
	mmz6HIUss1nTpsLl2Oz8sS/MW2l3QORgWJtJidzNGvng0XuHfGAQGoxgUfP/io4C+F7Y
	HJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HfS4l3oGnPluRww4HkZx2STg/N4i/ypegX0FaVuGmtE=;
	b=PSN3d39pvxl/5Cc4kFoG6Y9uBaNOsmdQHEa04N1pcV6tQY1CNUpbqAm6araBdPhUac
	q0uZUcwTXz2gsLiMf6dRQ1YAKqdkLUqxDm1NTFpS6bXFE7S9JelijJhCNS+2IwoFqpFn
	j9VqUby5cS9SkKOpZFSa7ai37Q6KtG0UhOHx3vK+DTzOinjyXoqiIWtpOv6qxy5lpYZZ
	8AMmN/h7UejPgkXQFhx0AiTM/a9xCxHZnCnQH72ZBdEmMThLb0RyOo55FWKXOAe/dVP0
	zQ/JSHJJP53a+iFsdUw5N0I6GqrxE4gzmha+ju2zJT4ycKTGlTmX3PXPHn/uQrpiR/iI
	xUnA==
X-Gm-Message-State: APjAAAU+CYJTL/AR0IS6mPNt10j5PPQNV+wJis01NATFxn8vmoeEsh5p
	3EpVZVz6P7BO5QCWOb7dwoNGGfzQ
X-Google-Smtp-Source: APXvYqxeQE9My6dvitrhv2+bAHBV3qAlgBoLn5hMNXcELTfGPPN8qZbNJz73POnavWasFcuNRt/PWw==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr562395wrt.136.1579541137937; 
	Mon, 20 Jan 2020 09:25:37 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:02 +0100
Message-Id: <20200120172510.22648-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/24] btrfs-tools: upgrade 5.4 -> 5.4.1
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:38 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.4.bb => btrfs-tools_5.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.4.bb => btrfs-tools_5.4.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
index 86d88fbcbe5..cdc971cf5da 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "d39ab9fafeb425d28fcaac645f7d663555fa654d"
+SRCREV = "3fc2326d3474a5e4df2449f5e3043f7298501334"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


