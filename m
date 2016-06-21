Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC77170018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:06 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ts6so1479782pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sN/VO5I/vdEsgWEMCaPK6dxQaxFVDbayMov9DVhozrE=;
	b=pEz7jy1lZFyZWDrOOnB3iPnEJalmDjcYGqXOktbODY9bPhxH6mlSL28tCKjQL7qXTA
	MqKVssHvJvPgo/LrG8A7w5ipMK9NZDiWbtrXHpddoFrxpgoPOGodrBPf+1ayxgXh6kq+
	GqB3CHC4BLfqMT3Q7216eAiO2eINa6jNzJ0u639vtXzPs+4Iz6AE4z+4cFjyAQadkOKP
	ieK9AYTsQN6oc39G5XdeNV/hRwcch3HBMXiFP+OKIbIRukRfSdOiZgvDXXfSj062O2VR
	eKBs+WjF3kIcNCh8em3Lqc9mWkXKHPHV3Tdhv+YuD7UibPiaPXXYZ+h4QWyaXSxiZZZK
	+Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sN/VO5I/vdEsgWEMCaPK6dxQaxFVDbayMov9DVhozrE=;
	b=Y8PQZXZyQ+xBUGtTj3jDrb1csBL5JLVf9sNXtTp5iqH/euDgS5yE9yYgEwpC1KRljb
	pclKcBtKuAPctJ7ZvAA6HFgb1J721QVFNjojxrBgQp0JMTjlmJw8oX7lSPC4Zx4EdSVq
	Dl4F1uEqTHFAyn6CkTzRaSS/M2rIg9GS9Rh5p3JMfu45ZoEFCRdeZQhHZ9z1+7KT0HiW
	mlEyoqK2Gr5RekODS1vHq64NDxh17cxOievgpWmLlMi0cCjDenxpDGvDN0ZOvVpdCpDN
	TVGUUY/wfAXIIXuEAu32LZODQn7pnkpFCXASlhHu8ilpJkGwBv8Cvp56GCVO+R8Ug9Cz
	RY6Q==
X-Gm-Message-State: ALyK8tKDZK2fBfEGeFvtW0E2Ad5RxQBXztJmdaJzdY8FvRLQov3+ZhjZasgcnvLPJikZjQ==
X-Received: by 10.66.190.71 with SMTP id go7mr28175027pac.146.1466519947183;
	Tue, 21 Jun 2016 07:39:07 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	t4sm51199340paf.39.2016.06.21.07.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 07:39:00 -0700
Message-Id: <1466519942-5978-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/3] machine: add qemuppc64 machine
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:07 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/machine/qemuppc64.conf | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000..5501101
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: qemu PPC 64 Emulator setup
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+DEFAULTTUNE ?= "ppc64p6"
+require conf/machine/include/tune-power6.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
1.9.1


