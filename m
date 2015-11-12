Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id E4B80771AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 04:44:16 +0000 (UTC)
Received: by pasz6 with SMTP id z6so54355693pas.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 20:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Zn1Ay6xDh4iX8zzrSr7gQcdfL0BaVX+mwncKNWtvBBg=;
	b=uQvUvVJEmQ8+xUFsRsdVlLqpXLn8xVf9CM5zuRVrkyPeSDj3duNFpskVtM6iAU5fWx
	uOaSZ15PcRjTfPxKAq947uxMecpLF32UZPasoP/RsEf20x0YdVVBjIckkHotaruY+53M
	mlQfdTzsFWnL4wJh78HDmAWIuClMGkA9KwVN3VFC47+bW+lr4byib4IX1veiO7zy23aS
	J8sxGHMWCkuuiTA9P5w0vlb/AErUx8iXlFUlQSHa1KLs+9U6bKPuPzwh91IR8QHMAhCR
	eEU8dY7Q8Yep+3JgLOHaK/S9agDvQpLFWyGvap8tkE77E3Ik7oABsP0DdjqvnKAq4qFw
	8ryA==
X-Received: by 10.66.119.174 with SMTP id kv14mr20207190pab.143.1447303456911; 
	Wed, 11 Nov 2015 20:44:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	nu5sm12186243pbb.65.2015.11.11.20.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 20:44:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:44:09 -0800
Message-Id: <1447303449-20796-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bootimg.bbclass: make default KERNEL_IMAGETYPE match kernel.bbclass
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
X-List-Received-Date: Thu, 12 Nov 2015 04:44:17 -0000

kernel.bbclass uses a default KERNEL_IMAGETYPE of zImage and that's also
the default mentioned in documentation.conf. Update the bootimg.bbclass
default value from bzImage -> zImage to be consistent.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/bootimg.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ec9d0b7..6728e0e 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -47,7 +47,7 @@ EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
 EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
-KERNEL_IMAGETYPE ??= "bzImage"
+KERNEL_IMAGETYPE ??= "zImage"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
-- 
1.9.1


