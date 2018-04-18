Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9E26010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 00:30:18 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l8-v6so24773qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w+vd7T5/dVciQJ/3ImS4Nx5MkblnWlDla/6VySTNK4E=;
	b=odEo5B9k/ORp4lpKcqwxF99gkHCTWKEcvzb4wK4ISA6RkE78O+JluCXlZJ35Y7X1YL
	3KVETc9t/JM3c2jcmW3xB852zEzW/q0ASPec6FGH966jWcpkODKhhQaK/+zLg13XQkr7
	Tp7J4b16pKtJmnLih8Iqnhp0gWmFIUxOvZYgKHTmx9hF+ZVldWiCZz5UZf3ADlQkdZDQ
	Og2BuoiErxE+WoLTCqVqL+CRrxK3nie11z12qXHSxLss6ggTP2EWHNIhd7G9YR7+/z7v
	ZYmoTevlsOvurdu7q1kNidqIL4juseegxhCGHJfZIvKJJTiQWWbM6YoMkOfGmz14k6Hu
	zZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w+vd7T5/dVciQJ/3ImS4Nx5MkblnWlDla/6VySTNK4E=;
	b=NIUBgBtBgZdE9rhm++kkE3ptzzAl6QQK6V7s2ezo8iaxhWvEl0gCNT/VKWpQhCwgRV
	FyWZV5P1bHY8G9YkZLXvbVR6LCBEZYLK2+gykZwLZwnx3kQ1cJEZa6BBb2QYSF2A0MRB
	sgtPsNmswGtI6vFVMeuCsR9KOPvgwchZwATqF4eIO5tGF5Sy0B8bEVgQB+UpN8N0N/If
	xl2YG2QLHYVIupxjR35nZE8iDVJWzEfiAdnPyXGZyxhs15gpuC8SHaNht8f0ZfaVTYPi
	SRvpw6qQmlvpmyxUfGwi2RUZEglWv4v72EuWhsZSTwICmQ+umqinVM/UhPZEww2J2xSc
	FNdg==
X-Gm-Message-State: ALQs6tD97qLRGyYos6paefKEufKrbdCYV3KFOz9FHWzG40xfXP/yGwc5
	KtTl2Hbth3l47VI581cFQZPeSvXdpw==
X-Google-Smtp-Source: AIpwx49DH/fWREUtzmmgT7GlmWtH0wCb8a7IL1rCXtzaxjHNqQH6Wo5E1BG5WD8lVSXf+Pv/VbbFRw==
X-Received: by 10.200.26.240 with SMTP id h45mr4444517qtk.223.1524011419258;
	Tue, 17 Apr 2018 17:30:19 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id r4-v6sm6443qta.47.2018.04.17.17.30.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Apr 2018 17:30:18 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2018 21:30:12 -0300
Message-Id: <1524011412-11216-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Cc: alexander.kanavin@intel.com
Subject: [PATCH v2] grub-efi: add grub target and image for aarch64
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
X-List-Received-Date: Wed, 18 Apr 2018 00:30:19 -0000

Add missing target and image for aarch64, as the current revision is
already fully compatible with ARMv8.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index ed27b90..7bfc8ee 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -22,6 +22,9 @@ python __anonymous () {
     elif re.match('i.86', target):
         grubtarget = 'i386'
         grubimage = prefix + "bootia32.efi"
+    elif re.match('aarch64', target):
+        grubtarget = 'arm64'
+        grubimage = prefix + "bootaa64.efi"
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
     d.setVar("GRUB_TARGET", grubtarget)
-- 
2.7.4


