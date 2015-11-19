Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 41CFD607AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:07 +0000 (UTC)
Received: by qkas77 with SMTP id s77so27965501qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tpok9v1LBCnqNrQV8gBCcFVsS/zuBLU5akAGDhVAq5Y=;
	b=kw/ZqDgOl5ibm7vQIqHbsNbatUanCECZHtuI0oH/gIHafnf9NNlslKR9R0K84IhTtM
	FM4k1J6JIlb353cstsdyFfNudxpSLtkfDb/+EWsItpIzWvFl7MIhoxl/mvLXmqoR5fix
	WhHYavYWzkeTr0NLSpZwbmOESFtlgmJPPg53ceBxfXHe+V5eT29jGFX1trS9LJ4UIff4
	gxBV2eznDwls+8pPHtF+zWQ/GNENRQd0P26PqrsiO2MV70+8gb7LuIpybBDq2a67kNuU
	ssRjPQ1FT80fbPZ+5y8UX/ZL/0ae/0VTcWWlA1TFUwlGrXm4/rVO8XnZ5bxqkfV1Tlp4
	x6/g==
X-Received: by 10.55.76.8 with SMTP id z8mr8211909qka.30.1447953068441;
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:53 +0000
Message-Id: <b493f705bf3a1ea2314b0f1132f6de00f3686a3c.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:09 -0000

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


