Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDB378C8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:28:28 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v66-v6so7000100pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S3/9SxiZuYF5oCiYo/+jtfX1zTv3kzLobkurYTV8vvU=;
	b=kg03oNyMsNxuoepJgTSnD0OToYSBCPeD3n89z0ecXJ4zQE42cS79Hf2Jp/iq3v7aUY
	lFYGLH92xdFKpxkfO1+e0HAnK2RNqrD7bVJdA0rvk11Yg509KISqga2wUn4ByBnDcFtj
	qjpUY41zAzjvc2Gz2TTXZSLFDE06Ca+d+1DWQ96GUUhK5Rb79KLpwrtlI85AYFajuz2Z
	CsLbnbNcrUpBw6nKPqmxjyZsQQ48FDtyAu4ZdRRGpYWvvWcYcCPoYtx6thuv8htJspkg
	XR1JwZB7Lcf+pzso2+HTN95EhwTLZz+ya6StHALDfXNe0eyO1B50yrHeGLE/VFMVtXX/
	VJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S3/9SxiZuYF5oCiYo/+jtfX1zTv3kzLobkurYTV8vvU=;
	b=K6koFJh+ikJjHhkc7fpXpnW2p9Wn+2eX9b9i9PeRBIyd2E7FlUpj+899UYB6E59soE
	IRX0gq2hhD2clJWfZdLSF8f5s3glO+Zo6+sYbPP95tl3fJ+G89K5CyJTce61ai6l6zwt
	RXdzp8Rjqj9g3RN8jgvMKdN4STYt3ytVtLufxsPlt4DWKJacF0Jj6Ci/k1nHgllnk4HE
	BsLfMki0n/ZUlUL5wrXteefm0jI99c5I3DYr4KOXkGVxemGhrdhxRR8wEHf5wlY/b/51
	E9xGU04sMQpXm5/8i6rcp3svR1Uxys6Z7IyECR9jZiTTePktSoHjluwiU7j3P2KIDT8c
	nU7A==
X-Gm-Message-State: APzg51DZ81TOLBZzya00VMomX99hX0F1Zlun3Vq07wsunX6clul+7s4k
	XarzAjBvEhnrdmozI4jyIKPunMN4kVQB7xz4BYo=
X-Google-Smtp-Source: ANB0VdaWfzBpcsfzkEXha9VdmD68bG/OtG2LEwCKfOjq9e9S/3jzFPrWxoYL5qMuIceq/y+LMHmpm/I39kTlQz0SPhg=
X-Received: by 2002:a63:2e09:: with SMTP id
	u9-v6mr8351541pgu.294.1536326909365; 
	Fri, 07 Sep 2018 06:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180727074130.19685-1-raj.khem@gmail.com>
In-Reply-To: <20180727074130.19685-1-raj.khem@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 7 Sep 2018 15:28:15 +0200
Message-ID: <CAAQYJAv5m+H=aOsG=C2f8fWvw-oqgbuTWfbjQprEe2XtZjkiHQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Fri, 07 Sep 2018 13:28:28 -0000
Content-Type: text/plain; charset="UTF-8"

What is holding back this patch?

Cheers
Andrea
On Fri, Jul 27, 2018 at 9:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This has been an opt-in for so long, some distributions e.g.
> poky-lsb uses it by default however, since most of linux
> distros have started to default to these settings for security
> enhancements, time has come for OE to make it default too
>
> remove documentation from advanced local.conf sample
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2:
> - Remove references to explicitly enabling security flags
>
>  meta/conf/distro/defaultsetup.conf   |  1 +
>  meta/conf/local.conf.sample.extended | 11 -----------
>  2 files changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> index ca2f9178d2..352e279596 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -1,6 +1,7 @@
>  include conf/distro/include/default-providers.inc
>  include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
> +require conf/distro/include/security_flags.inc
>  include conf/distro/include/world-broken.inc
>
>  TCMODE ?= "default"
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> index e698acb84b..7f107831ee 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -270,17 +270,6 @@
>  #COPYLEFT_RECIPE_TYPES = 'target'
>  #
>
> -#
> -# GCC/LD FLAGS to enable more secure code generation
> -#
> -# By including the security_flags include file you enable flags
> -# to the compiler and linker that cause them to generate more secure
> -# code, this is enabled by default in the poky-lsb distro.
> -# This does affect compile speed slightly.
> -#
> -# Use the following line to enable the security compiler and linker flags to your build
> -#require conf/distro/include/security_flags.inc
> -
>  # Image level user/group configuration.
>  # Inherit extrausers to make the setting of EXTRA_USERS_PARAMS effective.
>  #INHERIT += "extrausers"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

