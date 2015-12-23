Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 697F86FFE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 00:12:59 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id q126so202060912iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UX4OqO6AnJZIR3ymPMmTJdjvEKYj2/KRgdTzFCpy15w=;
	b=IVkWIeUUPCGrhzsxoYngDG564mrMw+u/mhScM4qysQTdyqGXYJA9Vl8Prw9NBG8v6D
	oU6lqVBF1sJfr7L3GslEpifKKn1TxX3deF4tm206PZbUreIP7bSoJ17FUK68TwH7hdBP
	PmAR4Kba1l7koPV8tzrP+7TeYBVXCGApkUSJDqLRT8MJYJ9Jf77dhYUtG+TltEEuSyrS
	oq2NhDDB4LO7UqQOzU5AzMAraZxWzZh6x5jq6vk//YH+zf58iOtAl0yXXYocQ6ma77OV
	W7pJeGS6EDVl4KjKF9UjPzgMPysbSowzqITWGOWP8IgBGD61TObr/vu/7uNq9mUVYv0F
	TGyg==
X-Received: by 10.107.130.169 with SMTP id m41mr29311695ioi.18.1450829580153; 
	Tue, 22 Dec 2015 16:13:00 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l21sm15032468ioe.21.2015.12.22.16.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 16:12:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:12:51 -0800
Message-Id: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] move do_kernel_link_vmlinux() into kernel.bbclass
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
X-List-Received-Date: Wed, 23 Dec 2015 00:13:00 -0000

do_kernel_link_vmlinux(), or something like it, is useful for MIPS,
since MIPS has no support for zImage images:

  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/mips/Makefile#n400

Moving do_kernel_link_vmlinux() from kernel-yocto.bbclass into
kernel.bbclass makes the task available to non-yocto kernels and so
avoids the need to duplicate or re-implement it in kernel recipes
based on kernel.bbclass.

Andre McCurdy (2):
  kernel-yocto.bbclass: remove do_kernel_link_vmlinux from SRCTREECOVEREDTASKS
  kernel-yocto.bbclass: move do_kernel_link_vmlinux() into kernel.bbclass

 meta/classes/kernel-yocto.bbclass | 14 +-------------
 meta/classes/kernel.bbclass       | 12 ++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

-- 
1.9.1


