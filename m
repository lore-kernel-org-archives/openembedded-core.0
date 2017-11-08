Return-Path: <peter.griffin@linaro.org>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E50877F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 10:52:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y42so2017456wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=0FsHb8lnV9EWb6u5p6VsY6z/zObyd0nLrOIii7PHzMc=;
	b=cW1cnISyHduQ1wWM+n/O7lqth/sWEA8tDqTyN/H7MjvKBdv7BvGok2Jan3o6PytSxL
	O54++/2KFyuuqsZfELSEYZDqM/M+eaGDOnn7tQF4ZrLL1eqGUDbbAx7gP8YLOUc8qqiZ
	x69Kdq3iRG/kDIgNstF3Yg8SUbPbn3yhsamb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0FsHb8lnV9EWb6u5p6VsY6z/zObyd0nLrOIii7PHzMc=;
	b=EFYLSJEkXmvP2KJuNrAqV/EJ9ujZ2/QXJO2jMo4wgPjp1uO5bUa6aVgLoCE2/O2cHl
	LwdPBvlO2PFs6K3x3WOFCdxJhLDobOvhG3R5nmOVOq0dHQU3XXVXngMOYatgwXW1SI6Y
	F7dNIaRR5n6Bpw4RBxmMhbdi5rjjVYS0b/q19DR6W3m+dUZlXPsCGnvTSPyx5hh6Pitv
	ap73repAi4h26mD5ggZ/i4ihXqZMpgqSryObQq28Pcb9JvOeAWOy8lIWPeDcW8P+MH8/
	M08AQNxwRe1WffkV6wq9mdiQWRUfb41MSBxLa1eKDr+SoTfsQmCBYp1y8uCqHSMBynyq
	dbUg==
X-Gm-Message-State: AJaThX6Jg8gD0wmquZeMp2IHEAJldjtQ2U/wod9Q/FoC9wYZIQ8JBkjd
	sYVt7/PshpzPK0sPoj6KU1jIsI+rbTc=
X-Google-Smtp-Source: ABhQp+Rj5+b5jbOlEtinAqw4LazwGbYdnfBpoKU2RE8VuqduDOQdvkETXbg3+oZv/zxTmSNkHYD1og==
X-Received: by 10.223.184.230 with SMTP id c35mr102876wrg.18.1510138366395;
	Wed, 08 Nov 2017 02:52:46 -0800 (PST)
Received: from localhost.localdomain
	(cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net.
	[86.31.179.135]) by smtp.gmail.com with ESMTPSA id
	141sm4785441wmr.45.2017.11.08.02.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 02:52:45 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 10:50:39 +0000
Message-Id: <1510138239-2891-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] initramfs-live-install: Add aarch64 arch to COMPATIBLE_HOST.
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
X-List-Received-Date: Wed, 08 Nov 2017 10:52:46 -0000

So that we can use this on aarch64 with HiKey board.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 2 +-
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 32c1fce..2a7f84d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -21,4 +21,4 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 FILES_${PN} = " /install-efi.sh "
 
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+COMPATIBLE_HOST = "(i.86.*|x86_64.*|aarch64.*)-linux"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 88b3b30..a553a0d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -21,4 +21,4 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 FILES_${PN} = " /install.sh "
 
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+COMPATIBLE_HOST = "(i.86.*|x86_64.*|aarch64.*)-linux"
-- 
2.7.4


