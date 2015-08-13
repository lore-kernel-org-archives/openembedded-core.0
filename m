Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1E948766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 20:34:22 +0000 (UTC)
Received: by iodt126 with SMTP id t126so65051597iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zUeDQ05KszvQVTGAcgMKyoXyOOfLwyl9Q6Aw0kbKf80=;
	b=qb//q5A/w7AvmEYUv8aZQcX8LvwDjvXTfYgkx+NDFSvQPCCpt/RU4yPUq4e8UX9KUo
	tt9BraYTwlL18Oj9IRkceiO+ZHHDOUENog7wfZg5ZFUJUMbT6xbSixtw7zlg+Jb+4XpC
	Ur1rg0dmRPE7QL2/cLeqtbHGQ4yfCesYhGWLs8LejvXZjSDReqzfSc9kMzoaMoC31E7h
	tCV6FXx8BWawNc3tsxYnm7LMBOWvIhv0gvGAIr+kFHszUBrgGIIKGUric3ACNAKW5h1V
	2k1WU5WLG33zNgTpsbkrHWEigCxtfU0JYGltLW2FmFoEFplc1bVu8dqFAzKh2X2Y1/28
	mJLQ==
X-Received: by 10.107.14.203 with SMTP id 194mr45591189ioo.195.1439498062964; 
	Thu, 13 Aug 2015 13:34:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 13 Aug 2015 13:33:53 -0700 (PDT)
In-Reply-To: <2bf92dbc892c01e163e1275bbd13d5bdedd4d071.1436781811.git.liezhi.yang@windriver.com>
References: <cover.1436781811.git.liezhi.yang@windriver.com>
	<2bf92dbc892c01e163e1275bbd13d5bdedd4d071.1436781811.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2015 13:33:53 -0700
Message-ID: <CAMKF1so5vLjc=jgQuPcBZ5fPqZBafq3Drr=pix963ZpX_cn-kA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] glibc: remove invalid ac_cv_path_KSH
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
X-List-Received-Date: Thu, 13 Aug 2015 20:34:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 13, 2015 at 3:04 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> There is no ac_cv_path_KSH in configure, can't find it
> in config.log after remove, either.

starting 2.21 ksh checks has been removed so this patch is ok.

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index da56bc9..74ad0b5 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -52,7 +52,6 @@ REQUIRED_DISTRO_FEATURES = "${DISTRO_FEATURES_LIBC}"
>  LEAD_SONAME = "libc.so"
>
>  CACHED_CONFIGUREVARS += " \
> -  ac_cv_path_KSH=${base_bindir}/bash \
>    ac_cv_path_BASH_SHELL=${base_bindir}/bash \
>    libc_cv_slibdir=${base_libdir} \
>    libc_cv_rootsbindir=${base_sbindir} \
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

