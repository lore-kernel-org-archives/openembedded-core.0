Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD2517F3A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 05:10:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d17so65215864qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 22:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R+lY7gt+C6hlxEi67ncdLk2Jqhqf+CIE8KYSO74qxew=;
	b=VsByiyl4Fcct3935TZQ4nnmXeIvnD2cKBZhF1XH1/oIQWmVX6zADbRJhbz4AeO7Pyv
	d/EFMvnVUUqGirpl7lDDL7zzA/6GxL3cXn1DxocRSrfvjf/RsxSTPNb+IPfmE7uikWI6
	b5kbower0i/KFoLxIdvC/hoa6gJVRhYkEdWXzpmS6+f4EYGeVxRgTKTLTgO8u5dMEv2O
	4w8IymeqrTro/Yj3GwwxWNBUYdOv16nUqVP+/6IlUhV2OEHuyao/860niJxAe7SfVpze
	bKKGMDsIBHV2ou2HDNVdaKfQjhwq21lU8RW/fcwLNG3N9rUl3rdHxQYwSUV6gxafxE44
	slhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R+lY7gt+C6hlxEi67ncdLk2Jqhqf+CIE8KYSO74qxew=;
	b=e7qyhGccLo2ZwyOG5uwfOtd5ndi1A8hMQipt57I4IidcK3xMqPcmhMW81XyG9zY4we
	rrrd+If20SXhf3UICW7bdparV+OHtG0b9HQWudd8NTd0H0UTb9I8TVKbF2hY8Py/sCti
	8YobwRUftAyYIqY1+D2iAwarVhIuLio8NL2FGGRY4bur3zh7tVPeTC+J1w2U53OH4qB7
	cgQ+p8JdZVGx0QVU2/o9jZJQji+OJkbzRvLzFIfJeIjyZMWGFwhzSmL669dpKbXRaTS7
	gX+1WKmdjnsdDPPtH9oFjeheTYPTr3S9OjTz22EQw1RqvaOq3FwrTecG3wymYyx2E94a
	2IbQ==
X-Gm-Message-State: APjAAAXPKR36dgdhF61Tm9P1YzlnuNW1sgyQ5ayiVWm9/XYZ5YzCxMME
	bl8Kb2yL2ScnzvBPu7kctNDrQrSn11/U4MUkNbI=
X-Google-Smtp-Source: APXvYqzfQd/H8QrKC0AvMbdp0IknuwZp/zj/LWrk1Y5UlWK7JGu5Iccc5pEnnm6HthvEiALSuoLV3wGgcP4xmePWiYk=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr86423016qvc.68.1564549859270; 
	Tue, 30 Jul 2019 22:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190625145203.24342-1-ross.burton@intel.com>
In-Reply-To: <20190625145203.24342-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jul 2019 22:10:42 -0700
Message-ID: <CAMKF1sq4DGk=4YA8YoJuJiyvqnnhVGeRSQfvWqeH76MmCMgZLw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] fortran-helloworld: add a very dumb Fortran Hello World for testing
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
X-List-Received-Date: Wed, 31 Jul 2019 05:10:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 25, 2019 at 7:52 AM Ross Burton <ross.burton@intel.com> wrote:
>
> For future runtime testing something more complex is preferred but this is
> sufficient to exercise the cross compiler.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-selftest/recipes-test/fortran/files/hello.f95 |  5 +++++
>  .../recipes-test/fortran/fortran-helloworld.bb     | 25 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/fortran/files/hello.f95
>  create mode 100644 meta-selftest/recipes-test/fortran/fortran-helloworld.bb
>
> diff --git a/meta-selftest/recipes-test/fortran/files/hello.f95 b/meta-selftest/recipes-test/fortran/files/hello.f95
> new file mode 100644
> index 00000000000..a0745fc64d7
> --- /dev/null
> +++ b/meta-selftest/recipes-test/fortran/files/hello.f95
> @@ -0,0 +1,5 @@
> +program helloworld
> +
> +      print * , "Hello World!"
> +
> +end program helloworld
> diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
> new file mode 100644
> index 00000000000..97313d7e249
> --- /dev/null
> +++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Fortran Hello World"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +DEPENDS = "libgfortran"
> +
> +SRC_URI = "file://hello.f95"
> +
> +# These set flags that Fortran doesn't support
> +SECURITY_CFLAGS = ""
> +SECURITY_LDFLAGS = ""
> +
> +do_compile() {
> +       ${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS} ${WORKDIR}/hello.f95 -o ${B}/fortran-hello

perhaps we can use ${FC} variable here.
> +}
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install ${B}/fortran-hello ${D}${bindir}

Just do install -D -m 0755 install ${B}/fortran-hello
${D}${bindir}/fortran-hello

> +}
> +
> +python () {
> +    if not d.getVar("FORTRAN"):
> +        raise bb.parse.SkipRecipe("Fortran isn't enabled")
> +}
> \ No newline at end of file
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

