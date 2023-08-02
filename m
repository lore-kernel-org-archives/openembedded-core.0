Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC09C04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:17:56 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.2162.1690996672273221150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OrgM8xht;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: kergoth@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-583c48a9aa1so75966727b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996671; x=1691601471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YBqUm/M8uM17ghqjSJMEuM7Fkq1gKpKtok4b2+ejDDg=;
        b=OrgM8xhtbRV95/de1AAoUeGeMfO+ROuG7t5jel8G/SO+eaaBblCX6BgKrZyTf9luF+
         wAKOk287HScuEUnZyi8LGMJtzj4UGh387BZZfjnCqgeFGflWF3V21Yb1VxoL6lPKQ0JC
         3SbuYb8/6VrpIkUZdlCjWMxyi8WABTp5NaLhBr4Wcoz/GOioedxc1sfQgLM8YeoKBgLK
         f8lDa/P6n09cCt8RKPvwhCQ5rxGXNmqaKHlxv4I3leXznT3oJUQyOHrg6lfMQFhLkl4s
         uogXZ1zH4m0ZE9QqqUAqZRuUNDai3YE9Tq5t51zQlOhQ3Oa25h1JSi8etfSgWWIEnLfu
         BXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996671; x=1691601471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBqUm/M8uM17ghqjSJMEuM7Fkq1gKpKtok4b2+ejDDg=;
        b=MKWafnYWMD5VsmLnRATMiwmTf2w6yuqqh8sUNChSYrw5Q0i4PWR/fYMn1qcNvusEAo
         CGtXlExnB092SWw4UpOgRqAY4PrjbGigQ8juA4sZdroa0lWjCpwVlUmKdhY+oBq22g6g
         iZG4oJCJ6A1giTXL1YU0NUVMg03sbEWjqOHAxmOztASqTUi4/r1/Bw4IWQcWvUo+3Q1N
         hZcgLIwx7rB06y6qqcDTFKK/6U81V9q/7ZvM4qpZN+jN5CF+q25yHX4MbSSLWZcIR+Pp
         ornxlxIJ+GXAc6cHvzWzBlpQ2rQFLw5tCHX9qqnJ8BkXDAJjQHJ1q/AeQMxPDy3nXw73
         7tEA==
X-Gm-Message-State: ABy/qLY9Cija6TeNPr8JKBCMaF3+G2590C6J2P7R5d3kQAQOEYFsNJoI
	h4/maOy0tS+aVReUB148s8NOJjrAlYYBKAk+MCE=
X-Google-Smtp-Source: APBJJlFMBFj9Cu9/yBpuOK2uz0zW2zRTqyunLP81Gzejo2bdgMKsqhyYHuZl7GckqAtpwMj38xHAhOOOwSKZlYcDjak=
X-Received: by 2002:a81:6b46:0:b0:579:e5fb:f6c5 with SMTP id
 g67-20020a816b46000000b00579e5fbf6c5mr16761212ywc.2.1690996671461; Wed, 02
 Aug 2023 10:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <c447aa42-9eae-ce9c-356f-ae3133c00418@ti.com>
In-Reply-To: <c447aa42-9eae-ce9c-356f-ae3133c00418@ti.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 2 Aug 2023 10:17:40 -0700
Message-ID: <CABcZANmXqJcCaqdxuHrTdvrg1kZ8OCeOag_ZGUA2J_TUkuLJFw@mail.gmail.com>
Subject: Re: [OE-core] image.bbclass question
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb41f10601f3d701"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185418

--000000000000eb41f10601f3d701
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Image builds obey IMAGE_FSTYPES. Initramfs images set that to
INITRAMFS_FSTYPES, so it's comparing the two as a check to see if this is
an initramfs image. It isn't making sure it matches a hardcoded list, so
intersection isn't necessary.

On Wed, Aug 2, 2023 at 9:41=E2=80=AFAM Ryan Eatmon via lists.openembedded.o=
rg
<reatmon=3Dti.com@lists.openembedded.org> wrote:

>
> I am trying to add support for the INITRAMFS_MAXSIZE into the meta-ti
> layer for our tiny image.
>
> I have added the following to our tiny image file:
>
> INITRAMFS_FSTYPES +=3D "cpio cpio.xz"
> INITRAMFS_MAXSIZE =3D "65536"
>
> But I'm not seeing any errors about the image being too big being printed=
.
>
> In looking at the code in question:
>
>      # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
>      if image_fstypes =3D=3D initramfs_fstypes !=3D ''  and initramfs_max=
size:
>          initramfs_maxsize_int =3D int(initramfs_maxsize)
>          if base_size > initramfs_maxsize_int:
>              bb.error("The initramfs size %d(K) exceeds
> INITRAMFS_MAXSIZE: %d(K)" % \
>                  (base_size, initramfs_maxsize_int))
>              bb.error("You can set INITRAMFS_MAXSIZE a larger value.
> Usually, it should")
>              bb.fatal("be less than 1/2 of ram size, or you may fail to
> boot it.\n")
>
>
> What is the purpose of the:
>
> if image_fstypes =3D=3D initramfs_fstypes !=3D ''
>
>
> It seems to looking for the ONLY images being built are the exact same
> as the INITRAMFS_FSTYPES...  Shouldn't that be more of an intersection
> check?  If any of the INITRAMFS_FSTYPES are in the IMAGE_FSTYPES, then
> check the size?
>
> Or am I missing something?
>
>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185415):
> https://lists.openembedded.org/g/openembedded-core/message/185415
> Mute This Topic: https://lists.openembedded.org/mt/100509426/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000eb41f10601f3d701
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Image builds obey IMAGE_FSTYPES. Initramfs images set that=
 to INITRAMFS_FSTYPES, so it&#39;s comparing the two as a check to see if t=
his is an initramfs image. It isn&#39;t making sure it matches a hardcoded =
list, so intersection isn&#39;t necessary.</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 2, 2023 at 9:41=E2=80=
=AFAM Ryan Eatmon via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.openembedded.o=
rg">ti.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
I am trying to add support for the INITRAMFS_MAXSIZE into the meta-ti <br>
layer for our tiny image.<br>
<br>
I have added the following to our tiny image file:<br>
<br>
INITRAMFS_FSTYPES +=3D &quot;cpio cpio.xz&quot;<br>
INITRAMFS_MAXSIZE =3D &quot;65536&quot;<br>
<br>
But I&#39;m not seeing any errors about the image being too big being print=
ed.<br>
<br>
In looking at the code in question:<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Check the initramfs size against INITRAMFS_MAXSIZE (i=
f set)<br>
=C2=A0 =C2=A0 =C2=A0if image_fstypes =3D=3D initramfs_fstypes !=3D &#39;&#3=
9;=C2=A0 and initramfs_maxsize:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_maxsize_int =3D int(initramfs_m=
axsize)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if base_size &gt; initramfs_maxsize_int:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;The initramf=
s size %d(K) exceeds <br>
INITRAMFS_MAXSIZE: %d(K)&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(base_size, i=
nitramfs_maxsize_int))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;You can set =
INITRAMFS_MAXSIZE a larger value. <br>
Usually, it should&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;be less than=
 1/2 of ram size, or you may fail to <br>
boot it.\n&quot;)<br>
<br>
<br>
What is the purpose of the:<br>
<br>
if image_fstypes =3D=3D initramfs_fstypes !=3D &#39;&#39;<br>
<br>
<br>
It seems to looking for the ONLY images being built are the exact same <br>
as the INITRAMFS_FSTYPES...=C2=A0 Shouldn&#39;t that be more of an intersec=
tion <br>
check?=C2=A0 If any of the INITRAMFS_FSTYPES are in the IMAGE_FSTYPES, then=
 <br>
check the size?<br>
<br>
Or am I missing something?<br>
<br>
<br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185415): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185415" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185415</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100509426/361=
7123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100509426/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christopher Larson<=
br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.com</a>,=C2=
=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=A0Embedded L=
inux Solutions,=C2=A0Siemens Digital Industries Software</font><br></div></=
div></div>

--000000000000eb41f10601f3d701--

