Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 300596FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:41 +0000 (UTC)
Received: by qgea14 with SMTP id a14so10016923qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tpok9v1LBCnqNrQV8gBCcFVsS/zuBLU5akAGDhVAq5Y=;
	b=ZqVRRHLKzNPqlh6UgNyRRIPK4T+g4k8AC7NdsBjv+u4CkN9J7f5NewSjgfvjf9brwD
	OZsYY8FPl63awEkc7fCo96OlAsY/nEyzFJBir2Ot4fRA7hjOSN1eDimt74aclau+RNrZ
	tnbjUgIj8RWBP7QcE0k0VatiY2kZwi+YWGpOlww6+zsQzkNPieFdpKeDILH6ryfJLsH9
	dO6Ed1aUBLXZyYNGJObiGgcAWgkQwVohwgYurcn91aQRD42gFwAZxO5mYtahturuXSA+
	NmeQhN3CcawDhAC5ogQw3810uC3s7gnwDhNr3CDC59nkDbiWy5VCVYHxqm6ioVUYBYLm
	TxJQ==
X-Received: by 10.140.20.144 with SMTP id 16mr2809325qgj.45.1449562362734;
	Tue, 08 Dec 2015 00:12:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:26 +0000
Message-Id: <8c749dc7ab6d9aac5af4d72dea0cde06ac741c3f.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 06/13] mtools: Use proper glibc override to add glibc packages to recommendations
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:42 -0000

Helps building mtools on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 24c9d49..bc9b79c 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -6,8 +6,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 
-RDEPENDS_${PN} = "glibc-gconv-ibm850"
-RRECOMMENDS_${PN} = "\
+RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"
+RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm437 \
 	glibc-gconv-ibm737 \
 	glibc-gconv-ibm775 \
-- 
2.6.3


