Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web12.10123.1592493953532346726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k5+ztiqJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id n22so1527258vkm.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZidrZivX7Vm/1i1w9POe8yZze3YoZEfRsGWxe7KEH7A=;
        b=k5+ztiqJcELFRwrsJcSIuMB5Q0ywxvixO+07O4FERRLHtVWVXX+/N63h7d/mvRUg1L
         sIJz7YMpd+v9lwFnNwaIgo8SsNEehVvVNdA0rc3+yqcKs1E5lOmEJ4he6Hurl3VGoR5D
         6pEybMYdaKiDBEHCEEWkuBvyTEfGipUqCfjFbsLI+nzagLNlF+VmK8E2KAOc5cl0pZdd
         BSbJ2QCB8UW+13VW5bIhTCnJzP/j0Mb1W3jdVFv6nPRxAzPG0iETmk/NLvuPTbRAaOdY
         toe6nS3mBgiFyzE92j+CsolHqPdhFZsmw0iBGdJNgqzxW/WqtbI3p8SVDPIAVREgg0o8
         UitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZidrZivX7Vm/1i1w9POe8yZze3YoZEfRsGWxe7KEH7A=;
        b=kTtRo4wPF/X8FKZ0pC30tMYYC4Ht5wD934YoJLv9pCdAX6KaGy4rr7oOrUmrfFF+2L
         qVEnoGjBxh2SSm2DcKP2t7zvdA2mUQXezeuzAFlb+RuwfYaMhQtbRyliHXH2xJDjAb/2
         CrMK4WCpAWMR19NMn+wYZKuHLuvk3J8ISGQpRaOpPP6nn9XVwKpWkRUZH551YBfIn/ya
         d7brGV3bsC/qTvaCbSsKezaj+M0I7R8MzuWoYUz8HxAas9+lY5+XxOS6wUfvPcxfTn15
         j8pd9EZViqhIyUdWm/Y4f6okaES0bVefVQnPx4WXj2vUhfRcD2D+kmH9tgf45el9HDP1
         M/Dg==
X-Gm-Message-State: AOAM533eiaNuOa7JXLNEoVHCCxn5p6YlcxE8P0v7axYMqqAZcOBneiye
	lyw7WGtDxe2+t/R9MDQQ1QVYE9iLin2BTXje9SE=
X-Google-Smtp-Source: ABdhPJw8qYinu1HzHII3ZGQLYII+oNkRgVA2Cp7c1VJqwpKV23SjmQyEd0oSdkCdEtMmf96kQZ9fJKlEeTCPtEJ0Dj8=
X-Received: by 2002:a1f:2c0d:: with SMTP id s13mr3892035vks.9.1592493952678;
 Thu, 18 Jun 2020 08:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200615060025.171354-1-arthur.she@linaro.org>
 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
 <20200615075646.GU17660@denix.org> <CAJ8hLzH2JMoJ7QspxnjAZ1ZwKshj+REUu=HrE7A2tspu_pH=Zw@mail.gmail.com>
 <CANNYZj8n5b46zVCL1Kt4NdweQb0tvZh3SmCype4p6BxzD7_T7Q@mail.gmail.com>
 <9f5397898511c51c6a388fa602e8bdba1a702560.camel@intel.com> <CAJ8hLzHB45R_g=OrGTEMLqnUkhg64OSPJvAr+P-3LGF355mpnw@mail.gmail.com>
In-Reply-To: <CAJ8hLzHB45R_g=OrGTEMLqnUkhg64OSPJvAr+P-3LGF355mpnw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 18 Jun 2020 17:25:41 +0200
Message-ID: <CANNYZj_hoDQ_XnGitKWu8MqJi33e3KEH2A9tzpY8r=NeU_Nh-A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
To: Arthur She <arthur.she@linaro.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, "denis@denix.org" <denis@denix.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b3de005a85d647e"

--0000000000005b3de005a85d647e
Content-Type: text/plain; charset="UTF-8"

I am fine with that, please resend with Anuj's rationale included into the
commit message.

Alex

On Thu, 18 Jun 2020 at 07:27, Arthur She <arthur.she@linaro.org> wrote:

> Hi Alex,
> Would it be a sufficient reason for doing that?
> Or any thought could be shared from you?
>
> Thank you so much,
> Arthur
>
> On Tue, Jun 16, 2020 at 12:16 AM Mittal, Anuj <anuj.mittal@intel.com>
> wrote:
>
>> Hi Alex
>>
>> On Tue, 2020-06-16 at 09:04 +0200, Alexander Kanavin wrote:
>> > Usually it's the other way around - what is the reason to have this
>> > recipe in core?
>> >
>>
>> I had requested Arthur to send this to oe-core since this provides
>> a core validation functionality that is needed by all providing DRM
>> drivers and is applicable not just to a single arch.
>>
>> It's a well maintained project and I can keep the recipe updated and
>> working. If it can be in oe-core, I can remove it from meta-intel layer
>> and avoid having a duplicate recipe.
>>
>> Thanks,
>>
>> Anuj
>>
>> > Alex
>> >
>> > On Tue, 16 Jun 2020 at 06:45, Arthur She <arthur.she@linaro.org>
>> > wrote:
>> > > Hi Alexander and Denys,
>> > > Thanks for your feedback.
>> > > I have no problem submitting it to meta-oe.
>> > > Since the meta-intel maintainer requested to submit it to oe-core,
>> > > do you mind sharing some thought about the reason?
>> > >
>> > > Thank you so much,
>> > > Arthur
>> > >
>> > > On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko <denis@denix.org
>> > > > wrote:
>> > > > https://lists.openembedded.org/g/openembedded-devel/topic/74775294
>> > > >
>> > > > But I tend to agree.
>> > > >
>>
>

--0000000000005b3de005a85d647e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am fine with that, please resend with Anuj&#39;s ra=
tionale included into the commit message.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, 18 Jun 2020 at 07:27, Arthur She &lt;<a href=3D"mailto:arthur=
.she@linaro.org">arthur.she@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div>Would i=
t be a sufficient reason for doing that?</div><div>Or any thought could be =
shared from you?</div><div><br></div><div>Thank you so much,</div><div>Arth=
ur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jun 16, 2020 at 12:16 AM Mittal, Anuj &lt;<a href=3D"mailto=
:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alex<br>
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
</blockquote></div>

--0000000000005b3de005a85d647e--
