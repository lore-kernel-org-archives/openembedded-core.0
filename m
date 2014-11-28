Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C4EF3722F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 21:31:14 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so1461414wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 13:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Mfd5u8A6bm54w8HR8h4agKZ92vNGSV7z0UUEhUrCaWs=;
	b=E3kKvQHxnSHob0kVm294zPZihvwHlq7cUSSCwOmk7oovsoFq8rxEzzcSrQiUGTid+a
	nNM3UH1tEoU76kDLX4zwi39evmeLOb5VjRS1CNlWvtnee0ynjlHZcioin6JXzghus/ld
	HNuBRriPCwHGnYRXR39FlLEIAYBQcB8hdyF7bruE9aNIZzVcHxQOE2eJYT7LTVqi7PIV
	cXKVdnEObSHRclQnRKTAJ/bjyISmqRG6y/Iiw1CCjJVHuz2NvyFzGxU3o0yPHCkpUb8z
	IBp+/DchcVZ+x0jywALOxEPL0fvbuK1eYYR7Cl8Sq1fEewi/Jv1UJm0I0vP6InfQUKS4
	Kd1w==
X-Gm-Message-State: ALoCoQkY8Z4SwXvShSu3mlF2N1jyZdNHFAHoo/mWuBfhAeB6IdIZQ55rNV4E0LSqdByhelmRR6gb
X-Received: by 10.194.185.68 with SMTP id fa4mr70849140wjc.83.1417210274731;
	Fri, 28 Nov 2014 13:31:14 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	mw7sm17475245wib.14.2014.11.28.13.31.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 13:31:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Nov 2014 21:30:52 +0000
Message-Id: <1417210252-17618-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] attr: use EXTRA_AUTORECONF to disable autoheader
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
X-List-Received-Date: Fri, 28 Nov 2014 21:31:20 -0000

Disable autoheader by setting EXTRA_AUTORECONF to --exclude=autoheader instead
of setting AUTOHEADER to true.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 72f623e..b17e9b1 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -7,7 +7,7 @@ inherit autotools-brokensep gettext
 
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
-export AUTOHEADER = "true"
+EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
 EXTRA_OECONF_append_class-native = " --enable-gettext=no"
 
-- 
1.7.10.4


