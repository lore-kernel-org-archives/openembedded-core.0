Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46C386C189
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 19:05:34 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p17so12329843lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0djAKO/yXm1H/DLp1Y32TMcNfw83trR3t+frZ++vX0Q=;
	b=EsmoMJ0+GsjjJfrIUZGUM0DnJUFX4bcp3ZUVAd7LdnOf+sfZh9wfbjuru7cmy3Uzod
	Mtz7H57NWD3iJ21Tujf3sU1c6peDN3+IcXeU3FHkmKTLYIwqrchGFNYEas26MwRgm6Cf
	BfMjgSsB4b/Xp79kVpnKV7TTa7iA4WPzFDsgWZumtJ79T8PACjY/TV0JtmNPG43HY+ds
	sA9i5ZI0OlmgacfU8n/F+iqswx3xSbO6oP0KsVTDQC4Ej9iUwamRfCsvrzD1kknWh/gT
	rhVA0+JnD2iCwvrdRzexjzWFbJGjDLUtPE5BDy7GXn2ezlwbK7VnDEwWLyBE2oxmSk78
	AkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0djAKO/yXm1H/DLp1Y32TMcNfw83trR3t+frZ++vX0Q=;
	b=E850KQBCOWIxpwrUcUvpfO9yM2iNY6LG/M+/dQvQWWbX8vfAUCMmbbJDm1Ce47QwH+
	d9HXjCpRCef1TbPccOWEkNwnlKWm4q8chUX6pse9q4x8hcW9t588As5+H8g4sH5ZtQxT
	DGnVMZfH+GynfRk3HzdmDEBzH0e/xIqFTsObcd40Z48yPVmwr9O6GTMzv0W17lY+EZyE
	V6GksAdZ19xfQAOc6BvPsmIdTmglz+SM8067Lvynoc/whDnsKZsRH0ZKuAWPwBT+ThzK
	MdVZANPtmutF4XwLm9IJOVrO7honGtl7hYn8Odfz+rxw5Tg9NHuGqr9NzbrIYPFK4R8+
	622g==
X-Gm-Message-State: AGRZ1gKuJ1WpLn+3tt8rqx9aluIHowAV80xPiq/LoJBUnHKfaakj6AEq
	prSYAxL+cqpFkkjR0iAPxgBOik82Si0=
X-Google-Smtp-Source: AJdET5e+q3Sdwbz88AFvyhe3YIJrXHF26uJiFA9MxkxK4NDlRaVaSsNl8dnWF5HnLliUV43lZnYUbw==
X-Received: by 2002:a19:6e0b:: with SMTP id j11mr1869800lfc.124.1542222334582; 
	Wed, 14 Nov 2018 11:05:34 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id b17sm350964lfc.21.2018.11.14.11.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Nov 2018 11:05:34 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 20:05:31 +0100
Message-Id: <1542222331-14982-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] wic: bootimg-efi: add a title source parameter
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
X-List-Received-Date: Wed, 14 Nov 2018 19:05:34 -0000

From: Ming Liu <liu.ming50@gmail.com>

Sometimes the users might want to change the title showing on UEFI
booting screen, so far it's hard-coded to 'boot'.

There is not a easy way to customize it in current design, I tried
firstly with '--configfile', but that does not work with --use-uuid,
since the later option will generate a UUID and write it to boot
config, only when the former option is not enabled.

So a new source parameter 'titile' is added in this patch, it defaults
to 'boot' to be consistent with the original title.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 0eb86a0..83a7e18 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -77,12 +77,13 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
             bootloader = creator.ks.bootloader
+            title = source_params.get('title')
 
             grubefi_conf = ""
             grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
             grubefi_conf += "default=boot\n"
             grubefi_conf += "timeout=%s\n" % bootloader.timeout
-            grubefi_conf += "menuentry 'boot'{\n"
+            grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
             kernel = "/bzImage"
 
@@ -152,9 +153,10 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
             kernel = "/bzImage"
+            title = source_params.get('title')
 
             boot_conf = ""
-            boot_conf += "title boot\n"
+            boot_conf += "title %s\n" % (title if title else "boot")
             boot_conf += "linux %s\n" % kernel
             boot_conf += "options LABEL=Boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
-- 
2.7.4


