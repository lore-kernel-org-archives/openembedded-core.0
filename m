Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD76EC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:12:18 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.37393.1634566337405892547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QcmhIgmh;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id s136so13140491pgs.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2PAg84/XStswL96/qAE1HPf0B9kDcBOXHQUM3Rm3ew=;
        b=QcmhIgmhMjJjgkS2uA9r0DU2LeOd+nRmuquLXQwKlPZt3FuXivHru38Tx/ZmwchZ6G
         hKQzk6IGSoWf5vUK3W7CgFb5/WLP6wnwwry+bDwG5FfJPoNHYXZaxiHwFoYVovxgGRXd
         uW8ph8MxvQ/6Qf9N0QfkSEIAtyiDmKlKzCyioQThkUBRYKnztEB+1H1w2KLlENJNQ3s9
         UFp7cuYy5F2itrd4ZR4wYTtHqc8L3PeVY6xeKy6NTXbXM6Dhrim/4QSHjWiqb00QfDVC
         VKwSTCVCgv3VAeFb+mWUQvODsmP4qg6NuR9EinSdcSblR8htLm00xONQtd2ynr+ENLiN
         YmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2PAg84/XStswL96/qAE1HPf0B9kDcBOXHQUM3Rm3ew=;
        b=PieK/qBBc1UVk+NwE5+juJkFAgzmSRCQi1wSAmLz+VXoDQesJRTTjjirIZnpjkpj6q
         MTxAropuU93pGYK8Lh7mOCp5RVyU7EdymvjGJaxw2m5DAWW5jrNzigs7OP3dN9POOSLH
         qbXqq24ImtXS7pEOyHngFGCfkk3MTSFNy3qUyeD78BdQ/pHUI1d+mzlmqCUZbTq0DUqV
         lMe3EM+hnT2UDa9jUnO4jAPTEjEyLSBOEK3fcfQVk6vVwnIQZ2RE+9jGv/eo91bcluLa
         v2bdqPyVXfLh0aLCHYg9DveupMW2+aOJebVicsXXxfz2VeoUuStJdgjr7lCjUjeZ1Xj7
         brNw==
X-Gm-Message-State: AOAM531nhuu28WxEfSFtEFv7kQF055b0GdrOSf+X/IuZr4YoncMNalQl
	hZmBn+0txpBLiCnIOiRk05mHDpkr50sQRcfWEUU=
X-Google-Smtp-Source: 
 ABdhPJzLeQM6JUS62Z/xLk7X6Mt1pDVIPwyVD3R4+jBeGc6ZmjND7KV3Ac5rDq+xBfZdqT+knnm9gIwUmC3y9287zcE=
X-Received: by 2002:a63:1cd:: with SMTP id 196mr23860951pgb.39.1634566336821;
 Mon, 18 Oct 2021 07:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
In-Reply-To: 
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:12:05 +0200
Message-ID: 
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de3e6a05cea121d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157065

--000000000000de3e6a05cea121d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 1:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > FWIW: I've fixed some bigger layers where pkgconfig was causing quite a
> few build failures,
> >
> Had an off-oe time due to  heavy work load.
> Think this one is the reason for the pkgconfig patch flood. You are
> aware that there are packages not failing at build time for missing
> pkgconfig but build output is different and bugs will pop up at
> runtime.
>
> To avoid responsible maintainers have to go through EVERY recipe (and
> combination of PACKAGECONFIGs) and check if builds are still as
> expected - Can't believe it!
>

Not sure why this seems targeted to me.

Yes I've tried to fix whatever issues this change caused in my world builds
and I'm partially responsible for pkgconfig patch flood, because I wanted
layers like meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay
compatible with oe-core whenever this change from RP is merged to master.

I've also tried to compare buildhistory and image content (for
ros-image-world with ros1-melodic) to see if I can spot more cases of
non-fatal build output changes as in collada-dom and unfortunately there is
a lot of noise in buildhistory (due to many recipes included in this image
not really build-reproducible), so I've used
mostly installed-package-sizes.txt file to spot 2 more recipes where the
size was different (but both don't seem to be caused by pkgconfig-native in
the end).

I did both builds from scratch without sstate, so I would assume that it
will catch all possible cases, but surprisingly just yesterday I've caught
another missing pkgconfig-native in one of meta-ros1-melodic recipes
(caught in kirkstone based build - while before I was testing on top of a
bit older honister with this change cherry-picked just for test - to
prepare recipes to be future-proof for kirkstone).

Regards,

--000000000000de3e6a05cea121d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 1:50 AM Andreas M=
=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gma=
il.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Oct 1, 2021 at 4:17 PM Martin Jans=
a &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Ja=
nsa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; FWIW: I&#39;ve fixed some bigger layers where pkgconfig was causing qu=
ite a few build failures,<br>
&gt;<br>
Had an off-oe time due to=C2=A0 heavy work load.<br>
Think this one is the reason for the pkgconfig patch flood. You are<br>
aware that there are packages not failing at build time for missing<br>
pkgconfig but build output is different and bugs will pop up at<br>
runtime.<br>
<br>
To avoid responsible maintainers have to go through EVERY recipe (and<br>
combination of PACKAGECONFIGs) and check if builds are still as<br>
expected - Can&#39;t believe it!<br></blockquote><div><br></div><div>Not su=
re why this seems targeted to me.</div><div><br></div><div>Yes I&#39;ve tri=
ed to fix whatever issues this change caused in my world builds and I&#39;m=
 partially responsible for pkgconfig patch flood, because I wanted layers l=
ike meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay compatible with=
 oe-core whenever this change from RP is merged to master.</div><div><br></=
div><div>I&#39;ve also tried to compare buildhistory and image content (for=
 ros-image-world with ros1-melodic) to see if I can spot more cases of non-=
fatal build output changes as in=C2=A0collada-dom and unfortunately there i=
s a lot of noise in buildhistory (due to many recipes included in this imag=
e not really build-reproducible), so I&#39;ve used mostly=C2=A0installed-pa=
ckage-sizes.txt file to spot 2 more recipes where the size was different (b=
ut both don&#39;t seem to be caused by pkgconfig-native in the end).</div><=
div><br></div><div>I did both builds from scratch without sstate, so I woul=
d assume that it will catch all possible cases, but surprisingly just yeste=
rday I&#39;ve caught another missing pkgconfig-native in one of meta-ros1-m=
elodic recipes (caught in kirkstone based build - while before I was testin=
g on top of a bit older honister with this change cherry-picked just for te=
st - to prepare recipes to be future-proof for kirkstone).</div><div><br></=
div><div>Regards,<br></div></div></div>

--000000000000de3e6a05cea121d9--

