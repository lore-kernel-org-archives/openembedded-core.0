Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD49D6AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:43 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so121553930iec.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KAFMvni86HKMOVgw8DKsmC/UcSb2xNMikiefX+4e3Ug=;
	b=JCgFRgcghm0DkE9GJxZKGMhrHieBwOvy0h2JaEQe5xTiDNFevYaUS1+9WyWlCcW1se
	Jnt5IOihgxRisE0+10xEOD/eoZNAKgep5voij2TJ53Is082dKmXYt9wjV6hR8BH5rhO/
	F1lFlCwoOGlR9zpDcJP8EapRUHzIUJo3RmaAUM2KCeUPVFP2Incz44xFdWOnJbFhNDxT
	9MTgSVYn2EmRaU4YahAyEGJs5URBSmAMS4OsVtvaDTZ9Qb/jpKwQFwQQVLDMcqOMFxlp
	eMtcM/povcbp7wChf1G+X9stIzT20uOYomcShKlnnCZ463fIyKNwgLDPO3NwvvrnvoYO
	7pug==
X-Received: by 10.50.79.196 with SMTP id l4mr73278742igx.48.1436215843703;
	Mon, 06 Jul 2015 13:50:43 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:49:59 -0700
Message-Id: <1436215810-23722-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/13] dpkg: fix typo in tar-error-code.patch, Upsteam -> Upstream
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:45 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
index 7be2090..dcde508 100644
--- a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
@@ -13,7 +13,7 @@ in other error cases. We tweak dpkg-deb here so that it ignores an exit
 code of 1 from tar. The files don't really change (and we have locking in
 place to avoid that kind of issue).
 
-Upsteam-Status: Inappropriate
+Upstream-Status: Inappropriate
 RP 2015/3/27
 
 Index: dpkg-1.17.21/dpkg-deb/build.c
-- 
1.9.1


