Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 040C777002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 04:33:58 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so42417546pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lOw8+rPoOt8akZ+V4B18UXRI5gR40PINRrdl086wg/0=;
	b=LoQDlJ8RMseOKQSVZETNQr3avo4t2M2BP3OaVyOEmpzuoTLVrzv8iUnj+J5C3zQ7Yx
	437PQgBF3HNxe8MSby4lN1PScdY5/CMegfW7IbX/vZB4gbPpv9p3LSj9xN3VkpDUPCl0
	8X1xZEksqPGwW27pYNqQr+M6hUnaaU8646Xp0AVlIywpNZDqn5JxIHdxNfAZv8mkYkye
	wsC05dqZY/Is5nPrkRNIQIo9ujGR/MSOSSHKIlWnj741MpD3UFWQsUernBmv6B9m/GbE
	expOA0+Q5IrNqNENVkMnYwHtocf47VBMunABka8oqBY1L42cAVOzfm1yC1H8BnYqCnlo
	Fuqw==
X-Received: by 10.66.235.194 with SMTP id uo2mr8089760pac.41.1445402039282;
	Tue, 20 Oct 2015 21:33:59 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cw5sm6551875pbb.49.2015.10.20.21.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 21:33:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 21:33:53 -0700
Message-Id: <1445402033-28721-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image-mklibs.bbclass: update i586 TARGET_ARCH test to also handle i686
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
X-List-Received-Date: Wed, 21 Oct 2015 04:34:00 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/image-mklibs.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index c455a8e..d5f668c 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -25,7 +25,7 @@ mklibs_optimize_image_doit() {
 		x86_64)
 			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
 			;;
-		i586 )
+		i586 | i686 )
 			dynamic_loader="${base_libdir}/ld-linux.so.2"
 			;;
 		arm )
-- 
1.9.1


