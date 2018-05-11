Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id A60937604F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:13:08 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id t129-v6so8152686lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LcSUsFJ3DA1wnNU2R3pG5jgTCTDQlGqhbSFvaGRxrXc=;
	b=u2yDoedsysT8JjPgWLJvo/47lhxwg+uEKRwDcLjpe2U6WrRmq0oulwyR1NUANjQ9kd
	/1Uoa8HYYIY9lPsNytQDzcttN3okLIZKLwYVdLd8aRW2SJX+u/m93KenHqjT5i1dX2bI
	qscI91fAw0/KIisqAYZ5Z3pEqXVV24I9toGNFas/dQeJ2dY3mZpO4zff4KnsGF4kNXrB
	dDCsunlBwFYwVoh++9M2wJQbCvjRZkWRM5XWSvsIuudlAAfcuvHb73YM9rI4XmsDWWRH
	zjCOjHgVgG7VQHsMwNgwIcojLYHn7uQXds9BF3k/YMqaiU7eAeVLhMa1wEa3PrsIQ33Y
	Klog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LcSUsFJ3DA1wnNU2R3pG5jgTCTDQlGqhbSFvaGRxrXc=;
	b=AKjbmrRV8LMmZ/l2eeirGzI22vADHZutRTHfSjHCt/+hM5uu2waWRYsfJS2mKx1oTf
	UPUY0AkmMrcU9gF+OsthwBqZW+VK4c916YInsD3myW0b81bZqEi8AbbSltam04B4DTEo
	yYq85rv0BaAJQC48UnAXOIaRquBr3bcAT3PzcRWrstAHsKukpkUoA/+SlxeSevhMEC6/
	gRXYV58HJH0TnNixLmbNetSzMEDrOYJpYXAwK3yfbNq3CXnBlxfbo7jy2bCdq16lc+L8
	3n+MXV8OJa33o9yINzcUDEgdWzYbKpwZd+/qpUOkNVkWbUvYeOLDieJZvbp1o/pQgQYI
	7z/Q==
X-Gm-Message-State: ALKqPwdcQE5Psr+fhdEm4SDPPtkMnTyQFpwqMFtLJ6uL5FeBmvIEd8g0
	kzDz7/Evi4SFaTAcEwDR8k78HXb10SMFNPh03mU=
X-Google-Smtp-Source: AB8JxZprj9zi59JVCA54dMwKEkx0y1A/1ZeGQC2oLvnSWSObaGIH/rKx8iiNW4xeESExeTkNyFay1bnJuTOdqqQXRNg=
X-Received: by 2002:a19:d514:: with SMTP id m20-v6mr1408496lfg.5.1526047988828;
	Fri, 11 May 2018 07:13:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP; Fri, 11 May 2018 07:13:08
	-0700 (PDT)
In-Reply-To: <20180511065249.40069-1-raj.khem@gmail.com>
References: <20180511065249.40069-1-raj.khem@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 11 May 2018 08:13:08 -0600
Message-ID: <CACS+7ZS7d+P4FgKFKAa+52HKP-p_KNea1--KmF_e+Rrs-tq5Vg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gcc-sanitizers: Package new liblsan objects built with gcc8
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
X-List-Received-Date: Fri, 11 May 2018 14:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 May 2018 at 00:52, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes installed-vs-shipped QA errors
>
> Reported-by: Dan McGregor <danismostlikely@gmail.com>

The email address I typically use in my git submissions is
dan.mcgregor@usask.ca. The gmail address is what I use only for
mailing lists.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 3b7e0028f2..e5e84526fa 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -94,6 +94,7 @@ FILES_liblsan += "${libdir}/liblsan.so.*"
>  FILES_liblsan-dev += "\
>      ${libdir}/liblsan.so \
>      ${libdir}/liblsan.la \
> +    ${libdir}/liblsan_preinit.o \
>  "

This looks good.

>  FILES_liblsan-staticdev += "${libdir}/liblsan.a"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

