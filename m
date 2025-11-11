Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDE7CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 11:42:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15418.1762861359470795669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 03:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZVs2I2/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-343806688c5so2422918a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 03:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861359; x=1763466159; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/MVpdAZnyFUU1WmtzWYTywE3aqZIQm/4FPWyzO+XUBs=;
        b=ZZVs2I2/8jxrBcqskhZYOG5poF02eGB+xQZ1z+Y5qsHfzviCH1uTILinnmtmC9khZ/
         DdOHHkVAQtJUei2OaPSBjpkgIFtWKIllqWHaC37lpp+/5VI2KmkuFqqiybTdgX5S6dbv
         OIQzVfhfTQOiiprjeD4CMi/PFMiegc0GJJjHfnQiB/KOWnaPqsfFSSXAuAscbGL7XmDk
         5C/AD/yUxPiP0yV6juHtFYe+ceDa0X75ZlbpmuKwCrJnKK8sE3h+xAZ6gB30wkuddV1G
         49pwiGKrK3EJQj46pp7Hx6P6Z63FBrznNUbCqIBTXZ0ECe3UkzWQPcHrCoU5+extYQCa
         x9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861359; x=1763466159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MVpdAZnyFUU1WmtzWYTywE3aqZIQm/4FPWyzO+XUBs=;
        b=JGHt4U2/dUK5cLlZOmXyB1oq7ne/avpdHAgZXAQkhtavg7bN03vp3WJ13iZoOA7UVO
         rOiUZOUXDqo4SVizvP6n38J7/zgiLsTcVWX234W6644GCsTDIGRF2fwNbHBRh3KCJtL6
         ngh+s5zx6Ifw804mHqMZZ+cTxN7/G6ezD0Bl53KSq4dY8Jy/njgyEepu3Y69tqkv+8Zz
         CvumSlgd8xi7Zlm2naczS7OdiVRp+rt1WvvB0ODIez2fo46CXwyI+zxmDk0tet8609ME
         RjT68SQN4T6KBnhWymFtPLhqdu7g2t9Xjk0fhNJ8CFFWCYz/YOMIMAlQQXpnCnqZolN5
         GqwA==
X-Gm-Message-State: AOJu0Yxph74BfaDLHp22Amd1Dko+7lNPxZd1+v2q4A+m9QMma3IT28ad
	PyUBR4KDA9SG4xo3iexsEj8Hylwr6JR2Ik1qrEJGoW/q1q1mj3Joj1ft1NWdfPfhGqpJxNqmT2M
	/ACkCXGvlbLQCX33FVvC6d3JAw04VCg8=
X-Gm-Gg: ASbGncs6B9x43mrWsOt2COFatrTlAXUVilHs85uvQAKsU1pgotRWW6TTTff9UsD8K0j
	xGK7wnTY3xQYad8gPRoQ0ufIp+1KmbjE+Xv0OZbypLZVZFC9Pm0FsnutawTRE/UBlaUJem3nCpI
	m3d/jWrFeufABEJjIpt6IV7aA/LuZSBaRgZOR3FVCRFcN8dPckQS+DuZbrQtPiQy0wd6NO5n0kZ
	LUGu94B8NpW5sCjWrvJCP9G9L1x5DQBy4qbez4dCXFtiu/1GsSsU4DXf0e9RijdSTlft62Mv6mN
	huMdT6IyVHVC3sEQ8g==
X-Google-Smtp-Source: AGHT+IEf33SgrYTJkwPG+6CkQqnDuasRTs90DH7yy3AK9SYjHFLzTGrczacBNpVa2TOyaKfLM7ZVxi1WhJ1v8JJlkm0=
X-Received: by 2002:a17:90b:2d8b:b0:340:a5b2:c305 with SMTP id
 98e67ed59e1d1-3436cb7adc6mr12793137a91.2.1762861358814; Tue, 11 Nov 2025
 03:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
 <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com> <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
 <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
In-Reply-To: <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 11 Nov 2025 12:42:26 +0100
X-Gm-Features: AWmQ_bkDfu53Y6LX_VD7uI2-JdFl7HRIII9gaRv9GgSeADKr1rcved6zp1xLPkI
Message-ID: <CALatG=6AR5oSJL7GhhCVZAfu4vGecXj3=nh03nPxv4YBHzcNEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000149a7b0643502508"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 11:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226158

--000000000000149a7b0643502508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross:

Yes, that should work, but I have to use prepend any way, I am wondering
"PACKAGES_BEFORE_PN:prepend " is better than "PACKAGES:prepend"?

//Ming Liu

Ross Burton <Ross.Burton@arm.com> =E6=96=BC 2025=E5=B9=B411=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:50=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On 11 Nov 2025, at 08:17, Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > I was using exact PACKAGES_BEFORE_PN with +=3D as you suggested in V1
> patch, but it broke the build, clearly PACKAGES_BEFORE_PN is not handled
> correctly in some recipes.
>
> Those recipes are assigning to PACKAGES_BEFORE_PN, so this class should
> use PACKAGES_BEFORE_PN:prepend instead.
>
> Ross
>
>

--000000000000149a7b0643502508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>Yes, that should work, but I =
have to use prepend any way, I am wondering &quot;PACKAGES_BEFORE_PN:prepen=
d=C2=A0&quot; is better than &quot;PACKAGES:prepend&quot;?</div><div><br></=
div><div>//Ming Liu=C2=A0</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a hre=
f=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; =E6=96=BC 2025=
=E5=B9=B411=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:50=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 11 Nov 2025, at 08:17, Ming Liu &lt;<a href=3D"mailto:liu.mi=
ng50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; I was using exact PACKAGES_BEFORE_PN with +=3D as you suggested in V1 =
patch, but it broke the build, clearly PACKAGES_BEFORE_PN is not handled co=
rrectly in some recipes.<br>
<br>
Those recipes are assigning to PACKAGES_BEFORE_PN, so this class should use=
 PACKAGES_BEFORE_PN:prepend instead.<br>
<br>
Ross<br>
<br>
</blockquote></div>

--000000000000149a7b0643502508--

