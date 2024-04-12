Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0781C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 00:14:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.35597.1712880851601224323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 17:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayAZgqif;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6181d032bf9so3447177b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712880851; x=1713485651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9z0eKnKPDblU8hpxTp6HCmvnzSg+DNouTyGes0bUyKo=;
        b=ayAZgqifRRDoTe7Js+IOJeMeUEnec+S9jiIZ4KQExWeFpt8dx+YMbEnJphJbM1y7I/
         Gm8fK/aVDxZbuP9M0+SCKnsXeuzp6jfg175MmkE09hHNlWDx3WqGuFP5dlModab8PfPU
         PkwwfSjgmwJdfNkcm/Su1tU5RC+1chZBoFkq7chZjNGptnC0OshHfl/ULj7KtWxrUAQI
         KZ1QLFtQA7vN6yn4DDDkhmUsatNaXb763eYeJRng09xYkfuvynjWPj4bFpwBDmIFw6/V
         R55kKce1NkhzpF0mM1M5tlsvSxhqBLuhnJS3Tj8D5uBWoU/KSXr2e1ZpirHKAH0+STU9
         LnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712880851; x=1713485651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z0eKnKPDblU8hpxTp6HCmvnzSg+DNouTyGes0bUyKo=;
        b=eGmQQN1Yyo1GCjqXlqFMIwxhhCo2UyPn6n6w0TVcFacxVomlD2SBp+j19n+RJeMWNN
         lqputsr8thIdE3N8OukP3r5EE3Ee27Pv7/q6gXKflfQSvw/zOFpXC2PmdIFLTZ1ktskH
         t6qTdN4dQRXuw26wqTU+feKj2eWNYSkX3V7qeU/aKgan6BtUtQfmAU6wNRtbmPoO+Yyo
         tVbuvE/QVchWDkqHFNWblR3UnMKue344xB+uQROwIyRhtrRXdBK9AJjBMGHhl9qXBoF0
         7kC6K1bDtqCBd8MjtQJUJfxt5+yMJP+juR1adFeAhdbMeLUoFmjhNLrkYwIXEPGj8To0
         xcnA==
X-Gm-Message-State: AOJu0YyPxW6GM780kyh7h2/lVDkO9kbIN8ehVpg1omyn8jsDRt0Z0Rsr
	qo46SLj2cBM64xd0G9ZrTAruoIV6XcSURvoACUmn7+jeHfrWRLG/ar6UXF/eR6tvuaoA9h6tTIs
	N5JSowbmTNQz3cLyA/JQkBH24JoE2lA==
X-Google-Smtp-Source: AGHT+IGwgLlbPAzgRG4O9ku9/XkkpTdlrue9yVMO0PbKK8Tt0YgPKtI53jnB86IlLpXZKnd7aLU/OMogKz5M19LfZb8=
X-Received: by 2002:a81:ad4f:0:b0:610:f586:2b42 with SMTP id
 l15-20020a81ad4f000000b00610f5862b42mr1041364ywk.46.1712880850675; Thu, 11
 Apr 2024 17:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240411194727.26317-1-jsbronder@cold-front.org>
In-Reply-To: <20240411194727.26317-1-jsbronder@cold-front.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Apr 2024 17:13:59 -0700
Message-ID: <CANx9H-BOyTh3eAR1j7JMQYbH12qp6vFNAQjwcuQLQ9sewDPh4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] Clear remaining ${PYTHON_PN} uses
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5b2f10615db2689"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 00:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198148

--000000000000a5b2f10615db2689
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 12:47=E2=80=AFPM Justin Bronder <jsbronder@cold-fro=
nt.org>
wrote:

> Removing a couple of remaining ${PYTHON_PN} uses that were missed in the
> prior scrubs.
>

Thank you. I thought we had already caught everything.
We really do not need to be carrying such obfuscation and abstraction
anymore. Let python2 go off to pasture in quiet reverence.


>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198143):
> https://lists.openembedded.org/g/openembedded-core/message/198143
> Mute This Topic: https://lists.openembedded.org/mt/105470299/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a5b2f10615db2689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 11, 2024 at 12:47=E2=80=
=AFPM Justin Bronder &lt;<a href=3D"mailto:jsbronder@cold-front.org">jsbron=
der@cold-front.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Removing a couple of remaining ${PYTHON_PN} uses that wer=
e missed in the prior scrubs.<br></blockquote><div><br></div><div>Thank you=
. I thought we had already caught everything.</div><div>We really do not ne=
ed to be carrying=C2=A0such obfuscation and abstraction anymore. Let python=
2 go off to pasture in quiet reverence.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198143): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198143" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198143</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105470299/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105470299/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a5b2f10615db2689--

