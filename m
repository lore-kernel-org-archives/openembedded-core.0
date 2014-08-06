Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8E6708A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:46:32 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so3385820pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NNWsjqEVpN01eXPUrw0TsPNdqP6CPTgWRySXMvlJ66k=;
	b=hIySsi1pKQlO9PowaDJwATybmFzyBWGKYq2EjE9u3BF+dbSWOzObUKjNAKTHDeq7Jr
	JiW1AOds7p84uibbPvTDGGGcWyabsgCnedBcaLWo+NUz9kyzcnhp5aWEE4om8yuax0XM
	v6hcn7daEsA7SlXzxyW5p9Qzr5ypVy1F4UASf2eg1r9srbWbFwzDwcqSU1SsouonMSWW
	FKqLYw/bSQCV4zRUSHpqWrszNrvz5Lne+lRe2Dl86xUKWCstJp6Zdyq/MGUZTKsV6dCX
	un9o5mcxvudojw8yZ0jHqkIC2bSvHi78aFJf9yhsAzZHHqGv0IC5UVDC3Ju5GXyknKQI
	LuHA==
X-Gm-Message-State: ALoCoQnlttjNIOR3foYRk002EQSu1pgv3N3UcUGGKJT3GV3aMeU+ufqzRdwNdWEaG2J8WmO+3xiV
X-Received: by 10.68.247.72 with SMTP id yc8mr8602866pbc.114.1407336394310;
	Wed, 06 Aug 2014 07:46:34 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id r3sm2111005pdd.8.2014.08.06.07.46.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Aug 2014 07:46:33 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 07:46:31 -0700
Message-Id: <1407336391-21898-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lz4: update to 120
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
X-List-Received-Date: Wed, 06 Aug 2014 14:46:34 -0000

Update package to version 120
Add Makefile to LIC_FILES_CHKSUM check as it changes with every rev.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/lz4_svn.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index 44160f4..adbe098 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -2,10 +2,11 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd \
+                    file://Makefile;md5=ca9db31c873dc45240e2792a866ab0b5"
 
 # Upstream names releases after SVN revs
-SRCREV = "119"
+SRCREV = "120"
 PV = "r${SRCREV}"
 
 SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-- 
1.9.1


