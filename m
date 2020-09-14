Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.61672.1600093503276410421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iyL3/8hc;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id q13so195110ejo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hzPzNSM38llHoJWLg6lQG6pcyRzaWbKX4k2mja46sEk=;
        b=iyL3/8hc4nJNxLnGDBqcUfS4y05Z1DtSUR0IgBR93oibYGJep2HGiqUbTtmFonIs10
         Tu7I4hwiKeUuGrDmslExf54QfIuaKSpzhnLvOjk5gzxEbpYkdNMPPXYFlG8a584o3ZXR
         HYQ9X1eop/rFQKsMTZL74P2p51U5KPlZXBzVmd16TqBzMIoAXtFhamYqDtPJ6RK+YGlG
         hSSxkdfp5M0Zf1E4uYr1P+7gYtR9cdNBE1rDRdfTVi0U0IJF7oZSYBnII3cw7LWj+IHy
         f8vqcqZljFCF1ObOuF/PPqEyGTaHjBCNK4bYAsI1EHaTE+1F69m+J5JdpXVIX0uXq7HI
         Dg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hzPzNSM38llHoJWLg6lQG6pcyRzaWbKX4k2mja46sEk=;
        b=X7JlDM/EvmIkg+1U8BSuBqod1JxonAvEm86YNT9ZSJHTJOXg5yb/aBvVYVvP8sQDvg
         P7G5sQav9eaLcEvxIq9i8LPWlsTlreD3LcwWJM5QUxwUt+XjHvPaUrnYIljNN3TeQwXf
         8XVE3aeostuwtM68OOfOTUFj2u6c0w8v3RsaLy42sFRijaQupuZTsD7ca/Kuh3qjgSpq
         QWWvjP6b/SEFo59+dyEJOqb+taHjmFc+kTxH9Zo2SSYHtqIoJYdgC7ZSj7JcZqwqxInE
         1A/RWoYrYqeSK/h8uPlKYf/3TQbHP+qSlhQeEpty6ofGLBIq0lGHlGOLXtyQB77tVw4t
         AJJQ==
X-Gm-Message-State: AOAM533IMwtiXb0a2VSW25YP1i7S/mXpf2r6JT89jzxVEmuetdd25JQF
	rFJPvvTeAMVaKfAYqsBk8ZMsB+XZBb2lghGDr6lARA==
X-Google-Smtp-Source: ABdhPJx7I9RfQjypyL744ZNWL5ditZUJPFaSXfMeFO5SU4WFBPGJkCmIOUpPs7J1U1I2Psal/p7iKfUe9JCWaUzlrhw=
X-Received: by 2002:a17:906:a415:: with SMTP id l21mr14182222ejz.431.1600093501564;
 Mon, 14 Sep 2020 07:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600092418.git.steve@sakoman.com> <1634ABE18B3346A2.7642@lists.openembedded.org>
In-Reply-To: <1634ABE18B3346A2.7642@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 14 Sep 2020 04:24:50 -1000
Message-ID: <CAOSpxdYL_NkRo_SmYvGYqnrtR=KKSRmLZ0AYw7N--bgP5UU3DA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 12/24] systemd-serialgetty: Fix sed expression quoting
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In reviewing new master branch commits this morning I see that this
patch introduces a bug and a fix patch has been merged.

I will drop this patch from the final pull request and will submit it
next week along with the fix (systemd-serialgetty: Replace sed quoting
using ' with " to allow var expansion)

Steve

On Mon, Sep 14, 2020 at 4:12 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Rahul Kumar <rahulk@mvista.com>
>
> Fix sed: -e expression #1, char 13: unterminated `s' command
>
> Error Message:
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc'=
, 'patch-native', 'quilt-native', 'gcc-cross-arm', 'gcc-runtime', 'linux-li=
bc-headers', 'libgcc', 'flex-native', 'xz-native', 'libtool-native', 'autom=
ake-native', 'binutils-cross-arm', 'zlib-native', 'mpfr-native', 'texinfo-d=
ummy-native', 'autoconf-native', 'libmpc-native', 'gnu-config-native', 'gmp=
-native', 'attr-native', 'm4-native', 'gettext-minimal-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | sed: -e expression #1, char 13: unterminated `s' command
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/opt/Projects/poky/build/tmp/work/qemux86_64-poky=
-linux/systemd-serialgetty/1.0-r5/temp/run.do_install.11228' failed with ex=
it code 1:
> | sed: -e expression #1, char 13: unterminated `s' command
> | WARNING: exit code 1 from a shell command.
> |
>
> To Fix this Issue using the strong (single quote) character in sed comma=
nd.
> It is recommend to use quotes. If we have meta-characters in the command=
, quotes are necessary.
>
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e2fea05e150dcfec4b7dfbd8edddb53897026bf9)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/rec=
ipes-core/systemd/systemd-serialgetty.bb
> index 044c6c5b67..059fccc2b6 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -21,7 +21,7 @@ do_install() {
>                 install -d ${D}${systemd_unitdir}/system/
>                 install -d ${D}${sysconfdir}/systemd/system/getty.target=
.wants/
>                 install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${s=
ystemd_unitdir}/system/
> -               sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${syste=
md_unitdir}/system/serial-getty@.service
> +               sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${sys=
temd_unitdir}/system/serial-getty@.service
>
>                 tmp=3D"${SERIAL_CONSOLES}"
>                 for entry in $tmp ; do
> --
> 2.17.1
>
>=20
