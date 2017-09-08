Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 84ACD60603
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:07:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id v82so1891898pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oh9kPTz3GEeuM+m+yX+jpeBUpsS/TkCKbZlT8bCOs7k=;
	b=X09dLqakDTDkQWPbAPtsAFCgPOEhBK2oLy8yO4iqbiqmHK/RiQIzFhwLUlRozHyIEQ
	Pb9Q4jck9iRZQsM83ITBU9zFA6cbpJqDnAzQuEFBLHy2HmdWLZO+8UVu8V+9U7ePYN5h
	uBeHqbrMGSjPrbn1qNGC4EpLXpOaz97Cmwyhs8lwa9Lt5bhIGGTtg4Hooye8NL2WmZdN
	tT1uyPulmh3yPtfk5IFp9+2GfZAQD8fvYoAjBROw8aD0iw0BArzC5tO3ekfVliey/hI/
	9503RQHoqj3amOM4lTLQ3MW8O19zq8y6qJIAPSYo7AbsXg0SteCnqZEC90IBO4sGq0XZ
	nlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oh9kPTz3GEeuM+m+yX+jpeBUpsS/TkCKbZlT8bCOs7k=;
	b=PrUStNGgPcxCGbVzHhPwAxanj+4DzxyxWFIm7QhJMzcqO0hMMDBDrMH0UXiiI0aWTJ
	6VCnsNlp37TWqsnlFS72ewSSpfzIyZZqKwXlsiQZ0oeQSyCMYdvHISZbt+bEB6bcRgi6
	dLdYV/vljVexWqBAHaoGsDK/xVZiOfU2oErwso+N+N76CagS+E9pcVMoEbdtofMs8joL
	mT2jaUt3U02nDuGP9LnPy2mKDH76IkrkhK1Qvw3I6/HJPNhA4BTuhwhFLIMlDzfgjA3w
	omg8gGML0Edb2hkFoxVURXkJ0+xdKC63sXDHZWZeadtfxJeYPIGx9p66oMU7/WBpP58k
	At9A==
X-Gm-Message-State: AHPjjUh8kXuQm4JO7wrDooXotc28Z9RW41ZzpW6JPpouRDLxFNisWtwv
	G4klj9rtpBUA5z/xgnwAYfaX5TkLbEN3t4c15KM=
X-Google-Smtp-Source: ADKCNb7pA/kTNWiM6bDYNX+YzkXS15dzjK2GvJ/1ISjBh540B9yIV5fZtl9Z6ceEyTrBEBZ8Umg6nIlDcdTojyrM3M4=
X-Received: by 10.84.132.110 with SMTP id 101mr5116028ple.67.1504912063620;
	Fri, 08 Sep 2017 16:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.177.199 with HTTP; Fri, 8 Sep 2017 16:07:13 -0700 (PDT)
In-Reply-To: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
References: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Sep 2017 16:07:13 -0700
Message-ID: <CAMKF1sqQaLDQwN2q8FaT4Xo_pA=x4=G4k49G2x8OxpmAZyEYJw@mail.gmail.com>
To: Yahia Farghaly <yahiafarghaly@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnupg: added a coreutils runtime dependancy to gnupg recipe
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
X-List-Received-Date: Fri, 08 Sep 2017 23:07:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 3:17 PM, Yahia Farghaly <yahiafarghaly@gmail.com> wrote:
> From: yahiafarghaly <yahiafarghaly@gmail.com>
>
> When using 'apt-key add' on the target image, the gnupg is required
> but for gnupg to be fully functional, the coreutils is required to be exist with the gnupg.
> Otherwise, it may throw an error in runtime as one of components of coreutils is missing.
> For 'apt-key add', i faced the error of 'comm: command not found' so as proper solution, i submit this change.
>
> Signed-off-by: yahiafarghaly <yahiafarghaly@gmail.com>
> ---
>  meta/recipes-support/gnupg/gnupg_2.2.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> index 0176ddd..8aa0951 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> @@ -44,3 +44,5 @@ do_install_append() {
>  PACKAGECONFIG ??= "gnutls"
>  PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
>  PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
> +
> +RDEPENDS_${PN} = "coreutils"

can we make the packaging more granular where comm is packages into a
package of its
own e.g. coreutils-comm and then create specific rdep on coreutils-comm

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

