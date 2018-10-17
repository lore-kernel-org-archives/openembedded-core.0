Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3631179B34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:22:42 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q5-v6so17496083qki.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KjuCiwM/GRq509atc+2Re1gCmTAeC6cyDpRvdOJ6/q0=;
	b=Goxi1TWvyjLxkQdRezcfxeTXFZaj+53QhK9ol1BsRS5l1BOe+1PeXgvuGLjbaT7WBs
	W6CJv9YHZZUwxl1ih+cZK5C2zsMNn88P9OX+LQC8N9UCzJ6zzAWBV6ORkujbtybG+ZHy
	ns/3GZKtpABp+FlX+YbZAdsvUD/z9ERtWmTBtP7Wq6nS5hCJ0M1lrxnb1Xee5Yoqlmri
	onlQMK3KtZ6IafW1PSCDSz/my5OpamFjIb585r75U/J3puW6G8piBYZ3pVkn/ZFMSl0G
	6+gLYgsVcpuSC8Pa5ylgovScPkdG1YOw2HYmKiW0+UM8HvwlKbpHaT8BHGMSt8RsJtW3
	z+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KjuCiwM/GRq509atc+2Re1gCmTAeC6cyDpRvdOJ6/q0=;
	b=Gv5ns1AoY87YqqJjgkSpReDTdM0evGquz9YHHdz5PWnt3+FdHzg6cIAVetBJ8K7KQQ
	HaonogXtJh6LdwbPk9Fuq9ftwvMSjTHBY7StoEAANECHKZFzm73ur557x24lnp80Byrg
	BZTCQt89zzliJn5g/TBY5CmowG2GeRI2H7L3pafkvn/0Y/ihcIbV3lGJ/yW5yqrLgoSe
	yykH+eSYePSaHpy51HyqBxKjXSuLxCLHrLns02b1yxOeEjFoqOJVSJT+bfROUzMWN97O
	HIf6ECBuXTdtUAgv8l3W7tVdGIsO+S1lU8I6p/9FYov69MnOLGDNm9OXeY5GkTbz5GxD
	alzA==
X-Gm-Message-State: ABuFfojz53ScqBl8TkfqC6YwfSj+wZzWJALz9bj/8CwxGY/l093liHEw
	qt7CaOUikcSsC/PuDJpCmq/LToRm
X-Google-Smtp-Source: ACcGV61UlH/1Fk30FxDLpK7gLa4N7nwDFvkCPwy6EGFdQYmlZ7xzvjgOeYmygucYCNdIPqDr7CWmEw==
X-Received: by 2002:a37:26d2:: with SMTP id
	m79-v6mr26749693qkm.167.1539811362719; 
	Wed, 17 Oct 2018 14:22:42 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	h4-v6sm9799796qkg.95.2018.10.17.14.22.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:22:41 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:22:34 -0600
Message-Id: <20181017212235.8453-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
In-Reply-To: <20181017212235.8453-1-danismostlikely@gmail.com>
References: <20181017212235.8453-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] kmod: bump alternative priority
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
X-List-Received-Date: Wed, 17 Oct 2018 21:22:42 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

toybox by default has a priority of 60, and busybox of 50. Bump kmod's
priority so that it beats both toybox and busybox.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index b25679359ba..bd21d2ff731 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -39,7 +39,7 @@ do_compile_prepend() {
 
 inherit update-alternatives bash-completion
 
-ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_PRIORITY = "70"
 
 ALTERNATIVE_kmod = "insmod modprobe rmmod modinfo bin-lsmod lsmod depmod"
 
-- 
2.19.0-dev


