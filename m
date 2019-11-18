Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC80F7F9F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:31:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l7so19734922wrp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zu24RQgKVLAUPtaz1C9qLLDwbQz+ROvVc3LbaOYROBM=;
	b=Ytye0n/V8a/+flR6ssbPofW1B8uwriXUZlXMFgvBwV6qLHc65GHP1N3eNPA7UicvDa
	kMxtR4PIcjPUeOzYUojrj971aWOUxq3mHpXXeAtCyojNooQs2APMthOomEo2kk/mUCir
	xUFa+GWciT4bgU48IQN48feQy2VsTsNZaBv+xtK5d/EKI50q3Bk0l3WVMOEBJvVB3iV5
	6Kg4K02yuapHSQyQyBCy4PXolIVqbgPeYBC3r+BPY4AhiwVV3V+ZN89ZAQ8Oavock+xm
	uqX9A35FIVl2MMqbG1TACbYw6sm2dMeEhaCRwcd4YZIXjO9EeZI/eas3nLaU91BIoj0U
	JKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zu24RQgKVLAUPtaz1C9qLLDwbQz+ROvVc3LbaOYROBM=;
	b=kvZgOOZ9GNDtXQhDhPTSpba3t80QCOcDiTZ8KckNQLqjOnUJJ9d+Z3CuXPiWz7lU96
	/Jhodfg/93CPwoC5wyKDow0698gJ0d/TiLQbJgWfATnoDKd9xXzbEkXZsSndwHSKbmnk
	Etv4jnx43YQrGL6PsPhzgQDgksANBP/7IKtQBGUtRdM/xQaewB8AiSHLwL8d573gAb82
	l5w0gpzOWER/qc1thvxOEP2MPggzhOKk1dsjl6+aUMeiDuw55I1/q9bqRqc0fBC9gyyO
	YuVyK98v7QpUqg3W9yNmHvz4Mtlzr5uvtDhbei6D5lTw9Qnrfo6pBNyEZYpaD2gEJAOE
	7B6A==
X-Gm-Message-State: APjAAAWdglAgD9rETYhauX/mLSF4ZKJiE9dfsH++Ry1tQ0eMXZ1LQ5MU
	2sD2NIvlcImaELW6ly+SSyUXEGsR
X-Google-Smtp-Source: APXvYqzJKq09xHN0T4RSGu8QXo3cUyFQ5aegmqRjvphrzCoXWVCAaHAb+huSt30AJQA5c9d/EkL0Qg==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr11852794wrm.356.1574087503575; 
	Mon, 18 Nov 2019 06:31:43 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:31:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:45 +0100
Message-Id: <20191118142852.22981-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/13] btrfs-tools: upgrade 5.3 -> 5.3.1
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
X-List-Received-Date: Mon, 18 Nov 2019 14:31:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.3.bb => btrfs-tools_5.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.3.bb => btrfs-tools_5.3.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
index 12b5c4562dc..a44c0bc87af 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "de7856cee5907938441f765ebab7cc106b7faf70"
+SRCREV = "f82e569b33c3c1cfd4f8f405085ff8d439a0a915"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


