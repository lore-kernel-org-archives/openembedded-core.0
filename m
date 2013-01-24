Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGc-0000rW-2d
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so4441275dak.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=P3JYyCwm3r830CMyehk2UVj9k5TXqKzeQgZ93pLr4/I=;
	b=fP3JjeV6JVCCXIm2EO6fkQmIWpV14985wkXNWPtTrq6DcbmA0UdYyo6CzVd9XhU+n9
	bPh+KCOyAblM2LDM4krtOxUP2d60zgE7GffTXdtvbhBxor1ZUVTK2UrgSGDLkZIiJ9Ef
	kGDqS+aV7kWILnZ7APfWa4rFpvsRXr1WgGE/29Gu/nmIBDFrkq3mLJVtO5p4l36FHSir
	jpfB2t4S8FIgorZ9ngBjmILON3yKmZR4IoouYLwlHvJqnEXtcYN81P1nvK+TIAom9dgs
	Qiq+/NS8/ZskK0Jq7p1pNMQih12W2pa1vqEKVxkIwg7yRmNwIre3/zXuzSkxpQr4GLgY
	S8Aw==
X-Received: by 10.68.253.161 with SMTP id ab1mr8501716pbd.97.1359061672108;
	Thu, 24 Jan 2013 13:07:52 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.50
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:26 -0800
Message-Id: <cdf92cb9e255068b826271cb9dbf0075fb7dea15.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 05/11] quota: inherit gettext
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

Othereise it does not honor USE_NLS variable
and does not have proper dependencies. Which leads
to compile errors like missing liintl.h on uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/quota/quota_4.01.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index e2b7ad7..1cb6650 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/quota-tools"
 
 DEPENDS = "gettext-native"
 
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OEMAKE += 'STRIP=""'
 
-- 
1.7.9.5



