Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.24558.1592244258041753476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 11:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ml+YvfCy;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id q2so9885032vsr.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYbig4vLahPSBYhXhv3bJD7l0qJf0IQ7Uvk3q6gal/k=;
        b=ml+YvfCy9fpdR2gnryw8fnhWY9IFurSCHLHfTaiSDxWezOE3awFG28kGj1gstspoGY
         K9GdvcyJ5SJLRJPXZbFCb1zM3mzk2ukgobWXCPmaOET9dikWbVDwW0iqwYqjPQq7g4SM
         tx9UCEH3gybvip55wvAnHtVlMFHD6aH5Zf9RguNqop5Mb/d8oH/7CnJ5992IPCzuBQzn
         6yfN/5cvPWuJeUGA3421a0zjMVDn7US4DE3CRxpoD5uZpxDX9UHm6/n4P3H1iV/mr7YE
         3qB6eCqqV86RBt5O0zvbZagUT7NHe5Za4R0tue1Hngbf6MPxktspnMzC3Wr7zP7jdu8+
         mTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYbig4vLahPSBYhXhv3bJD7l0qJf0IQ7Uvk3q6gal/k=;
        b=c1cDCJRKCjCtS2GEcsARs4DDlZVSRdcJagXOc5gXTmU+a+Ql+m18XSOc7INnteXXB0
         wRXh0x/ei9Ndvg6xPEX+Y4vMbkyAfoPvAEVqRXKE1CtSuNKqmCu70zHirGVl44kl+9G3
         5ZbeaM28zc53HJTdUAaWGahGVttwp9I9/2WI0cgU63zIa8fc1+UyJCKTS8mJKXx0h5gv
         xvSc8qhimlm6NmdyR92fy+Hi6eKzeBvaVrl/CE1B4Yk9PuqrrynFrWxIwMu9OQLgySqm
         ihXCO3NVjDbVvnk85btN36e1iP//lRwTUs6RmDvrTd9VemXkYvhEPkVxfZQ9wxukKPT1
         ucmg==
X-Gm-Message-State: AOAM5310cFPNH5gis0xNTYamRTTXPcmhtLooiLsVjftTTLec9yByLLH9
	f9vX5UTXMqkTuzsxlwBxsA1bD94OZr8SlQFQh/w=
X-Google-Smtp-Source: ABdhPJwCh/fQJAk2p6Oi/PO53XOsUCi9eO8eoqnaNbyVwnvKjFKjUVAF32ILod1ryrpdOmXdz09WojbHv8gsRy2mCu8=
X-Received: by 2002:a67:6ec4:: with SMTP id j187mr20136024vsc.35.1592244256669;
 Mon, 15 Jun 2020 11:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
 <1618C532747F3046.29686@lists.openembedded.org> <CANNYZj9Q_cWv4L1ssOFLVDm1TdY20ZSu2B2V0zjLpYnAAJTeVA@mail.gmail.com>
 <80ddd1d5eece62f64b743fb25db62ef3501a9e5e.camel@linuxfoundation.org>
In-Reply-To: <80ddd1d5eece62f64b743fb25db62ef3501a9e5e.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 15 Jun 2020 20:04:05 +0200
Message-ID: <CANNYZj9bBmVP62=j-qU-RTs2wp7Ekywm4W+zq8tyJMtYU217kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050877e05a8234143"

--00000000000050877e05a8234143
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 18:56, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-06-15 at 18:54 +0200, Alexander Kanavin wrote:
> > Come to think of it, maybe it's okay in this situation to actually
> > remove OEHasPackage - the test will simply always run, and will still
> > fail if the package is absent, but the failure would be less specific
> > than a missing package.
>
> Lighting up the autobuilder with failures will just mean people no
> longer know which failures matter, so no, this isn't an option.
>

I didn't mean the AB (which has a universal list of test suites for all
images, which means the tests have to adapt via OeHasPackage), but rather
what we have here: several lists of tests that are tightly coupled to their
respective test images. In this situation OEHasPackage is
counter-productive.

Alex

--00000000000050877e05a8234143
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 15 Jun 2020 at 18:56, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2020-06-15 at 18:54=
 +0200, Alexander Kanavin wrote:<br>
&gt; Come to think of it, maybe it&#39;s okay in this situation to actually=
<br>
&gt; remove OEHasPackage - the test will simply always run, and will still<=
br>
&gt; fail if the package is absent, but the failure would be less specific<=
br>
&gt; than a missing package.<br>
<br>
Lighting up the autobuilder with failures will just mean people no<br>
longer know which failures matter, so no, this isn&#39;t an option.<br></bl=
ockquote><div><br></div><div>I didn&#39;t mean the AB (which has a universa=
l list of test suites for all images, which means the tests have to adapt v=
ia OeHasPackage), but rather what we have here: several lists of tests that=
 are tightly coupled to their respective test images. In this situation OEH=
asPackage is counter-productive.</div><div><br></div><div>Alex<br></div></d=
iv></div>

--00000000000050877e05a8234143--
