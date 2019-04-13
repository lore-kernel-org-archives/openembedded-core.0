Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7577D29B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 14:49:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h18so9678990lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0xBztFJaoBXq61Kg1ECeHOHFZW2TVyu+gNPAiHilXM8=;
	b=EFH/XQUiVHTZvAIa7++4oeBjIOBikvvcGPPwbetU2/Bz2wYW+aqZ6wex3A0hcNQ9rL
	uyuZxzPrJF20WSxCXSuCvFt+5FHegi+Vtbj0SWjtbkjtywjV+fd/4fXyZGQL/NZfYL4p
	OpYDTIL1PAZMrWze8NQOiWnUce+yojczHChkzMdrzyiBgife8zvbAVbmv12s1LK+efnj
	FPPmbAqX4JO4jtwXtKaCAx5YFLeN/LfmATjIN15Mi+5AdM4JXgN1hqgOs/3UdaYDHdxg
	lU0MKIaIw28SfUd6d9oVHFspbCLFI1CqMkPrOKFKaWa+tMaIUzO4Wi8NSMJvt4pvPMoe
	Vmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0xBztFJaoBXq61Kg1ECeHOHFZW2TVyu+gNPAiHilXM8=;
	b=TweiNAUdqpsTPmss98S6DTaiiSKplR3i5Jiwnj64dahVHFVEnfVkOTFUAo72YV7uAu
	9krsbF1ZUDuwVFdodDcqkcHfIsfqOYwpqEC+botUbxJPz3kwjZZIbFLlfNLKuhzBUcUz
	4rBjTv8fmLjghZTpEh0zs3F5imfLvVWwtqlxLnekQF0TaVWmENFbtLa5/e+j9+ejvyFd
	6OpV91U1E3YJk6gM40BduA+Qsmo/c1YIeqkqF8VWSXKesfn34Vh+wrZi86L8O/WCyvJh
	/Rq6sfCHZGK7OCR7kYwczLfz48fBzevhD23TW/+ErodRtqUMRAThBB5TjUhOoOB91+qL
	Lb8Q==
X-Gm-Message-State: APjAAAWPGZ64cyfi7NNI/+mOeHQ6JsQgvwUMcywVLBXSovio1kNxEqgj
	jCgWFowX8gnc/OchQSqn3FN/npeg
X-Google-Smtp-Source: APXvYqx9BgNJMWk+8/crxr0ap7OvlWsY085AbTL/Rb3AG1UlgLXRrKHwlh6J2cjjE6vcMdEs9d4YSw==
X-Received: by 2002:ac2:598b:: with SMTP id w11mr5692440lfn.62.1555166951304; 
	Sat, 13 Apr 2019 07:49:11 -0700 (PDT)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	x71sm2308279lff.82.2019.04.13.07.49.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Apr 2019 07:49:10 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 16:48:53 +0200
Message-Id: <20190413144853.3765-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] grub-efi-native: Install grub-editenv
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
X-List-Received-Date: Sat, 13 Apr 2019 14:49:11 -0000
Content-Transfer-Encoding: 8bit

Having a native version of grub-editenv around can be useful for
setting the targets grub environment.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 14fce97ff0..6dbd23a3c7 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -70,6 +70,7 @@ do_install_append_class-target() {
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
+	install -m 755 grub-editenv ${D}${bindir}
 }
 
 do_install_class-target() {
-- 
2.20.1


