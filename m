Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D05A971BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 01:16:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p52-v6so12812146eda.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 18:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=208VntI+BHXXnLvoGiqE5VsjAivJLx1BOMJ2L0dCMsk=;
	b=v9db1yryN4uD2eVWNefeO3SiMx8lZL6FGufXUEbZnZ7p8gDhIRQLhnvP2zqMSuuA/A
	9wvOwOZ19VgC3pVcdVe//0BXA7uglCAlDEnk3v/NYUGN3neKHBiUjdsXIKrnqXARXW/v
	Dfv/qqgF+r0sWbx5Ou/FPd6F7s7ParaWsfhR8Pj97NjS15/9tHGCUJM+9jchrZb+qiCZ
	R9QXdQNzhc3GAoJ8xsgWruY7N7bXa2/Rahb8kRPIQ4O+UHUyZnAzatlvvCuKhVooCHdj
	bmP3D2lCQvDnZ9Dg0//VYm8KTtTN7Q/yLPG4ecxbmCdVgQ4Bn/PfvlkDH8bAuK6hT/0r
	3gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=208VntI+BHXXnLvoGiqE5VsjAivJLx1BOMJ2L0dCMsk=;
	b=qUGSONdjRbk2Jhat2l2v/whWEsusWxF2SYz7Ul61Jgm/QwChMmcjh2JW4NDRnhpF+1
	UDZ8NFdPdXPfvVBDOTg9+R46ocYXj60s6VGbrue7ie6Sh/FXUi5xKez+TGPoOaTHOZgS
	7hWNopSIuX5mEvMjHkDHco3iF1kR0Gu9PWzI68zh4gMrrcjEaWdtvoLJPNvHsER8mXP5
	YlCNjcsOKAJwWWsqMPASP4R1WTqg7js1r8hrz+lczp80gfGnZViElOMwVIS8Z5XAfKpq
	SsAxAI5Uf2wN0cdynjRUhwLBbDL4NqLlJvHyw7GCxIiWAtFm9LhB87oRw2x246+XQ8ON
	XDyw==
X-Gm-Message-State: APzg51DRq0ONZyEEqGIWDKCPgAxZVSSTqQcL121raIaMX8VeAAEnef7V
	9eglxOjd1RkwTgDg1eGjTFsI2MYestbS6w==
X-Google-Smtp-Source: ANB0Vdb9gzY2MsfXba54RquACxV/I4bDpnY7W57Qx3QFN9zG4BtWletvIOnqsqX6Smj0Q54TD7pGnA==
X-Received: by 2002:a50:a7a2:: with SMTP id
	i31-v6mr30367780edc.296.1535937375342; 
	Sun, 02 Sep 2018 18:16:15 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	d12-v6sm8455905ede.78.2018.09.02.18.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 18:16:14 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 03:16:06 +0200
Message-Id: <1535937366-10340-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Cc: Walter Goossens <waltergoossens@creative-embedded.com>
Subject: [openembedded-core][PATCH] kernel-fitimage.bbclass: Create a "fitImage" symlink to resulting FIT image.
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
X-List-Received-Date: Mon, 03 Sep 2018 01:16:15 -0000

From: Walter Goossens <waltergoossens@creative-embedded.com>

If an initramfs was used, the fitImage link will point to the FIT containing
the initramfs. Otherwise it will link to the FIT without initramfs.

This ensures the user can depend on "fitImage" to point to the desired
FIT image.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 6d02d74..b672579 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -496,6 +496,9 @@ kernel_do_deploy_append() {
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
 			ln -sf ${fit_initramfs_base_name}.bin ${fit_initramfs_symlink_name}.bin
+			ln -sf ${fit_initramfs_base_name}.bin fitImage
+		else
+			ln -sf ${linux_bin_base_name}.bin fitImage
 		fi
 	fi
 }
-- 
2.7.4


