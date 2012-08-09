Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzHgf-0007hX-MY
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 03:37:21 +0200
Received: by pbcwy7 with SMTP id wy7so14357pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Vu/AGtcEaS/xNUVJhQZXokHtigqZEMdUTmgl3nFyD4E=;
	b=n3LOL0cL8lY39ZOHM4qWSsZCf1RWu7Id6oxJKv+5/LjLqO1M8h5soHtSyDLLI101Gb
	6hMY48jPaqejeTCL9aBkHVcixDQ2X1KkjQd4cCSubVYKcbFBkBSktP9zw8FlhxcW0FaZ
	hMEdynDBVMvmyXq9omWYWydTjPYRdMRc/DICtOWmLa68EXQ6cCKZCppR7b+pOVa/lxM+
	xwTcnYwcy2RPRHVYP+19W4eg1O34i9vTJ5V56sGzf/Sw7faIszAprLY23RFw1Lme8eUU
	0wNB02zolcBoL5LIFw6hnazhS5X3hnle2C/xliR6ahD1FkctSQJmaXTAwaR2xK5j/TD1
	ygxQ==
Received: by 10.68.239.164 with SMTP id vt4mr3776011pbc.118.1344475533247;
	Wed, 08 Aug 2012 18:25:33 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rd7sm5428pbc.70.2012.08.08.18.25.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 18:25:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2012 18:25:16 -0700
Message-Id: <1344475516-27640-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 02/12] eglibc-2.16: Update to top of 2.16 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 01:37:21 -0000

Some translations and tst-gettext fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index b053a5b..2fb9f5b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "19383"
+SRCREV = "19922"
 
 DEPENDS += "gperf-native"
 PR = "r5"
-- 
1.7.9.5



