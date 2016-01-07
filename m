Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 47FBE6FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:53:25 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id xn1so63217614obc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gGBJUDOg6FTwWyX9fBWgBRSubGqC/aLAc3S9fCj4lrY=;
	b=EX0ErXHpfv1V64vnsLP3XT3Z7difzefH/9VY3+q3QKPcgentliHyXjIdnvvGwDXDWQ
	dHKgTLZJqFTVcZiQaLppihn425dVcCXqu6WrCyS2jjmv/XeeQVyTiywB+EV+ndo5HxaB
	H796n74Vvb0+pAjYiULunAm0nwGSYvWOvMS6YR0WxV7fMTLYTE/zO4NyuSdBoXUfvqCL
	fLCzs0U3Cp5GG5E1l96sE6Dj7ILfZv+MH4SirhQl/UwW/UlVa11GyWPte8A8nASn+Sv5
	AU6mlv/9V8ZJ0YE77w2ntMwWW8zUIJyipf4V5+jjScnEj7fNPdloJ539gU+9/Bzg9Ko5
	ZmNQ==
X-Received: by 10.182.40.167 with SMTP id y7mr76782364obk.10.1452200006670;
	Thu, 07 Jan 2016 12:53:26 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	mm4sm42079156obb.1.2016.01.07.12.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 12:53:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:53:11 -0800
Message-Id: <1452199993-3885-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 20:53:26 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 45b3f15..84e971a 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -74,6 +74,7 @@ EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
 EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
 EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
 
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
-- 
1.9.1


