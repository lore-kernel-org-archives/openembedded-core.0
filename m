Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.1242.1592458079510322471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 22:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HtsFSSiH;
 spf=pass (domain: linaro.org, ip: 209.85.166.175, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f175.google.com with SMTP id l6so4622822ilo.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzWc3HjkaowLT1+ZddMH8KLCaY0wT4CV9DypYi6Unzw=;
        b=HtsFSSiHuefDfcI+n+eXfCvMrvwsffAel/dUNZ4B+O4f9ohUnflEg/aLVd7TeTdRQ9
         3zNgGCVUxmIPzQ3WqwYCRgGIRrB5ohcbYDN9xEo+0pxOk2w0ElQgDSO7crDXlnls137n
         uACiK+QZlIOjhRSU1O6dQm8ICJ60SsrFWoR4ivEZTIvCtbFSOSddc3WhuFln2+eyn8gn
         y2WdP65W+BlWH/hhjLLnIlrwy36i2AWeHJm10fPuWxf6B5aV3PTcySL2ocS2BmLoXZAa
         GeRxEvFiqYJ89yE0uk1lWfLTHMFEXbXCOWpoJjzbsP9lChciLGKzZq+L+vvAiIhqzfwa
         hLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzWc3HjkaowLT1+ZddMH8KLCaY0wT4CV9DypYi6Unzw=;
        b=YKV+u9CEtGG9cn6zA02R/3Ay95UUjJeP3GsRBnXGoXg/7MId1Nszh24lgi2oq75VOb
         C8KG5BsIvzIGX3EFeLJaH+HCIZHFnHljMFw37t7NwKGoVSdAmV0IkuyPKl+PI3EroIp5
         WQOCG9mwIWMN2Ostj6vwxiCsp5lkysSQMHE9Ml/BhI9fASpSRGlJ82iL8yGVm0JDM2zv
         3bhWT1xXMRqQayCYKbpfFcXz6niDYFqLYL1SP46t2KeIFTtfiyHF1RGISMqu9xH8DxDv
         yUWpkE7MNSBtJiHZxWdN69VALOtLIAo2AMnwWTD5sWa5sn5B7bXFrh/Oi8/T1Q0stE5N
         WWUQ==
X-Gm-Message-State: AOAM5333lVuykBQRJWlSGvFv5AyBZin2xBdMla4wQCKJPZYRhefetARI
	szMI4ACaGacLni+Iv3Q49zjzqMW7+LjTEQvOKT6GSg==
X-Google-Smtp-Source: ABdhPJzRBwQUidqKy7YrTrO5pxk0Y1CcfMZTPimh6NMqm6DhgTYnuqaK3xAM0UxKlst/hR2cM0NuyKwyvsmqwfRQqGA=
X-Received: by 2002:a05:6e02:f44:: with SMTP id y4mr2499187ilj.237.1592458078958;
 Wed, 17 Jun 2020 22:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200615060025.171354-1-arthur.she@linaro.org>
 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
 <20200615075646.GU17660@denix.org> <CAJ8hLzH2JMoJ7QspxnjAZ1ZwKshj+REUu=HrE7A2tspu_pH=Zw@mail.gmail.com>
 <CANNYZj8n5b46zVCL1Kt4NdweQb0tvZh3SmCype4p6BxzD7_T7Q@mail.gmail.com> <9f5397898511c51c6a388fa602e8bdba1a702560.camel@intel.com>
In-Reply-To: <9f5397898511c51c6a388fa602e8bdba1a702560.camel@intel.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Wed, 17 Jun 2020 22:27:48 -0700
Message-ID: <CAJ8hLzHB45R_g=OrGTEMLqnUkhg64OSPJvAr+P-3LGF355mpnw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "denis@denix.org" <denis@denix.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001dcdb405a8550a63"

--0000000000001dcdb405a8550a63
Content-Type: text/plain; charset="UTF-8"

Hi Alex,
Would it be a sufficient reason for doing that?
Or any thought could be shared from you?

Thank you so much,
Arthur

On Tue, Jun 16, 2020 at 12:16 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> Hi Alex
>
> On Tue, 2020-06-16 at 09:04 +0200, Alexander Kanavin wrote:
> > Usually it's the other way around - what is the reason to have this
> > recipe in core?
> >
>
> I had requested Arthur to send this to oe-core since this provides
> a core validation functionality that is needed by all providing DRM
> drivers and is applicable not just to a single arch.
>
> It's a well maintained project and I can keep the recipe updated and
> working. If it can be in oe-core, I can remove it from meta-intel layer
> and avoid having a duplicate recipe.
>
> Thanks,
>
> Anuj
>
> > Alex
> >
> > On Tue, 16 Jun 2020 at 06:45, Arthur She <arthur.she@linaro.org>
> > wrote:
> > > Hi Alexander and Denys,
> > > Thanks for your feedback.
> > > I have no problem submitting it to meta-oe.
> > > Since the meta-intel maintainer requested to submit it to oe-core,
> > > do you mind sharing some thought about the reason?
> > >
> > > Thank you so much,
> > > Arthur
> > >
> > > On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko <denis@denix.org
> > > > wrote:
> > > > https://lists.openembedded.org/g/openembedded-devel/topic/74775294
> > > >
> > > > But I tend to agree.
> > > >
>

--0000000000001dcdb405a8550a63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div>Would it be a sufficient reason for doing tha=
t?</div><div>Or any thought could be shared from you?</div><div><br></div><=
div>Thank you so much,</div><div>Arthur</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 16, 2020 at 12:16 =
AM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_bla=
nk">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Alex<br>
<br>
On Tue, 2020-06-16 at 09:04 +0200, Alexander Kanavin wrote:<br>
&gt; Usually it&#39;s the other way around - what is the reason to have thi=
s<br>
&gt; recipe in core?<br>
&gt; <br>
<br>
I had requested Arthur to send this to oe-core since this provides<br>
a core validation functionality that is needed by all providing DRM<br>
drivers and is applicable not just to a single arch.<br>
<br>
It&#39;s a well maintained project and I can keep the recipe updated and<br=
>
working. If it can be in oe-core, I can remove it from meta-intel layer<br>
and avoid having a duplicate recipe.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 16 Jun 2020 at 06:45, Arthur She &lt;<a href=3D"mailto:arthur.=
she@linaro.org" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; Hi Alexander and Denys,<br>
&gt; &gt; Thanks for your feedback.<br>
&gt; &gt; I have no problem submitting it to meta-oe.<br>
&gt; &gt; Since the meta-intel maintainer requested to submit it to oe-core=
,<br>
&gt; &gt; do you mind sharing some thought about the reason?<br>
&gt; &gt; <br>
&gt; &gt; Thank you so much,<br>
&gt; &gt; Arthur<br>
&gt; &gt; <br>
&gt; &gt; On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko &lt;<a href=3D=
"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a><br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-dev=
el/topic/74775294" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/topic/74775294</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; But I tend to agree.<br>
&gt; &gt; &gt; <br>
</blockquote></div>

--0000000000001dcdb405a8550a63--
