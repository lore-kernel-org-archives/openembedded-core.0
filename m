Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CA4C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:54:45 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.20225.1721660076074593449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7d1OItD;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-260f94067bcso2467202fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721660075; x=1722264875; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbIeYXIevpM7iYPeDpcRk6M1d2LztSXf0lAJdCPv1bs=;
        b=B7d1OItD3K0lcfm8Qw4ShMHpaOkeqwRdxKe78ZbgI1MmaiBy0ookqLuj7df66tCG/D
         6LFTrN91K5RfMlRLmpnoLBvemN5RWuFrA5LT4eL/BUZd2LQyW6vvCSKvFHRkEj/oXlEt
         r/cEeSMBzgEubiwPYkK8TYil2bTC6FjeSSdXpx//n8cjNYmJhVNPS3i8x/6hINR7NIVm
         eszVDU9ixQHS3YQUPqm59lBAUBOfqoEbYDn4MvQohXLtd3uvqM1f1Ui8Dy0qj2tadq+u
         2rTLOUsntMLilOvYDiTPcYE7DbE4AGVx+YM8gFEh9rICKu6EEYZDpTRYPYbHy7+diAIN
         KiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721660075; x=1722264875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbIeYXIevpM7iYPeDpcRk6M1d2LztSXf0lAJdCPv1bs=;
        b=mr5ACBN80dqI5GpmKFO6LhbLq5NbUQsH2Oyt5Cw7w9tPnf9ikw4A42PM7rVQ4f7PQN
         w49/7n/EpakOe1x7QApc+EiJYI8aH9Wwr0jYVyUCaP6hivtGamZVTaSc1NXfgDCC2AP6
         UERfsx85T9dBrI4F1SdcPcgbuh7Kd4Tv4KhmhB2y1pTrcha+qa8MDmAyBBon4reZwI/B
         4nzNKXFo4g+CZwZIpo/MaWbGptqueK1wC2enzOtEHfvG7cytClDH0A1Lzafkkf9e6DSe
         0s+p/VawcyPTt/X3LPBpCR/Nm3wv8EJK2qo852itvUVifg5fR0z9UPWxH+UEOzGXsKb4
         kElQ==
X-Gm-Message-State: AOJu0YzQBUdsl72eVfSGZ7MOj+sd0uQT7DhQQVKnmjgtB/m2zKiVFZZ4
	q17m42gqisww61uQgp1LI46pNuqnpwqRh3+26I7vl0ZJusN0LS1LP5XJh0kuBU/tpVH0mnMkFr9
	mcq5t3Uj8y1ypCVIsQHLpDisGvglC+78w
X-Google-Smtp-Source: AGHT+IEJ5COfNnVwLf6T/N5EZbiaFK4RSUg8E1LNKVxyu9cX/7GzQCaY28pNQymuaXfBa4IMv2KV3omsBRbQHmXrkbw=
X-Received: by 2002:a05:6871:b28:b0:25b:6d53:d294 with SMTP id
 586e51a60fabf-2638df9ff70mr6100109fac.23.1721660075115; Mon, 22 Jul 2024
 07:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240722055715.2600693-1-Deepthi.Hemraj@windriver.com> <31107.1721627969142118796@lists.openembedded.org>
In-Reply-To: <31107.1721627969142118796@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2024 07:54:23 -0700
Message-ID: <CAMKF1sq+6L0ZUes4jXPSttoACS51EFSc4BE=g2nk+ETP9E4yPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: stable 2.42 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000338b9b061dd73917"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202316

--000000000000338b9b061dd73917
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 10:59=E2=80=AFPM Hemraj, Deepthi via lists.openembe=
dded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:

> after update:
>
> =3D=3D=3D binutils Summary =3D=3D=3D
>
> # of expected passes            302
> # of unexpected failures        2
> # of untested testcases         1
> # of unsupported tests          7
>
> before update:
>
> =3D=3D=3D binutils Summary =3D=3D=3D
>
> # of expected passes            302
> # of unexpected failures        2
> # of untested testcases         1
> # of unsupported tests          7
>
> The testing was done and there are no regressions found.
>

Lgtm


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202304):
> https://lists.openembedded.org/g/openembedded-core/message/202304
> Mute This Topic: https://lists.openembedded.org/mt/107480341/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000338b9b061dd73917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 21, 2024 at 10:59=E2=80=AFPM Hemraj, Deepthi vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
Deepthi.Hemraj=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">wi=
ndriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div>
<p>after update:</p>
<p>=3D=3D=3D binutils Summary =3D=3D=3D</p>
<p># of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 302<br># of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2<br># of untested testcases=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1<br># of unsupported tests=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 7</p>
<p>before update:</p>
<p>=3D=3D=3D binutils Summary =3D=3D=3D</p>
<p># of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 302<br># of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2<br># of untested testcases=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1<br># of unsupported tests=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 7<br><br>The testing was done and there are no =
regressions found.</p>
</div>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Lgtm</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202304): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202304" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202304</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107480341/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107480341/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000338b9b061dd73917--

