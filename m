Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id AD45E76AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 06:02:02 +0000 (UTC)
Received: by obbwb3 with SMTP id wb3so33058174obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 23:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k2rIfYeR005TltkosW5kYJ5Hcr192c1KYifS0GWlZp4=;
	b=WrEf0ifjxode98xHze7d28dEQGAtLV0RmR7ICenRESDbI2lQTCWA/YVOeZudc6DmUF
	5bNkLBRKP8QLk4S+MhvICQ53gVDTIg7z8oGA9aHTilcsL2o6/Su+iZ6YFt0X6yFWSiib
	7tYPBqAORVU4pTrAiIlqODG82ZcSDboyuXdqeSt4hHy3SzPfpWownKWsWbL0utUxRNkL
	NTX3qyDsSyTROVgbT08f5D2atqz56K7rMnJlXj6r4HymxBkDVwA2tkwnMYUuXt3v/y5Z
	mezeGB313THCPEr6PPKlsS1UWqJ5ukCLhf4LWcTuDCiBdr6a33gZaaetJ/q7wnN5FJUb
	MjLg==
X-Received: by 10.182.29.72 with SMTP id i8mr4743899obh.67.1445407322190;
	Tue, 20 Oct 2015 23:02:02 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id k3sm2934948oes.13.2015.10.20.23.02.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 23:02:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 23:01:56 -0700
Message-Id: <1445407316-11368-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] image-mklibs.bbclass: update i586 TARGET_ARCH test to i*86
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
X-List-Received-Date: Wed, 21 Oct 2015 06:02:03 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/image-mklibs.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index c455a8e..cfb3ffc 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -25,7 +25,7 @@ mklibs_optimize_image_doit() {
 		x86_64)
 			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
 			;;
-		i586 )
+		i*86 )
 			dynamic_loader="${base_libdir}/ld-linux.so.2"
 			;;
 		arm )
-- 
1.9.1


