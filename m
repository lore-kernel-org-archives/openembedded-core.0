Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.2074.1592532476736365081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 19:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZimX55VT;
 spf=pass (domain: linaro.org, ip: 209.85.166.173, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f173.google.com with SMTP id b5so7930322iln.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 19:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01N55pkryUEyQsQ1stzyMb8Fbdz+fb4hfiIogIgGpyg=;
        b=ZimX55VTyo2M1enduD00lEJivX0xQhxtV5LAjjeEqWyqHaBlLCFxQOcyVjweBVPlVz
         qEgy8b9WHJasV1pPnyii1JJyYsqNyjql1U+UGOe7zRqtAMGm7w7EbU83EaQ7vnIUId8D
         wcenI+eG/FJFtKJYbmCgpiqgXKmiDQ+FrbAmlMevk+fm40D5bdB4Ntfzra0JmFsZYEvi
         ZUW/5k4EB4vTFdAl9hqhnz3hFmNMqUoAIw4XaQ71DJd+YjKn+j+UyjfUh8O8bqnCAjcM
         4n7bN+JAKYamPa1f8GIMS6c/07s0vLamHJjEkn63+yVPSFHMbvhfrSPyhbHmraKVh2Re
         ArPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01N55pkryUEyQsQ1stzyMb8Fbdz+fb4hfiIogIgGpyg=;
        b=ckmUGcN6EeloOmxcFCuapMqQlP0tY+OoO0b745b9Fu88xKKQBt/P3VJ8sWQST3TojL
         YwJuPctFygLs9fZ6ejKcmcHu6GN2fMtA/qbG7+Ok0ULlnNAoPyuZn4yBAuvVdNtOKezF
         0iaph1D5Lo0MZALQGRWFOWRf9vqM2j50UmYI79DCKEFmBwKFUUTbo/13WoJ1zgs2r/LQ
         3zOYu1DPzOc6uUioVl/9rmeSA/cYdqAOAcBSUwFCYjyxXUjkyWex2ga0AHDP0GJlEjfM
         MRY21gzMIc5CP6tjN25bnGm3OokyJ/698F39tjaTFBPA55BDYmw/BGdKeXTTmmmNsdFx
         umcg==
X-Gm-Message-State: AOAM533+hFDDZ+ml5pCdxF/BsLEnhQOS6G+aa+YruQOABuMlHR03POP1
	odxpATlsafhF07SYaHy6GN9nwdsYgRFf8AX6SxRhVA==
X-Google-Smtp-Source: ABdhPJwwgPaUnlRdKTs20DKINVJYRIuGQnDmVcPwBcvWsFrNMKrqoEhdQWMZZ9Uud/kLgbAXQZzZuYDfFHiL5KCcCLg=
X-Received: by 2002:a92:290c:: with SMTP id l12mr1414573ilg.279.1592532476178;
 Thu, 18 Jun 2020 19:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200615060025.171354-1-arthur.she@linaro.org>
 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
 <20200615075646.GU17660@denix.org> <CAJ8hLzH2JMoJ7QspxnjAZ1ZwKshj+REUu=HrE7A2tspu_pH=Zw@mail.gmail.com>
 <CANNYZj8n5b46zVCL1Kt4NdweQb0tvZh3SmCype4p6BxzD7_T7Q@mail.gmail.com>
 <9f5397898511c51c6a388fa602e8bdba1a702560.camel@intel.com>
 <CAJ8hLzHB45R_g=OrGTEMLqnUkhg64OSPJvAr+P-3LGF355mpnw@mail.gmail.com> <CANNYZj_hoDQ_XnGitKWu8MqJi33e3KEH2A9tzpY8r=NeU_Nh-A@mail.gmail.com>
In-Reply-To: <CANNYZj_hoDQ_XnGitKWu8MqJi33e3KEH2A9tzpY8r=NeU_Nh-A@mail.gmail.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Thu, 18 Jun 2020 19:07:45 -0700
Message-ID: <CAJ8hLzGrm1YtEQ3LPnjvmoL7Hqgziq6eybSyo++o1ZoJut+=yw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, "denis@denix.org" <denis@denix.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000894fe305a8665c57"

--000000000000894fe305a8665c57
Content-Type: text/plain; charset="UTF-8"

Hi Alex,
Thank you so much. I will update the commit message and send the patch v2
out.

Thanks,
Arthur

On Thu, Jun 18, 2020 at 8:25 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I am fine with that, please resend with Anuj's rationale included into the
> commit message.
>
> Alex
>
> On Thu, 18 Jun 2020 at 07:27, Arthur She <arthur.she@linaro.org> wrote:
>
>> Hi Alex,
>> Would it be a sufficient reason for doing that?
>> Or any thought could be shared from you?
>>
>> Thank you so much,
>> Arthur
>>
>> On Tue, Jun 16, 2020 at 12:16 AM Mittal, Anuj <anuj.mittal@intel.com>
>> wrote:
>>
>>> Hi Alex
>>>
>>> On Tue, 2020-06-16 at 09:04 +0200, Alexander Kanavin wrote:
>>> > Usually it's the other way around - what is the reason to have this
>>> > recipe in core?
>>> >
>>>
>>> I had requested Arthur to send this to oe-core since this provides
>>> a core validation functionality that is needed by all providing DRM
>>> drivers and is applicable not just to a single arch.
>>>
>>> It's a well maintained project and I can keep the recipe updated and
>>> working. If it can be in oe-core, I can remove it from meta-intel layer
>>> and avoid having a duplicate recipe.
>>>
>>> Thanks,
>>>
>>> Anuj
>>>
>>> > Alex
>>> >
>>> > On Tue, 16 Jun 2020 at 06:45, Arthur She <arthur.she@linaro.org>
>>> > wrote:
>>> > > Hi Alexander and Denys,
>>> > > Thanks for your feedback.
>>> > > I have no problem submitting it to meta-oe.
>>> > > Since the meta-intel maintainer requested to submit it to oe-core,
>>> > > do you mind sharing some thought about the reason?
>>> > >
>>> > > Thank you so much,
>>> > > Arthur
>>> > >
>>> > > On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko <denis@denix.org
>>> > > > wrote:
>>> > > > https://lists.openembedded.org/g/openembedded-devel/topic/74775294
>>> > > >
>>> > > > But I tend to agree.
>>> > > >
>>>
>>

--000000000000894fe305a8665c57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div>Thank you so much. I will update the commit m=
essage and send the patch v2 out.</div><div><br></div><div>Thanks,</div><di=
v>Arthur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 18, 2020 at 8:25 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>I am fine with that, please resend with Anuj&#39;s rationale included=
 into the commit message.</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18=
 Jun 2020 at 07:27, Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org"=
 target=3D"_blank">arthur.she@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div>Would=
 it be a sufficient reason for doing that?</div><div>Or any thought could b=
e shared from you?</div><div><br></div><div>Thank you so much,</div><div>Ar=
thur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Jun 16, 2020 at 12:16 AM Mittal, Anuj &lt;<a href=3D"mail=
to:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alex<br=
>
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
</blockquote></div>

--000000000000894fe305a8665c57--
