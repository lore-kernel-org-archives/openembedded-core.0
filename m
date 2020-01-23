Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id C1DA96BCD6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 19:49:50 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x18so2576988vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 11:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CliO/YyFEgTpgkohwyJS2P/SJqlqmjjqpJcuELXN2AQ=;
	b=EuRX8EVqfPmxdKEZzcce4W22/qyMi3U/FqaTqPr3Buge+mMqNIeNUl8w2FTGRPvON3
	P43h9BsfIC6tQbUUDFbm/y+DFXGMjjV5PI3gDshBQDkCE5+/sVSY9qCOl+Go+GgnOiS+
	PKPzIrp7IWCFk1Bgqgs6XdbtKs4tXkEvqGqsTtPDM4x/oNi9VUJtonQQlpqptEuRKW3N
	OhqszGUQznwFvPCukQiCwsNPZRpv2VEfWfAllFSSjnsX4TWJvBaQ63EHG3k3fzfkFsTg
	oqmQXDBKtFJoyMONOP1iuLA3VZ2dawxVESTgGAwTGcDlHP8YUfSUpfKl5zUz0BtXTGa3
	DdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CliO/YyFEgTpgkohwyJS2P/SJqlqmjjqpJcuELXN2AQ=;
	b=q1WRsSwbaXUmQ6YKRFKl+WepGyXJkdT2sj26/QVt4vh05AZjd3ALOi0thVP6jixhZ5
	tiKZPwPyPcMccdZTzl96gO5wVof0tlcDIMH4f41fPb1LPCLqblsgEhUgFcGK4Fu6NgPX
	o6fQwgGEnWJorM8KzwDp27Ka8/MxvOshG8H/t49EuZ2KPO4+zBo68bsXDsnroy2iuNVa
	XfwXfbw0XtFg0OGhZ7Ihv381jRcmNWGTC/nipzS3iZt9aAtiScahOpNknVM9QeNpG7w0
	irgcaptFg/lF6Klhltvon4bYndrJcOU78KByaxQ8u01TU5ERGtAQXdfk1B5GJHROT7bh
	8tJQ==
X-Gm-Message-State: APjAAAWhO9cmGRe0RxlaKHJ/ehB+B6ATYk5krPdnODxXHqKNB3JEtA0Q
	OAH9VWHm0vb9m5a+eLgmUSw4Hy2TxeGMOBDIveI=
X-Google-Smtp-Source: APXvYqw/tktBpRk+LsjijO0Mnie6Wf4AA+niC/qLwngJkv01SdiIz68ub8DThZj/T+4tjfHAg/igQqFgCfEDD/pbNeA=
X-Received: by 2002:a67:e443:: with SMTP id n3mr7641550vsm.137.1579808991508; 
	Thu, 23 Jan 2020 11:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20200122144548.5723-1-ross.burton@intel.com>
In-Reply-To: <20200122144548.5723-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Jan 2020 11:49:38 -0800
Message-ID: <CAJ86T=UOiaA6=grPykqPKj-NMaXKNFXo_TBczV5i1m5TmN_UEw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] packagegroup-base: only pull in dosfstools if licensing allows
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
X-List-Received-Date: Thu, 23 Jan 2020 19:49:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 6:46 AM Ross Burton <ross.burton@intel.com> wrote:
>
> packagegroup-base-vfat RRECOMMENDS on dosfstools, but this is GPLv3 so
> may be blacklisted.  Respect INCOMPATIBLE_LICENSE and don't recommend if
> GPL-3.0 has been blacklisted.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 1f802da09b7..3476db09c35 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -168,7 +168,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
>      kernel-module-vfat \
>      kernel-module-nls-iso8859-1 \
>      kernel-module-nls-cp437 \
> -    dosfstools"
> +    ${@bb.utils.contains("INCOMPATIBLE_LICENSE", "GPL-3.0", "", "dosfstools", d)}"

Should this be using incompatible_license_contains() instead of
bb.utils.contains()?

>  SUMMARY_packagegroup-base-alsa = "ALSA sound support"
>  RDEPENDS_packagegroup-base-alsa = "\
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

