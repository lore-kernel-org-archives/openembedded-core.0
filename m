Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 787D165CCC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:44 +0000 (UTC)
Received: by igh16 with SMTP id 16so35606428igh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m4gzksnOj4R7BIj677oTG47kV2vukUelg3AzVcR5Sf4=;
	b=qLEwci4Z9QAFHVu50m5rqCr0ZvFr8WzbfaW/zqhS+hktPXlgGkchc+IcphhblHxw0q
	QjgHK733MCBDErM/TN/UYTBRee4wJ7TChy1kpgA742eQlG3umRrgoweaxvIJG0SyBvch
	cxXkQFbz6ds89g2+1mrEPoME4rFHpq/KvK8FWY4RyscukTxff//UKc18sfLGkgKMc22H
	JqjzyZjMdzBt74ooQmJvX2wLyegyW1ta8/R390BDHmHsVpYn+sR+1np+OuFXLKNBbMS/
	OzE+b95ysOafPUANfbFCYlVG0WVjdtFeNfkgR2A10et0LRcA9q6tOAKWn4mnGTqxXx/d
	FVYw==
X-Received: by 10.50.225.35 with SMTP id rh3mr70368524igc.29.1436215845372;
	Mon, 06 Jul 2015 13:50:45 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:00 -0700
Message-Id: <1436215810-23722-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 03/13] base-passwd: fix typo in add_shutdown.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:47 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch b/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
index eb75559..5f357d8 100644
--- a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
@@ -3,7 +3,7 @@ We need to have a shutdown group to allow the shutdown icon
 to work correctly. Any users that want to use shutdown like
 the xuser should be added to this group.
 
-Upstream-Status: Inapporpriate [Embedded]
+Upstream-Status: Inappropriate [Embedded]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Index: base-passwd-3.5.26/group.master
-- 
1.9.1


