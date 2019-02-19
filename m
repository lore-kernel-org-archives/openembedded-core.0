Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 660437C9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id x10so3670953wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pZcNkxrIDicK2XR68ymzGxA8ZEyAwr6swBwEMRZPqKo=;
	b=RapWncGIDMrtgHKsqREP/CJn77OY0Hhg1TZWIY0a3sehhE6tr8QJ9MweGsMNeciZfy
	50XgWIs7gtJsiY+yXX2PHVof+xP6Ex4VT1bNi7rxeBcBE4nfF5JpXPkMbGd3mWHoZIt6
	hML0fubndtMT56jqKnA7CntesLSuV2kzA+s4ZR2fSdmpuFzRWV8LAnAcIJwd8BSLt+Fl
	iLBTSZ3qZ7kg1zFmEN5dP7hwfZXbvEEbfARWbXk5PR9xiXTNvlB6QfeJAPbBUZQK0cqM
	vdIJ8DvL60WSpaSzm/HxL1ohpnBk9AebLJ759RREUngdQNb6i34qwaEJiqj20YDowrA0
	iGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pZcNkxrIDicK2XR68ymzGxA8ZEyAwr6swBwEMRZPqKo=;
	b=KfS6IA9lknrPRTo2nP5Dl2STsfn5GD5RtSRRbHXQEdhLAwAkv6sahb0nmVQfYF1gmc
	6dUb5VJzLI8H05hTWKflFr5UVwP4OhGfuXgMMvtwpMLgm6st9RUdDbPUNn6cMYbY8fsR
	wevK+V0MCOmgUilBFlRkPiSFuscXQb8afTJrmaZv9GmSYxeAldHVWZ5iSEn1jpnEfGMd
	Or0rrjOTeqlUGl97rA4a7OnSurhHc78oXLIlFI/Jl8vo4W9Gv4jyWQBrjO6qFTUDJBDm
	33QOQa/mWEox2vTD1rKphYLcjZRfxsjKYd4cvgbErkuFqzPL0vPgYCQDiW0hraXVfbFj
	JNLQ==
X-Gm-Message-State: AHQUAuZcEyu/pIn4Fjjr1OWCIJoV6DnFh17IkxHAzLG9gn+Nj11NUYJK
	xhNI8P17FVBKxEwRLRK5PwROlVw4
X-Google-Smtp-Source: AHgI3IY3EtoB4gbwOH1joQoE0TnXWAg1McU9ufhwaWxKFuIfuy0yP7TAN6Wv0rWODhfh4l591IPrdw==
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr3530034wmc.49.1550598460927; 
	Tue, 19 Feb 2019 09:47:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:12 +0100
Message-Id: <20190219174712.60694-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/20] menu-cache: fix upstream version check
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:40 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index dfc15ba5ed3..ddbbd940669 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -13,6 +13,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 SRC_URI[md5sum] = "99999a0bca48b980105208760c8fd893"
 SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
 
 inherit autotools gettext pkgconfig gtk-doc
-- 
2.17.1


