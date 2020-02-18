Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id CAD726101C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 20:52:38 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id t12so13642887vso.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 12:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uKgoDnIZZtYVdd/r5D5mw7anEuryrSS9Y4eKHci+TMw=;
	b=CXrPmtlZo6wlsdV2TYqrWCUBlsqyaOO4bNzLU/FLHtvvXZCT9AhN4HWHL2R1RX6gpQ
	PLhcyQJRQuFxvD5toFODaFltUYt4TgLKYl2/LpTrCnI89jHzLf0MX2rwcmFcTll29R4G
	Np9cI8TEOMX3a2WhMe9RIB3p99Tvxe/ZQZ7gtV++RhmDnGOP8tM33raJ9jsF+4MPP1Ee
	NxQ/vs+kAlIFa/qX6lD66rUhprXATIZ39QMsEuvopGz3SHOPf4oNxdXGJdqPRVcffkHV
	inmpvBvHIBuA4M6hFRCEqnHhPhdU8HrKR3wx4a3IjCH8yZ1NJARG/ly6h3WKzleJlKMS
	wEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uKgoDnIZZtYVdd/r5D5mw7anEuryrSS9Y4eKHci+TMw=;
	b=BuLF6/vyiCsGROZztTdwwWs0jVE099RHHC0YCLXa7f07fVF2b9m926RoxxxZTCIVga
	D/doB4yjPEy8ZIsDc4pblW1BEeQ/dkj9589wXuXss9T2JuVA9sIKS0TOG2erWq59XoSi
	7EGpCDKed5L6MJhX6gIzAugZNz7OT6AMdX13YkK3bjaUhwAkMfSm2SX8D8rMU3IUZBpD
	nacQrs+vJP9XdYPwHUNoySFQ107pTBIA5R67etjAZhHNJuhIqDjtuFGGDRrD5flA8Tdi
	2l00wEmfZKe/1AwlZU+AlvdpyrjtqIHbjr9MFTedT9ia+VsoOWHTAAM53pNXZdPV8DOt
	XLqA==
X-Gm-Message-State: APjAAAW/gVfIUeLPs0eIMZZQZAjbpzQs1BAMdHw0oq3y3S0TV80gJPeE
	tRydrTTXnNLr0WQ09CfLY75Fd/i4allLRwehBqo=
X-Google-Smtp-Source: APXvYqx210qGOND1AmmNwH5XvKSSiQW77Kr1cOUBmEaevm45iQcQiBC7wdOP53IyrxMvmLzvuz2yhNRsfqd1+tfAWFU=
X-Received: by 2002:a05:6102:a10:: with SMTP id
	t16mr12445012vsa.130.1582059159691; 
	Tue, 18 Feb 2020 12:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20200218203136.8314-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200218203136.8314-1-jonathan.richardson@broadcom.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Feb 2020 12:52:27 -0800
Message-ID: <CAJ86T=WWPJ+CQJovoy+Gr35Qw1B0xQZ5Bs9dMxiA8LcgpvOoYA@mail.gmail.com>
To: Jonathan Richardson <jonathan.richardson@broadcom.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 1/1] fio: remove disabling of compiler optimizations
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
X-List-Received-Date: Tue, 18 Feb 2020 20:52:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 12:32 PM Jonathan Richardson via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>
> Disabling compiler optimizations affects fio performance by 25-30% so
> remove this from EXTRA_OECONF. Disabling of optimizations should be
> machine specific if there are bugs in the code instead of the default.

Wrong mailing list ( patches for meta-oe should be sent to
openembedded-devel@lists.openembedded.org )

In general when removing a workaround or fix it's also helpful to
include a link to the commit which added it, in this case:

  https://git.openembedded.org/meta-openembedded/commit/?id=739349da0826221f98648b64b693f9ae33e7d4ea

(FWIW since that crash was seen with a much older version of fio
compiled with a now obsolete toolchain it seems perfectly justified to
remove it).

> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>  meta-oe/recipes-benchmark/fio/fio_3.18.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.18.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> index b6484290f..2c461b8c5 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> @@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
>  DISABLE_STATIC = ""
>
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
> -EXTRA_OECONF = "--disable-optimizations"
>
>  do_configure() {
>      ./configure ${EXTRA_OECONF}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

