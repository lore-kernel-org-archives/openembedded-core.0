Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 822387F941
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 22:56:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q2so12974694ljg.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 14:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=hzcAIgV6e1aKRDmT0lt6ixDZnLDvXEtzhS5P3srQg2s=;
	b=mbqSpFdTP4l6saOTogUGxgP7muk5q48+xUyDe5rV6dxkDXPlUnpXFKQ0MSGHX87t9u
	hATBDcmzcvHp5XJ5Uyn/Y/7la5WtY9PJh7JDtmcLwd6bOUJirg95yL9JK0USB+eVde57
	u2GVJRWKa+8d4U9UlQc0foAks2nda9v0qC5Jas86ZIcF4DrjRMId6z/3af6woUAT845H
	mHer4K05ArUtlyFTuMM0BAWuilZktnh0R9iJCWFTek7tBS6i68U1ModsG+lOdGynNbNi
	FMU4DkGwJ2uIk7Szi9j5qO+NGCT7iiBXiikmNadx82JEmUfKt5gqdpFdzW4KTGB+Ijyk
	LRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=hzcAIgV6e1aKRDmT0lt6ixDZnLDvXEtzhS5P3srQg2s=;
	b=AzGyG5mhJQx2hjSJohBa1d13JKTV1mkFO6b08pb7MmigBtwgK3lK/TntrnSN/g+xaE
	ZEOrSI6DCl8Y68mPoznjKwerWLksWT3eUrE3YMq6Kg3V5pB5V1a0d1yGJWfJWpLJlldH
	oVXrfL1UViPfg4ycq1y+E4nA5HjXDqxEsuFSe4ua/ckP6Lgr9z82Mv62FrKTdEkVb6bE
	tIUTL1DRNwBMsP55uGIjxtkdy0kicpxF1UEcVt/gvKngNScL4YPpNqKvNsFdrsT+4S0L
	ZISR+y5S5UlkCi3Z9A/c4DzVJxhlwIGw/BPm7gI8XDaHpHYF9zTzlOQq3Ec+U3XiVRAH
	TARQ==
X-Gm-Message-State: APjAAAWNv+g++6L232nG1AvAj69JvzsoO2GnR87o+zJ3XU/BzZxGqWpD
	sI8tUXYLTcpRvtQTw1tF1+tMhxiRYCVI3CswWw8Y5MzT
X-Google-Smtp-Source: APXvYqytixFy0adTMQSEDmPEVmpJc4nX4ff0lcCNHKTFeu0rZ+JTED9BqwCCcWeI4IcaTftLtYeV1W+ZXkeYqQK+TJk=
X-Received: by 2002:a2e:a175:: with SMTP id u21mr14484466ljl.198.1572908173680;
	Mon, 04 Nov 2019 14:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20191024183426.23676-1-daniel.diaz@linaro.org>
In-Reply-To: <20191024183426.23676-1-daniel.diaz@linaro.org>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 4 Nov 2019 16:56:02 -0600
Message-ID: <CAEUSe780NPpCJw_DsqZC9es6bQ4ex5BQ=7VrPOELQUL4guyatg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Mon, 04 Nov 2019 22:56:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Thu, 24 Oct 2019 at 13:34, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wro=
te:
> As of linux-next-20191022, we need bpf_helpers_doc.py in order to
> build libbpf, which lives in /scripts. Otherwise, do_compile fails
> with:
> | /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/scr=
ipts/bpf_helpers_doc.py: not found
> | Makefile:184: recipe for target 'bpf_helper_defs.h' failed
>
> See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
> endian, tracing}.h into libbpf") from linux-next.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 8201c0cb60..a463eebc52 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -113,6 +113,7 @@ PERF_SRC ?=3D "Makefile \
>               tools/Makefile \
>               tools/perf \
>               tools/scripts \
> +             scripts \
>  "
>
>  PERF_EXTRA_LDFLAGS =3D ""
> --
> 2.20.1

Ping.

Daniel D=C3=ADaz
daniel.diaz@linaro.org

