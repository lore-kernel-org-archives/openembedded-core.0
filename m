Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id B392F7C039
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 02:43:21 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id g125so3626662qke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 18:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AEI3e1Ie8dl6h7ZHSl6UPzbz3HDrsG6Gp0k3v1+JbPA=;
	b=Y57J3I7dq3lNMZHqzK/QUBVVyX0Qo2FIEKcMl9wRI2SBWsW1wjjd1EGij88L5/pFir
	0BIOz+rLSDDxEFla4xMqjcmVCHjdGf9giKkYWKl6HTgO+SWbxkwSHSxV9SAxiKWFCQ4l
	Dnq0x9vYY+70hLOZ8szI/mFea71vgL3WgjUmAt5Il+ZfKVmTxKFI/u9bNS1TjL0371y8
	BDLWAOvinHIjhnyBGXMMr4nLXYYjBZ98OPqIRxNF0d1lzySdohrM8u5Hp5x6PRbzPyDt
	85TmSZEZ3m8O9NiFRfIx9RdXL/mAZGZq80y/QLLGx2OrqwcLHLztDfXi4ge+IyTyxUQv
	svUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AEI3e1Ie8dl6h7ZHSl6UPzbz3HDrsG6Gp0k3v1+JbPA=;
	b=TGki0Ah9LQdrnPrJtBKkZ5+QhO8Rx1dviudFP8JS6o8Bj+kKHSZs73ETiH7f4UeqQf
	+CNEk+XoQZLPXpw01Rhdjcyc/DUrL4P/I2wFDQuzu0fLNUbaP7KQgCT0GynkZTbgBhKD
	juGjMlmLN4FfwF5UnLrHbla2cn381Il/PdsLzwO3x/A/BOSqsb/x6V7+8A1rVB7T+4tl
	B5T0N40HTXXuK86gYsktycscnVhZbpDi84F3MJaU8kLD8uSWxkO5CMxEVFHSGOrr0vKi
	Mu1Z7nMcsPSDLLgko4RFeXa9zdOibqFvMffX5zTCh00t8WXg56e3ufx+8ADBl+TOawy4
	gvdg==
X-Gm-Message-State: AJcUukcxXyzdEQOsXmRCcMLGTF+ykT3IFFJLUrnRpT45qn+NfVmyJoZi
	/exdQz5JCWISIXiIDhv2Q8Z6Cv84f5CkMr3FiWQ=
X-Google-Smtp-Source: ALg8bN7oW2rR3vNFSDdKlo5D1MNzh65zKiX7ypBwfVtTVnmeNE/vYatTaYqDP/h2tDbMWOqIUzROKcEU1A8ldpFj+3g=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr3974522qke.2.1547001802484;
	Tue, 08 Jan 2019 18:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20190109000938.7899-1-alistair.francis@wdc.com>
In-Reply-To: <20190109000938.7899-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2019 18:42:56 -0800
Message-ID: <CAMKF1spHuA=F3-xL8nn5MiY_wS72ZG3zMs56+SvCWnOrWWexCw@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Wed, 09 Jan 2019 02:43:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 4:19 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-graphics/wayland/libinput_1.12.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/libinput_1.12.3.bb b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
> index 3d1ab59309..d3f34c5040 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.12.3.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "f266ff861a2e7a97e1402c4345e3547b900efde68adbd40e56403e2617
>  UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>  inherit meson pkgconfig lib_package
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "gui"

if you explain why, this should be default that would be helpful.

>  PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
>  PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

