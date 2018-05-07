Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0926774E47
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 23:19:26 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id i185-v6so13347621vkg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 16:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x4/j32e49S7CXP9ggJ6KcUyQPbfAKm9io65LEXZ4qM4=;
	b=gETnLIvtKZ9qqFT0sFmtUTTwnTz1WaewxKXXfi4FA2egdDV2U656H/OoGPWA21MXrY
	ZpxU27c74dT61ErKMaWD06tO9soREjiUWyB1VdDsMNbna718VLQN+c4eiZoc+vnBHdrh
	+nwsAxcva7O6iL18+LZReI0KhaSLDPqIZbMG1mF0hKbyNtwlmtBr4v2cVgYzzoM8KCoS
	zZ+/zH8PZhuk+1qORjbnPVdGNKY7vdTttU8aw7kkhFbfvu5lldOsD8aq8gOErXeF7utn
	aJQby9coksgxcdT/sUfs1UUIVC3m/mABRVir9YaH/KvseNw0tPGKz/iLj64vQpW/Dx9A
	JWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x4/j32e49S7CXP9ggJ6KcUyQPbfAKm9io65LEXZ4qM4=;
	b=IsULOtJxJxT0NcqsfMcQl2qeMCOKC06emUD61BEg4m5lnhzR+lMDIoqozdfm4oc1+W
	bG9ouHCQmHWmk+D2XwUCGAiJak8db0hpVSUMR5Wru+gaPbaBernJd57p9aO3hh2GkaI9
	wUvcxCUWRxZseGWmLGTdc7KdIJx443M+W3g3Dg6MlnvTgn1VPxf8oejNAtLFjZuH+g4c
	2d1vLWxICfv+0P3e9prkgoRr1oYEgtP0nNR2iXgeSpM5Kukos3lPcKmZBfOA9SzxL5GR
	B36hcAkSaFYIFyP09s386ldwTXXUHzRzwot3jdjO168yemtp6W99yUQWfAAu1NZjvt5c
	4mVw==
X-Gm-Message-State: ALQs6tDjTkES+merynAl5mHhNokx+O7SQWNd5FMOtabR+WYYwvxUmJiQ
	ufvKeKQZ/SVWhBFvufQwNqkyzWa3QHGisVDE+W/qug==
X-Google-Smtp-Source: AB8JxZo0KCEGAMXXyMi8hIQhGT6Gk6Gy/H9gZZoqadY6eP/1Zxq6MdwUO1FcnajE3SR1TceaPIq5NAtFl0+uLZkxkig=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr32368605vke.5.1525731626344; 
	Mon, 07 May 2018 15:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Mon, 7 May 2018 15:20:25 -0700 (PDT)
In-Reply-To: <1525729814-24709-1-git-send-email-alejandr@xilinx.com>
References: <1525729814-24709-1-git-send-email-alejandr@xilinx.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 7 May 2018 15:20:25 -0700
Message-ID: <CAJ86T=Uw1Rgu=96qh0eMFbJLvwv0OL4WjY8u98ZCxCLpHeQDVg@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tclibc-baremetal: Adds virtual/crypt to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 07 May 2018 23:19:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2018 at 2:50 PM, Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> When trying to build meta-toolchain using TCLIBC =3D "baremetal"
> bitbake throws an error due to a mising dependency:
>
> ERROR: Nothing PROVIDES 'virtual/crypt'
>
> glibc PROVIDES virtual/crypt but was skipped:
> PREFERRED_PROVIDER_virtual/libc set to musl, not glibc
> musl PROVIDES virtual/crypt but was skipped:
> PREFERRED_PROVIDER_virtual/i586-poky-elf-libc-for-gcc set to baremetal,
> not musl
> libxcrypt PROVIDES virtual/crypt but was skipped: Recipe only applies in
> nativesdk case for now
>
> This is caused by the changes on commit:
> 29f65bda6d2c9fea4adb125c4857ee64f9312b9f
> nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
>
> This is where the concept of virtual/crypt was introduced.
>
> This patch adds virtual/crypt to ASSUME_PROVIDED on tclibc-baremetal,
> providing the missing wiring to build meta-toolchain on baremetal
> correctly.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com=
>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
> index a8ce6d3..8d570f0 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -8,7 +8,7 @@ LIBCEXTENSION =3D ""
>  LIBCOVERRIDE =3D ":libc-baremetal"
>  OVERRIDES .=3D "${LIBCOVERRIDE}"
>
> -ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv"
> +ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv virtual/crypt"
>
>  PREFERRED_PROVIDER_virtual/libc ?=3D "musl"
>  PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"

Not directly related to this fix, but why does tclibc-baremetal.inc
set PREFERRED_PROVIDER_virtual/libc to musl?

> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

