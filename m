Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id C67DB7D6C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:37:58 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e13so14665338ioq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tu+Rx58DylaDpmPW/cuAasbF27sFZCc7wDuVnUCD94o=;
	b=JqSnPgokR0oH/tcWD4iQSXijTiR64e2mCUg7lNIpiF8dVCEIGlvRRYUL9VnaHtjgYL
	8Oxt7pFe+n1kLlTD31OarQh3eU38xVZIvMbVFkuZY3R0pT2/5KUUWG95ZRvjK2knd+RO
	TiD80dFkEEu1rIezhN880EmAa0upupu2NVbXoQ2TixudDxahwqscmMZ59n9+rBtiOAqn
	fW53kmVJdUAbHWC3eTTvCW6wd3O5R7q3bty4D/PTfQdLJYmhNGAYW6A8lwj5DGQPACLC
	yqTyvEqQX8Xt1QO5iv8dC9YPPHL4qdjwZy92UYhm9jgMwVQVbevO+TWsH8uZ0qnVw4aL
	SXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tu+Rx58DylaDpmPW/cuAasbF27sFZCc7wDuVnUCD94o=;
	b=TKMBDELuI0P+1N3aUNYN2zph1nNzG7jUpvlKi1xIHmPF0oQ2DvU2gASrTr0Ft9Zo17
	xR0yH+NIFucny6jbmeE0QxgjzfvwutWaYT8hMkjhepP0o8eC6kWNJElYp0nSwnafNvEu
	nBZw07bvVuSxDOY+AxoFOfT4S5H0oB6a52AMc3ko2+BWoeDjIDuF8eAMDg9QSEDNwBJL
	8UVKvTTqKJO98NUsFqtqi1MvJQtG6hlyyEWYMr/XvFLdfktm9YKNcrPGrVRH2RQov7Kz
	o4BNiG4klQoaWrNlgupZlr7Sf/E0vpjI9Z/9CsjOe5ui+ecxgtvPrE3xQRhMtQ9BA7F3
	oCPg==
X-Gm-Message-State: APjAAAW5r9p5o+v+aoZlS4S3u8M01E6cVQ8Tk1NICimdBHYoS1+P8ikN
	5SqTbpWAHKT1FV0ca1u+QgM=
X-Google-Smtp-Source: APXvYqzSNnAaEPWed7LCZcjM3YwOEx/TMRju9dzQRLSguwkpqICy9NjjKUF/EZtBSIKj7l1FfM5j+Q==
X-Received: by 2002:a5d:8b97:: with SMTP id p23mr16317712iol.83.1554824279519; 
	Tue, 09 Apr 2019 08:37:59 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:37:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:50 -0400
Message-Id: <cover.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 09 Apr 2019 15:37:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the M4 pull request for linux-yocto*. It is mainly configuration
updates and fixes that I've gether over the past few weeks. I expect
to have one more set of -stable updates, but otherwise, there are no
other significant planned changes.

This series should fix the qemumips shutdown issue (qemumips: Enable the poweroff driver).

And finally, as we've been discussing it also fixes up the -tiny support
in 5.0 to a bootable state, allowing poky-tiny to move off of 4.18 (I'll
send that patch separately). As a result of those fixups, I've included
the removal of 4.18 from master. As I've noted in the commit itself, I'll
continue to merge changes for 4.18, I just won't do SRCREV bumps in master.

Cheers,

Bruce

The following changes since commit 3c67567ece6d7bf712964f06e008abede96180bf:

  oeqa/utils/qemurunner: Fix typo in previous commit (2019-04-09 16:04:09 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto-rt/4.19: fix duplicate TIF_NEED_RESCHED_LAZY
  linux-yocto/5.0: update CGL audit configuration fragment
  linux-yocto-tiny/4.18: point KBRANCH to 4.18
  linux-yocto/4.18: update to v4.18.33
  qemumips: Enable the poweroff driver
  linux-yocto/5.0: tweak qemuarm -tiny configuration
  linux-yocto/4.18: remove versioned recipes

 .../linux/linux-yocto-rt_4.18.bb              | 43 -----------------
 .../linux/linux-yocto-rt_4.19.bb              |  4 +-
 .../linux/linux-yocto-rt_5.0.bb               |  2 +-
 .../linux/linux-yocto-tiny_4.18.bb            | 32 -------------
 .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
 .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb | 48 -------------------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
 9 files changed, 7 insertions(+), 130 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb

-- 
2.19.1


