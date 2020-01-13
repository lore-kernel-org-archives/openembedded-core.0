Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 841 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Jan 2020 14:11:02 UTC
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
	[64.147.123.24])
	by mail.openembedded.org (Postfix) with ESMTP id A6A187FCDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:11:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 451844F5;
	Mon, 13 Jan 2020 08:57:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Mon, 13 Jan 2020 08:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=4VCukDoaJxfkyJ+YJmy4QkW+R6PDRdw
	vER6OxyH31+c=; b=C+lPnMhP+8Ra3RksWWeGSOIIFyabOvBKj4H5UsQSbbLhAVz
	ZCZJLyvQE124+5A9cAwhcgJEhsoo2eyJSvCue33oac5MSM6/C0kbprKdX29hOGpS
	QSfeeRFgZyNfmcVti6eD+ZWi6K7VkuRwWHvK7PlKNadKGHnPJJ5sIIy6h0OHWw5G
	8vxN7Sn/ny05HzJo6h3i3HQNx5ZYzIBa6iRUdskkRV+/SAlW4V1rfsIh3xriIkad
	WUgLbEfotbmzLWYiuRQ1k3061OX9yB9OJmnHVz8rtVecP0T/YZQdfIArOJmsWvzJ
	B8nG/kllksXR4NXFdDrww5dlApyl4YP28XZC1rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4VCukD
	oaJxfkyJ+YJmy4QkW+R6PDRdwvER6OxyH31+c=; b=lQWfCGu/hN4WpVGSUszTe8
	JLRPPGnBe/WR3ke1SpDPDzkEwm53sb/a7bxmiOT30JTwAqic8/Nv/h2isRVyjuXY
	n4qZd2thirwYyNXgMyD2uKiUWxeJEv5WB1FOuX9op7ieUJE+P0oDdRHe5KoTSiXY
	tZzvBAqS7B6TYQfejzikBtgCs4ZblT1ZmwwEGKzOU6yaaLca/NsRnb6O/YIpbSTA
	sAszetXVaQ40IyVPZpmawWpn0Ryp/BIDC9Owp5TAiMPlhoBuFj7/qp+HLk7Z32bI
	PZ6gCP9V+laQP+Y+VlozBlCTna8dA79g0jKcWfBP/Rl3TQsWkC+7J41rTiASIzOQ
	==
X-ME-Sender: <xms:K3ccXik_5noWSXNZtu2nyAun2VVU3DX2qd7DGa2xQxngy5IsVNoOJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejtddgheejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfrrg
	hrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:K3ccXuGvuJmV0gyw4pJkQ9A8Z-LE70JwbB2wPjaPKmyYzhxkMQZH6g>
	<xmx:K3ccXrr1vWTMjSWzm7YqpowwZC084PCyJWZXFcB0BIntz5xp4-prpA>
	<xmx:K3ccXq7FHXI5s2ngLDhnXECdQp2pSPtBQLK7-Qnw8BpMYn_YCHzjKw>
	<xmx:K3ccXhy5elLuP5iPEbnpJFFYdbC5oHQCE1VcpCmxeyokRVhBfvefbQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8D928E00A2; Mon, 13 Jan 2020 08:56:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <1f1224ce-2bd6-4895-8c6a-8c113ca14e81@www.fastmail.com>
In-Reply-To: <20200104200703.6758-1-maxim.uvarov@linaro.org>
References: <20200104200703.6758-1-maxim.uvarov@linaro.org>
Date: Mon, 13 Jan 2020 13:56:41 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Maxim Uvarov" <maxim.uvarov@linaro.org>,
	"OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Mon, 13 Jan 2020 14:11:02 -0000
Content-Type: text/plain

On Sat, 4 Jan 2020, at 20:07, Maxim Uvarov wrote:
> Linux kernel can be compiled as UEFI stub and loaded directly
> with UEFI firmware without grub or other UEFI shell.
> 
> Tested with wic file:
> bootloader  --ptable gpt --timeout=0  --append="rootwait"
> part /boot --source bootimg-efi --sourceparams="loader=kernel" \
>  --ondisk sda  --fstype=vfat --label bootfs \
>   --active --align 1024 --use-uuid
> part / --source rootfs --fstype=ext4 --label rootfs \
>   --align 1024 --exclude-path boot/ --use-label
> The same wic file for armv7, armv8 and x86_64.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py 
> b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 2cfdc10ecd..a39d852f6a 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -13,6 +13,7 @@
>  import logging
>  import os
>  import shutil
> +import re
>  
>  from wic import WicError
>  from wic.engine import get_custom_config
> @@ -204,6 +205,8 @@ class BootimgEFIPlugin(SourcePlugin):
>                  cls.do_configure_grubefi(hdddir, creator, cr_workdir, 
> source_params)
>              elif source_params['loader'] == 'systemd-boot':
>                  cls.do_configure_systemdboot(hdddir, creator, 
> cr_workdir, source_params)
> +            elif source_params['loader'] == 'kernel':
> +                return
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" % 
> source_params['loader'])
>          except KeyError:
> @@ -243,6 +246,7 @@ class BootimgEFIPlugin(SourcePlugin):
>              if source_params['loader'] == 'grub-efi':
>                  shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % 
> cr_workdir,
>                                  "%s/grub.cfg" % cr_workdir)
> +
>                  for mod in [x for x in os.listdir(kernel_dir) if 
> x.startswith("grub-efi-")]:
>                      cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, 
> mod, hdddir, mod[9:])
>                      exec_cmd(cp_cmd, True)
> @@ -252,6 +256,29 @@ class BootimgEFIPlugin(SourcePlugin):
>                  for mod in [x for x in os.listdir(kernel_dir) if 
> x.startswith("systemd-")]:
>                      cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, 
> mod, hdddir, mod[8:])
>                      exec_cmd(cp_cmd, True)
> +            elif source_params['loader'] == 'kernel':

How about "uefi-stub" instead of just "kernel" here so it's more explicit?

> +                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +                if not kernel:
> +                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % 
> target)
> +                target = get_bitbake_var("TARGET_SYS")
> +                if not target:
> +                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % 
> target)
> +
> +                if re.match("x86_64", target):
> +                    kernel_efi_image = "bootx64.efi"
> +                elif re.match('i.86', target):
> +                    kernel_efi_image = "bootia32.efi"
> +                elif re.match('aarch64', target):
> +                    kernel_efi_image = "bootaa64.efi"
> +                elif re.match('arm', target):
> +                    kernel_efi_image = "bootarm.efi"
> +                else:
> +                    raise WicError("kernel efi is incompatible with 
> target %s" % target)

Perhaps call this "UEFI stub kernel" instead of just "kernel efi" to make things clearer.

> +
> +                for mod in [x for x in os.listdir(kernel_dir) if 
> x.startswith(kernel)]:
> +                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, 
> mod, hdddir, kernel_efi_image)
> +                    WicError("cp_cmd = %s" % cp_cmd);

What's this WicError created here for?

> +                    exec_cmd(cp_cmd, True)

Wouldn't this result in the destination file being overwritten each time through this loop? I guess you're just copying from the grub-efi implementation above though.

>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" %
>                                 source_params['loader'])
> -- 
> 2.17.1

-- 
Paul Barker

