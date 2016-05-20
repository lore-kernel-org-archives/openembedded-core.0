Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D63586FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:09:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so27853186wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lYjT4zzXO4sWqiL7Pvw/0o7UPPrIbeyoBqiKsyE9zD8=;
	b=wGtQlXKTrdHX9lP1Sy3O1E8MPDVEMrubAL7eFMBzu619KtQxh/YQMqLidqpA5fvlzz
	3NmF7SM/mNKgX3L/mpd1RdjzniRDzr3DBRB3VRyBJ6POUZTf80mheqLJabYA0fOAgWAC
	ZaG5JkLUWRBKkjry41mY/cLHg6BGhW74yHOPFGmtbxnufOJX7lj27zL0fIfWuKDxrO5C
	xOGPJ9kSE985a9sUJqIxML7iWT2gd77Dcqet8Y4BHciB+LmYRxqwiJhIFeORiXJo80wb
	JDomPthaFAPZCFstxM25ZVoQPA1EaARTyRnYBoJVt5lpwzXql8/2Wbdg4Z0RswGLM6SK
	g80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lYjT4zzXO4sWqiL7Pvw/0o7UPPrIbeyoBqiKsyE9zD8=;
	b=NbrPB4agMTlLWGSSXhdeWtFolqOlo/T2WT2ue7vJtIMtVCOQRoDE+0T6z6HYbbU7WM
	gZLAJIBZ9mipbZURBuBsgDj1mXvWHCZKfZcdWHAtgEzRQoCZfTmxbklbDv+VDnJqvf3s
	2wV8N7hYevTgYud8uHsWeNnH03nmYufzu9G+MrXfODHfxQfyn98DRu0Mq+9H8J2MmzMU
	Yi8H6J8Utd1bUNInZgwbT1ozHnJI4cnYCZB9M8Am5C0JcN16/txxfmdH2T79aQtCoQr1
	rasX3uLE8kAMrVrmu8+bv5ZMA/yZTw2WJx9Yko2wEKCpayzQszFiN6TDvFdmVKVETvwm
	/pjA==
X-Gm-Message-State: AOPr4FUKxkwupiplppeP871+FmYCwMmy26tYMYyx4J90YjaRIeSm02i3olLzojN8BGBzVA==
X-Received: by 10.28.146.70 with SMTP id u67mr2845393wmd.36.1463738954763;
	Fri, 20 May 2016 03:09:14 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id c85sm7555669wmd.0.2016.05.20.03.09.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 03:09:13 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 11:13:12 +0100
Message-Id: <1463739192-30404-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463739192-30404-1-git-send-email-eu@felipetonello.com>
References: <1463739192-30404-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 2/2] rsync: Added native package
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
X-List-Received-Date: Fri, 20 May 2016 10:09:15 -0000

This is useful when recipes require rsync native tool to copy files
locally and through the network.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-devtools/rsync/rsync.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index c65f270312c9..1219dd3be9b6 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -21,3 +21,5 @@ do_install_append() {
 }
 
 EXTRA_OEMAKE='STRIP=""'
+
+BBCLASSEXTEND = "native"
-- 
2.8.2


