Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788A2C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 17:29:26 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.2941.1717090165669252084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 10:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/o9gJKt;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f906f52a4aso776780a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090165; x=1717694965; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qskP+iAukxpw61bi+DQb+roxSJteZ3w3HQ9DL2PfrMM=;
        b=B/o9gJKta4ymBi4sG8Nj4Pbgna8+nZLG+qcurs1xVvaaaxl9sSSTqAR7K14hEX7WBc
         X8BGubtZwbwG0DRe6z51ZtjkMlWPftnootqDDXai8GPY1aekBryUfA+FyK88kJc4LEz0
         zcLCtloK1AgOJy2GPNBkdmkFKI2C37RDFeK/Rcd+PVoPmj3WCYWBlNDj9y2e3/LKm03t
         o7iGzOyBJJtjsorsQwJsUGDKlzY6TWvakOF8KyiQX46FhLzjPf1iDUO3qBRoKMbbmIjH
         1v+2ge0vdG0PeSggIqhwWh/mTJSbu8kMWszcvLPQga4uMYUX0SyOOlxGkAcqwkl6yafV
         RoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090165; x=1717694965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qskP+iAukxpw61bi+DQb+roxSJteZ3w3HQ9DL2PfrMM=;
        b=r9+xFnOnme0EeSR/urBy2C8wwuMr1Wa1h9Ip+Z4bGT1gx2qHhYxC69uORc1T4BihQ4
         dm/S4q2CvoLRlRwpUauB/E/+X8nHCqc7rITyXaH2kzQWQ5CxMXGkIy6HM6kYxQtV+666
         AxYA3nMEpeHjmzjDhaX30wgbxgjDPvkThPnv6hsO/CX39jZtMKVsxoiTN5tgYurHixZz
         X3sNvAHT6qnTbnE/8rTACauN12l9krqG1zMZ0HNIzWN15UyVH5CB8AjZwVCo+QKyQvGG
         1/4FMG7iiSrHwBuAB9t0W4Ql35nZkGL92zNDrdAfexiH2Qkgx+wO8/IQi3+GWR9jJBRz
         jpdw==
X-Gm-Message-State: AOJu0YyylInoUiGhIOfXnhN8CosN/oBHpjR2wufm7+yM9WA7Geehfc3E
	nTxQSFsbfdQntRtsHKwHJ52SDhSGgJplCMc7t/rlyms2zoAUm2izX6+3YmcR8I6X0SGKp9+1iQ4
	Vr28DcinQ+ucxsdT0TCR4XCiOxtM=
X-Google-Smtp-Source: AGHT+IFIK4dsgTrsIIbRuNHc9vJQywo/TW84DIQ6p/jtt1SoJJbsn/J8Q7AtgJK+Lt8m0nao31dQYGKG5Hw1lGVwRMY=
X-Received: by 2002:a05:6870:2423:b0:24f:e284:407e with SMTP id
 586e51a60fabf-25060bf2d96mr3412815fac.25.1717090164503; Thu, 30 May 2024
 10:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240530051758.2990123-1-Deepthi.Hemraj@windriver.com> <26400.1717084649474764175@lists.openembedded.org>
In-Reply-To: <26400.1717084649474764175@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 10:29:12 -0700
Message-ID: <CAMKF1spYvUrGPy47_1dr2056FpWxCnvnewhS-jjz44vXtMhKxA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d7d160619af3539"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 17:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200036

--0000000000004d7d160619af3539
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems good to me

On Thu, May 30, 2024 at 8:57=E2=80=AFAM Hemraj, Deepthi via lists.openembed=
ded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:

> Regression testing is done and below are the results:
> *after update: *
> fail   -               427
> pass   -            14368
> xpass  -           18
> xfail  -              48
> unsupported - 670
>
> *before update*
> fail   -               428
> pass   -             14367
> xpass  -            18
> xfail  -               48
> unsupported - 670
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200027):
> https://lists.openembedded.org/g/openembedded-core/message/200027
> Mute This Topic: https://lists.openembedded.org/mt/106383371/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004d7d160619af3539
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Seems good=C2=A0to me</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 30, 2024 at 8:57=E2=
=80=AFAM Hemraj, Deepthi via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;Deepthi.Hemraj=3D<a href=3D"mailto:windriver.com=
@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><p style=3D"margin:0px"><span>Reg=
ression testing is done and below are the results:<br><strong><span style=
=3D"font-family:&#39;Calibri&#39;,sans-serif">after update:=C2=A0</span></s=
trong><br>fail =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0427 =C2=A0 =C2=A0 =C2=A0<br>pass =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 14368<br>xpass =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=
8<br>xfail =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48<br>un=
supported - 670<br><br><strong><span style=3D"font-family:&#39;Calibri&#39;=
,sans-serif">before update</span></strong><br>fail =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0428<br>pass =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014367<br>xpass =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 18<br>xfail =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A048<br>unsupported - 670</span></p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200027): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200027" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200027</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106383371/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106383371/1997914</a><br>
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

--0000000000004d7d160619af3539--

