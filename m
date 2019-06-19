Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDEF7E870
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:54:57 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so36669287ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vIYyqo5Z/BnXQRMh6b/TdezrkqlcSbx4BclROfnNtCE=;
	b=JXzG1ruWjEDd0a8FCp/e/jsbSpsDCPxt2bBa+BaQV55Jq3D4wczIrArwJYh0RKi+xr
	L7auKmW8j45vcq1hO18x3VTVObVpX+KSPb7nefHYOqQ7BmU/5sM9Qf+Mf76aVc9VdmuG
	hYWmwKrV23mL17BHQqcdQ+wAMwC7/K5fGb+18prJ2XtQwvZgfO9fIkYruLgxvSKXv+Tz
	lxWMT6jQOGG4lCdrh4AFp6HcuYsNdYoZd2UVmb7YPvfN1UOdX+nRM7Y/hMo329Ia0IO5
	o8wAhoqDAWmYMR4CYuCHmeqPZECREQABphcPo0WJChTyMaLvS5OgjKeOntjuUhikYKXf
	EZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vIYyqo5Z/BnXQRMh6b/TdezrkqlcSbx4BclROfnNtCE=;
	b=S7Qf44f+fZdFV3xAaj3lzuqsGQ5TBoVeqdbN6Cv9TXlLfBr7xRr+r0eyMkcPMm7pJz
	3+KIYAXGKF9h/AeU0NuWrTboDsfMGLYeHCzdC+mg/KHRVooPmCwbus59dHlCU/zKiu7u
	53xAdlkqFuktOSi8JlNXdb9M1xoAbteCEU+Qyt1TaLXfeiaP44lkfxiKniuWBCdWaa+V
	BCjf1/GbTSrXoEuMzT0tj8rXOOHkrH8rwj02WR7MCeN/y5phyQ89YeUHBs13zgFk0ln9
	il9xeFsIaxNSZIa1iQgUWyUQgalVNj9mFquFqU0Eluuhfqi4yMdPYGLT23FCuHKkS4Iq
	kaZQ==
X-Gm-Message-State: APjAAAUVtFm9Xdx04z1tciqIFF6VJkVI6p66D38WTCZLNZ8zD8jRzvTh
	bMZ5V8HagZ0fTlfZAEJD+WjOdenb0tNBC9DaNEjdVHUw
X-Google-Smtp-Source: APXvYqzvGCogw4zIi7RXi8jO+nZ8SiwfqGxyA2oC7DdOMnQ/jI02rmFugTg/J+SmbdrkyWlNPL9wPAp6RmIBIMJlQjo=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr92258596jao.82.1560938098402; 
	Wed, 19 Jun 2019 02:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190619094436.2024-1-ricardo@ribalda.com>
In-Reply-To: <20190619094436.2024-1-ricardo@ribalda.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2019 10:54:47 +0100
Message-ID: <CAJTo0LafiOR5uE8cD3wv79TeVsY0OSsoMsUG1OcgMwCXgBwYHA@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] less: Create symlink for pager
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
X-List-Received-Date: Wed, 19 Jun 2019 09:54:57 -0000
Content-Type: text/plain; charset="UTF-8"

dpkg may, but that's because dpkg is the Debian package manager and it
follows Debian traditions.  /usr/bin/pager is a Debianism: I suggest
we just patch it to use 'less'.

Ross

On Wed, 19 Jun 2019 at 10:47, Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Some system tools (like dpkg) expects a binary called pager when they
> run on a interactive console.
>
> This patch addes this symlink via alternative, so other packages can
> also provide this symlink.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/recipes-extended/less/less_550.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/less/less_550.bb b/meta/recipes-extended/less/less_550.bb
> index bb1618f1eb..8f59bd6087 100644
> --- a/meta/recipes-extended/less/less_550.bb
> +++ b/meta/recipes-extended/less/less_550.bb
> @@ -24,6 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
>                      "
>  DEPENDS = "ncurses"
> +RPROVIDES_${PN} = "pager"
>
>  SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
>           "
> @@ -39,5 +40,6 @@ do_install () {
>          oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
>  }
>
> -ALTERNATIVE_${PN} = "less"
> +ALTERNATIVE_${PN} = "less pager"
>  ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_TARGET[pager] = "/usr/bin/less.less"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

