Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id BBB5775512
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:06:52 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l10-v6so20518775wrn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NlR9KfiJsfj1IP7/hrgsSImyDz4bgvzp2Qy1cooWtfk=;
	b=mAU1dVxPhzTh5wyZYkUy/IrgpsL5KRJKV0z/SVg1omhMkfZXlGpMBFytJbh/NitkZT
	u9N6ZDLN/hF9lN+XLkbmfjteMQFmbUpjRTmukwWZZ+MKZ9siC8rkhK4sj1CtcPvSxxYb
	Npk7qPIdeMrLaA0hAkeHwQgPAJkdf9YYbrD3c3SvUnm4cxntBb7cn/C7RicUJM0ScAMA
	dHyxm+1yjlDH26pWi4KGitGbx24Inp8CUm5dKgh18Z1+FS3iYmeGbWoqttlTrK/KO5Gg
	quIAg+rAryP3CriU+YAqafqt73R7gUb5jP2kgc2DWCdQGRzA4Ukc2eAGu1BCGeqMUnSK
	ocZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NlR9KfiJsfj1IP7/hrgsSImyDz4bgvzp2Qy1cooWtfk=;
	b=BJfBeqBIv+sbqN+bV9CWYkKVUu8PDuMyXeQ53/2weAK+CocHM1Kw9QKRIS1Leu1js+
	qdun+c9eQouf+XfCstPnk/B0kBoyQPiokflRGZ5xWK4UQ7UtM9nBwiYWLrT+S4aesDnM
	+60f9GFmFPEievLq/PKWKhC6OMfXKEa5fGkmakmV/V4aGN26JHv51PvIzefbk6ucJGH8
	fSsJLUCLQttBtr0alifkctV4NnhOB1moBSzRE/c5H4rv37HXkZlwQ8OeNzJXFcHHqz7B
	c+FImHThgJTyyukU3sQqiLU16OsjZ6jdiwcy2S44Qx+dSJuLHl5NmVMuUiElHsKFMktq
	mSdA==
X-Gm-Message-State: APt69E2rVwUM21IZ3WXNGUytPu9BZ+zt2UqwrGq+T4MoUcNwdIQlcTLv
	18X49+inL0RdnXw+5EEsxd0njv/PRd4+M3Xi3DFftDk=
X-Google-Smtp-Source: ADUXVKJqxWWxih1X1BcmI54qsfXV5rCZco3ICjZSlADg8D5QRQUxAUciY2Xlfbx1dqPk4j07VZJjCIDH0rGlhgaGkik=
X-Received: by 2002:adf:f090:: with SMTP id
	n16-v6mr14954599wro.49.1529413613398; 
	Tue, 19 Jun 2018 06:06:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:3e0b:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 06:06:52
	-0700 (PDT)
In-Reply-To: <20180619114512.11699-3-richard.purdie@linuxfoundation.org>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
From: Paulo Neves <ptsneves@gmail.com>
Date: Tue, 19 Jun 2018 15:06:52 +0200
Message-ID: <CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Tue, 19 Jun 2018 13:06:53 -0000
Content-Type: text/plain; charset="UTF-8"

I support this patch and I see that one of the problems in sumo is
fixed, namely the HOSTTOOLS missing ip and ping.
Even so there is one HOSTTOOLS that is missing, ifconfig. As far as I
know the automatic network setup scripts of runqemu require ifconfig
for 192.168.7.1 tap setting. Without ifconfig the virtual machine
cannot be spawned.

Also, given the lack of the HOSTTOOLS in the sumo version i have, how
is this being tested?

I also would like to discuss the possibility of testing u-boot in a
virtual machine. I have a setup where I am able to pass to qemu,
u-boot.bin as a bios file, and then I am able to boot from tftp
enabled qemu network device. This allows for unification of test setup
of virtualized and real target booting. Do you have any integration
like this in the plans?

Paulo Neves

On Tue, Jun 19, 2018 at 1:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The TEST_IMAGE interface has never particularly worked and image testing currently
> gets configured manually.
>
> This reworks the interface to better serve the needs of its users, replacing it
> with TESTIMAGE_AUTO.
>
> This does away with the need for the separate class due to better bitbake APIs for
> changing tasks.
>
> TESTIMAGE_AUTO will automatically boot under qemu any image that is built. It
> also adds in dependencies so that any SDK for which testing is requested will
> automatically be built first.
>
> The code in bitbake.conf was error prone (e.g. testsdk wasn't considered), this
> improves it to standardise on IMAGE_CLASSES as the standard configuration mechanism.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image.bbclass          |  1 -
>  meta/classes/testimage-auto.bbclass | 23 -----------------------
>  meta/classes/testimage.bbclass      | 10 +++++++++-
>  meta/classes/testsdk.bbclass        |  5 +++++
>  meta/conf/bitbake.conf              |  2 +-
>  meta/conf/documentation.conf        |  2 +-
>  meta/conf/local.conf.sample         | 10 ++++++----
>  7 files changed, 22 insertions(+), 31 deletions(-)
>  delete mode 100644 meta/classes/testimage-auto.bbclass
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index c4fc457985b..24c1a983f3e 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -6,7 +6,6 @@ IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar(
>  IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
>  IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
>  IMGCLASSES += "image_types_wic"
> -IMGCLASSES += "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
>  IMGCLASSES += "rootfs-postcommands"
>  inherit ${IMGCLASSES}
>
> diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
> deleted file mode 100644
> index e0a22b773c8..00000000000
> --- a/meta/classes/testimage-auto.bbclass
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -# Copyright (C) 2013 Intel Corporation
> -#
> -# Released under the MIT license (see COPYING.MIT)
> -
> -
> -# Run tests automatically on an image after the image is constructed
> -# (as opposed to testimage.bbclass alone where tests must be called
> -# manually using bitbake -c testimage <image>).
> -#
> -# NOTE: to use this class, simply set TEST_IMAGE = "1" - no need to
> -# inherit it since that will be done in image.bbclass when this variable
> -# has been set.
> -#
> -# See testimage.bbclass for the test implementation.
> -
> -inherit testimage
> -
> -python do_testimage_auto() {
> -    testimage_main(d)
> -}
> -addtask testimage_auto before do_build after do_image_complete
> -do_testimage_auto[depends] += "${TESTIMAGEDEPENDS}"
> -do_testimage_auto[lockfiles] += "${TESTIMAGELOCK}"
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index c17a7c604b4..1be22f63047 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -10,6 +10,11 @@
>  # - first add IMAGE_CLASSES += "testimage" in local.conf
>  # - build a qemu core-image-sato
>  # - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
> +#
> +# The tests can be run automatically each time an image is built if you set
> +# TESTIMAGE_AUTO = "1"
> +
> +TESTIMAGE_AUTO ??= "0"
>
>  # You can set (or append to) TEST_SUITES in local.conf to select the tests
>  # which you want to run for your target.
> @@ -382,4 +387,7 @@ def package_extraction(d, test_suites):
>
>  testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
>
> -inherit testsdk
> +python () {
> +    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO")):
> +        bb.build.addtask("testimage", "do_build", "do_image_complete", d)
> +}
> diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
> index 2e43343643e..f12725cbab8 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -194,3 +194,8 @@ python do_testsdkext() {
>  addtask testsdkext
>  do_testsdkext[nostamp] = "1"
>
> +python () {
> +    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO")):
> +        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
> +        bb.build.addtask("testsdkext", None, "do_populate_sdk_ext", d)
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3b2ef9fb47c..c4dba61cc6b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>  "
>
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.data.inherits_class('testimage', d) or d.getVar('TEST_IMAGE') == '1') else ''}"
> +HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d)) else ''}"
>
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 3189dd39b72..fc6d008807b 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -415,7 +415,7 @@ TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux
>  TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
>  TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc' or 'musl'."
>  TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
> -TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
> +TESTIMAGE_AUTO[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images each time an image is built."
>  TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
>  TEST_SUITES[doc] = "An ordered list of tests (modules) to run against an image when performing automated runtime testing."
>  TEST_POWERCONTROL_CMD[doc] = "For automated hardware testing, specifies the command to use to control the power of the target machine under test"
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 17cdd7046e5..1ac4156b903 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -135,10 +135,12 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>  # Runtime testing of images
>  #
>  # The build system can test booting virtual machine images under qemu (an emulator)
> -# after any root filesystems are created and run tests against those images. To
> -# enable this uncomment this line. See classes/testimage(-auto).bbclass for
> -# further details.
> -#TEST_IMAGE = "1"
> +# after any root filesystems are created and run tests against those images. It can also
> +# run tests against any SDK that are built. To enable this uncomment these lines.
> +# See classes/test{image,sdk}.bbclass for further details.
> +#IMAGE_CLASSES += "testimage testsdk"
> +#TESTIMAGE_AUTO_qemuall = "1"
> +
>  #
>  # Interactive shell configuration
>  #
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

