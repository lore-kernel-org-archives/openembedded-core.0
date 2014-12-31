Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B75FE610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 04:12:29 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so20334519pac.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 20:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=laGDjalaImlP/MJeAq+1m2kz9bAzdfgmnFe82PNmkWo=;
	b=0AmWcE7tlph3YxUUeA8eybkEJnTMwwKdZNwZmg44lJuxk/uOgp82sDP9x3//XmNTeL
	6Em8wi64hiGeKak7lpzw0Eo1+NkaU8IyJnMYom1qAMs6z47cZ3kn9YqoIjY5iYEa1pZR
	ZnG4Yrdkc6qXTSjZ9h6QjQp00N6j0O3qawQQhsfylvf2AaYUTBJrbxJNhDhdhBsj+tr+
	woq3CWq6EfkDBovupKvt42MdI+ROPMSkchmwJj0mbY79rZHpVYG0Ir8po9xCNBh888H5
	PLEsL2lOjBLtmpgjwG+uFrdFkBrHnGOMRGpsai5RrcgZz1wKAEX5QUu0lMjbbiQ1cqJl
	2SNg==
X-Received: by 10.66.162.162 with SMTP id yb2mr44470918pab.46.1419999149881;
	Tue, 30 Dec 2014 20:12:29 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id t4sm18909122pdh.9.2014.12.30.20.12.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Dec 2014 20:12:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 20:12:23 -0800
Message-Id: <1419999144-6278-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] mmc-utils: update to latest git version
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
X-List-Received-Date: Wed, 31 Dec 2014 04:12:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index d88520c..c54e351 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
 
 BRANCH ?= "master"
-SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
+SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
 
 PV = "0.1"
 
-- 
1.9.1


