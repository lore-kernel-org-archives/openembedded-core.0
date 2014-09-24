Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id ECE6F60144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 21:54:06 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id k15so3743139qaq.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 14:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VCwoB6Q0/edW9i+KdqvDJ9wnYJg7FhABT389nHxbPWM=;
	b=J8XQW/nVovOZr1WQtfxfAvPftdGookKDixyplA2eI8JqGnutcDAxuem0ZyvDEzMtZC
	YaFX2aGUqFQ88EBZktK2jqzJNp7MBRAYftOf4z+ckvoMUAOBLrzUp36ev8N+fV3E+NIM
	dSWTkfb/GS09ew+el9iN46jEkIgZRtzKaCMiDgWr5gkbcrXzGvUWVTwzQ1BtI0cQCMnh
	+u8s/iSYpun1Ge4PjprSjJsxczv4eFTGhvmXjv0Lf/6vIRRfUZbGc5KrWafavCLBjE5Z
	kSSwSQGEPHPMt2sG+mxVV+sCx3UYr2u976oAQBB74CY0xDqBhJQ3zZQDLwcT9bk2qP4m
	GdeQ==
X-Gm-Message-State: ALoCoQmaXkb1XPNb1mny3Mrq61Bv8FuRYkaNvCsQqMg4+ilqsz2CBGCXKY+eza7CtxkrdKgz/OpP
X-Received: by 10.224.103.65 with SMTP id j1mr13517548qao.17.1411595647195;
	Wed, 24 Sep 2014 14:54:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 14:53:47 -0700 (PDT)
In-Reply-To: <cover.1411572129.git.hongxu.jia@windriver.com>
References: <cover.1411572129.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 22:53:47 +0100
Message-ID: <CAJTo0LYMRuVfx5poDJuNRdu5TPaLBTtgsJLLXJrB_G8e4ur-3Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 0/4] man/info: fix not support xz/bz2 compression
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
X-List-Received-Date: Wed, 24 Sep 2014 21:54:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi Hongxu,

This is failing for me, core-image-minimal for NUC with doc-pkgs:

Collected errors:
 * check_data_file_clashes: Package util-linux-doc wants to install
file /data/poky-master/tmp/work/nuc-poky-linux/cor
e-image-minimal/1.0-r0/rootfs/usr/share/man/man3/libblkid.3.xz
        But that file is already provided by package  * e2fsprogs-doc
 * check_data_file_clashes: Package util-linux-doc wants to install
file /data/poky-master/tmp/work/nuc-poky-linux/cor
e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/findfs.8.xz
        But that file is already provided by package  * e2fsprogs-doc
 * check_data_file_clashes: Package util-linux-doc wants to install
file /data/poky-master/tmp/work/nuc-poky-linux/cor
e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/fsck.8.xz
        But that file is already provided by package  * e2fsprogs-doc
 * check_data_file_clashes: Package util-linux-doc wants to install
file /data/poky-master/tmp/work/nuc-poky-linux/cor
e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/blkid.8.xz
        But that file is already provided by package  * e2fsprogs-doc
 * opkg_install_cmd: Cannot install package util-linux-doc.

NOTE: Running intercept scripts:
NOTE: > Executing update_info_dir intercept ...
/data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir:
line 63: /insta
ll-info: No such file or directory
/data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir:
line 63: /insta
ll-info: No such file or directory

Ross

On 24 September 2014 16:27, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Changed in V3:
> - Remove Debian-specific code
> - split() the INHERIT variable
>
> Changed in V2:
> - Conditionally add 'gzip/bzip2/xz' to man/info's RDEPENDS
>   rather than modify busybox's defconfig.
>
> - Refer Ubuntu to add a script to postinst_intercept to
>   run it after all packages have been installed at build time.
>
> Test Case:
>
> vim local.conf
> ..
> IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info info-doc"
> INHERIT += "compress_doc"
> DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
> ..
>
> bitbake core-image-minimal
>
> runqemu qemux86
>
> On target,
> ...
> root@qemux86:~# man man
>
> root@qemux86:~# info info
> ...
>
> //Hongxu
>
>
> The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:
>
>   build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib hongxu/fix-doc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc
>
> Hongxu Jia (4):
>   scripts/postinst-intercepts: add update_info_dir
>   texinfo: fix QA Error while doc compress enabled
>   texinfo: fix info not work
>   man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
>
>  meta/recipes-extended/man/man_1.6g.bb        | 13 +++++
>  meta/recipes-extended/texinfo/texinfo_5.2.bb | 68 +++++++++++++++++++++++-
>  scripts/postinst-intercepts/update_info_dir  | 77 ++++++++++++++++++++++++++++
>  3 files changed, 157 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/postinst-intercepts/update_info_dir
>
> --
> 1.9.1
>

