Return-Path: <net147@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 286D6782E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:42:44 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 185so14359933itv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VSg2NRB5F2EhNTd9v3QHzRAmuGamoUG8ZiPAWAm9lSc=;
	b=c0XM8Cjozpc7iljOUvlnWlmzcnXUIMf/lSY3bvz1zIMH4Hu6btWxzn4SHCgwjfanFk
	p/7uRvaMctSz27FnsvDfwtKmaAkypMcPfAXnrNDCay6EkRJsArbJPgnhd8nBHVOm8Vf+
	6Y727RMLbpUcakcvU62MLrvwm+Q5xGf1jQ0HUy2SJWIMhXd1GjWUVduQDJ2nnW0tBXaH
	WEU9AB740L1acqVbrxmcuTxfpDfJSaXJqH0UaDhgIjwQ8KBCXq1JSXxwr1jjXPT5AY6u
	HizJMX2lRkM3xEm9c+LYkDJ0/C2QvnrECZEp4J+O+bdr9ZV1e3PmmiKnmQzd05kxbCRu
	n/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VSg2NRB5F2EhNTd9v3QHzRAmuGamoUG8ZiPAWAm9lSc=;
	b=I7pN4G0zpy825lyLhJQ3NE1Qcu/StlJ0DcupofBQ04BzFQQjBeoNrXlJYyEiBY2i/k
	JIRF2CJe+2u8zx1j1Nmc8JbTpRyA5OjbY0h4mjlLECuaKBeNTsocHhaglnyrWeRR+MYj
	TvRbMKcXzsm0VkVV8AI4IQqhkwuMcfMrVXFdPZEcQ5U91Q+MguxbdLVVOuf7Z+gfxsvE
	O1UMCHnQusSFdNgnjnExW5H/vc3cGIS5W0n+yH9FdxLnvLTpfkCDs5pIWsdnXIllHRxz
	2OZhJC/dC+kF08g4Wq2Sc0lvh/ihDjqJ8KHGdPBucWXS1RJmr2I/V8qRBfizd3xneszJ
	vkHw==
X-Gm-Message-State: AKS2vOzeufUqPiHVuQxJcRWyoMPRAi4G1QEl+magAOEqCDnY1sDaNGMY
	FZQsg3659ylnpmFldYu+Av2IKVmW4g==
X-Received: by 10.36.222.194 with SMTP id d185mr479954itg.111.1497436965871;
	Wed, 14 Jun 2017 03:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.131.68 with HTTP; Wed, 14 Jun 2017 03:42:45 -0700 (PDT)
In-Reply-To: <20170605235952.16856-1-net147@gmail.com>
References: <20170605235952.16856-1-net147@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 14 Jun 2017 20:42:45 +1000
Message-ID: <CANwerB1QqCKneUPuFbjKSNMf++der72-11B_Ad-MzaG+xN2d2w@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Wed, 14 Jun 2017 10:42:45 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 09:59, Jonathan Liu <net147@gmail.com> wrote:
> If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-config
> to HOSTTOOLS to allow access to the host sdl-config.
>
> (From OE-Core rev: eeb248c1a017e07e36b6fbaafe45006e3869f41a)
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e4f4bbb56..3ad905c917 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -471,6 +471,9 @@ HOSTTOOLS += " \
>  # Tools needed to run testimage runtime image testing
>  HOSTTOOLS += "ip ping ps scp ssh stty"
>
> +# Link to sdl-config if using host SDL
> +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
> +
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
>
> --
> 2.12.2
>

Bump.

