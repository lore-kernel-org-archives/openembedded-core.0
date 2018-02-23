Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id A34126011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 15:12:09 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s13so5048578plq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=86XczCYxU/kaLPJKI0uTYqrA/xz1QLdp2bzVP3ihpaY=;
	b=hNodrp2LcXNYYgbG+GXnZd1c6BaTWOAfn0QelzmkaDn4ALk/AzFFfhB4iswMLhVUeC
	MZOIRMck5p5jJ1jRnv+Cben65jV8MCHQENK2CM03okn+PvgvL+/XXMMaql+Oj362LHJC
	d6gTvnLvdimdkgnLZVZMiy2d2ZST1elvM8eksM0uFmfzHinUnCONeyUqj4hGDcNsWtMe
	4s7/tHOK4gwj2VSZMyAKhDdcWNymKOQcz1Thw88KR44XvIFfgiw1XZYpX2oRrkyNk4eY
	MfrdZAQQvjy5efEKGaMJr6BU3hvc5+atQkuxuDhdqvVP9KBA1hwWL7SaU14sWLyTZGrG
	uAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=86XczCYxU/kaLPJKI0uTYqrA/xz1QLdp2bzVP3ihpaY=;
	b=lwmDBuI9szqf5JjonTk3XFY0Sldnlj1NkObYdK2+HEcksIsZlSj6FiCG4+yfpKjFDH
	k6ACMycgBXic7x5v5jMf2uHqPPI8Ed8Pej/ac513vs8PFzPnaeVqi246iQxKE35Vuxj6
	8/HOaIN3mjvJHo0tu/1aQHZfWrog7IzcetEpRbxHLRKsU08HumoW4cldyJR39/mnQGKe
	GCkwGkuxvb3OIKZYiMRS4BTOKBpRn+rbk/UTN5ffZHwAZgZsVkPxtt39PDVsi/o9XewD
	g8e/M48lhY6DkFIDtWu3q2Bx122WBPHzEmsW20R/ZuqLsPLwRajJHfhF5Ty6hA6ntpGa
	eiyQ==
X-Gm-Message-State: APf1xPBGKlgSgBZa47s47ezFR7ZiRZc6lsXRfB5gK9cgULb0NZIj0PKz
	P5bwUQvEnmRQWNzCJrMhgXGyWg==
X-Google-Smtp-Source: AH8x225iJTunM5gHivqCH8F5AebwDXKb/XFY3nJM25jcj9a+tEWdJa2ysWdT83POqUYNNQSs4gZGNA==
X-Received: by 2002:a17:902:d806:: with SMTP id
	a6-v6mr2020046plz.274.1519398731354; 
	Fri, 23 Feb 2018 07:12:11 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	80sm6116933pfn.114.2018.02.23.07.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 07:12:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 07:11:59 -0800
Message-Id: <20180223151159.11743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] musl: Upgrade to 1.1.19 release point
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
X-List-Received-Date: Fri, 23 Feb 2018 15:12:10 -0000

Changes from the current commit

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=628cf979b249fa76a80962e2eefe05073216a4db..55df09bfccbfe21fc9dd7d8f94550c0ff25ace04

Summary of this release
http://www.openwall.com/lists/musl/2018/02/22/2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8b2cb4d49d..8906ac6beb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "628cf979b249fa76a80962e2eefe05073216a4db"
+SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
 
-PV = "1.1.18+git${SRCPV}"
+PV = "1.1.19+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.16.2


