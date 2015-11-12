Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id BFF1F7729C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:09 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so79752796pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ikN23Bfsk341di5ePQfSQVmHtq+bmhjwVhb5xtFX14I=;
	b=rXrQhijZM4img1RCp/z594Hq8g+fwlbfJTg5T0UrUK7jF1c3xGWHBq/La7Z6QuWZfq
	Fi7EsN+FAUuA3vC8f52bomITfA4EuuegeLAPDLcMqM3e/ZvVNjGPaTKycpbIfD/zFb40
	zUDFXfv5E/CxOI7wfGB7ELqg3Bexm3081Mxj9adnLctlKNtEEvPQ/3SEDnY0MQ8dFqCP
	iG4duToDQBH8AuaFAGXzQyowEe+eEa96VuFNyDDaQUxvxmW2GZ/h6mBvocAXXAh0PjSu
	FZlc6tjr+fHo1qnUjSib8POCmdFjFdGasYL/Onv7XatJfji9juX/tIWEoKDjGTTb9buv
	QPqg==
X-Received: by 10.66.156.106 with SMTP id wd10mr26648409pab.150.1447371609918; 
	Thu, 12 Nov 2015 15:40:09 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:08 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:20 -0700
Message-Id: <45e3f6a8077682bdcc1f70c68acbbe9b7971e551.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 09/11] connman: depend on readline
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

When the client is enabled, which we do by default, readline is required.
Currently it gets pulled in by other dependencies of connman, indirectly,
but we should be explicit rather than relying on this.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afdb3f2..6324d7a 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d bluetooth
 
-DEPENDS  = "dbus glib-2.0 ppp iptables"
+DEPENDS  = "dbus glib-2.0 ppp iptables readline"
 
 INC_PR = "r20"
 
-- 
2.2.1


