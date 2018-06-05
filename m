Return-Path: <cjp256@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 466A4754FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 14:36:06 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u4-v6so3691808itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=anxfnyxE5F/dZZqEzXMk5Od3MkCHa4UuaFpdHiNZbjo=;
	b=QofOSt3c/TGjTdqVfJowWs27EBCNPJL6NY0ZMGZ3guNlFwvFCG7HPC3Z73/DflrWns
	Drh01e41k+CC/hY9UvwDJDPktuNDwvxBIpT0yL73TiXodDziC9bXmegBOQJRNmUYUkwt
	bS4VB9vrBeI+OvJTMz70KyaJZNvW79ypjx8QNplPai6x6qAHHV07PmC2fa9sgpyJxVa7
	4ms6sEXplwI1D6rre6KD+NDAWt6mihakmjGdvm2GqJa7XI3INDUVQRz4aLOUygOhh6G3
	zvkDgLsTVDzEcUv36KxZd/JDAm/ocFC2aRfcUf/wJ9b4q4IYXCvlNi3X/wAd90uEOfXQ
	Kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=anxfnyxE5F/dZZqEzXMk5Od3MkCHa4UuaFpdHiNZbjo=;
	b=Cn72k139m0hGGvADKsqlU+JNDnC2dLewvi8MPtPmDqf7LP2+NovaUIbc2ymZHA0qhl
	N3+bPh37MWL78hYeIm2gfSqT8Vec0hN9BJUrWUhGPWVlLh6gHGd0FVtnbpjl2fW5ewyy
	w8vkR/SaxBp2yQCtI+XjgubRbagIzx9VbPOyX4mxZwq76Iy4G7K1fPwDk/Ts1wLocmke
	l0Q932AIjS8o+VWgSHV6lJZaf4F5ymqlqUOPEk2X7hJw+gHVK82x+tLnWCm5BMej9G9o
	HLVIBGg8J8C5VKioXgE2Zpcc7Ei0cTJKEbvX+ELBS5jfUe4Dfv1ihTgScPniSkT3qXEN
	/1aw==
X-Gm-Message-State: APt69E0rH5p7KZfmDvbIrHq35HJtqXmRF391JC+AxpXHkokT39MycrrV
	ZEgFN5HP6a8THv/l97vHdBoiEFq/aDbLX+FdFSMwVg==
X-Google-Smtp-Source: ADUXVKLhP/q3fct13MiM7m7hFjGRdhkH4v/aPB09nT7U3HLtIA6jT/OIICbJKXq+a88jAmtLHkt0sacwdQUYUJRg4Nk=
X-Received: by 2002:a24:754:: with SMTP id
	f81-v6mr19202271itf.11.1528209367114; 
	Tue, 05 Jun 2018 07:36:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:7111:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 07:35:46 -0700 (PDT)
In-Reply-To: <1526063923-32176-1-git-send-email-cjp256@gmail.com>
References: <1526063923-32176-1-git-send-email-cjp256@gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 5 Jun 2018 10:35:46 -0400
Message-ID: <CABZSBQeejuzPgb1LjjtqSvObDdC59nsHaB3FMsFmpQFoO+bvtA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [meta-oe][PATCH] strongswan: package up sbin debug files
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
X-List-Received-Date: Tue, 05 Jun 2018 14:36:06 -0000
Content-Type: text/plain; charset="UTF-8"

ping :)

On Fri, May 11, 2018 at 2:38 PM, Chris Patterson <cjp256@gmail.com> wrote:
> From: Chris Patterson <pattersonc@ainfosec.com>
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> index f2fe1f1..5cae6ac 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> @@ -46,7 +46,7 @@ inherit autotools systemd pkgconfig
>  RRECOMMENDS_${PN} = "kernel-module-ipsec"
>
>  FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
> -FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
> +FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
>  FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
>  FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
>
> --
> 2.1.4
>

