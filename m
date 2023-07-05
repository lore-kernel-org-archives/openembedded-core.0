Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A2DEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 16:42:27 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.22739.1688575344752592004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 09:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pe8osv2v;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a3b7fafd61so2209468b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688575344; x=1691167344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2s3JbjYyQy4aPunlyCDQczRTU3eyy7SOXrenBEU5Jdc=;
        b=pe8osv2vvggECz08J2dd/Qx6hjaQM2HL8HMlyzhoJLqBH07/sP9bwGYw5UcdgvpNzF
         Sh2MZ9h0zGBGJJjjbpqENKdTPRx22Qxn2nmVVkNcUZBILxC/ik4XA8DYJCylvw73I4U8
         NFm7w8OkIBXOgLU7i0L/XcylfdnCpSYdOnBsQN2fGcCMH2kOgou92rzU86vGDbsCShX7
         UgsJT9EMn5uIge+QP03qUyxtfyykxvBNd7LU6OOwfa7abPDQ1z+aI/q+1jmOhvaP1Q20
         uzlTm5ZI/QOElcHZGJlILNT/XoQe7LWZVNldgbak3UuZoDBBgsLx0KsEG0JfBwOndu/q
         Ai4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688575344; x=1691167344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2s3JbjYyQy4aPunlyCDQczRTU3eyy7SOXrenBEU5Jdc=;
        b=PmNmJdrjzKxdCS5vSYxYsy3GDMJnyzvgPKAnLriU6whHDEeJBo502Z6sYxfdt6ipcu
         dqUYoOuMh8UjmwPWFCMwvPHMHsGC0QQ6TdaBkro2JO/TvuePZjYREyXTXTof1Xkuu39W
         Sey+V3nRJZYlfkvoiTT9xH3USF3Bw2sohLQKFeWIB9SqfJW025MuD6hYckubAt12y0jk
         D6In0JLrz5qpkuKU2puqmK1aA+UPXirPRSrlsXyZ1o/Fn6EN33VNTyM3w+i6+OPRVGxN
         bxb+XBzQ1hq1zu775mRZPwIlneN9wHbd2c1aKXsWilqU3937/Q/jxOqUkgNJd9AfnhwH
         LOOQ==
X-Gm-Message-State: ABy/qLaaukjAQKWXpRgR0RLC8FvcD/p64xd0TaBTWSssOg6H7+MAckYY
	5WseEAyoWEVE8c6k/b532qoxyd3ICozSyoZt35I=
X-Google-Smtp-Source: APBJJlHYXvtEz4qLbn3di+2y0PO82hmNJRtF7W0fZYzXQnhzATllxv6L7Mmj5TNiFUwv9448WqdLUmzQ/Vyp/TnCWpU=
X-Received: by 2002:a05:6808:10ce:b0:3a3:9073:856f with SMTP id
 s14-20020a05680810ce00b003a39073856fmr19461946ois.3.1688575343821; Wed, 05
 Jul 2023 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230704102307.3654880-1-ross.burton@arm.com> <CAMKF1srqdCHyyOcpZzzhvB+=mAE+38E4hYKhwG-a+6LSf7bpTQ@mail.gmail.com>
 <427A6236-E060-4E2D-8642-FF5E78FD6095@arm.com>
In-Reply-To: <427A6236-E060-4E2D-8642-FF5E78FD6095@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jul 2023 09:42:12 -0700
Message-ID: <CAMKF1srLYqsDqmkKbP2MNtTXV5+73Jt5y-5YOcWZsjanFgqW6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: upgrade to 3.0.0
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000008b863905ffc0151e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 16:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183898

--0000000000008b863905ffc0151e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 8:19 AM Ross Burton <Ross.Burton@arm.com> wrote:

> On 5 Jul 2023, at 15:48, Khem Raj via lists.openembedded.org <raj.khem=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > I wonder of this failure is related to this
> > https://errors.yoctoproject.org/Errors/Details/711770/
>
> TOPDIR/build/tmp/work/cortexa72-cortexa53-crypto-mx8-yoe-linux/poppler/23=
.04.0-r0/recipe-sysroot/usr/include/jpeglib.h:968:52:
> error: unknown type name 'FILE'
> 968 | EXTERN(void) jpeg_stdio_dest(j_compress_ptr cinfo, FILE *outfile);
> | ^
>
>
> Quite possibly, but poppler should be including stdio.h:
>
> =E2=80=9C=E2=80=9D"
> Applications using the JPEG library should include the header file
> jpeglib.h
> to obtain declarations of data types and routines.  Before including
> jpeglib.h, include system headers that define at least the typedefs FILE
> and
> size_t.  On ANSI-conforming systems, including <stdio.h> is sufficient; o=
n
> older Unix systems, you may need <sys/types.h> to define size_t.
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> Looks like you want to backport
> https://gitlab.freedesktop.org/poppler/poppler/-/commit/2986f06c7cc9d64a5=
06ebe861b8bf38f73386e86
> to poppler.


Right that seems to be the fix. So should I be expecting a patch :)

>
>
> Ross

--0000000000008b863905ffc0151e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 5, 2023 at 8:19 AM Ross Burton &lt;<a href=3D"m=
ailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On 5 Jul 2023, at 15:48, Khem Raj via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt; <br>
&gt; I wonder of this failure is related to this<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/711770/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/711770/</a><br>
<br>
TOPDIR/build/tmp/work/cortexa72-cortexa53-crypto-mx8-yoe-linux/poppler/23.0=
4.0-r0/recipe-sysroot/usr/include/jpeglib.h:968:52: error: unknown type nam=
e &#39;FILE&#39;<br>
968 | EXTERN(void) jpeg_stdio_dest(j_compress_ptr cinfo, FILE *outfile);<br=
>
| ^<br>
<br>
<br>
Quite possibly, but poppler should be including stdio.h:<br>
<br>
=E2=80=9C=E2=80=9D&quot;<br>
Applications using the JPEG library should include the header file jpeglib.=
h<br>
to obtain declarations of data types and routines.=C2=A0 Before including<b=
r>
jpeglib.h, include system headers that define at least the typedefs FILE an=
d<br>
size_t.=C2=A0 On ANSI-conforming systems, including &lt;stdio.h&gt; is suff=
icient; on<br>
older Unix systems, you may need &lt;sys/types.h&gt; to define size_t.<br>
=E2=80=9C=E2=80=9D=E2=80=9D<br>
<br>
Looks like you want to backport <a href=3D"https://gitlab.freedesktop.org/p=
oppler/poppler/-/commit/2986f06c7cc9d64a506ebe861b8bf38f73386e86" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.freedesktop.org/poppler/poppler/=
-/commit/2986f06c7cc9d64a506ebe861b8bf38f73386e86</a> to poppler.</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Right that seems to be the=
 fix. So should I be expecting a patch :)=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--0000000000008b863905ffc0151e--

