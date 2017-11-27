Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6933B71D97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 01:45:45 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 62so7530552plc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 17:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+RTq3VWfpWZNGvLdCPLieaf9kzHJaNNbyDFClKyTmd4=;
	b=dla11HZAXCGFu4MdqvdRFck97mJ16a0zkdnJrQAxXEbU31yIAEokznR4infZJb3hws
	xDEVbG4Y/0Du491xAl0jUDDWK0ns5RL3nXNeBqPF4dO2lILNVRB5pUBMntp1kRh9XOBl
	m+NRm4/uuVLr9sgz/e2V43wg0tTt6NYDnXutyOC+Fmfh6CE8SHw5WFovwLm7KooNQvht
	BrSu9XBlWw/rI5ETBrzQtvYQofSnBC5CyqooO0X4c/O22wdTlc/4bZr2Hj0wl16Bqbpr
	1z/RXXGybvdaddsTg0fKvbJ3bidyOndloCa7FMhzh4y1S3iHS+YgmxQzAKC5+WwM7zm+
	MKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+RTq3VWfpWZNGvLdCPLieaf9kzHJaNNbyDFClKyTmd4=;
	b=U25cao0RmrwD1rhoLbKl4Tc0uDU3DmSNhnRuw3jLeOKA6Y8FUlgc2HCRPCDaMvSD5B
	08XT4pDzM3cIZvvOgDUe1gS6NkZNIf3dX2KrERpsLXBe8NxCRBCj3zbwWfkZrcON63Rl
	3MlMl8SmqxpTV7vzpgMASTGTLwC10UwCrnJl/4KozknpvcJnprRfmwZ4Ds168pZHV2KU
	BLXgaVzU3TTwnplFCoOgi9IoRFXYqbf+k8YU2TEXfSCPDtvMWSxiEQtk7JXPPguRNhpU
	fAs2RgT15hLnEQGy4/M5YF+S4vUbimQ6YxfN0PN1IPEcppVb3S1eIOJOq+pdyM26917s
	0Ngw==
X-Gm-Message-State: AJaThX6mITiyc0WKvq90sIboOpFoP+CLSDx9NNHfe7I5kPU/r1SH1qSU
	k1gEI/IaoS3bfFKZpz0elx6U9vkX3p5Gg+ajQ0I=
X-Google-Smtp-Source: AGs4zMbwTb+xmoNbW1+h82zEKhP1l6dY6DXOCATPk3HctAuVwTnFuYfRbRCvqDHKHDJncTcDslGIGCg3sQFW/JZQYLw=
X-Received: by 10.84.252.4 with SMTP id x4mr34902059pll.99.1511747146471; Sun,
	26 Nov 2017 17:45:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Sun, 26 Nov 2017 17:45:16 -0800 (PST)
In-Reply-To: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
References: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2017 17:45:16 -0800
Message-ID: <CAMKF1sr2ZAM0sH19g0Y0Ewbb7D61x6igA4NBXd0wrXYBx9Wvvw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Morty][PATCH] binutils: Fix build issue on Centos 6
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
X-List-Received-Date: Mon, 27 Nov 2017 01:45:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 10:05 AM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Per Yocto Compatable: The following change was made to fix a build issue we are seeing on
> Centos 6. Not expecting this to be merge.
>
> binutils-cross-canadian-arm-2.27-r0.47: task do_compile:
>

does installing https://people.centos.org/tru/devtools-2/6/x86_64/RPMS/ help ?

> gprof' cc1: error: unrecognized command line option "-Wstack-usage=262144"
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index ae14642..30e3bc6 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -12,6 +12,13 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
>  # e.g. we switch between different machines with different tunes.
>  EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
>
> +EXTRA_OEMAKE += "WARN_CFLAGS='-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow'"
> +do_configure_prepend () {
> +       sed -i ${S}/bfd/warning.m4 -e "/Wstack-usage/D"
> +       sed -i ${S}/bfd/configure -e "s/-Wstack-usage=262144//"
> +       sed -i ${S}/binutils/configure -e "s/-Wstack-usage=262144//"
> +}
> +
>  do_install () {
>         autotools_do_install
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

