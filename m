Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 719D0605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 11:26:19 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so109245902wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LLdE6vrdJEOpwTjNDS8WA1C9EREsf/nF/ocHh3Nq0Gs=;
	b=QtqNoTvik9akeKd73x27BFXEboUMWtj7TbrTWKZPbQk8xjEu4vN1WthMgkPqwFu/LT
	m+oQUwxjxqTcny1i81oyOFnk1KecGvwkIhPuknXbtT9zT6JbSTy6MQ5wrAyH7uN0IMWp
	kfUoZw1YmkFzsJurzQomT0LULqKlloL4emeEZu41QJvY0xFowILgoHOOltNzLEXBK2RC
	ZdlqpcLzLZZCLP4BgZTECqICn6qTx3OBnZY0+WC5/HW0SbwRKEg2Yho/mMlGladWek62
	CzALsxr40lPF3W5lQqbE2qfsGtyJ5yDkxL8y+gSQw6v6vPamJlSazgNO8di2mUEPF174
	D+MQ==
X-Gm-Message-State: ALoCoQmyYP1Rm/qLQfiQ2M6xM/Cdw4eGXVttOR30+K+rfUqfuikkzX8QD2Nwc23xKKQr93Gg+VbJ
X-Received: by 10.180.96.230 with SMTP id dv6mr47180144wib.23.1439378779307;
	Wed, 12 Aug 2015 04:26:19 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id
	gw7sm23336932wib.15.2015.08.12.04.26.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 04:26:18 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 13:26:16 +0200
Message-Id: <1439378776-10733-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] gnu-efi: BBCLASSEXTEND to native
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
X-List-Received-Date: Wed, 12 Aug 2015 11:26:20 -0000

Sbsigntool depends on gnu-efi and we need sbsigntool-native to do some signing, so extend gnu-efi to support that.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
index 27cc6c1..9ad258e 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
@@ -39,3 +39,5 @@ do_install() {
 }
 
 FILES_${PN} += "${libdir}/*.lds"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


