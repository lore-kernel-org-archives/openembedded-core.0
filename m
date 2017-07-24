Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1377836D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 00:48:02 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c23so9177818pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 17:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IQhY21Xd6WAm+EE8FRaQ2pkYcJ3RYj2d4K0UtRHdqMs=;
	b=L5A20yFNE+0nuck31VQazilkpKAOu9iqg3ydZNJOO+GUVkuX8qPakK80o6CNNR47oE
	MDaKXtelNEK0Cb0uWvdjhoZc2l50P7WHUYLYmHDXV+U9F4TcN4MQwWniaANwLO8b63mY
	kQ8cGeAdRJJl2z3FrJ7NWQH64mhCd/Rr9dI2fxZYbkth2ET4ORvC+BTbrf88ASGa7XgX
	g+BJJWn08MOUq9KtYPVByvPtsej3ez9dxOSo2UOrEAU+MAnRYetNkmG4JzfGOTSGaTE3
	sVm0cpoA5000kWWrfpz1UMK7Xk2mPWG8MiuspcODT01NZVJdmqELt0nfAtpkMLCRWN2v
	cYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IQhY21Xd6WAm+EE8FRaQ2pkYcJ3RYj2d4K0UtRHdqMs=;
	b=fYpHPhfMsCYT4hpH+2gohxX1sZtWyjvtENJpVt40+yuCxYDJKIjdp5/s6++fNnqQZG
	iWJQgZgBYxGnMNriqrknvzR+nVXaL6EhtgiOCSO09c56gWby1nN9pLoipcoaz08Y5oks
	CSw0Uxv9/HatTW7rdVghmo4g9xXslpjaXdhowvRpDmcrRBa5s7cBlOJyGXLH0j1KgXgH
	t+tqqSXzNuin+WoNmoGZRFSZLgrO83hYJ0hbzlGSlW0ElL3jGjCj9yP/67eggQiNlKEN
	f3WNwjhFah623Lps0p/FK/yH3XP6/gxdCfzJHDTccpv6I89rflRyhYtZPiabG5JbX6Rz
	Lf+g==
X-Gm-Message-State: AIVw111cGWNNH/qka3NbbV9Y6/AyKq1BY1BqDsitOwRBDumjHJfMplm1
	IonGX1xvpcxekjD9
X-Received: by 10.99.169.17 with SMTP id u17mr14570088pge.292.1500857283390;
	Sun, 23 Jul 2017 17:48:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s3sm18228742pgn.70.2017.07.23.17.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Jul 2017 17:48:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 17:47:47 -0700
Message-Id: <20170724004748.14778-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724004748.14778-1-raj.khem@gmail.com>
References: <20170724004748.14778-1-raj.khem@gmail.com>
Subject: [PATCH 5/6] kexec-tools: Remove -fPIE -pie from SECURITY_PIE_CFLAGS
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
X-List-Received-Date: Mon, 24 Jul 2017 00:48:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index 4caca933c7..bd89720e5b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -26,6 +26,8 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.g
 SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
 SRC_URI[sha256sum] = "b3e69519d2acced256843b1e8f1ecfa00d9b54fa07449ed78f05b9193f239370"
 
+SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
+
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.13.3


