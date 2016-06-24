Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E885D65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 13:47:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b136so21010563qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xwQRPhr6oXx2rUi0fthxk8FwS9vW7LfiN5iWqn2BNvQ=;
	b=OtjXbG8lM4Kf0mZ1McomqC1h1zxWOQejumGnClzUIXJKmt9BP80k7EMc9NwXmlyAk+
	P/g9WjvcETY3lMriBoM87S8cTB4uqDcugx5hj+zG5Xemm9LkEe1Kh5mNFSGm3BVWfsED
	XOIH02OHCVJn+eNB0GrnqBkIHOKYQLKjesB3TRANo44ETe8gn/dWhpRAue47wb3vV0Z7
	4K0wQo7kLIHSHwTBKQlfGbI9uLdZ1ITbMz+TngMFnsp/ecMwkZNsXUmRdqXYiGHwygEJ
	MGOloK4gKvH36hyhUw1zZbpcv/iS+U7Ny1xZG/8BxcymmZScdROq/nebCQ25LTOZz0SA
	Rv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xwQRPhr6oXx2rUi0fthxk8FwS9vW7LfiN5iWqn2BNvQ=;
	b=UQek1dY4ZD2hGypAhmloTrc5OPqaO7uNuL0MIStOizJ487DYAoeVIK34XSfZGVSrVf
	9o2ir/gWwWSLwu8+vhbBJQHmSJY2n/1sNUTBigf0hFO54FqpN1l9+tGE2QfS/gBlWijr
	+5a25l6yapMLEtEyydUGU1V2laHs0L8pMoVT0TVNtFM4zSdgbgYEiNAN89xFGEPv6NJm
	6jURufbKh925KRLEA7m1FYzxKUSJkjcUCUAEzpS6J6LNDG7BG4NmyvSjBG1rAX2Ro60y
	2rrAA7+RA5dnUj33o9E3AznxXXOd7+3dKiZFkHtN3+/b9OhSp+6CJJ8APnYlUB5SGNJj
	g6Gg==
X-Gm-Message-State: ALyK8tLB84s7MxDfViMAXLbivKsv3z+pqSFLBcBrgRFDwnOjhjdrPSIFmgMKnkZF+YDTR3Co5vMhfBex97oJ0Q==
X-Received: by 10.200.37.9 with SMTP id 9mr4995643qtm.31.1466776039856; Fri,
	24 Jun 2016 06:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 06:46:50 -0700 (PDT)
In-Reply-To: <1466765671-22371-4-git-send-email-git@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 06:46:50 -0700
Message-ID: <CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 13:47:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 3:54 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> Things must have changed at some point in the past. V=3D2 doesn't
> give us verbose make output anymore. On the other hand,
> adding V=3D1 to EXTRA_OEMAKE works fine, similar to how things
> are done in other recipes that use kbuild.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  meta/recipes-core/uclibc/uclibc.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/ucli=
bc/uclibc.inc
> index 71d4bdd..57f87fa 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -52,13 +52,11 @@ EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} \
>                  'HOSTCC=3D${BUILD_CC}' \
>                  'HOST_CFLAGS=3D${BUILD_CFLAGS}' \
>                  'CC=3D${CC}' \
> -                ARCH=3D${UCLIBC_ARCH}"
> +                ARCH=3D${UCLIBC_ARCH} \
> +                V=3D1"

keep V=3D2

>
>  EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
>
> -# enable verbose output:
> -export V=3D"2"
> -
>  # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reporte=
d
>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44860
>  #
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

