Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.34519.1591010286398695402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D1KtoxG4;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id r11so1042333vsj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HZ2mV4BM96/Va182NdBrrdDvO8CzeuqHC8iQBWCkwS0=;
        b=D1KtoxG40HNjAOIVYjTMVZCCxbyWNtn0g/FtlrivW/Z55HoA1vgYhnHhFAi7Z2EjE0
         NWCRQJNuWDaoDBG4RoiCI/lbwj3styXh7J6aiQYsbeUPQIGQ2dFdRFMPyexptf9sCKsJ
         GCTeytWBplGpe8Yrh4YMppY3fHCw6t45WzRRwbsw4JINM3t3zajDQ8csZfQn+MbUPVnV
         yJYrSTxz0UARHZeU9Rjpi+lpJiTEvZDtbAPTiz7dV6bATGwGRhV55giautA5pvCLuA3H
         Ml+JMSzUCza4Bmz/dB8oqcO59/LPCsECBgYpnd/ln50y5GDRFI1jXwXVmvOo1ua3XbEJ
         +bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZ2mV4BM96/Va182NdBrrdDvO8CzeuqHC8iQBWCkwS0=;
        b=h18uoEpKyVjOWZmxdKAmAT8FGTmOG5kshh3LyJ8Zxq8fUgJt7H4rFBZFFPgrVQWUGj
         2agKS+3ddh567hVhb8uvXsMRQC7p1ond6Z9a4x0wQgaTmk2A2gNnG0N2Iz+pqkMNY1HE
         /NSfPnSA830fYm/YzTsf0vYT/aWV+IA45B1kYB4AG67l/jU4DfIGtTZxuEvtKzi7VTUw
         hi2WJ2cJa4lZ9O2w/bOTx0Tc87OwRmG/qX9DWY4dOYuf0Da/cDabFQ7srDB+KXwvvLkZ
         JJQkOcdNTaw+R8DHVRwsIfhWwqwiqB+pB2b2SjdHHF+uTQ9cWglEKOsx4OvTxmr+MIL8
         3Scg==
X-Gm-Message-State: AOAM5330QYs9tduKZvTr+Z0r6JAYvYW3rpWZvBEZm1L6kPfsjDzqrdGq
	PNE1s1T6gYAzV3wt879p3ga/aI7cxW6yG97kgmM=
X-Google-Smtp-Source: ABdhPJz3GkVRjktV9ZbFLAE9wB58DCWGgbd+nOhF5AUsuU0oh19DrUb6yug/37BxJLupqoFkWOylcrG8DAabOvoIV2o=
X-Received: by 2002:a67:d098:: with SMTP id s24mr13616846vsi.25.1591010285560;
 Mon, 01 Jun 2020 04:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-67-alex.kanavin@gmail.com> <c48af912b817bbb89b8dcae32a94562fd83efc66.camel@linuxfoundation.org>
In-Reply-To: <c48af912b817bbb89b8dcae32a94562fd83efc66.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2020 13:17:54 +0200
Message-ID: <CANNYZj8d2uOO4-HSBzn-gSOxaXpS12p1xdcfaNt4Qu=muY=aiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 67/70] apt: update to 1.8.2.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e7aad305a703f2c1"

--000000000000e7aad305a703f2c1
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2020 at 09:21, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-05-31 at 17:52 +0200, Alexander Kanavin wrote:
> > I took the opportunity to rewrite the recipe from scratch; there was
> > just too much baggage in it.
>
> Test builds failed with a reproducibility problem in lz4:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13925
>
> This hasn't been seen until now since there is now a hard dependency on
> lz4 from apt in this patch.
>
> We could fix the symbol ordering or perhaps disable the static library
> as we don't use it as far as I know, not sure why it would be building
> one...
>

lz4 is using hand-crafted Makefiles, so the build is non-standard. I just
sent a patch to disable the static library.

Alex

--000000000000e7aad305a703f2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 1 Jun 2020 at 09:21, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2020-05-31 at 17:52 =
+0200, Alexander Kanavin wrote:<br>
&gt; I took the opportunity to rewrite the recipe from scratch; there was<b=
r>
&gt; just too much baggage in it.<br>
<br>
Test builds failed with a reproducibility problem in lz4:<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13925" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13925</a><br>
<br>
This hasn&#39;t been seen until now since there is now a hard dependency on=
<br>
lz4 from apt in this patch.<br>
<br>
We could fix the symbol ordering or perhaps disable the static library<br>
as we don&#39;t use it as far as I know, not sure why it would be building<=
br>
one...<br></blockquote><div><br></div><div>lz4 is using hand-crafted Makefi=
les, so the build is non-standard. I just sent a patch to disable the stati=
c library.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000e7aad305a703f2c1--
