Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4A972392
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:37:57 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so8443606ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pBlhlPfh8wvorDp4lGidvLN0qeV/CMXkQZodS4SLVqI=;
	b=CpqxeNrZySRcz+4aWOp/4N34jPv4CLuDXStp+21AWAlqvv4/Y10XCqeI5GpDPgv6up
	ikBynkHLKT90bTTxpiUcF4V3dIADsXtYAmrgeW8wbapojQv07jamdmegmT3/Vlzo2fFK
	bMFdTgwa8U/z2TUyoRVbB0zvmGAb+pTrqzCkTRivUOAz8l2bv0APWshWHbPF6JwLxJFS
	81YclOWeKWl279eVb4cqL7X9qwyo86cMnq8dGCHLOxT0+mQmaFx84RBmdDK90CyUZZ9p
	sSVjLnZ6/81987s9xD6XEBSoAgrjZ/HIvC3K8wnL1US9SLsYau5aE5iwGtTwPsKjyBwH
	ldtw==
X-Gm-Message-State: ALoCoQmwGsrHjKJ3Hb2mDqbyRj9TZcXKCwlEaAjWUwxmQidlZQMNa/9CZ932QglhV6HZleqqIiJm
X-Received: by 10.107.137.92 with SMTP id l89mr21330344iod.22.1418499478459;
	Sat, 13 Dec 2014 11:37:58 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id q7sm2508842igx.9.2014.12.13.11.37.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Dec 2014 11:37:58 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 13:37:45 -0600
Message-Id: <1418499465-1801-2-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 2.1.2.374.g63a4513
In-Reply-To: <1418499465-1801-1-git-send-email-mgloff@emacinc.com>
References: <1418499465-1801-1-git-send-email-mgloff@emacinc.com>
Subject: [PATCH 2/2] volatiles: Link /media to /run/media
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
X-List-Received-Date: Sat, 13 Dec 2014 19:38:00 -0000

Since the change in automout.sh to mount devices to /run/media,
we create the /run/media directory on startup and link /media to it.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 1fc5816..e6f0695 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
-l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 f root root 0644 /var/run/resolv.conf none
+l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 d root root 1777 /run/media none
 l root root 1777 /media /run/media
-- 
2.1.2.374.g63a4513


