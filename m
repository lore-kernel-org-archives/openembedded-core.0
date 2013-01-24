Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGe-0000rZ-8l
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so5770153pad.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Mv8DI3A5uCy9MDeEkX5cxIa6a+yzX0xk5u3XXV94jFI=;
	b=BTRn08EjgRzDytTATLtFrb6HkBSWu+O8Ok581VdI9Pt5ls/x3KhbZE3Ky6LE4CTeo5
	LU7RXAna0VYkJu3gn4gREG2iLVpiJ00cqG2kmk+iIcyuYO4Qla+6WtLysQxbjUmOmimu
	pGDkmdbYyeG5XmwkQ0M1sFobkB3wej+PoFq3WBBuEEC9liACG/cIWSd4is71gRU41uGb
	pzzhom608eHsgGzKdw89LrvI+4r7S9bbB+fc0dzGL7GIbZ+1UBTBAf1rwovc4s6v9NI1
	WdqxyqUoabl0AjekhD0A4wJ1U0f1sB9Iiu1fkG9FPOYSq4g3MMzeB1RW+QRsGzo9pjn2
	PckQ==
X-Received: by 10.68.241.103 with SMTP id wh7mr8478913pbc.153.1359061674412;
	Thu, 24 Jan 2013 13:07:54 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.53
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:28 -0800
Message-Id: <ece28b006953233d51f2526fc91d960ae94bdab0.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 07/11] uclibc-git/uClibc.distro: Enable UCLIBC_HAS_REENTRANT_RPC
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

The renterant functions are needed by quota

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index c33bf8e..5affb5a 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -54,7 +54,7 @@ UCLIBC_GRP_BUFFER_SIZE=256
 UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
-# UCLIBC_HAS_REENTRANT_RPC is not set
+UCLIBC_HAS_REENTRANT_RPC=y
 UCLIBC_USE_NETLINK=y
 UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 
-- 
1.7.9.5



