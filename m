Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5C25B605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 16:39:18 +0000 (UTC)
Received: by widdi4 with SMTP id di4so64083755wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PASe9ldZwmKXEmd7KL/g4ewt1qh5n52Pn072fH3LfdI=;
	b=QLKmZN8MzG1dbpDxhzBolwBUP8+OVdos4sEop8v9ltVOI6oanL+N73IIz8O2EAR0HP
	jsoMaNT0NBxYy4+zElhuJ9UDuZQLdyPxHMWDrcx8uynwi5WQTjEgdHWhSo8Q4u5/8wL4
	H/tJUvvbAHBlX/C6Y2hJmc+lIdfRcUElbpI7UCOTOenik1JPuf0XDOukz15WpqEFN8lS
	HBogrjjhknZV9pnZ8Dxk6CX4qs1vr37uZEIDNaUbVVvpfkMIvurwbQNYqIcjjDWizvtt
	gep0Nixpe8JWf2179ZzkK0mbGnGHaNqXQkITi8SxL2qi3KIxtDPqz3dZAn0+nu5hV78b
	JUZA==
X-Received: by 10.194.185.9 with SMTP id ey9mr41300008wjc.70.1429720759390;
	Wed, 22 Apr 2015 09:39:19 -0700 (PDT)
Received: from X220.tupi.fr ([37.162.36.133])
	by mx.google.com with ESMTPSA id g5sm213179wjq.6.2015.04.22.09.39.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Apr 2015 09:39:18 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 18:39:06 +0200
Message-Id: <1429720746-20096-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Cc: tprrt <tprrt@tupi.fr>
Subject: [PATCH] systemd-systemctl-native: fix checksum error
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
X-List-Received-Date: Wed, 22 Apr 2015 16:39:19 -0000

From: tprrt <tprrt@tupi.fr>

ERROR: systemd-systemctl-native: md5 data is not matching for file:///home/tprrt/dev/oe-build-easy/combination/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690
ERROR: systemd-systemctl-native: The new md5 checksum is 751419260aa954499f7abaabaa882bbe

Signed-off-by: tprrt <tprrt@tupi.fr>
---
 meta/recipes-core/systemd/systemd-systemctl-native.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index fbdc9c0..8cc2c21 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Wrapper for enabling systemd services"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 PR = "r6"
 
-- 
1.7.10.4


