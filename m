Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BDBFE61663
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 08:40:25 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id j13so890230wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=RtMe6lr+oSr4O/PA44F3g9wVoF9viaOiitTeydvbtxs=;
	b=dTL/eA+OqfY8zqpiZqvyRRbgFiP/OZ09P6PO9CvCIAAhCaUcfXDFQ3wOpxVVFRZ5Xq
	ooK03XYVbHd75nm8SE0+XYGv/BdgkebKnf/7Im33wiMKxHfwICaN9b0fpMiB0zVZqqZQ
	GxPHrcDqq2IaR4sYKdkkWi2ZjatqfkB4PZx7JVcf3VAN27TGhLZmwxc6LJ8RYftsKF2F
	SDjQORBd7k4X/uBOYzOy9z8/s3ePTMJyD1gqw42N37x2F/C5NLRl9pWIQA3lVOTaPp8U
	5YZAXzUeCGvu2rPJQu+2xhRq0FDzDkbiwQBldJyOVGXuRNvAXcujDoPgA/TZIJx2/duE
	rBlA==
MIME-Version: 1.0
X-Received: by 10.181.12.80 with SMTP id eo16mr15191519wid.44.1372927225959;
	Thu, 04 Jul 2013 01:40:25 -0700 (PDT)
Received: by 10.216.93.70 with HTTP; Thu, 4 Jul 2013 01:40:25 -0700 (PDT)
Date: Thu, 4 Jul 2013 10:40:25 +0200
Message-ID: <CALbNGRTa3kzF+m5PGsivVqA6E3FmBMfNkY_BupaY5zcNfdiDdw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: (lib)gcc fails with dbg-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 04 Jul 2013 08:40:26 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

since gcc 4.8.x I get  with dbg-pkgs in IMAGE_FEATURES

|  * check_data_file_clashes: Package gcc-dbg wants to install file
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-dev-image/1.0-r0/rootfs/usr/src/debug/libgcc/4.8.1-r0/gcc-4.8.1/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/libgcc/unwind.h
| 	But that file is already provided by package  * libgcc-s-dbg
|  * opkg_install_cmd: Cannot install package gcc-dbg.
| ERROR: Function failed: do_rootfs (see
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-dev-image/1.0-r0/temp/log.do_rootfs.12650
for further information)

could somebody look into that please because from time to time I need
some remote debugging capable image.

Andreas

