Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.3380.1617933215213603102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 18:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jj9Xm6w4;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id o5so4471305qkb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 18:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iVqi93gRjSQ5yGHriZWpPSyAc8NQ67ttPQmNIblw4lo=;
        b=Jj9Xm6w41sUXVqhQ8t1gpd0D4AbVXEysuMl1xdPuExEO3CAcOpy5GGRmNrOEygzzIk
         Zl+rlno8Fao528kyoTfQ0thnpMWJD2VMkGQaZheINwtqUBHqwU5k0GcbZfrBBElD2N0O
         lQePbU/LSiUsFk0367jvw50/jBIPIg/wiLq82/mu+rilB2j9JEzFZ0lqo5c69JlZ93OL
         vzJAty4uj8gcZzzvHVZ8VVFRMK/rbdoUBtqEB/5DV8xQj8fPSRHbK3VV/9Ma5SxuArvg
         QB9IzpZSaFjkL+5D88/DgGsvrevteGAInpa/cSTD3Lz/MSHXhgdUJO7Wnwm0GgaPWSCx
         vZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iVqi93gRjSQ5yGHriZWpPSyAc8NQ67ttPQmNIblw4lo=;
        b=JTi80a48UbtLPzCmIJgRztxqY7AWQhmGEiohNKBQ+wdB149UnLVe55sSTxjuAy15eG
         DLg9irw/Ciw/IVyhCZtxwWZRxjhzrHjd/GuT7b6XpKZxp6SzJqWpfiTbLHoJ6oYebgIW
         kopLmAsxDk4HP9h9lHrw1mdXmCJizNOa/oMtXsFOMUAw3xAUcsjHLyC7Ww/IjVyt+1TU
         vUtxIlYD+0EySdLaf7d3zIqyZTN5t5nH6N2YpWqHdeRtGVnPbopBHt6NbQKrTjGvmGE+
         rCGaC59t3hiKdyjOl2V56Mb3X0OUQ03Se96q2Rm5/Qg9wnNRamrYqUDryrkeE4KjO8m6
         Vhzw==
X-Gm-Message-State: AOAM533PZdlBN72AvQL5rT6CCieZHTvGopUrBnpNG+lZ/5HBfwT81sMz
	VjtLsZyQhfzvKZQaPgLnyhSS1k0GlQoI43p3KqA=
X-Google-Smtp-Source: ABdhPJwg6iam3G1FfrrjtvHim4UW76hJyzPqrUFFpwOPY5tJCB7DkQUFQtVyZ8qcusmD3yIkh1i0314SODH5n0Zi5cM=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr11741121qki.25.1617933214371;
 Thu, 08 Apr 2021 18:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
 <1617860454-5064-2-git-send-email-wangmy@fujitsu.com> <b26851b2-e3ce-f702-aae7-8b5615514927@windriver.com>
 <OSBPR01MB18454482F7055674EBCE1C46DC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18454482F7055674EBCE1C46DC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Apr 2021 18:53:08 -0700
Message-ID: <CAMKF1sqAEvnkGrhizqm=1UgcjK6zU7Kof2OtuauOGUW6zA9V5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
To: wangmy <wangmy@fujitsu.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 8, 2021 at 5:58 PM wangmy <wangmy@fujitsu.com> wrote:
>
> I found libgsasl in meta-tizen, but this repository is very old and has =
been deleted from layers.
>
>
>
> Can I specify  --without-libgsasl in curl to solve the problem?

I think ideally you can add a packageconfig knob for it and keep it
disabled by default.

>
>
>
>   --
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> Development Dept.I
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, =
Nanjing, 210012, China
>
> TEL: +86+25-86630566-8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com
>
> http://www.fujitsu.com/cn/fnst/
>
>
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> Sent: Friday, April 9, 2021 3:50 AM
> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>; open=
embedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
>
>
>
>
>
> On 2021-04-08 1:40 a.m., wangmy wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>
> ---
>
>  meta/recipes-support/curl/{curl_7.75.0.bb =3D> curl_7.76.0.bb} | 2 +-
>
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  rename meta/recipes-support/curl/{curl_7.75.0.bb =3D> curl_7.76.0.bb} (=
97%)
>
>
>
> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-sup=
port/curl/curl_7.76.0.bb
>
> similarity index 97%
>
> rename from meta/recipes-support/curl/curl_7.75.0.bb
>
> rename to meta/recipes-support/curl/curl_7.76.0.bb
>
> index 7666c7b608..68315d9f77 100644
>
> --- a/meta/recipes-support/curl/curl_7.75.0.bb
>
> +++ b/meta/recipes-support/curl/curl_7.76.0.bb
>
> @@ -13,7 +13,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.=
tar.bz2 \
>
>             file://0001-replace-krb5-config-with-pkg-config.patch \
>
>  "
>
>
>
> -SRC_URI[sha256sum] =3D "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50=
a01869effb316d026"
>
> +SRC_URI[sha256sum] =3D "e29bfe3633701590d75b0071bbb649ee5ca4ca73f006492=
68bd389639531c49a"
>
> This change fails on the curl-native do_configure step:
>
> | checking for time.h... (cached) yes
> | checking for sys/socket.h... (cached) yes
> | checking for struct timeval... yes
> | checking run-time libs availability... failed
> | configure: error: one or more libs available at link-time are not avai=
lable run-time. Libs used at link-time: -lidn2 -lgsasl -lssl -lcrypto -lssl=
 -lcrypto -lz
>
> After a look at the recipe it appears that this may be a dependency on l=
ibgsasl. Could you investigate this and send a v2 with the appropriate PACK=
AGECONFIG added? You should also include release notes in the patch summary=
 where possible.
>
> - Trevor
>
>
>
>
>
>  # Curl has used many names over the years...
>
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:=
libcurl daniel_stenberg:curl"
>
> --
>
> 2.25.1
>
>
>
>
>
>
>
>
>
>
>=20
>
