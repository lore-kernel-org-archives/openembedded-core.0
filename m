Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id C5787607E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:13:55 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id e1-v6so4038629pga.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vvfhpqmtNFV8Oc46yKUWxrwiGGi8UAWRbY4h/+ABS9I=;
	b=PZH667qEjlOOAZNfncJ+WqH5tEqM7WC1loCYkSsHtLLcYoeXCwoq098m/uPYkHraye
	k//sLcJFgbBrSbjTD/6UmlVbsyqR+l3MO3jmCH7RzRTyOkAWMIHx7ZJCQrFHtSLOiMwQ
	KqxQSqc5XufiP9chdM7gMJR3N5CjwApOlHbN+WOe31LkQB3ZHL9VdLOFLrED9XjuiwOi
	Wy71u1f2PvY0rvzEG0pky6MgfwY2uJfhSaraQp8AswJYhHec/Iezn6Y+2pEKwQVzWkll
	AY7MjAtbF9QKiskxHVqTUfzXEr1HfNf4KgKU58ilvO0YlPMtpJzwjamDvx3u5c5b5BqS
	YLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vvfhpqmtNFV8Oc46yKUWxrwiGGi8UAWRbY4h/+ABS9I=;
	b=XGHLM/6zcE9lSHKzrA0A2v8qnHpjPfWmUlTYSC/bsyOjt6RVyyaqRmHOEdCBxsD4DP
	Qin57ZuyPEJ+a1aHufVBh1N1NvoyZEG84xKj8NMl1JGFj5MzN8YlAHEI92cvZl+Ypbib
	PjqXdy3bQBqMiqb/X0qprNOxLnBKiHyimU1rSwAu4DdTGGU6df5GiJ7pplEy4TX4TvoO
	nIwBVwLstXhiT1E/gStzhWSdFgAZ7qz1gA909s/ym9fht+R4mjw+jdlnyMcfYnmGuWkV
	Dp1Lus+ytwfbUnf0BCJ6qegRXj0PQLjrlkkgxMJFqgmpwD0ByruLyPjWjFYb4chkO//X
	uMiQ==
X-Gm-Message-State: ALKqPwchbbuywPPxCWPh15napQLgfm1GwDdCAugR8/Tz0Q9MipIk5rVl
	0BtWwP1070c1xZvzcTt8vSo=
X-Google-Smtp-Source: AB8JxZp8BEuCAVzYDKOpcAtzAmM+29ED+Ol1htW4oR24c1OTrnmGj/P2gyqeNr96hOEudYjOU7hIqg==
X-Received: by 2002:a62:1fc8:: with SMTP id
	l69-v6mr11699681pfj.49.1526696036295; 
	Fri, 18 May 2018 19:13:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.13.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:13:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:47 -0700
Message-Id: <1526696034-3857-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/8] openssh: upgrade 7.6p1 -> 7.7p1
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
X-List-Received-Date: Sat, 19 May 2018 02:13:55 -0000

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssh/{openssh_7.6p1.bb => openssh_7.7p1.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.6p1.bb => openssh_7.7p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_7.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index e11e8d7..691dec6 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "06a88699018e5fef13d4655abfed1f63"
-SRC_URI[sha256sum] = "a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723"
+SRC_URI[md5sum] = "68ba883aff6958297432e5877e9a0fe2"
+SRC_URI[sha256sum] = "d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.7.4


