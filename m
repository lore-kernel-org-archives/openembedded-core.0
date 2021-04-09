Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.5684.1617952198056266427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 00:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9m5W6bZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id z10so4888507qkz.13
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z2Nu4PtAs7+RNuz4WobkilZRxXRawDVVgeNRpxpEEqI=;
        b=G9m5W6bZwAsjnE2GGThgk+fvx82sjsXFrDhbJgpmcyhHpBkgzNxmCZvw8cvtgeFrzq
         t8bEerocinmalQIv7cZlz2K2MPQhSJx9aalQPoAKSjbrO1jIHQBwuQZdsGrYvEwtxm9x
         x/hT0GnofnZweZzJUrrzxcE9FWbRe5kDnoSlUz0/kZKcDoqDfk9bmJpna4XaEUK2gJvM
         JUAfJ3s1z8uamhcrjzZ0QHaJSA84S+qPangkVbGyD86k2/44719lOkTlmAKoff75wMGA
         8VONftvcFsCg9wYz1vmcZ1KKa0cWVQu4gFfSFs2li1daizaB/2qwavecOIahATnnWjKV
         wkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z2Nu4PtAs7+RNuz4WobkilZRxXRawDVVgeNRpxpEEqI=;
        b=EdwBS3Mkrm/z8EKvSPFtGuavEyBND4jj8I1NUl1WgWC+ELMhMCGyAyWKH57nNSNELs
         UGPV7zjikjidbltTRRzlXnMp8PrOZ8G8idnUmRysqewgNI0gXZg2fT/OPn72nLSO9j0T
         VjzmA2tQhH+TI4Af99R7dYbbeA4z1mdSJN01MLpSiDPAfHsZF2fa8uxDy1UBvQzstUgO
         oGt7OfEqsqjz8ttsj4U2fLujxvRKLYOWfpUntc2eyqPBcOdw2DFRbv6eAz/KCINFSf8M
         WdC3wtpzLUUpF+We0IG+IQoDb2W0PzhveoCAoyE0jtxTSLgJHzk5fOjdsLbnytSu+wdl
         zMVg==
X-Gm-Message-State: AOAM532TIushDWKOzvB9f7g1tyfpeSsa5nyaPHdNmVd6JXvH3/6OvD/A
	Kymh+bAcdPrOfrFvYvwE+Dew+/q+0BAcdPHjKos=
X-Google-Smtp-Source: ABdhPJw+X35hG2US3C4a9OUM4l4vYaXP6I1W9rkIktTivNq4+q+HMTgYKFnKc2K4MNRIcloxZNhrxFotzsaeSUOXpxk=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr12522887qka.119.1617952197106;
 Fri, 09 Apr 2021 00:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
 <1617860454-5064-2-git-send-email-wangmy@fujitsu.com> <b26851b2-e3ce-f702-aae7-8b5615514927@windriver.com>
 <OSBPR01MB18454482F7055674EBCE1C46DC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sqAEvnkGrhizqm=1UgcjK6zU7Kof2OtuauOGUW6zA9V5Q@mail.gmail.com> <OSBPR01MB18456A7EF732C1328517655CDC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18456A7EF732C1328517655CDC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 9 Apr 2021 00:09:31 -0700
Message-ID: <CAMKF1sqns+5By8tbZK326_WQporCu=9XDM5QyQGwtR32EREt9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 9, 2021 at 12:07 AM wangmy@fujitsu.com <wangmy@fujitsu.com> wro=
te:
>
> I'm going to revise it like this. Please see if it's OK:
>
> @@ -54,6 +54,7 @@
>  PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded-resolver,--disa=
ble-threaded-resolver,,,,ares"
>  PACKAGECONFIG[verbose] =3D "--enable-verbose,--disable-verbose"
>  PACKAGECONFIG[zlib] =3D "--with-zlib=3D${STAGING_LIBDIR}/../,--without-=
zlib,zlib"
> +PACKAGECONFIG[libgsasl] =3D "--with-libgsasl,--without-libgsasl,libgsas=
l"
>

looks ok

>  EXTRA_OECONF =3D " \
>      --disable-libcurl-option \
> @@ -65,6 +66,7 @@
>      --enable-debug \
>      --enable-optimize \
>      --disable-curldebug \
> +    --without-libgsasl \

this hunk is not needed anymore after adding PACKAGECONFIG, it will be
added automatically

>  "
>
>  do_install_append_class-target() {
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, =
Nanjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Friday, April 9, 2021 9:53 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: Trevor Gamblin <trevor.gamblin@windriver.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
> >
> > On Thu, Apr 8, 2021 at 5:58 PM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > I found libgsasl in meta-tizen, but this repository is very old and =
has been
> > deleted from layers.
> > >
> > >
> > >
> > > Can I specify  --without-libgsasl in curl to solve the problem?
> >
> > I think ideally you can add a packageconfig knob for it and keep it di=
sabled by
> > default.
> >
> > >
> > >
> > >
> > >   --
> > >
> > > Best Regards
> > >
> > > ---------------------------------------------------
> > >
> > > Wang Mingyu
> > >
> > > Development Dept.I
> > >
> > > Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu
> > > Road, Nanjing, 210012, China
> > >
> > > TEL: +86+25-86630566-8568
> > >
> > > COINS: 79988548
> > >
> > > FAX: +86+25-83317685
> > >
> > > MAIL: wangmy@fujitsu.com
> > >
> > > http://www.fujitsu.com/cn/fnst/
> > >
> > >
> > >
> > > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > Sent: Friday, April 9, 2021 3:50 AM
> > > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > > openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
> > >
> > >
> > >
> > >
> > >
> > > On 2021-04-08 1:40 a.m., wangmy wrote:
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > >
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > ---
> > >
> > >  meta/recipes-support/curl/{curl_7.75.0.bb =3D> curl_7.76.0.bb} | 2 =
+-
> > >
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  rename meta/recipes-support/curl/{curl_7.75.0.bb =3D> curl_7.76.0.b=
b}
> > > (97%)
> > >
> > >
> > >
> > > diff --git a/meta/recipes-support/curl/curl_7.75.0.bb
> > > b/meta/recipes-support/curl/curl_7.76.0.bb
> > >
> > > similarity index 97%
> > >
> > > rename from meta/recipes-support/curl/curl_7.75.0.bb
> > >
> > > rename to meta/recipes-support/curl/curl_7.76.0.bb
> > >
> > > index 7666c7b608..68315d9f77 100644
> > >
> > > --- a/meta/recipes-support/curl/curl_7.75.0.bb
> > >
> > > +++ b/meta/recipes-support/curl/curl_7.76.0.bb
> > >
> > > @@ -13,7 +13,7 @@ SRC_URI =3D
> > > "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> > >
> > >             file://0001-replace-krb5-config-with-pkg-config.patch \
> > >
> > >  "
> > >
> > >
> > >
> > > -SRC_URI[sha256sum] =3D
> > "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
> > >
> > > +SRC_URI[sha256sum] =3D
> > "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a
> > "
> > >
> > > This change fails on the curl-native do_configure step:
> > >
> > > | checking for time.h... (cached) yes
> > > | checking for sys/socket.h... (cached) yes checking for struct
> > > | timeval... yes checking run-time libs availability... failed
> > > | configure: error: one or more libs available at link-time are not
> > > | available run-time. Libs used at link-time: -lidn2 -lgsasl -lssl
> > > | -lcrypto -lssl -lcrypto -lz
> > >
> > > After a look at the recipe it appears that this may be a dependency =
on libgsasl.
> > Could you investigate this and send a v2 with the appropriate PACKAGEC=
ONFIG
> > added? You should also include release notes in the patch summary wher=
e
> > possible.
> > >
> > > - Trevor
> > >
> > >
> > >
> > >
> > >
> > >  # Curl has used many names over the years...
> > >
> > >  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libc=
url:libcurl
> > daniel_stenberg:curl"
> > >
> > > --
> > >
> > > 2.25.1
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >=20
> > >
