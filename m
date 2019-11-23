Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6D227FCA4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 15:55:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so12251484wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 07:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4E3bh0/IqnSLOGbeqUox0hVm5eKp99WauXBRmArtOEI=;
	b=YhSt09Gj7ZptrB3N+gGZNIkG0ls4G/Z9KQK3bnQekKLmmiK3V6VDpBbQq33YaolMew
	DwtvWzaGmYd65tgmyQcw9eVrC0qx5G6sKK1XC6TGYhqHWvT8mfkuuXgPsDIlUXDgJNU4
	ADmYNxPqbQx2snyDEc9Blz7Vg4H2jZjIJ9jfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4E3bh0/IqnSLOGbeqUox0hVm5eKp99WauXBRmArtOEI=;
	b=sKYMy/HLGQIh8nMPJ8aK1N5bvKYWHKOgFLmNrM15PCEOWopxigLbrlxZAu5Vou9SfM
	noxpXWE29PytYbe7WBVkT+5TVdClkJHx3okycLKDJCapS/rWQTmllM8o+03K2Ww+t1sc
	k7SqBbeqPTIlKKi2liJ/TD3ob69YzGW+Ha7557xrtw+phwV5qxXOvytkzS3eDc/nmVe4
	yTm8WcgcAVACrucKCq8mZgAi659YpMosI4xBllW6Pc6TT8vx8CHiUdEkuCMeVQJSeVYC
	03qmHhpqj2FPpiTI3oshHe2v16ZFe1cKAomfBO1WKDf6b0V5yZQU8Vr6BYPbug+j529z
	qs5A==
X-Gm-Message-State: APjAAAWXjQpYKECxOS9b8UZiC2ycLHWaTHG2+3cPLr4aQNl9apyoBJoT
	NonSGQacrm5AS5R+tIKKzSX5dQ==
X-Google-Smtp-Source: APXvYqxI+6Z66h7fdeo1haNtohu+HE54fKVwaQX4KlljJd8qMryVT/EfrSj43xswvFrLtY2oTJ2OMg==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr24404724wra.194.1574524530563;
	Sat, 23 Nov 2019 07:55:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z4sm2377127wmf.36.2019.11.23.07.55.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 07:55:29 -0800 (PST)
Message-ID: <b4e27afa9809fe3d43362b270415841bf7df4266.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 15:55:28 +0000
In-Reply-To: <1574439782-29100-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1574439782-29100-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574439782-29100-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] kexec-tools: upgrade 2.0.19 -> 2.0.20
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
X-List-Received-Date: Sat, 23 Nov 2019 15:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-22 at 08:23 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../kexec/{kexec-tools_2.0.19.bb => kexec-
> tools_2.0.20.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/kexec/{kexec-tools_2.0.19.bb => kexec-
> tools_2.0.20.bb} (95%)
> 
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
> similarity index 95%
> rename from meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> rename to meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
> index c3f7435..b79e33b 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
> @@ -21,8 +21,8 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-
> ${PV}.tar.gz
>      file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-
> arm.patch \
>  "
>  
> -SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
> -SRC_URI[sha256sum] =
> "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
> +SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
> +SRC_URI[sha256sum] =
> "cb16d79818e0c9de3bb3e33ede5677c34a1d28c646379c7ab44e0faa3eb57a16"
>  
>  inherit autotools update-rc.d systemd

Fails to compile:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1264

i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
-fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-
security -Werror=format-security --sysroot=/home/pokybuild/yocto-
worker/pkgman-non-rpm/build/build/tmp/work/core2-32-poky-linux/kexec-
tools/2.0.20-r0/recipe-sysroot -fno-zero-initialized-in-bss  -Os -fno-
builtin -ffreestanding -fno-zero-initialized-in-bss -fno-PIC -fno-PIE
-fno-stack-protector  -I../kexec-tools-2.0.20/purgatory/include
-I../kexec-tools-2.0.20/purgatory/arch/i386/include -I../kexec-tools-
2.0.20/util_lib/include -I../kexec-tools-2.0.20/include -Iinclude
-I/home/pokybuild/yocto-worker/pkgman-non-
rpm/build/build/tmp/work/core2-32-poky-linux/kexec-tools/2.0.20-
r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../lib/i686-poky-
linux/gcc/i686-poky-linux/9.2.0/include  -c -MD -o
purgatory/purgatory.o ../kexec-tools-2.0.20/purgatory/purgatory.c
../kexec-tools-2.0.20/kexec/arch/i386/kexec-x86.c:39:22: error:
'multiboot2_x86_probe' undeclared here (not in a function); did you
mean 'multiboot_x86_probe'?
   39 |  { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
      |                      ^~~~~~~~~~~~~~~~~~~~
      |                      multiboot_x86_probe
../kexec-tools-2.0.20/kexec/arch/i386/kexec-x86.c:39:44: error:
'multiboot2_x86_load' undeclared here (not in a function); did you mean
'multiboot_x86_load'?
   39 |  { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
      |                                            ^~~~~~~~~~~~~~~~~~~
      |                                            multiboot_x86_load

(and more)

Cheers,

Richard


