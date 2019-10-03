Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 541717997D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 08:27:31 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r4so1640891edy.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=EgXrP9iQMats/wl4SiiVI6SYmL4RNJSCag/3S3n+4hA=;
	b=GLbrnZE3Ab5F95FSLmPnbKdFB48BWlStChl1t4l8zb/zIvFCw+EfG0OjgIVtt4fIwi
	CoiQk8dID/vYyDs6cnxAzEXGa2qPC0BAMHGOk2BN1A33JsT/RQXTBXf7OoEXM34obNcI
	BxchSguSpwPua1YHc3A1JLsp1s0mqL3TxHG/btD+sNks2WqHpxI4q85QnDsAX97Yqjiv
	7ZlTcBHKyZkToMZrZ7hR/vcC7v4Sm9AQ5uHptm9igjGpVcgF6eMwzdTMnm0e/Znov/Kc
	4odTirm8Sj0mLF2itbalcRZvAO8DZI533KQTPRWDFSqdMsVW1yovucRLKm/lARR58Osm
	+j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=EgXrP9iQMats/wl4SiiVI6SYmL4RNJSCag/3S3n+4hA=;
	b=ZEZDUO1eMERn+VMbcNn1IScMBlt6kkhU6pKUpdhARUVsDVVy+IZf0bdWHTvZ8WL9gt
	I2I/HwRvp/L+NY25PtjLtekkf0W3Qidu8OiTfM2uVVFpZ/d1ss1OWysqtH/H9xi3e50M
	0lUUzBDZTMlrdtkoCI7120cikXRIcewnC1jrWnEq40Dg3CZxiMZTFvcdEI8zLRlMV4ls
	4KRDHozBfsO8Bsc0nYruqtXKI9V7z2dnTIDrhg1strLunvUXx1S96BIdIYE9IbfSW6eE
	UarC+7vSy1XKABslMzyxOTH6hoeY1JpOPa1u9fAe8iGTkHwE2dPJDwZjkop31RYsZR0L
	oHHw==
X-Gm-Message-State: APjAAAUZZeU7cx49n8D0rNj371k54+QVjMRKO2Ic6vIW3Vvlr3ogVh0P
	cGpDpRG+TPRsbWbOtn2tqdkFwVUoT3yb81kyTiQdIiAq
X-Google-Smtp-Source: APXvYqxaZBrISSpEbkKdwqkW1OmLHz0t9nXNhH0iBAer2E+zdVmHW55YfuBmqB7Ji+EETc35aAo14EtLLfrIM0V4Zhc=
X-Received: by 2002:a50:e79b:: with SMTP id b27mr8271516edn.186.1570091251405; 
	Thu, 03 Oct 2019 01:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 3 Oct 2019 10:27:24 +0200
Message-ID: <CA+chaQdY6JESztT2ziw=H4H=qdTTCsUe0uqWuk3C-CfeyMnCwg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Thu, 03 Oct 2019 08:27:31 -0000
Content-Type: multipart/alternative; boundary="0000000000004e182f0593fd5ba6"

--0000000000004e182f0593fd5ba6
Content-Type: text/plain; charset="UTF-8"

Any feedback on this or does it have to wait for 3.1?

At least the last patch is a fix for regression already included in 3.0.

On Fri, Aug 23, 2019 at 8:01 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Let me explain a bit what these changes do for us in LGE.
>
> We have jenkins jobs for CI as well for official releases.
>
> All built artifacts are moved from jenkins builder to fileserver after
> the build.
>
> Each jobs have some identifier which is then included in the filenames
> of all relevant build artifacts, e.g. CI jobs will add e.g. lgsvl-verf-12
> to show where it was created and what build created it (12 is
> BUILD_NUMBER from jenkins, verf is type of build, lgsvl is location).
>
> To do this you can already use IMAGE_VERSION_SUFFIX variable and add
> this as a suffix to current artifact names. But that has some bad
> limitations.
>
> A) If you keep IMAGE_VERSION_SUFFIX in do_deploy signatures, then
> the artifacts will be rebuilt even when the deploy sstate archive in
> cache is identical except tha filename. We had this for a while, but
> all CI jobs were slow, because of rebuilding kernel every single time.
>
> B) If you vardepexclude IMAGE_VERSION_SUFFIX from the tasks which use
> it, you get faster CI builds, but with inconsistent artifact names when
> kernel deploy sstate is reused, e.g. image will have lgsvl-verf-12
> but all kernel artifacts will end with lgsvl-verf-11, when the kernel
> do_deploy was reused from previously built sstate-cache
>
> It gets even worse with B) when you have some other tooling (like
> runtime testing farm) which is tasked to flash image and kernel from
> lgsvl-verf-12 and it fails to find kernel image to flash, because it's
> named differently.
>
> C) Using version-less artifacts and just storing them in different
> directories might work better, but then it would make sense to include
> IMAGE_VERSION_SUFFIX in DEPLOY_DIR_IMAGE and remove it from the actual
> files inside (with version-less symlinks pointing to them). But this is
> a bit problematic when the individual images are usually downloaded by
> BFUs over http (and they end with various identically named files for
> which they don't remember from where they came).
>
> So this was the motivation why we have this in webOS.
>
> The difference for you (most people shouldn't even notice):
>
> 1) hard links instead of symlinks in DEPLOY_DIR_IMAGE, because now the
>    version is in the *_LINK_* variables and you don't want symlink with
>    version release-1 pointing to file created with release-2 build.
>
> 2) do_deploy, do_rootfs can still be reused from sstate, it will restore
>    the version-less artifact and then just quicky add another hardlink with
>    new filename (do_deploy_links task).
>
> 3) we're using this for couple years (badly hacked into OE, because we
> didn't
>    want to overlay all relevant .bbclasses, but still needed to inject
> do_deploy_links
>    task dependency in multiple places) and the only issue I've noticed was
> with
>    one our proprietary IMAGE_FSTYPE format which was appending to image
> file in
>    DEPLOY_DIR_IMAGE if it existed before, instead of overwritting it from
> scratch -
>    to fix that I've just changed fstype function to remove the file before
> creating
>    it again.
>
> 4) Examples:
>    All show "ls -laih DEPLOY_DIR_IMAGE | sort" to show the symlinks and
> hardlinks
>
>    TMPDIR is removed between each example, except the e) and f), but
> sstate-cache
>    is kept in all cases and reused where possible
>
>    MODULE_TARBALL_DEPLOY = "1" is added to local.conf to have more than
> just 1
>    kernel image as artifact from kernel (e.g. rpi MACHINEs have a lot of
> them with
>    all the dtds).
>
> a) Current master with default values:
>
> $ ls -laih qemux86-64-master-default/  | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 50735788 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 50735796 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 14:23 .
> 50741892 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 52067796 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 14:22
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
> 52067797 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22
> bzImage-qemux86-64.bin ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
> 52067798 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 bzImage ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
> 52067799 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 14:22
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
> 52068116 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22
> modules-qemux86-64.tgz ->
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
> 52068127 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 14:23
> core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
> 52068128 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23
> core-image-minimal-qemux86-64.qemuboot.conf ->
> core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
> 52068136 -rw-r--r--  1 bitbake bitbake 162K Aug 16 14:23
> core-image-minimal-qemux86-64-20190816141126.testdata.json
> 52068137 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23
> core-image-minimal-qemux86-64.testdata.json ->
> core-image-minimal-qemux86-64-20190816141126.testdata.json
> 52068153 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 14:23
> core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
> 52068154 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23
> core-image-minimal-qemux86-64.manifest ->
> core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
> 52068264 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 14:23
> core-image-minimal.env
> 52068265 -rw-r--r--  1 bitbake bitbake  61M Aug 16 14:23
> core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
> 52068271 lrwxrwxrwx  1 bitbake bitbake   56 Aug 16 14:23
> core-image-minimal-qemux86-64.ext4 ->
> core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
> 52068272 -rw-r--r--  1 bitbake bitbake  49M Aug 16 14:23
> core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk
> 52068273 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23
> core-image-minimal-qemux86-64.wic.vmdk ->
> core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk
>
> b) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":
>
> $ ls -laih qemux86-64-master-release-1/ | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 50735791 -rw-r--r--  2 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 50735798 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 16:12 .
> 50741895 -rwxr-xr-x  2 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 52068085 -rw-r--r--  2 bitbake bitbake 7.6M Aug 16 16:11
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
> 52068086 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11
> bzImage-qemux86-64.bin ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
> 52068087 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 bzImage ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
> 52068088 -rw-r--r--  2 bitbake bitbake 7.0M Aug 16 16:11
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
> 52068443 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11
> modules-qemux86-64.tgz ->
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
> 52068450 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 16:11
> core-image-minimal-qemux86-64-release-1.qemuboot.conf
> 52068451 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11
> core-image-minimal-qemux86-64.qemuboot.conf ->
> core-image-minimal-qemux86-64-release-1.qemuboot.conf
> 52068471 -rw-r--r--  2 bitbake bitbake 161K Aug 16 16:11
> core-image-minimal-qemux86-64-release-1.testdata.json
> 52068472 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11
> core-image-minimal-qemux86-64.testdata.json ->
> core-image-minimal-qemux86-64-release-1.testdata.json
> 52068507 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 16:11
> core-image-minimal-qemux86-64-release-1.rootfs.manifest
> 52068508 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:11
> core-image-minimal-qemux86-64.manifest ->
> core-image-minimal-qemux86-64-release-1.rootfs.manifest
> 52068583 -rw-r--r--  2 bitbake bitbake 1.1K Aug 16 16:11
> core-image-minimal.env
> 52068584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 16:11
> core-image-minimal-qemux86-64-release-1.rootfs.ext4
> 52068585 lrwxrwxrwx  2 bitbake bitbake   51 Aug 16 16:11
> core-image-minimal-qemux86-64.ext4 ->
> core-image-minimal-qemux86-64-release-1.rootfs.ext4
> 52068586 -rw-r--r--  2 bitbake bitbake  49M Aug 16 16:12
> core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk
> 52068596 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:12
> core-image-minimal-qemux86-64.wic.vmdk ->
> core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk
>
> c) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
>    and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
>    while kernel is still reused from sstate
>
> $ ls -laih qemux86-64-master-release-2/ | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 50735847 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 50735855 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:25 .
> 50742058 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 50886339 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 13:23
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
> 50886340 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23
> bzImage-qemux86-64.bin ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
> 50886341 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 bzImage ->
> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
> 50886342 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 13:23
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
> 50886345 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23
> modules-qemux86-64.tgz ->
> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
> 51125060 -rw-r--r--  1 bitbake bitbake 161K Aug 16 13:25
> core-image-minimal-qemux86-64-release-2.testdata.json
> 51125068 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25
> core-image-minimal-qemux86-64.testdata.json ->
> core-image-minimal-qemux86-64-release-2.testdata.json
> 51125069 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 13:25
> core-image-minimal-qemux86-64-release-2.rootfs.manifest
> 51125070 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25
> core-image-minimal-qemux86-64.manifest ->
> core-image-minimal-qemux86-64-release-2.rootfs.manifest
> 51125072 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 13:25
> core-image-minimal-qemux86-64-release-2.qemuboot.conf
> 51125073 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25
> core-image-minimal-qemux86-64.qemuboot.conf ->
> core-image-minimal-qemux86-64-release-2.qemuboot.conf
> 51125075 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:25
> core-image-minimal.env
> 51125076 -rw-r--r--  1 bitbake bitbake  61M Aug 16 13:25
> core-image-minimal-qemux86-64-release-2.rootfs.ext4
> 51125077 lrwxrwxrwx  1 bitbake bitbake   51 Aug 16 13:25
> core-image-minimal-qemux86-64.ext4 ->
> core-image-minimal-qemux86-64-release-2.rootfs.ext4
> 51125078 -rw-r--r--  1 bitbake bitbake  49M Aug 16 13:25
> core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk
> 51125079 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25
> core-image-minimal-qemux86-64.wic.vmdk ->
> core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk
>
> d) With this PR and default values:
>
> $ ls -laih qemux86-64-YOCTO-12937-default/ | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 50735787 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 50735794 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:45 .
> 50741889 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.tgz
> 50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64.tgz
> 50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.bin
> 50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64.bin
> 50878239 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage ->
> bzImage-qemux86-64.bin
> 51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45
> core-image-minimal-qemux86-64-1.0-r0-20190816124241.qemuboot.conf
> 51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45
> core-image-minimal-qemux86-64.qemuboot.conf
> 51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45
> core-image-minimal-qemux86-64-1.0-r0-20190816124241.testdata.json
> 51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45
> core-image-minimal-qemux86-64.testdata.json
> 51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45
> core-image-minimal-qemux86-64-1.0-r0-20190816124241.manifest
> 51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45
> core-image-minimal-qemux86-64.rootfs.manifest
> 51663546 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:45
> core-image-minimal.env
> 51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45
> core-image-minimal-qemux86-64-1.0-r0-20190816124241.ext4
> 51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45
> core-image-minimal-qemux86-64.rootfs.ext4
> 51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45
> core-image-minimal-qemux86-64-1.0-r0-20190816124241.wic.vmdk
> 51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45
> core-image-minimal-qemux86-64.rootfs.wic.vmdk
>
> e) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":
>
> $ ls -laih qemux86-64-YOCTO-12937-release-1/ | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 50735846 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 50735852 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:59 .
> 50742055 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64-release-1.tgz
> 50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64.tgz
> 50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64.bin
> 50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64-release-1.bin
> 50878359 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage ->
> bzImage-qemux86-64.bin
> 51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58
> core-image-minimal-qemux86-64.qemuboot.conf
> 51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58
> core-image-minimal-qemux86-64-release-1.qemuboot.conf
> 51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58
> core-image-minimal-qemux86-64-release-1.testdata.json
> 51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58
> core-image-minimal-qemux86-64.testdata.json
> 51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58
> core-image-minimal-qemux86-64-release-1.manifest
> 51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58
> core-image-minimal-qemux86-64.rootfs.manifest
> 51665606 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:58
> core-image-minimal.env
> 51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59
> core-image-minimal-qemux86-64-release-1.ext4
> 51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59
> core-image-minimal-qemux86-64.rootfs.ext4
> 51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59
> core-image-minimal-qemux86-64-release-1.wic.vmdk
> 51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59
> core-image-minimal-qemux86-64.rootfs.wic.vmdk
>
> f) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
>    and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
>    while kernel is still reused from sstate
>    In this case I haven't removed TMPDIR between e) and f) to show
>    that kernel artifacts are identical from previous build release-1 and
> just
>    added another hardlink to the same inode.
>
> $ ls -laih qemux86-64-YOCTO-12937-release-2/ | sort
> 47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
> 51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07
> core-image-minimal-qemux86-64.qemuboot.conf
> 51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07
> core-image-minimal-qemux86-64-release-2.qemuboot.conf
> 51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07
> core-image-minimal-qemux86-64-release-2.testdata.json
> 51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07
> core-image-minimal-qemux86-64.testdata.json
> 51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07
> core-image-minimal-qemux86-64-release-2.manifest
> 51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07
> core-image-minimal-qemux86-64.rootfs.manifest
> 51665583 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:07
> core-image-minimal.env
> 51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07
> core-image-minimal-qemux86-64-release-2.ext4
> 51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07
> core-image-minimal-qemux86-64.rootfs.ext4
> 51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07
> core-image-minimal-qemux86-64-release-2.wic.vmdk
> 51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07
> core-image-minimal-qemux86-64.rootfs.wic.vmdk
> 51666546 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:07 .
> 51666553 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16
> grub-efi-bootx64.efi
> 51666554 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16
> systemd-bootx64.efi
> 51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64-release-1.tgz
> 51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64-release-2.tgz
> 51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44
> modules-qemux86-64.tgz
> 51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64.bin
> 51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64-release-1.bin
> 51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44
> bzImage-qemux86-64-release-2.bin
> 51666557 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage ->
> bzImage-qemux86-64.bin
>
> The following changes since commit
> 64f9fd2a1ebfad102140801f8be8b8be33082d61:
>
>   quilt: added less to RDEPENDS list (2019-08-22 17:36:13 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib jansa/artifacts
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts
>
> Martin Jansa (6):
>   image-artifact-names: introduce new bbclass and move some variables
>     into it
>   bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
>     the _LINK_NAME variables and change it to hard link
>   kernel-artifact-names.bbclass: use PR instead of PKGR in
>     KERNEL_ARTIFACT_NAME
>   kernel.bbclass: imageType without {}
>   kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
>   *-artifact-names: include version only in the artifact links
>
>  meta/classes/buildhistory.bbclass          |  2 +
>  meta/classes/cve-check.bbclass             |  4 +-
>  meta/classes/image-artifact-names.bbclass  | 15 +++++++
>  meta/classes/image-live.bbclass            |  2 +-
>  meta/classes/image.bbclass                 | 10 ++---
>  meta/classes/image_types.bbclass           |  9 +---
>  meta/classes/kernel-artifact-names.bbclass | 12 +++++-
>  meta/classes/kernel-devicetree.bbclass     | 21 ++++++++--
>  meta/classes/kernel.bbclass                | 49 +++++++++++++++-------
>  meta/classes/qemuboot.bbclass              |  4 +-
>  meta/classes/rootfs-postcommands.bbclass   |  6 ++-
>  meta/classes/testimage.bbclass             |  2 +
>  meta/conf/bitbake.conf                     |  5 ---
>  13 files changed, 97 insertions(+), 44 deletions(-)
>  create mode 100644 meta/classes/image-artifact-names.bbclass
>
> --
> 2.17.1
>
>

--0000000000004e182f0593fd5ba6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any feedback on this or does it have to wait for 3.1?<div>=
<br></div><div>At least the last patch is a fix for regression already incl=
uded in 3.0.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Aug 23, 2019 at 8:01 AM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Let me explain a b=
it what these changes do for us in LGE.<br>
<br>
We have jenkins jobs for CI as well for official releases.<br>
<br>
All built artifacts are moved from jenkins builder to fileserver after<br>
the build.<br>
<br>
Each jobs have some identifier which is then included in the filenames<br>
of all relevant build artifacts, e.g. CI jobs will add e.g. lgsvl-verf-12<b=
r>
to show where it was created and what build created it (12 is<br>
BUILD_NUMBER from jenkins, verf is type of build, lgsvl is location).<br>
<br>
To do this you can already use IMAGE_VERSION_SUFFIX variable and add<br>
this as a suffix to current artifact names. But that has some bad<br>
limitations.<br>
<br>
A) If you keep IMAGE_VERSION_SUFFIX in do_deploy signatures, then<br>
the artifacts will be rebuilt even when the deploy sstate archive in<br>
cache is identical except tha filename. We had this for a while, but<br>
all CI jobs were slow, because of rebuilding kernel every single time.<br>
<br>
B) If you vardepexclude IMAGE_VERSION_SUFFIX from the tasks which use<br>
it, you get faster CI builds, but with inconsistent artifact names when<br>
kernel deploy sstate is reused, e.g. image will have lgsvl-verf-12<br>
but all kernel artifacts will end with lgsvl-verf-11, when the kernel<br>
do_deploy was reused from previously built sstate-cache<br>
<br>
It gets even worse with B) when you have some other tooling (like<br>
runtime testing farm) which is tasked to flash image and kernel from<br>
lgsvl-verf-12 and it fails to find kernel image to flash, because it&#39;s<=
br>
named differently.<br>
<br>
C) Using version-less artifacts and just storing them in different<br>
directories might work better, but then it would make sense to include<br>
IMAGE_VERSION_SUFFIX in DEPLOY_DIR_IMAGE and remove it from the actual<br>
files inside (with version-less symlinks pointing to them). But this is<br>
a bit problematic when the individual images are usually downloaded by<br>
BFUs over http (and they end with various identically named files for<br>
which they don&#39;t remember from where they came).<br>
<br>
So this was the motivation why we have this in webOS.<br>
<br>
The difference for you (most people shouldn&#39;t even notice):<br>
<br>
1) hard links instead of symlinks in DEPLOY_DIR_IMAGE, because now the<br>
=C2=A0 =C2=A0version is in the *_LINK_* variables and you don&#39;t want sy=
mlink with<br>
=C2=A0 =C2=A0version release-1 pointing to file created with release-2 buil=
d.<br>
<br>
2) do_deploy, do_rootfs can still be reused from sstate, it will restore<br=
>
=C2=A0 =C2=A0the version-less artifact and then just quicky add another har=
dlink with<br>
=C2=A0 =C2=A0new filename (do_deploy_links task).<br>
<br>
3) we&#39;re using this for couple years (badly hacked into OE, because we =
didn&#39;t<br>
=C2=A0 =C2=A0want to overlay all relevant .bbclasses, but still needed to i=
nject do_deploy_links<br>
=C2=A0 =C2=A0task dependency in multiple places) and the only issue I&#39;v=
e noticed was with<br>
=C2=A0 =C2=A0one our proprietary IMAGE_FSTYPE format which was appending to=
 image file in<br>
=C2=A0 =C2=A0DEPLOY_DIR_IMAGE if it existed before, instead of overwritting=
 it from scratch -<br>
=C2=A0 =C2=A0to fix that I&#39;ve just changed fstype function to remove th=
e file before creating<br>
=C2=A0 =C2=A0it again.<br>
<br>
4) Examples:<br>
=C2=A0 =C2=A0All show &quot;ls -laih DEPLOY_DIR_IMAGE | sort&quot; to show =
the symlinks and hardlinks<br>
<br>
=C2=A0 =C2=A0TMPDIR is removed between each example, except the e) and f), =
but sstate-cache<br>
=C2=A0 =C2=A0is kept in all cases and reused where possible<br>
<br>
=C2=A0 =C2=A0MODULE_TARBALL_DEPLOY =3D &quot;1&quot; is added to local.conf=
 to have more than just 1<br>
=C2=A0 =C2=A0kernel image as artifact from kernel (e.g. rpi MACHINEs have a=
 lot of them with<br>
=C2=A0 =C2=A0all the dtds).<br>
<br>
a) Current master with default values:<br>
<br>
$ ls -laih qemux86-64-master-default/=C2=A0 | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
50735788 -rw-r--r--=C2=A0 1 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
50735796 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 14:23 .<br>
50741892 -rwxr-xr-x=C2=A0 1 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
52067796 -rw-r--r--=C2=A0 1 bitbake bitbake 7.6M Aug 16 14:22 bzImage--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin<br>
52067797 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A078 Aug 16 14:22 bzI=
mage-qemux86-64.bin -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-=
qemux86-64-20190816141126.bin<br>
52067798 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A078 Aug 16 14:22 bzI=
mage -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-2019=
0816141126.bin<br>
52067799 -rw-r--r--=C2=A0 1 bitbake bitbake 7.0M Aug 16 14:22 modules--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz<br>
52068116 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A078 Aug 16 14:22 mod=
ules-qemux86-64.tgz -&gt; modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-=
qemux86-64-20190816141126.tgz<br>
52068127 -rw-r--r--=C2=A0 1 bitbake bitbake 1.3K Aug 16 14:23 core-image-mi=
nimal-qemux86-64-20190816141126.qemuboot.conf<br>
52068128 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A058 Aug 16 14:23 cor=
e-image-minimal-qemux86-64.qemuboot.conf -&gt; core-image-minimal-qemux86-6=
4-20190816141126.qemuboot.conf<br>
52068136 -rw-r--r--=C2=A0 1 bitbake bitbake 162K Aug 16 14:23 core-image-mi=
nimal-qemux86-64-20190816141126.testdata.json<br>
52068137 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A058 Aug 16 14:23 cor=
e-image-minimal-qemux86-64.testdata.json -&gt; core-image-minimal-qemux86-6=
4-20190816141126.testdata.json<br>
52068153 -rw-r--r--=C2=A0 1 bitbake bitbake 2.2K Aug 16 14:23 core-image-mi=
nimal-qemux86-64-20190816141126.rootfs.manifest<br>
52068154 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A060 Aug 16 14:23 cor=
e-image-minimal-qemux86-64.manifest -&gt; core-image-minimal-qemux86-64-201=
90816141126.rootfs.manifest<br>
52068264 -rw-r--r--=C2=A0 1 bitbake bitbake 1.1K Aug 16 14:23 core-image-mi=
nimal.env<br>
52068265 -rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 61M Aug 16 14:23 core-ima=
ge-minimal-qemux86-64-20190816141126.rootfs.ext4<br>
52068271 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A056 Aug 16 14:23 cor=
e-image-minimal-qemux86-64.ext4 -&gt; core-image-minimal-qemux86-64-2019081=
6141126.rootfs.ext4<br>
52068272 -rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 49M Aug 16 14:23 core-ima=
ge-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk<br>
52068273 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A060 Aug 16 14:23 cor=
e-image-minimal-qemux86-64.wic.vmdk -&gt; core-image-minimal-qemux86-64-201=
90816141126.rootfs.wic.vmdk<br>
<br>
b) Current master with IMAGE_VERSION_SUFFIX_forcevariable =3D &quot;-releas=
e-1&quot;:<br>
<br>
$ ls -laih qemux86-64-master-release-1/ | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
50735791 -rw-r--r--=C2=A0 2 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
50735798 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 16:12 .<br>
50741895 -rwxr-xr-x=C2=A0 2 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
52068085 -rw-r--r--=C2=A0 2 bitbake bitbake 7.6M Aug 16 16:11 bzImage--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin<br>
52068086 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A073 Aug 16 16:11 bzI=
mage-qemux86-64.bin -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-=
qemux86-64-release-1.bin<br>
52068087 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A073 Aug 16 16:11 bzI=
mage -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-rele=
ase-1.bin<br>
52068088 -rw-r--r--=C2=A0 2 bitbake bitbake 7.0M Aug 16 16:11 modules--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz<br>
52068443 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A073 Aug 16 16:11 mod=
ules-qemux86-64.tgz -&gt; modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-=
qemux86-64-release-1.tgz<br>
52068450 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 16:11 core-image-mi=
nimal-qemux86-64-release-1.qemuboot.conf<br>
52068451 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A053 Aug 16 16:11 cor=
e-image-minimal-qemux86-64.qemuboot.conf -&gt; core-image-minimal-qemux86-6=
4-release-1.qemuboot.conf<br>
52068471 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 16:11 core-image-mi=
nimal-qemux86-64-release-1.testdata.json<br>
52068472 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A053 Aug 16 16:11 cor=
e-image-minimal-qemux86-64.testdata.json -&gt; core-image-minimal-qemux86-6=
4-release-1.testdata.json<br>
52068507 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 16:11 core-image-mi=
nimal-qemux86-64-release-1.rootfs.manifest<br>
52068508 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A055 Aug 16 16:11 cor=
e-image-minimal-qemux86-64.manifest -&gt; core-image-minimal-qemux86-64-rel=
ease-1.rootfs.manifest<br>
52068583 -rw-r--r--=C2=A0 2 bitbake bitbake 1.1K Aug 16 16:11 core-image-mi=
nimal.env<br>
52068584 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 16:11 core-ima=
ge-minimal-qemux86-64-release-1.rootfs.ext4<br>
52068585 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A051 Aug 16 16:11 cor=
e-image-minimal-qemux86-64.ext4 -&gt; core-image-minimal-qemux86-64-release=
-1.rootfs.ext4<br>
52068586 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 16:12 core-ima=
ge-minimal-qemux86-64-release-1.rootfs.wic.vmdk<br>
52068596 lrwxrwxrwx=C2=A0 2 bitbake bitbake=C2=A0 =C2=A055 Aug 16 16:12 cor=
e-image-minimal-qemux86-64.wic.vmdk -&gt; core-image-minimal-qemux86-64-rel=
ease-1.rootfs.wic.vmdk<br>
<br>
c) Current master with IMAGE_VERSION_SUFFIX_forcevariable =3D &quot;-releas=
e-2&quot;<br>
=C2=A0 =C2=A0and IMAGE_INSTALL_append =3D &quot; zlib&quot; added to force =
image to be recreated<br>
=C2=A0 =C2=A0while kernel is still reused from sstate<br>
<br>
$ ls -laih qemux86-64-master-release-2/ | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
50735847 -rw-r--r--=C2=A0 1 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
50735855 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 13:25 .<br>
50742058 -rwxr-xr-x=C2=A0 1 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
50886339 -rw-r--r--=C2=A0 1 bitbake bitbake 7.6M Aug 16 13:23 bzImage--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin<br>
50886340 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A073 Aug 16 13:23 bzI=
mage-qemux86-64.bin -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-=
qemux86-64-release-2.bin<br>
50886341 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A073 Aug 16 13:23 bzI=
mage -&gt; bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-rele=
ase-2.bin<br>
50886342 -rw-r--r--=C2=A0 1 bitbake bitbake 7.0M Aug 16 13:23 modules--5.0.=
19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz<br>
50886345 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A073 Aug 16 13:23 mod=
ules-qemux86-64.tgz -&gt; modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-=
qemux86-64-release-2.tgz<br>
51125060 -rw-r--r--=C2=A0 1 bitbake bitbake 161K Aug 16 13:25 core-image-mi=
nimal-qemux86-64-release-2.testdata.json<br>
51125068 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A053 Aug 16 13:25 cor=
e-image-minimal-qemux86-64.testdata.json -&gt; core-image-minimal-qemux86-6=
4-release-2.testdata.json<br>
51125069 -rw-r--r--=C2=A0 1 bitbake bitbake 2.2K Aug 16 13:25 core-image-mi=
nimal-qemux86-64-release-2.rootfs.manifest<br>
51125070 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A055 Aug 16 13:25 cor=
e-image-minimal-qemux86-64.manifest -&gt; core-image-minimal-qemux86-64-rel=
ease-2.rootfs.manifest<br>
51125072 -rw-r--r--=C2=A0 1 bitbake bitbake 1.3K Aug 16 13:25 core-image-mi=
nimal-qemux86-64-release-2.qemuboot.conf<br>
51125073 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A053 Aug 16 13:25 cor=
e-image-minimal-qemux86-64.qemuboot.conf -&gt; core-image-minimal-qemux86-6=
4-release-2.qemuboot.conf<br>
51125075 -rw-r--r--=C2=A0 1 bitbake bitbake 1.1K Aug 16 13:25 core-image-mi=
nimal.env<br>
51125076 -rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 61M Aug 16 13:25 core-ima=
ge-minimal-qemux86-64-release-2.rootfs.ext4<br>
51125077 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A051 Aug 16 13:25 cor=
e-image-minimal-qemux86-64.ext4 -&gt; core-image-minimal-qemux86-64-release=
-2.rootfs.ext4<br>
51125078 -rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 49M Aug 16 13:25 core-ima=
ge-minimal-qemux86-64-release-2.rootfs.wic.vmdk<br>
51125079 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A055 Aug 16 13:25 cor=
e-image-minimal-qemux86-64.wic.vmdk -&gt; core-image-minimal-qemux86-64-rel=
ease-2.rootfs.wic.vmdk<br>
<br>
d) With this PR and default values:<br>
<br>
$ ls -laih qemux86-64-YOCTO-12937-default/ | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
50735787 -rw-r--r--=C2=A0 1 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
50735794 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 12:45 .<br>
50741889 -rwxr-xr-x=C2=A0 1 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
50878232 -rw-r--r--=C2=A0 2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.tgz<br>
50878232 -rw-r--r--=C2=A0 2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64.tgz<br>
50878233 -rw-r--r--=C2=A0 2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.bin<br>
50878233 -rw-r--r--=C2=A0 2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64.bin<br>
50878239 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A022 Aug 15 18:44 bzI=
mage -&gt; bzImage-qemux86-64.bin<br>
51663342 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 12:45 core-image-mi=
nimal-qemux86-64-1.0-r0-20190816124241.qemuboot.conf<br>
51663342 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 12:45 core-image-mi=
nimal-qemux86-64.qemuboot.conf<br>
51663368 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 12:45 core-image-mi=
nimal-qemux86-64-1.0-r0-20190816124241.testdata.json<br>
51663368 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 12:45 core-image-mi=
nimal-qemux86-64.testdata.json<br>
51663370 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 12:45 core-image-mi=
nimal-qemux86-64-1.0-r0-20190816124241.manifest<br>
51663370 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 12:45 core-image-mi=
nimal-qemux86-64.rootfs.manifest<br>
51663546 -rw-r--r--=C2=A0 1 bitbake bitbake 1.1K Aug 16 12:45 core-image-mi=
nimal.env<br>
51663555 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 12:45 core-ima=
ge-minimal-qemux86-64-1.0-r0-20190816124241.ext4<br>
51663555 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 12:45 core-ima=
ge-minimal-qemux86-64.rootfs.ext4<br>
51663557 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 12:45 core-ima=
ge-minimal-qemux86-64-1.0-r0-20190816124241.wic.vmdk<br>
51663557 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 12:45 core-ima=
ge-minimal-qemux86-64.rootfs.wic.vmdk<br>
<br>
e) With this PR and IMAGE_VERSION_SUFFIX_forcevariable =3D &quot;-release-1=
&quot;:<br>
<br>
$ ls -laih qemux86-64-YOCTO-12937-release-1/ | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
50735846 -rw-r--r--=C2=A0 1 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
50735852 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 12:59 .<br>
50742055 -rwxr-xr-x=C2=A0 1 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
50878352 -rw-r--r--=C2=A0 2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64-release-1.tgz<br>
50878352 -rw-r--r--=C2=A0 2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64.tgz<br>
50878353 -rw-r--r--=C2=A0 2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64.bin<br>
50878353 -rw-r--r--=C2=A0 2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64-release-1.bin<br>
50878359 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A022 Aug 15 18:44 bzI=
mage -&gt; bzImage-qemux86-64.bin<br>
51665406 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 12:58 core-image-mi=
nimal-qemux86-64.qemuboot.conf<br>
51665406 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 12:58 core-image-mi=
nimal-qemux86-64-release-1.qemuboot.conf<br>
51665432 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 12:58 core-image-mi=
nimal-qemux86-64-release-1.testdata.json<br>
51665432 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 12:58 core-image-mi=
nimal-qemux86-64.testdata.json<br>
51665434 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 12:58 core-image-mi=
nimal-qemux86-64-release-1.manifest<br>
51665434 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 12:58 core-image-mi=
nimal-qemux86-64.rootfs.manifest<br>
51665606 -rw-r--r--=C2=A0 1 bitbake bitbake 1.1K Aug 16 12:58 core-image-mi=
nimal.env<br>
51665615 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 12:59 core-ima=
ge-minimal-qemux86-64-release-1.ext4<br>
51665615 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 12:59 core-ima=
ge-minimal-qemux86-64.rootfs.ext4<br>
51665617 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 12:59 core-ima=
ge-minimal-qemux86-64-release-1.wic.vmdk<br>
51665617 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 12:59 core-ima=
ge-minimal-qemux86-64.rootfs.wic.vmdk<br>
<br>
f) With this PR and IMAGE_VERSION_SUFFIX_forcevariable =3D &quot;-release-2=
&quot;<br>
=C2=A0 =C2=A0and IMAGE_INSTALL_append =3D &quot; zlib&quot; added to force =
image to be recreated<br>
=C2=A0 =C2=A0while kernel is still reused from sstate<br>
=C2=A0 =C2=A0In this case I haven&#39;t removed TMPDIR between e) and f) to=
 show<br>
=C2=A0 =C2=A0that kernel artifacts are identical from previous build releas=
e-1 and just<br>
=C2=A0 =C2=A0added another hardlink to the same inode.<br>
<br>
$ ls -laih qemux86-64-YOCTO-12937-release-2/ | sort<br>
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..<br>
51665409 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 13:07 core-image-mi=
nimal-qemux86-64.qemuboot.conf<br>
51665409 -rw-r--r--=C2=A0 2 bitbake bitbake 1.3K Aug 16 13:07 core-image-mi=
nimal-qemux86-64-release-2.qemuboot.conf<br>
51665420 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 13:07 core-image-mi=
nimal-qemux86-64-release-2.testdata.json<br>
51665420 -rw-r--r--=C2=A0 2 bitbake bitbake 161K Aug 16 13:07 core-image-mi=
nimal-qemux86-64.testdata.json<br>
51665422 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 13:07 core-image-mi=
nimal-qemux86-64-release-2.manifest<br>
51665422 -rw-r--r--=C2=A0 2 bitbake bitbake 2.2K Aug 16 13:07 core-image-mi=
nimal-qemux86-64.rootfs.manifest<br>
51665583 -rw-r--r--=C2=A0 1 bitbake bitbake 1.1K Aug 16 13:07 core-image-mi=
nimal.env<br>
51665584 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 13:07 core-ima=
ge-minimal-qemux86-64-release-2.ext4<br>
51665584 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 61M Aug 16 13:07 core-ima=
ge-minimal-qemux86-64.rootfs.ext4<br>
51665585 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 13:07 core-ima=
ge-minimal-qemux86-64-release-2.wic.vmdk<br>
51665585 -rw-r--r--=C2=A0 2 bitbake bitbake=C2=A0 49M Aug 16 13:07 core-ima=
ge-minimal-qemux86-64.rootfs.wic.vmdk<br>
51666546 drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Aug 16 13:07 .<br>
51666553 -rw-r--r--=C2=A0 1 bitbake bitbake 612K Aug 15 17:16 grub-efi-boot=
x64.efi<br>
51666554 -rwxr-xr-x=C2=A0 1 bitbake bitbake=C2=A0 95K Aug 15 17:16 systemd-=
bootx64.efi<br>
51666555 -rw-r--r--=C2=A0 3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64-release-1.tgz<br>
51666555 -rw-r--r--=C2=A0 3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64-release-2.tgz<br>
51666555 -rw-r--r--=C2=A0 3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux=
86-64.tgz<br>
51666556 -rw-r--r--=C2=A0 3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64.bin<br>
51666556 -rw-r--r--=C2=A0 3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64-release-1.bin<br>
51666556 -rw-r--r--=C2=A0 3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux=
86-64-release-2.bin<br>
51666557 lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A022 Aug 15 18:44 bzI=
mage -&gt; bzImage-qemux86-64.bin<br>
<br>
The following changes since commit 64f9fd2a1ebfad102140801f8be8b8be33082d61=
:<br>
<br>
=C2=A0 quilt: added less to RDEPENDS list (2019-08-22 17:36:13 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> jansa/artifacts<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Djansa/artifacts" rel=3D"noreferrer" target=3D"_blank">http://cgit.op=
enembedded.org/openembedded-core-contrib/log/?h=3Djansa/artifacts</a><br>
<br>
Martin Jansa (6):<br>
=C2=A0 image-artifact-names: introduce new bbclass and move some variables<=
br>
=C2=A0 =C2=A0 into it<br>
=C2=A0 bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in<=
br>
=C2=A0 =C2=A0 the _LINK_NAME variables and change it to hard link<br>
=C2=A0 kernel-artifact-names.bbclass: use PR instead of PKGR in<br>
=C2=A0 =C2=A0 KERNEL_ARTIFACT_NAME<br>
=C2=A0 kernel.bbclass: imageType without {}<br>
=C2=A0 kernel.bbclass: drop unnecessary package_get_auto_pr for do_install<=
br>
=C2=A0 *-artifact-names: include version only in the artifact links<br>
<br>
=C2=A0meta/classes/buildhistory.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meta/classes/image-artifact-names.bbclass=C2=A0 | 15 +++++++<br>
=C2=A0meta/classes/image-live.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 ++---<br>
=C2=A0meta/classes/image_types.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 +---<br>
=C2=A0meta/classes/kernel-artifact-names.bbclass | 12 +++++-<br>
=C2=A0meta/classes/kernel-devicetree.bbclass=C2=A0 =C2=A0 =C2=A0| 21 ++++++=
++--<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 49 +++++++++++++++-------<br>
=C2=A0meta/classes/qemuboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0meta/classes/rootfs-postcommands.bbclass=C2=A0 =C2=A0|=C2=A0 6 ++-<br=
>
=C2=A0meta/classes/testimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ---<br>
=C2=A013 files changed, 97 insertions(+), 44 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/image-artifact-names.bbclass<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000004e182f0593fd5ba6--
