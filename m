Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DB8936E6F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 18:41:10 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id at1so3265532iec.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 10:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=du69qLG9mEyZb7cCb9bYVfMO7WdWcCCE9N1T6BSkEd4=;
	b=Pyc/RNEQQ5uzev/A7MuK87yyXbaeiTjvqFLNNMOP9WyVdpQf/nKoo5q3TuzGePS3w0
	GkoLpPq/0zyeFKstrGgyt/wpiLTamDqEdiKYECb5kQ8BjdfK89w8BDNaX1xLlzIzTfXo
	1qow1ekcewuO7YS/x4ih9YrDjE+C6uE+qbLKGyT/O2FU8SgX7QIlBV3F5Utq4dgbOgyo
	XV2wet8qrImfiYolEe8kDKnsQYhZyKIfudAum8JgEDKTtP2Dc0xRybr5aLA0s4vjQSIs
	uiWb4GuiSsw3IrfNHhZz4bbqYYpG5IbIM2mifywD1o3f6gQ4iQQ2cv1cE2sgdamzZARw
	L+jA==
X-Received: by 10.50.143.69 with SMTP id sc5mr18087220igb.2.1392662471767;
	Mon, 17 Feb 2014 10:41:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 10:40:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2014 10:40:41 -0800
Message-ID: <CAMKF1sr14p-RtkTpK8FcYA3PjDExfxq_qJZfX3k0c0sKy5AzdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Error: The image creation script fails
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
X-List-Received-Date: Mon, 17 Feb 2014 18:41:11 -0000
Content-Type: text/plain; charset=UTF-8

ERROR: Error: The image creation script
'/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
returned 1:
./

WARNING: /home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar:1
exit 1 from
  bzip2 -f -k core-image-minimal-qemux86-20140217182225.rootfs.tar

....

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/log.do_rootfs.20070
ERROR: Task 7 (/home/kraj/oe-core/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs) failed with exit code '1'


looking as log.do_rootfs


DEBUG: Shell function prelink_image finished
NOTE: Running image creation script for tar:
/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar
...
NOTE: Running image creation script for ext3:
/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.ext3
...
0+0 records in
0+0 records out
0 bytes (0 B) copied, 2.7118e-05 s, 0.0 kB/s
mke2fs 1.42.9 (28-Dec-2013)
debugfs 1.42.9 (28-Dec-2013)
bzip2: Can't open input file
core-image-minimal-qemux86-20140217182225.rootfs.tar: No such file or
directory.
ERROR: Error: The image creation script
'/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
returned 1:


I am seeing this starting today with pure oecore

Build Configuration:
BB_VERSION        = "1.21.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "i586-oe-linux-uclibc"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "staging:e114cc405bd98ebbe5376e094842c9d49e7ca9b8"

staging has few patches on top but they were same working few days ago

any ideas ?

