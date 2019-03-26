Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4163C6C3A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 01:39:38 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k130so6661050qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 18:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cLpiRj/QfT1jRtU7x7x13nLUzQ7aQwmNmyNX4wXYaMs=;
	b=ShGsA65f4dQnLwI6ZrVm+YSprYwNDfZaU3T3L23ZWpEjW8gnBzjVibqiM5Baz0bS0v
	2Ys30Gdqt9SPNgyM7Cv//AOtCyJnxquvslkTmqsYH2D6I2PpC34EjyfTK+F4PeUpzhM+
	wF1YBOiWXGSPxkGecPlUekLzGPF0VO02pFmhU2LAJ1flFPgxUpX+iDnTe243uhE68YP1
	iDYNQHW5GUVai9GSbS6TrCtE5mMeHo7BAMF2LhGBWknrKfsvUaX90gmhbodBBtXqs6h2
	gmyojByzupeNitL8JSlAUooivVOOyPYV090/8VNU90CPLMy58STroSo+9snSOHtBk+vB
	ArfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cLpiRj/QfT1jRtU7x7x13nLUzQ7aQwmNmyNX4wXYaMs=;
	b=LjT/P20CSKNzh7430YItMHG52Kx0g/SdF/HTokwA/hsOzCNo9RUE+T60tGCb2khSCz
	4UOD3rMUin8RNFlWfoa1E5HgzU/jvZ82HstcBbAsiJhz+Xt45tpwNFayX5Ug9mvtdbRD
	m3vZ1Khlh2//2oE+dAmn3hWuOeIL4imEGsLzoqAhV9ovODgd6UZMzIAWK2UiPvTEFvey
	XIiX7/3MqCNRZ0i0GyV8PgCJOebh3tH9Z3ZUNSMJg/njcq1+Texbn4dnQ0y5h+qkDWgH
	sB46jceP1hK0FR/GjNcbHL0xHUzH4/wxKd1L19BvUVz5tEGkC0WGZDNbHW3N3ksUZAt2
	EzAw==
X-Gm-Message-State: APjAAAVI2u18d5wSmZpMvqckEnsDjPdiLMOeAzAhZc6jDNs2IoizwQTx
	5eKoCW7PYyMtfnhWRGL9EMkgwKTuKuNKG5PC6MtK6/YX
X-Google-Smtp-Source: APXvYqxNycYdQenp5VFR6jUdoHa8oqN+yUkiLJTwCOWZcNZoPPSHPDKotzjCcYRIaVLYSofnknhzSyT4ehYDT4ZGBLs=
X-Received: by 2002:a37:99c7:: with SMTP id b190mr17948856qke.2.1553564379725; 
	Mon, 25 Mar 2019 18:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190325234413.12652-1-ross.burton@intel.com>
In-Reply-To: <20190325234413.12652-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2019 18:39:13 -0700
Message-ID: <CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 01:39:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 25, 2019 at 4:44 PM Ross Burton <ross.burton@intel.com> wrote:
>
> This isn't a git snapshot recipe but a release that is fetched over it.  For
> clarity, put the PV in the filename.

I think its better to keep it as it is. since its easy to trace git log history.

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} | 1 -
>  1 file changed, 1 deletion(-)
>  rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} (98%)
>
> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> similarity index 98%
> rename from meta/recipes-devtools/libcomps/libcomps_git.bb
> rename to meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> index ff6820851fe..1c4f3bde65e 100644
> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> +++ b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
>             file://0001-Add-crc32.c-to-sources-list.patch \
>             "
>
> -PV = "0.1.10"
>  SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

