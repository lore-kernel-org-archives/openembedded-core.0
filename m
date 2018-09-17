Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2BE793E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 18:19:20 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id 101-v6so10888473uav.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c7rKskq0yFg22+hdqRghXeg90/YljPEMio6SPs4Iac4=;
	b=eHlT6oEZ59soMhbK6dLyF5m5nN6gPoqsz6rqWnQmIwXR+5IImb3oAvqRlNF1n+2CDs
	SzSKp498w4s8vzsNAp7BDia8xuoRSW74BgRpFgqDt4qvj8qV9zb/D+PCQBe204gb95qV
	3NjwQYt18QJO2ERSawR+3RXqg1zW2vf/l2Wo1oWUziabRIeubuttGm5zLZfxwyyzrGzl
	4LyL8jnIrF4AOkmTUApUEM77FhAGoxEmg+1DG/0MpFjCRhq24rgo1q92y/yqXgXwGRWN
	jd+YyzJz0MW9gNEW/x6ix9m1twJQd6YXibP+8skJ2RPKg8fq3ovolE276i6Tfeauov7N
	4hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c7rKskq0yFg22+hdqRghXeg90/YljPEMio6SPs4Iac4=;
	b=Eg5MY9ftljifQiFuqzRz6yZlQEt5RfD6np2b9xHro6LDKMfiY73/REbMJf6DX1znQr
	b4mApnFO5bXfjdqyoqTzcvqhBi7C3tOf8QMfDxzeaoStbcKoKxPocBvByHsYflLLDy//
	TvQOhYyJx8T+YWILuPR4gsSSX3mRGz0pADrCpNJ6GKD8mo6wWQxQ2Rngfzg+ixJOeEDC
	epHMI6jwTGirn0ksLw+Ydud3yZ1PEWUgc1W22UrkcIIMHoAT0tI5pkO9GIqdoXbeyAae
	CNVGzD3D5YlGy15U03Hsxf/PfMsT1brcO1qhq5LR3/y89onNhU4E+55qkvg3ssq/PQHx
	LFwQ==
X-Gm-Message-State: APzg51Ak12tlg1bbC52FCQzS7OunK6NrGZnNrmq3bPT6zgv0AVXRkgDX
	fJ0mDFkaWbRCj8gJWZN14ozkz88jwaBr32TCi7I=
X-Google-Smtp-Source: ANB0VdYi2eyQ/DQS5FsdcDTGvSG5S45XZEtYO3V4tWlXK/0r7Vr0h3dSPwryEnBCfTHAnQgmYzhfpbV52y3phBENDlc=
X-Received: by 2002:ab0:5c0c:: with SMTP id
	q12-v6mr7951231uaf.134.1537208361057; 
	Mon, 17 Sep 2018 11:19:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 11:19:20
	-0700 (PDT)
In-Reply-To: <20180916155313.18535-1-raj.khem@gmail.com>
References: <20180916155313.18535-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 17 Sep 2018 11:19:20 -0700
Message-ID: <CAJ86T=VU+eey_Pn9hxdBwprjOHRyej25pKVooSL7imb1vtg0XQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Mon, 17 Sep 2018 18:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 16, 2018 at 8:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This is a step towards running pebuilt applications for glibc  on musl
> There are many realworld applications which are not always built from
> source, especially provided by third party

Should these symlinks go in a separate package (musl-glibc-compat ?)
so that only people trying to run closed source glibc binaries on musl
need to see them?

> Signee-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index be31718e3a..a830c36eeb 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -26,6 +26,14 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>             bsd-headers \
>             libssp-nonshared \
>            "
> +GLIBC_LDSO ?= "ld.so.1"
> +GLIBC_LDSO_arm = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ld-linux-armhf.so.3', 'ld-linux.so.3', d)}"
> +GLIBC_LDSO_aarch64 = "ld-linux-aarch64.so.1"
> +GLIBC_LDSO_x86 = "ld-linux.so.2"
> +GLIBC_LDSO_x86_64 = "ld-linux-x86-64.so.2"
> +GLIBC_LDSO_x32 = "ld-linux-x32.so.2"
> +GLIBC_LDSO_powerpc64 = "ld64.so.1"
> +GLIBC_LDSO_mips64 = "ld64.so.1"
>
>  export CROSS_COMPILE="${TARGET_PREFIX}"
>
> @@ -62,10 +70,14 @@ do_install() {
>         install -d ${D}${bindir}
>         rm -f ${D}${bindir}/ldd
>         lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
> +       lnr ${D}${libdir}/libc.so ${D}${base_libdir}/${GLIBC_LDSO}
>         for l in crypt dl m pthread resolv rt util xnet
>         do
>                 ln -sf libc.so ${D}${libdir}/lib$l.so
>         done
> +       for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
> +               ln -sf libc.so ${D}${libdir}/$i
> +       done
>  }
>
>  RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

