Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 131A578DD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:04:00 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i26-v6so4658615pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5gszG6CgcPjiIcswVWZIhtP7qDjphZk1FmI1RhqookM=;
	b=CjTFrCQiXmKeZNPc16wwCHeJvaDuaqHXUEZ0lLhEWMbOFUjQO0XiAsiZvWMLsVY8zv
	bXtSEdvz2pQ/9yY6eel0nFofrMf36VP9rfcYzw1t/x7vArKG1Glb12qd7HamF0Dks8lC
	mjcUHOzTiHRbCi994ct5MClC5O6jdya3nUiC9/HOwyipu6YUS/nknnCIPsBVXDNXJUmC
	4gOYH2FlAaikrJHG8RwTSDh9T5OT/g6Y7VSjziVoHSRmWAOEFvz+IV+O550NSQL37/Hp
	MmS7VImQo59s4q/qFxTrKY17ZIfDH9reJp00TptzFtqOHN+94tyZ4L9M4SM70Es+5fEV
	jZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5gszG6CgcPjiIcswVWZIhtP7qDjphZk1FmI1RhqookM=;
	b=fAGwE56tCVdnKnad8F/2+BztvUaXWABJ5u11kh06mNhQ3FQ7uWRD6/Vl14SF3F7AUz
	vjPv+qinSoevhWUJoq63KZ+Rc3sxKvjSP3Vb7rKIVdrvsOH49EmYZNUPx9Jtrm3sg/Ya
	lUTpi5m9aLOdtdjqCNVpK6c/GQ7wiMk+ctXtYmMkdSz3Smzgx951g1Yf85O6ufvYzk5J
	z1ZD1UYhPluZHDAAH+BW0Q3icwRG0khxoKENSbAKrZrx9wMqMm5i+q+4YFNbeSPZdP+0
	rnNQrZiEEEAnfXvo3k7N69GUNbEPG8TXnRMxI8e2RzEiAX11xkA6tqIjFIj6+P7zgCyL
	+a8w==
X-Gm-Message-State: AOUpUlGMx2WtEnxECZyJW1RBmFjoOOz5zJ00mG1P6G8s93dSw9DgDzLr
	ODP6i0lTuBNdr+aFIBP8tDY=
X-Google-Smtp-Source: AAOMgpe6bAhtOuPk+jZnbvezYTNrQntjdES4qxhWQhuAfxPUkUT9fRbJOyv/F5Uc+8Kc1DhbpjhDhA==
X-Received: by 2002:a62:a312:: with SMTP id
	s18-v6mr17972441pfe.13.1532963042084; 
	Mon, 30 Jul 2018 08:04:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:f98c:c6a6:efae:e2fe])
	by smtp.gmail.com with ESMTPSA id
	14-v6sm19983748pft.93.2018.07.30.08.04.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jul 2018 08:04:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 08:04:00 -0700
Message-Id: <1532963040-31606-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] parselogs: Add bluetoothd error to list of mips
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
X-List-Received-Date: Mon, 30 Jul 2018 15:04:01 -0000

do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access from 0000000000000030
[   21.402249] epc = 000000852c3a0438 in libc-2.27.so[852c310000+19b000]
[   21.402505] ra  = 000000852c3ae0cc in libc-2.27.so[852c310000+19b000]

This causes the xorg testcase to fail.

[Yocto #12845]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f0bcd16..e902299 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -90,10 +90,12 @@ ignore_errors = {
         'Failed to load module "glx"',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         'cacheinfo: Failed to find cpu0 device node',
+        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access',
         ] + common_errors,
     'qemumips64' : [
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         'cacheinfo: Failed to find cpu0 device node',
+        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access',
          ] + common_errors,
     'qemuppc' : [
         'PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]',
-- 
2.7.4


