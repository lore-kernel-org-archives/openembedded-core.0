Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 64B407C29D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:36:13 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id a6so9714768itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=skRAzjbKoF7oFO1WVbfa+Ze7bQIchaTHsZ1rbjbibOI=;
	b=I/WJ5zbEG9KsfO42s3j6F1uivl+eijhTWQoUKynNWS4LjEyqiBLVndfXjconDQSFe7
	8EunRDwsUO7Gxj99DBL63/jP63d8ecHsKkT9jnbCHgP58jwF2/eRViBGRo4EysynM5D6
	/O6KgrN4fLibg25vLtDclSMXqStkneXZXSz65uLfeeYsnKghtvzmXOouNWEYlt9yFQND
	973D7U8d27qOMFH/nCaJ3NvcuMwokjYoVcg1jaU9H1KnDb0cyPiS5pUN9r3dTv8XlfXS
	3zbew2tTJgo+kKArtr2wXXX943FaObmmdAwmbLFOcDevzBwAPsqSuxwwqcjgSxD4JX+9
	I+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=skRAzjbKoF7oFO1WVbfa+Ze7bQIchaTHsZ1rbjbibOI=;
	b=Ym1TPgkBNbwyQ9lnhzx12Coap5xz5B/AD9MqkF4oyruN36y8TFYM3gEzenRD6U1AuC
	uQOpJDZ6LmHC8DH/7IfpOXnpTCrlb19yRhSN/XaYTMY6eQ2IWc08Xva4q08Q1b0ZKTcG
	dwAifCv+uFCYhYUepwtN3KPlBZrdM7FrwGSPaNpXJUU03QX/SOj0jwvZGx7zMECLVCp3
	SWUoiCe4TPaHzlYO5jORnWw3QvcR5kOjLSzxXfohJk3tRyWekRFOiR1bQ4rpcuNTOr2U
	73HZjnICwiQbsfPqfdhMkWDbTKVU/+rrEXoNhibE5JovLaGkjruMLkh9m1kZ2i3lQ58e
	N/fQ==
X-Gm-Message-State: AJcUukf6lkD3E7GflExGcYENhL3unX7Sq/2Wk8jTjRc1E9SQx/cpvB+i
	fEg9q94clFqh0sh6sMVAYXiXJhRr3AgXTGp95dcINQ==
X-Google-Smtp-Source: ALg8bN4xkl4SfDV4clh8R0pZp0+4WfNawhblV7YLFlZSW/r2hvI6cGKqxSGVYYBkOiUXAvtih30tlOWAnoRaxc4B2uQ=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr8017560itj.62.1548844574189;
	Wed, 30 Jan 2019 02:36:14 -0800 (PST)
MIME-Version: 1.0
References: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BC7ED8@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BC7ED8@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2019 10:36:03 +0000
Message-ID: <CAJTo0LZWYQmeWsb9HqtiW0PRa_6ZDmbyBWJLye5LsCrHT5ouhg@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IHF1ZXN0aW9u77yaZ2xpYi0yLjA6IGRlcGVuZGVuY2UgcHJvYmxlbQ==?=
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
X-List-Received-Date: Wed, 30 Jan 2019 10:36:13 -0000
Content-Type: text/plain; charset="UTF-8"

Probably you changed glibc-locale to produce a smaller set of locales.

Ross

On Wed, 30 Jan 2019 at 08:40, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi All:
>
> I found an dependence problem for libglib-2.0-ptest package.
> 1. Dnf error message:
> Error:
> Problem 1: conflicting requests
>   - nothing provides locale-base-de-de needed by libglib-2.0-ptest-1:2.58.0-r0.x86_64
>
> 2. In ./recipes-core/glib-2.0/glib.inc, it defines RDEPENDS includes locale-base-es-es
> RDEPENDS_${PN}-ptest_append_libc-glibc = "......
>                                                                           locale-base-de-de "
>
> But glibc-locale didn't provide a package called " locale-base-de-de ", does anyone know the reason?
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

