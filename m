Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f43.google.com (unknown [209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id B24E365F09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 04:45:52 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz1so1006461pad.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 21:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Yy9hQq4BLsnrSnEM2xAM/l1bcEOn+pYc9JkLMORXBE=;
	b=sVvthEw9DjiAv1HoEh+B1kAwa65LoYXCgdr+7PJGUmsGOXK+sZgqTx/5vE7VEITX1U
	FtAKcYPPurPq9N5WZtcC7n19sqwothCRSApETtMYtpTREJQAk+YQvZ+44gjodrVX0h1G
	rXt0L4e7f1K8axD0ZnoXVQly43N2vMIaVcWqR6nPsM/VWn/34EQG0GUhU2HuLBcmbG5U
	mCGnP3kFXfew/aLVqqv3xYh7DbUA0MB31DbpdShAET12gMoyn7t4b6wf748JKHUdmp0x
	ph+ts401fI+xIPYboL5CyTJjrEKxF7L3RzgGT+0Z9kej3PfIwUpD58vcS/CdbVv9tCWv
	hHvQ==
X-Received: by 10.68.234.2 with SMTP id ua2mr55536587pbc.81.1400647553054;
	Tue, 20 May 2014 21:45:53 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ck10sm99308401pac.0.2014.05.20.21.45.51 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 20 May 2014 21:45:52 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2014 21:47:28 -0700
Message-Id: <1400647649-27570-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400647649-27570-1-git-send-email-ticotimo@gmail.com>
References: <1400647649-27570-1-git-send-email-ticotimo@gmail.com>
Subject: [PATCH 1/2] mirrors.bbclass: add ${CPAN_MIRROR} option
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
X-List-Received-Date: Wed, 21 May 2014 04:45:55 -0000

From: Tim Orling <TicoTimo@gmail.com>

* Perl modules fail to fetch because default CPAN site has been flaky lately.
* Create option to use metacpan.org as a mirror.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/classes/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 90fb1e0..0d9b517 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -67,4 +67,6 @@ p4://.*/.*      http://sources.openembedded.org/ \n \
 osc://.*/.*     http://sources.openembedded.org/ \n \
 https?$://.*/.* http://sources.openembedded.org/ \n \
 ftp://.*/.*     http://sources.openembedded.org/ \n \
+${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
+${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 "
-- 
1.8.3.2


