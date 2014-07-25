Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E77F706C7
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:21:52 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so3961319lbi.29
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=T2oV4Di518YvLUIztmA9NC9xLDXXSp/2DxumJ+uJ0eg=;
	b=HQ6NY3SivGhK3xDjuEc0as1T5EO1UxHjsD38hMmozn9tx3R+X29Pt57hbxCuxRkoa8
	8dQxqt/1SrHrEKwfRt3koQcvTaheGCUnJNbEUqxIRg6d3y+/AWzxx0XAXdIBUzXsqgtF
	Wkaza87YBKXsnUzf7zol2AJ0mqhFiXxFz57wbX5+IFB4bhV3E/xcSf1aIyaXKbOCsJRO
	1dmIXn6m1DqzOrsUu3UEM5xKjEI63vWlUI/fZATvMY1J4Dn712NqPqLeHM1ScvR8F5Jg
	yyjAeCa8x18LxkpK/tixaNucONFBdSb/6l6gCtrToSn47jHC2HYjRv0MqTXwnsLGBdKj
	1d+w==
MIME-Version: 1.0
X-Received: by 10.152.23.197 with SMTP id o5mr18986768laf.60.1406326913193;
	Fri, 25 Jul 2014 15:21:53 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Fri, 25 Jul 2014 15:21:53 -0700 (PDT)
Date: Sat, 26 Jul 2014 00:21:53 +0200
Message-ID: <CAAQYJAt1sQtz_sb=5NdWG2Ypkwgz+BRYAYiRWgA+hh9EaszT8Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: [RFC] libgcrypt.so.20.0.1' has relocations in .text [textrel]
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
X-List-Received-Date: Fri, 25 Jul 2014 22:21:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi, somehow this QA is repeatedly here:

andrea@mizar:/oe/oe-core/build$ bitbake core-image-base
Loading cache: 100% |###########################################| ETA:  00:00:00
Loaded 2519 entries from dependency cache.
Parsing recipes: 100% |#########################################| Time: 00:00:07
Parsing of 2066 .bb files complete (2065 cached, 1 parsed). 2519
targets, 115 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.23.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "poodle"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta              = "master:188545ba82119d75f80dde322a73712ce1f0f762"
meta-initramfs    = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
meta-handheld     = "master:b61b450a0639aaac6f17ec4656950e28545c90e0"
meta-oe
meta-networking   = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
meta-opie         = "master:369016695601cea46915fe47de1d86d31dd9acd7"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: validating kernel config, see log.do_kernel_configcheck for details
WARNING: QA Issue: ELF binary
'/oe/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/lib/libgcrypt.so.20.0.1'
has relocations in .text [textrel]
NOTE: Tasks Summary: Attempted 2368 tasks of which 1071 didn't need to
be rerun and all succeeded.

A quick inspection of the configurations shows th elibs are compiled
-fPIC -DPIC  so one common cause seems ruled out.

But I'm confused after reading
http://lists.gnupg.org/pipermail/gnupg-devel/2014-January/028163.html

Worth opening a bug?

Cheers

Andrea

