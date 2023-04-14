Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5E1C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:40:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3170.1681454451296831244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LclxIzA4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q6so4942734wrc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681454450; x=1684046450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dlZckJORvuBMM9EsJGiyNvk2/FQqWorgQBSfo5EGoLg=;
        b=LclxIzA4Eg2G4rodTe+BveSMjUdkJZMPcmxbJfTQffiuzMJoUFU6Mic1feKryWQruA
         rB07dgi1Cm+9HavGvz0Yk1F20NFOvpmJzt5GsAL4ZhCXlFkWxEe5FQjxlZoWHmAsXz17
         GFCdPfWZ9aXw/ndb6LP4Sb5Yp7B5ADyVW2wLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681454450; x=1684046450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlZckJORvuBMM9EsJGiyNvk2/FQqWorgQBSfo5EGoLg=;
        b=L5fPuHSc6TB+9SiNCyADhi9YIC/KC6XSRI3ReS5IKOvQNKPXFOPAQXXDxaE38zGTKB
         DkfCzIs79hYW76eBRwHyEHlcuVJmVXhnJUl8I5AdT3XceqSSEz5fAqRi5aNCM7RdOdqo
         wCFEujjO81xlwwXZVGk0NUn5PwEm6wD5+c9qk7qxkMzNYnEpEefMmJhTAbnoWG1rZnLf
         9WFh9OuboyH9hG/jjXFOfLUI/uYCIV4ff1WSFTxZYqLx+erZh3IMnRMTpV4ToU4CR8I5
         b4Iao5fNzYD4XARAVnjEExzHjD1+bDNspehA+JHlQyi024JW21g+8EX83iR/wJwUkXkQ
         MppA==
X-Gm-Message-State: AAQBX9fdsSMbVeiraq5WkNe5KUzrcIXklFt96wyPb2ygecxst3RURcSW
	wkm1ANmXa46hNECc1Zmc3JnieA==
X-Google-Smtp-Source: AKy350aEvLNjscYmrJOaEAZiQv8NEs77GP3uHomxpLypnGyEY3L+Qwwd60kkpM2Aow3XuwbXqy+vhg==
X-Received: by 2002:adf:ef06:0:b0:2f6:3a86:ba0e with SMTP id e6-20020adfef06000000b002f63a86ba0emr2939244wro.57.1681454449715;
        Thu, 13 Apr 2023 23:40:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4676:d773:dc86:c4a1? ([2001:8b0:aba:5f3c:4676:d773:dc86:c4a1])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c35cd00b003ede03e4369sm7277281wmq.33.2023.04.13.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 23:40:49 -0700 (PDT)
Message-ID: <b3248fb71b11d64ce7064ea9d7ba94e2ae20cc16.camel@linuxfoundation.org>
Subject: Re: FW: GCC patch "[PATCH] Share work directories" to be discussed
 after GCC upstream denial
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shinde, Yash" <Yash.Shinde@windriver.com>, Patches and discussions
 about the oe-core layer <openembedded-core@lists.openembedded.org>,
 "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Jia, Hongxu"
 <Hongxu.Jia@windriver.com>, Khem Raj <raj.khem@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"yashinde145@gmail.com"
	 <yashinde145@gmail.com>
Date: Fri, 14 Apr 2023 07:40:48 +0100
In-Reply-To: <SJ1PR11MB61295601FDB553E1C8820C71EB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230222121904.4087522-1-Yash.Shinde@windriver.com>
	 <CA+=Sn1kxde5ynivyv_Y4PUvJUBBEauZWdun6Pp=EBvEt3UZQJg@mail.gmail.com>
	 <SJ1PR11MB61295601FDB553E1C8820C71EB999@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179990

On Fri, 2023-04-14 at 06:20 +0000, Shinde, Yash wrote:
> As discussed in the meeting, sharing the GCC upstream=E2=80=99s reply for=
 the
> =E2=80=9CShare work directories=E2=80=9D patch.

Thanks for sharing this. With a few of these patches we need to
understand the history of them and why we're doing what we do.

Since we share ${S}, the source directory between multiple gcc builds
and multiple target builds, the configuration can vary but we can't
change files in ${S} as that would cause races. I believe we therefore
take a copy of defaults.h into ${B} and that is a copy we can modify in
different builds.

grepping the gcc recipes for defaults.h, we find this:

gcc-configure-common.inc-do_configure:prepend () {
gcc-configure-common.inc-	# teach gcc to find correct target includedir whe=
n checking libc ssp support
gcc-configure-common.inc-	mkdir -p ${B}/gcc
gcc-configure-common.inc-	echo "NATIVE_SYSTEM_HEADER_DIR =3D ${SYSTEMHEADER=
S}" > ${B}/gcc/t-oe
gcc-configure-common.inc:	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_D=
EFAULTS_H" > ${B}/gcc/defaults.h.new
gcc-configure-common.inc:	cat >>${B}/gcc/defaults.h.new <<_EOF
gcc-configure-common.inc-#define NATIVE_SYSTEM_HEADER_DIR "${SYSTEMHEADERS}=
"
gcc-configure-common.inc-#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}=
"
gcc-configure-common.inc-#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1=
}"
gcc-configure-common.inc-#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
gcc-configure-common.inc-#endif /* ! GCC_DEFAULTS_H */
gcc-configure-common.inc-_EOF
gcc-configure-common.inc:	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
gcc-configure-common.inc-}

which is the code taking the copy. The patch you mention then causes
gcc to use the copy rather than the one in ${S}.

The patch as it stands will break gcc since there is no file copy in
upstream so it is not surprisingly upstream wouldn't take it. Proposing
a change like this which breaks things for them will undermine our
relationship with them too, so we need to be careful with this.

The question then becomes can we override the values we want to set
here without changing defaults.h? I think we struggled to find a way to
change these defines so that gcc always used the new values which is
why we have the patch.

Our goal is to stop patching gcc with as many patches. The question is
therefore, can we find a way to keep this working without a patch.

At the very least we should update the patch with the information I've
collected above.

Cheers,

Richard

> =C2=A0
> Regards,
> Yash
> =C2=A0
> From: Andrew Pinski
> Sent: 22 February 2023 21:34
> To: Shinde, Yash
> Cc: gcc-patches@gcc.gnu.org; raj.khem@gmail.com; MacLeod,
> Randy;Kokkonda, Sundeep
> Subject: Re: [PATCH] Share work directories
> =C2=A0
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the
> sender and know the content is safe.
>=20
> On Wed, Feb 22, 2023 at 4:22 AM Yash Shinde
> <Yash.Shinde@windriver.com> wrote:
> >=20
> > From: Khem Raj <raj.khem@gmail.com>
> >=20
> > Fix configure and Makefile files to read the defaults.hand t-oe
> > from build directory,
> > so that the source can be shared between gcc-cross-initial, gcc-
> > cross-intermediate, gcc-cross, gcc-runtime,
> > and also the sdk build which use a separate build directory
> > compared to source directory.
>=20
> >=20
> > While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> > occasionally failure that test the existance of default.h doesn't
> > work,
> > the reason is tm_include_list=3D'** defaults.h' rather than
> > tm_include_list=3D'** ./defaults.h'.
> > So we add the test condition for this situation.
>=20
> This patch does not make sense because $(srcdir)/defaults.h will
> always exist.
> I build all the time with different object directories and I know of
> many people who build with a read only source directory; explicitly
> so
> they can test that way.
> You are going to have to expand on why you need defaults.h from the
> build directory and not the source directory?
> As far as I Know there is no defaults.h in the build directory even.
> Do you have another patch which changes that?
>=20
>=20
> Thanks,
> Andrew Pinski
>=20
> >=20
> > gcc/ChangeLog:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * configure
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * configure.ac
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mkconfig.sh
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> > =C2=A0 gcc/configure=C2=A0=C2=A0=C2=A0 | 4 ++--
> > =C2=A0 gcc/configure.ac | 4 ++--
> > =C2=A0 gcc/mkconfig.sh=C2=A0 | 4 ++--
> > =C2=A0 3 files changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/gcc/configure b/gcc/configure
> > index 254f9b6c943..ff2a3e26049 100755
> > --- a/gcc/configure
> > +++ b/gcc/configure
> > @@ -13471,8 +13471,8 @@ for f in $tm_file; do
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${t=
m_include_list} $f"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defaults.h )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_file_list} \=
$(srcdir)/$f"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${tm_include_l=
ist} $f"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_file_list} .=
/$f"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${tm_include_l=
ist} ./$f"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_f=
ile_list} \$(srcdir)/config/$f"
> > diff --git a/gcc/configure.ac b/gcc/configure.ac
> > index 62bc908b991..d36830cf2fb 100644
> > --- a/gcc/configure.ac
> > +++ b/gcc/configure.ac
> > @@ -2336,8 +2336,8 @@ for f in $tm_file; do
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${t=
m_include_list} $f"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defaults.h )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_file_list} \=
$(srcdir)/$f"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${tm_include_l=
ist} $f"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_file_list} .=
/$f"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_include_list=3D"${tm_include_l=
ist} ./$f"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tm_file_list=3D"${tm_f=
ile_list} \$(srcdir)/config/$f"
> > diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> > index 054ede89647..3b2c2b9df37 100644
> > --- a/gcc/mkconfig.sh
> > +++ b/gcc/mkconfig.sh
> > @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $# -ge 1 ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo '#ifdef IN_GCC' >=
> ${output}T
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for file in "$@"; do
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test x=
"$file" =3D x"defaults.h"; then
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test x=
"$file" =3D x"./defaults.h" -o x"$file" =3D
> > x"defaults.h"; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 postpone_defaults_h=3D"yes"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "# include \"$file\"" >> ${output}T
> > @@ -106,7 +106,7 @@ esac
> >=20
> > =C2=A0 # If we postponed including defaults.h, add the #include now.
> > =C2=A0 if test x"$postpone_defaults_h" =3D x"yes"; then
> > -=C2=A0=C2=A0=C2=A0 echo "# include \"defaults.h\"" >> ${output}T
> > +=C2=A0=C2=A0=C2=A0 echo "# include \"./defaults.h\"" >> ${output}T
> > =C2=A0 fi
> >=20
> > =C2=A0 # Add multiple inclusion protection guard, part two.
> > --
> > 2.39.0
> >=20
> =C2=A0


