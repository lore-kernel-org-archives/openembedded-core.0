Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 11A9F755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:19:52 +0000 (UTC)
Received: by ykba4 with SMTP id a4so49584452ykb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XQq8/pURJPsuZ1YHhve+qAyo1kMW+JPaYayDst3cotU=;
	b=Ee5OSdrM/3dF5V46CTqZshfxA4KFnUE4HGAfI0Sj7LUP8tNid05erNgn9GxNHT1HGo
	gf1aGFWs8w0lqEMFSpyz6bVQEAvIqOhfSvRTk8BWsVSBK25oaEsvdj1ha9XJ7qX3eJeo
	giB7fxHL2/M6Tko/E+NWyk4NBJ/w4COMtWfiY8GjyHMvi8ml64B1CYacqT9PBpnkSeDy
	jn0ckBr9fGqLYVMgBFP12gkCZxW5qLj+Z70cAG159hIUm/eWDqnOhIzjGgfCUiTQFgbj
	2BuLvfouOXJpkdEhBzdXWL9lQJibOBWW7OM5edTcCoFtVmitJjkwV2UAG7x+0TrDo83i
	lCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XQq8/pURJPsuZ1YHhve+qAyo1kMW+JPaYayDst3cotU=;
	b=Cq4UUfE2HlM4fiRu4nmJ3CumoZqjbgCsBPuAXGXoP0eowAR1g3ZBXmjOVoYvlRq9v/
	ATbx363tKzqYJ65j8wyHbi/G9Uyoj8RUgjORpE4Ni/2sECWcw3s/+dHkm/LXzQucEzj/
	ZCG3orCcFB+ybRqmdBNjIPV45wl5JNUxpqoU6+8Bt/+t61EdA/hrB+sCmu5o120TTCZn
	rqt1kUnbIdz79sqOu+bE9TDLnJBaPv7Y7afPrRWUZwsuIMaSy0a3MIMEDGAz9DTMpUPb
	jU9uHKsSdi65pNjj9bXX8v4UL+VkIN5Hxk7GNM7sGRMjkFDsdqzDP/aF8iNp5a8ht6xP
	IBzA==
X-Gm-Message-State: ALoCoQnxRrZMP3610zRnb7xiNQ1LVkVAk4cKIewzlqYICTf5/+a2ZX9bDGUUv0sqOXL+0Spv3MAE
MIME-Version: 1.0
X-Received: by 10.129.33.65 with SMTP id h62mr2333012ywh.296.1446139192501;
	Thu, 29 Oct 2015 10:19:52 -0700 (PDT)
Received: by 10.129.148.132 with HTTP; Thu, 29 Oct 2015 10:19:52 -0700 (PDT)
In-Reply-To: <CAFoFrHaiWeGDoRqDAqnKdKy30d+NihfsrvgT4z06F+8OZV0ApA@mail.gmail.com>
References: <CAFoFrHaiWeGDoRqDAqnKdKy30d+NihfsrvgT4z06F+8OZV0ApA@mail.gmail.com>
Date: Thu, 29 Oct 2015 22:49:52 +0530
Message-ID: <CAFoFrHZEFPucHjumrwKE4zs+n8EjcE3hJC_k2SotcrUwr6fphw@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: randy.e.witt@linux.intel.com
Cc: Matt Fleming <matt.fleming@intel.com>, "Neri,
	Ricardo" <ricardo.neri@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>,
	"luv@lists.01.org" <luv@lists.01.org>
Subject: Re: luvOS yocto based project - "hvc0" respawning too fast
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
X-List-Received-Date: Thu, 29 Oct 2015 17:19:55 -0000
Content-Type: text/plain; charset=UTF-8

+OE core ML

On 27 October 2015 at 16:17, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Hi Randy,
>
> The luvOS project is based on luv-yocto frame work.  I have built the
> luvOS project for AArch64 architecture using qemuarm64.conf machine
> configuration file and boot the luvOS image on QEMU machine (used
> latest QEMU git repository image i.e. qemu-system-aarch64 QEMU
> v2.4.50)
>
> I am facing the following issue on the console "INIT: Id "hvc0"
> respawning too fast: disabled for 5 minutes"
>
> ...
> .....
>     [-] kernel-efi-warnings
>       [+] EFI_BOOT_SERVICES_*_illegal_access... passed
>
> Ran 3 testsuites and 64 unittests, 53 passes, 15 fails, 3 skipped.
>
> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>
> INIT: Id "hvc0" respawning too fast: disabled for 5 minutes
>
> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>
> qemuarm64 login: root
> root@qemuarm64:~#
> root@qemuarm64:~#
>
>
> Can you please let me know how did you tested this patch on QEMU and
> what are the parameter's you have passed for command line ? Can you
> please help me to overcome from the above issue ?
>
> I am using following script to launch the QEMU -
> https://wiki.linaro.org/LEG/Engineering/luvOS#How_to_test_luvOS_image_on_QEMU
> and I can see the below patch introduced the hvc0
>
> [nareshbhat@Lenovo luv-yocto]$ git show f44e043c752470b1ed4d22f3732dc0b362f83fd9
> commit f44e043c752470b1ed4d22f3732dc0b362f83fd9
> Author: Randy Witt <randy.e.witt@linux.intel.com>
> Date:   Thu Aug 27 19:42:43 2015 -0700
>
>     qemuarm64.conf: Make the second serial console /dev/hvc0
>
>     Since the qemu for aarch64 must use a virtual console for the second
>     serial port rather than emulating actual hardware, make sure the correct
>     device is specified so that a tty is actually started.
>
>     (From OE-Core rev: 5b720a69f0d181ab2de6032a6e3f5a0ee4a14302)
>
>     Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index 7bbdad7..8459d0f 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -9,4 +9,4 @@ MACHINE_FEATURES = ""
>
>  KERNEL_IMAGETYPE = "Image"
>
> -SERIAL_CONSOLES = "38400;ttyAMA0 38400;ttyAMA1"
> +SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
> [nareshbhat@Lenovo luv-yocto]$
>
>
> Thanks and Regards
> -Naresh

