Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE38C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 13:51:59 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.8517.1682517111572669570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D+m6sYdo;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: rwmacleod@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-42e3ceafd7cso5465627137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682517110; x=1685109110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfujHpTSr8wqwfsg1d80kTvHYu+uoCx+nMvX14Idrw8=;
        b=D+m6sYdoT5v3wPAn/AOh5J1hIac0Hqk9ZcjDKKJEEmeYcEG5WUWdzrpr8XTxpvxfoj
         PNFc27Ano9C4KNTk5BPzIDOHcObHabdvIpt2HbRXSp7ByCKuspBFeNWS7O1HI57dWzB0
         /h/QsY1ugUXD4KGrg7iNlMbjGvwKJqYhD0TgikNi2M2X4oViOkEH3JUI4pXBFdgina8E
         FHJHYyVBg1p+ERuxmJoNzMOB3ADCxwNj+qHF3WIP1BVYytkXDSrqokA/dGNH4o2GW1Xe
         Jjun41CXVJZUaFUFURcG2qk/ZIFTUIF+v9QPpLj8V6KO07fxKMJCIepkg5//kzbXMQKU
         R5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682517110; x=1685109110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfujHpTSr8wqwfsg1d80kTvHYu+uoCx+nMvX14Idrw8=;
        b=Stpk/K9mg8HMN8c/xFkb7HMT94l+0Ev37b5Lpk8lGZx67NU4YSsxNgYbNR/3s98bcn
         w/8iRUQ/T7iaGb3B0RIbrNGl3p5fgSNQTMaKDH/hJP05zqxdTCVp7KJIalRD2dgva7WV
         lVlL+7SiK1LIgVJGr01xzQVr3DAlXXHUl7CdRS9IHzDMF+vjBMPA7mJjdUPY14kK+PJW
         pboDS7CMMz4Jn3F96THk7NfuwGk47+/e3HYZhY3VyZDuQ8Ik8SUgouhkv81GyGEH5Rw7
         AqjYW/VCwrd6x4F9ZbFqrx6bcEX6vj2ynfK+YFZQS8aLkqMd8vte+0H72PL95Z72Q4nc
         zl8g==
X-Gm-Message-State: AAQBX9cMEcJX3dFQxwXwbcbyRL+ZsNrRws9b6GuGV+S2is0+ZvgkZ3y9
	ta6mtc5sHI6uEe6NGo3Yq4RWNuf5af7Q/1VBZac=
X-Google-Smtp-Source: AKy350bbKcG39NIujBRbydgZRe70LH9cwV7410C5Aak1ZHVuoxv+okkp8aAuNq8H/f738OHjcbM5Tm2QzvCW0NLf/cs=
X-Received: by 2002:a1f:60c3:0:b0:440:35af:c812 with SMTP id
 u186-20020a1f60c3000000b0044035afc812mr6205560vkb.12.1682517110259; Wed, 26
 Apr 2023 06:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230426113135.2740310-1-deepadeepthi98@gmail.com> <17864.1682508868187918015@lists.openembedded.org>
In-Reply-To: <17864.1682508868187918015@lists.openembedded.org>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Wed, 26 Apr 2023 09:51:33 -0400
Message-ID: <CAK6=ix7=eGeh8pEWHfezRNKh4R2DcRwiDWCh4zT0xW702irYPQ@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH V2] glibc: stable 2.37 branch updates.
To: Deepthi Hemraj <deepadeepthi98@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000af84ee05fa3d8a3a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 13:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180443

--000000000000af84ee05fa3d8a3a
Content-Type: text/plain; charset="UTF-8"

On Wed., Apr. 26, 2023, 07:34 Deepthi Hemraj, <deepadeepthi98@gmail.com>
wrote:

> Regression tests are performed and below is test summary.
> Test summary after glibc updates:
> 193 FAIL
>    4399 PASS
>      38 UNSUPPORTED
>      16 XFAIL
>       2 XPASS
>
> Test summary before glibc updates:
>      247 FAIL
>     4382 PASS
>       38 UNSUPPORTED
>       16 XFAIL
>        2 XPASS
>


Thanks Deepthi.

Next time, please do the arithmetic for everyone:

Diff:

-54 FAIL
+17 PASS
    0 UNSUPPORTED
     0 XFAIL
     0 XPASS


It looks like some of the failing tests were removed. Please confirm and
provide brief context about why they were removed.


Regardless, the test results are better so we're in good shape.

Randy



>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180432):
> https://lists.openembedded.org/g/openembedded-core/message/180432
> Mute This Topic: https://lists.openembedded.org/mt/98512594/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000af84ee05fa3d8a3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed., Apr. 26, 2023, 07:34 Deepthi Hemraj, &lt;<a h=
ref=3D"mailto:deepadeepthi98@gmail.com">deepadeepthi98@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div>Regression tests are perf=
ormed and below is test summary.</div>
<div>Test summary after glibc updates:</div>
<div><span style=3D"white-space:pre-wrap"> </span>193 FAIL</div>
<div>=C2=A0 =C2=A04399 PASS</div>
<div>=C2=A0 =C2=A0 =C2=A038 UNSUPPORTED</div>
<div>=C2=A0 =C2=A0 =C2=A016 XFAIL</div>
<div>=C2=A0 =C2=A0 =C2=A0 2 XPASS</div>
<div>=C2=A0</div>
<div>Test summary before glibc updates:</div>
<div>=C2=A0 =C2=A0 =C2=A0247 FAIL</div>
<div>=C2=A0 =C2=A0 4382 PASS</div>
<div>=C2=A0 =C2=A0 =C2=A0 38 UNSUPPORTED</div>
<div>=C2=A0 =C2=A0 =C2=A0 16 XFAIL</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A02 XPASS</div><div dir=3D"auto"></div></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Thanks Deepthi.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Next time, please do the arithmetic for everyone:</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Diff:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">-54 FAIL</div><div dir=3D"auto">+17 PASS<br></div><div =
dir=3D"auto"><div dir=3D"auto">=C2=A0 =C2=A0 0 UNSUPPORTED</div><div dir=3D=
"auto">=C2=A0 =C2=A0 =C2=A00 XFAIL</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=
=A00 XPASS</div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">It looks like some of the failing tests were removed. =
Please confirm and provide brief context about why they were removed.=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Regardless, the test results are better so we&#39;re in good shape.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Randy</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><br><br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180432): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180432" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/180432</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98512594/9533=
99" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/98512594/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000af84ee05fa3d8a3a--

