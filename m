Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id ED0756079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:37 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c17so1620618qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XJRKridu++ughbOqiPmpg+ITc2CSRV+vrwwlazJLRsM=;
	b=s+oTtFobq+HhVb63wz6VkALk5KUPdGWGSpClnPzhZsCzRwLVQYbOBZUGkqWOEUDi7d
	0rgVM9qW8XLI8KfpR8c+47co+X3AImtcie/2Od7eXtd4YYLXieU0HAq5wzZc+1fwZF3D
	40RTmTcwQfCv0At5UruaJ0vQjpvSbEUnfI/jqUdHPmMtO12DLx4lqVU5eTuWokBR1f/1
	ZERAb+N2G8BdwdLMGndmD0SymZai0EYI+HWkfkRG2B9UcheNEUmQHEuzu6qm54h1bcF3
	yCGvY0HNyM8cZgN20xvBv3QwsSU+l8Ki9J9PCCR0NETRjA6iNfmGGSOSi49pRsbGLJzT
	qgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XJRKridu++ughbOqiPmpg+ITc2CSRV+vrwwlazJLRsM=;
	b=c0vOd2DGewwtdZKTCiE9KCiCxrnzQ0eBXD3a8J8PGq56DK5ipLYdjx9WkXLrVzD4h5
	w5KTpqwAPERxqgnCYBaKQUAd5HuV3pXO55alg6LDgfP0kimWKHk2yG+0zJVRNtursPCY
	HMLz0YutIPAT2WcGhq5TgfBjALdbAggwhfXF5GA9jl4ijjtiqdieLd7LhIn5VyNiM4E2
	hRABsWlysZWQWCOsMybKtw2xM2w6mGP3KkHoPsBufygZgGDBNq+TcwteaqrgR5ztXwvE
	SalDgZwVgIEPL9cKkmjVmw4Ich/BwG36Kqwpi80uSiA7lTeYq5VnkUL25g56msPO8pTO
	19zQ==
X-Gm-Message-State: APjAAAX3C1PMhBvAiOunkGFya1cQkHq6LTumI/Z0aovU6TujTtm2Wqqr
	ScRyfu+ILkEZGb17kjCxoQbjsHGsihWwjw==
X-Google-Smtp-Source: APXvYqxDpzdq1/VoqUOL48fcV/Z5NUkRSCtxPXTTxEuvXv6V8n0ZexE+Ka8FCJRcoXOyFno6Eg6tSw==
X-Received: by 2002:a37:e109:: with SMTP id c9mr2467732qkm.366.1576678058858; 
	Wed, 18 Dec 2019 06:07:38 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:26 -0500
Message-Id: <fa2bc2d58f4a1cf9de5322b6aacf1362aa47e044.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1576677592.git.bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto-dev: bump to v5.4+
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:38 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 163f280560..3b5c9ddc59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.3-rc+"
+LINUX_VERSION ?= "5.4-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


