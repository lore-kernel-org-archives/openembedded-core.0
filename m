Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D59DE7F637
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 13:03:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y19so14699078wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=TCrMp9V8HqV3KHWW05nthOLx2Z/yZPoTOVk6xsJbHFY=;
	b=hNwRlHsOZBBVSxxBxMrncTEv71WxHXIAQQzQ5wBNtonAn6GP4pu2J5XLqRsssXeSx3
	a/k2RqQSzKVMiUuX0mDMkJxr/79zh6bVt82HlK+rjVAd87cAcVB7hzU+Z7O3DFBnOsq3
	+M0O/KvzrcZDkpSDD/HoFHEISdfcthWI7DgSpE/rSMnKdZW57W5rUh7myPRZgflN45aZ
	6bDw8NdceeXXdKOkfwnvIWwNk0mE3aFO2I7CYpt8B8UDuEc6I6hkY/vC6zAf1WG7zX4g
	AfiprcuBWY59G+Z8WjOFMFCntoB2eimQbSDHpLXykUe6VjuLgn7NRocjW6H/2tOh2Nzx
	8cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TCrMp9V8HqV3KHWW05nthOLx2Z/yZPoTOVk6xsJbHFY=;
	b=Zy9iGJ8FN5z7V+h/skFir4/Hy7Yg1cvZAqQ7sBCWE3UM6VsSTXo0sZadlaw2NUZ4cL
	vjl9ExzkDRVA6Re9AVop5aiJ8xJ00oXVZbovvRdIZeZil6RiDM9Lulibc9Wms364p8eq
	dvUWLMWBqQmM1feUNkR+StPzzEg6UDbAaTIrGRG5fVpcQe0alweUG63Tyd5hYCr4Yx4J
	DIhaGQ1xiYh43pwNNPBNDnR/YFSRlUndz5ZM5YYrUCfwr0gCQvVE/sFIzGrZ+KxfNgCY
	reN+u+0FzddEucfr9d142X7GR5/hk6iHyg+d/M/Ha1oX0+yrA5CtlnCfZbB/LJde73YR
	Qclw==
X-Gm-Message-State: APjAAAWVPVGmfbWjCe1VKylLiqgvgK8ofiBVpS9IlGCbNDKNQD8SnBZx
	SfH/Z9M/zxj/0klbKgPJQ4UMYgf4jEM=
X-Google-Smtp-Source: APXvYqzB8NUjCUzDyARJ11TBF8lOjovI4S67wxyUr6DX6jN54EqadyFSAqYcRwiK2+fdEPfPvlQl3w==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr17374089wru.29.1570885390809; 
	Sat, 12 Oct 2019 06:03:10 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	207sm23154793wme.17.2019.10.12.06.03.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Oct 2019 06:03:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:03:06 +0000
Message-Id: <cover.1570885333.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][RESEND 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Sat, 12 Oct 2019 13:03:11 -0000

Let me explain a bit what these changes do for us in LGE.

We have jenkins jobs for CI as well for official releases.

All built artifacts are moved from jenkins builder to fileserver after
the build.

Each jobs have some identifier which is then included in the filenames
of all relevant build artifacts, e.g. CI jobs will add e.g. lgsvl-verf-12
to show where it was created and what build created it (12 is
BUILD_NUMBER from jenkins, verf is type of build, lgsvl is location).

To do this you can already use IMAGE_VERSION_SUFFIX variable and add
this as a suffix to current artifact names. But that has some bad
limitations.

A) If you keep IMAGE_VERSION_SUFFIX in do_deploy signatures, then
the artifacts will be rebuilt even when the deploy sstate archive in
cache is identical except tha filename. We had this for a while, but
all CI jobs were slow, because of rebuilding kernel every single time.

B) If you vardepexclude IMAGE_VERSION_SUFFIX from the tasks which use
it, you get faster CI builds, but with inconsistent artifact names when
kernel deploy sstate is reused, e.g. image will have lgsvl-verf-12
but all kernel artifacts will end with lgsvl-verf-11, when the kernel
do_deploy was reused from previously built sstate-cache

It gets even worse with B) when you have some other tooling (like
runtime testing farm) which is tasked to flash image and kernel from
lgsvl-verf-12 and it fails to find kernel image to flash, because it's
named differently.

C) Using version-less artifacts and just storing them in different
directories might work better, but then it would make sense to include
IMAGE_VERSION_SUFFIX in DEPLOY_DIR_IMAGE and remove it from the actual
files inside (with version-less symlinks pointing to them). But this is
a bit problematic when the individual images are usually downloaded by
BFUs over http (and they end with various identically named files for
which they don't remember from where they came).

So this was the motivation why we have this in webOS.

The difference for you (most people shouldn't even notice):

1) hard links instead of symlinks in DEPLOY_DIR_IMAGE, because now the
   version is in the *_LINK_* variables and you don't want symlink with
   version release-1 pointing to file created with release-2 build.

2) do_deploy, do_rootfs can still be reused from sstate, it will restore
   the version-less artifact and then just quicky add another hardlink with
   new filename (do_deploy_links task).

3) we're using this for couple years (badly hacked into OE, because we didn't
   want to overlay all relevant .bbclasses, but still needed to inject do_deploy_links
   task dependency in multiple places) and the only issue I've noticed was with
   one our proprietary IMAGE_FSTYPE format which was appending to image file in
   DEPLOY_DIR_IMAGE if it existed before, instead of overwritting it from scratch -
   to fix that I've just changed fstype function to remove the file before creating
   it again.

4) Examples:
   All show "ls -laih DEPLOY_DIR_IMAGE | sort" to show the symlinks and hardlinks

   TMPDIR is removed between each example, except the e) and f), but sstate-cache
   is kept in all cases and reused where possible

   MODULE_TARBALL_DEPLOY = "1" is added to local.conf to have more than just 1
   kernel image as artifact from kernel (e.g. rpi MACHINEs have a lot of them with
   all the dtds).

a) Current master with default values:

$ ls -laih qemux86-64-master-default/  | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735788 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735796 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 14:23 .
50741892 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
52067796 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 14:22 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067797 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067798 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067799 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 14:22 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
52068116 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
52068127 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
52068128 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
52068136 -rw-r--r--  1 bitbake bitbake 162K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.testdata.json
52068137 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-20190816141126.testdata.json
52068153 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
52068154 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
52068264 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 14:23 core-image-minimal.env
52068265 -rw-r--r--  1 bitbake bitbake  61M Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
52068271 lrwxrwxrwx  1 bitbake bitbake   56 Aug 16 14:23 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
52068272 -rw-r--r--  1 bitbake bitbake  49M Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk
52068273 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk

b) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":

$ ls -laih qemux86-64-master-release-1/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735791 -rw-r--r--  2 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735798 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 16:12 .
50741895 -rwxr-xr-x  2 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
52068085 -rw-r--r--  2 bitbake bitbake 7.6M Aug 16 16:11 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068086 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068087 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068088 -rw-r--r--  2 bitbake bitbake 7.0M Aug 16 16:11 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
52068443 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
52068450 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.qemuboot.conf
52068451 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-release-1.qemuboot.conf
52068471 -rw-r--r--  2 bitbake bitbake 161K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.testdata.json
52068472 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-release-1.testdata.json
52068507 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.rootfs.manifest
52068508 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:11 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-release-1.rootfs.manifest
52068583 -rw-r--r--  2 bitbake bitbake 1.1K Aug 16 16:11 core-image-minimal.env
52068584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 16:11 core-image-minimal-qemux86-64-release-1.rootfs.ext4
52068585 lrwxrwxrwx  2 bitbake bitbake   51 Aug 16 16:11 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-release-1.rootfs.ext4
52068586 -rw-r--r--  2 bitbake bitbake  49M Aug 16 16:12 core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk
52068596 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:12 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk

c) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
   and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
   while kernel is still reused from sstate

$ ls -laih qemux86-64-master-release-2/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735847 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735855 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:25 .
50742058 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50886339 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 13:23 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886340 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886341 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886342 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 13:23 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
50886345 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
51125060 -rw-r--r--  1 bitbake bitbake 161K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.testdata.json
51125068 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-release-2.testdata.json
51125069 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.manifest
51125070 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-release-2.rootfs.manifest
51125072 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.qemuboot.conf
51125073 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-release-2.qemuboot.conf
51125075 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:25 core-image-minimal.env
51125076 -rw-r--r--  1 bitbake bitbake  61M Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.ext4
51125077 lrwxrwxrwx  1 bitbake bitbake   51 Aug 16 13:25 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-release-2.rootfs.ext4
51125078 -rw-r--r--  1 bitbake bitbake  49M Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk
51125079 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk

d) With this PR and default values:

$ ls -laih qemux86-64-YOCTO-12937-default/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735787 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735794 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:45 .
50741889 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.tgz
50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.bin
50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
50878239 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin
51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.qemuboot.conf
51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45 core-image-minimal-qemux86-64.qemuboot.conf
51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.testdata.json
51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45 core-image-minimal-qemux86-64.testdata.json
51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.manifest
51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.manifest
51663546 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:45 core-image-minimal.env
51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.ext4
51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.ext4
51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.wic.vmdk
51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.wic.vmdk

e) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":

$ ls -laih qemux86-64-YOCTO-12937-release-1/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735846 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735852 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:59 .
50742055 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-1.tgz
50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-1.bin
50878359 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin
51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58 core-image-minimal-qemux86-64.qemuboot.conf
51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.qemuboot.conf
51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.testdata.json
51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58 core-image-minimal-qemux86-64.testdata.json
51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.manifest
51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58 core-image-minimal-qemux86-64.rootfs.manifest
51665606 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:58 core-image-minimal.env
51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59 core-image-minimal-qemux86-64-release-1.ext4
51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59 core-image-minimal-qemux86-64.rootfs.ext4
51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59 core-image-minimal-qemux86-64-release-1.wic.vmdk
51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59 core-image-minimal-qemux86-64.rootfs.wic.vmdk

f) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
   and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
   while kernel is still reused from sstate
   In this case I haven't removed TMPDIR between e) and f) to show
   that kernel artifacts are identical from previous build release-1 and just
   added another hardlink to the same inode.

$ ls -laih qemux86-64-YOCTO-12937-release-2/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07 core-image-minimal-qemux86-64.qemuboot.conf
51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.qemuboot.conf
51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.testdata.json
51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07 core-image-minimal-qemux86-64.testdata.json
51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.manifest
51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.manifest
51665583 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:07 core-image-minimal.env
51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07 core-image-minimal-qemux86-64-release-2.ext4
51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.ext4
51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07 core-image-minimal-qemux86-64-release-2.wic.vmdk
51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.wic.vmdk
51666546 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:07 .
51666553 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
51666554 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-1.tgz
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-2.tgz
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-1.bin
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-2.bin
51666557 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin

The following changes since commit 59938780e7e776d87146002ea939b185f8704408:

  build-appliance-image: Update to master head revision (2019-10-09 22:28:44 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/artifacts
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts

Martin Jansa (6):
  image-artifact-names: introduce new bbclass and move some variables
    into it
  bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
    the _LINK_NAME variables and change it to hard link
  kernel-artifact-names.bbclass: use PR instead of PKGR in
    KERNEL_ARTIFACT_NAME
  kernel.bbclass: imageType without {}
  kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
  *-artifact-names: include version only in the artifact links

 meta/classes/buildhistory.bbclass          |  2 +
 meta/classes/cve-check.bbclass             |  4 +-
 meta/classes/image-artifact-names.bbclass  | 15 +++++++
 meta/classes/image-live.bbclass            |  2 +-
 meta/classes/image.bbclass                 | 10 ++---
 meta/classes/image_types.bbclass           |  9 +---
 meta/classes/kernel-artifact-names.bbclass | 12 +++++-
 meta/classes/kernel-devicetree.bbclass     | 21 ++++++++--
 meta/classes/kernel.bbclass                | 49 +++++++++++++++-------
 meta/classes/qemuboot.bbclass              |  4 +-
 meta/classes/rootfs-postcommands.bbclass   |  6 ++-
 meta/classes/testimage.bbclass             |  2 +
 meta/conf/bitbake.conf                     |  5 ---
 13 files changed, 97 insertions(+), 44 deletions(-)
 create mode 100644 meta/classes/image-artifact-names.bbclass

-- 
2.17.1


