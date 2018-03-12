Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id D1649788A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:41:01 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 93-v6so8682728plc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HTHbDzzy0rb06iguUuhRbeS8aB/cY8VVuel7DmqRskQ=;
	b=ITJimB8iFnARe9BEecmRXz6o5dYm8PmvnkgCLRhO+nQiuz5f/zbH3yzmFQADIpVvnC
	wl9UiVeKDVjmvIdUOU+7WSANEhCe8FCaZbMUxtHb8fwt17CHnLkJys3U/HPQ/DX4yJ4M
	MMX4/iUODZdBPjrHij6csPYezziMXoIs7/VLcNJ7mqRy4hZ0xELjc2d9n97830eRdr/t
	4hNEkQKYztfDbQkPs6Q+iU4/B92g6QlrXq+z0g436vMQOW1mpKa6faiLdSDhqBPKPyAg
	XnEaCT+h8LNnmPkjdWsffYgZgHCgTfMxErPm8nenU+ZgM05noGjiA6anZqXB6m3kaMtv
	Y1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HTHbDzzy0rb06iguUuhRbeS8aB/cY8VVuel7DmqRskQ=;
	b=Sj5JpcCEgFWM1Lt3hBW6pygkVUYJEcpGsvhKt3HE52YDm+QQKgoDlaCXZuE9xlLyve
	cBZsXCOMwSBgsLa4CeayETSl4wmBmUx6b5Unx5iCxifalaM14Kp5zeUObqcAQ+kpzLmi
	+Yi89GUzs9Y40IMkHeGhGBOXBKOGebLZmILAcG7cHQwFxpCiGGUtnrrMfBOYHZwQWCg4
	PoSU3MQYroSUO9Gy39zHMbisTPD0vNh33w6sLyz5I6ZM66J+CYS/JVmBtO70W4ngOx+y
	3TbekQ1qFjoL6gg18J5AIW05ezY75blu72l4ZCi5fJMO7brR2UV1+uzflqDWpHGQKRM4
	lVMA==
X-Gm-Message-State: AElRT7H6JHmUJawY5LWU4JAmchM/1xy8GXDb3Yqrfi4l1E1okaEOM04X
	/zkrZhl65qp1xnBykgUWcck+Gg==
X-Google-Smtp-Source: AG47ELvZFHj9B57IPZb9cJMTrpemX2XTgvV7Wc0EaNCmjY0R0fRb6vXWJ92QDFh1cJln4/eCV9pwJQ==
X-Received: by 2002:a17:902:4545:: with SMTP id
	m63-v6mr7016355pld.15.1520829662527; 
	Sun, 11 Mar 2018 21:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y1sm964765pgs.80.2018.03.11.21.41.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 21:41:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 21:40:52 -0700
Message-Id: <33c4f25d4a520a608b853bf923babc4fe7399f93.1520829505.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520829505.git.raj.khem@gmail.com>
References: <cover.1520829505.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] libtirpc: Extend to native and nativesdk recipes
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
X-List-Received-Date: Mon, 12 Mar 2018 04:41:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
index 1a73de9db0..99212600e0 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
@@ -29,3 +29,5 @@ EXTRA_OECONF = "--disable-gssapi"
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


