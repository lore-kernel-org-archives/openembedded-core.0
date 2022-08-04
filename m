Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9ACC19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 09:53:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.2928.1659606790079741501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 02:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nFylTzjU;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id j7so24605800wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Z9NKq0JkTjFogEcgiUNEK8X5aJ0P03/QEHC2eHiMc5c=;
        b=nFylTzjUiV8ivh15VcLBzhSHMbTRLbDbZ9CAp6PrYT6Zm5yel6q7WOKtQVwGuYoDez
         UeyXcdx/cQdoBarlfvJT/ns9iolykddjXusuM+KeXQgKY5B7qOHVccobY8sGXmS0uGzk
         dunKy/9iahQVJzzhN3UaI0cgX58DXTUfVKpT6ZLq7E40xS+AXMSlifeUw+MIhcQ6wQrP
         ngwNqe0oINoeRho4Gna6DozYDKKFkvXarn4AmQvof27+xWh2nwQHEYEr9OZJB8iTktQN
         WNH6AJuaU3txKmgX7OKBbTEZ2s0k3YNmA8SY/O1f0qRDQxGHNecMStlsVOwIXJ+5tBa5
         6hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Z9NKq0JkTjFogEcgiUNEK8X5aJ0P03/QEHC2eHiMc5c=;
        b=mtf+huE512oAo1G23i7L4XiuFhyBK9L6Br0jSNsO5k/5PU6ha7VWDvRLeE8y3flYNT
         xGdYZ58J1ME8WrrREucbfmoC38L4AxIsgC02g47MrhNZVeuaFPlH2Um1k4h2a38bP6NM
         oD0YP5Sd84HRHplgb/kLWfu89QYYJ4KugMY78ego1wh6RKwqQlKQoU/hUGAqnz6gkUFB
         WgA7GubRjWHQLthfBe8mOlZWpEak+8R8MoBUCnpifBqfJC8iLpjZHbDmrUlHLkitmy0T
         zvUBHZ8rZqK1Zl1BadQEbOM3cQK8PeijBTPLzip7B2gBUiqZEoqiB5iLU2bY06O74aL+
         OdEQ==
X-Gm-Message-State: ACgBeo3PGQszynJVKbY6DsH6LnjTCKp1j7r/QRpjf6X9h0Py9NfGZI6X
	eoHVUKRVII2Li2/HzYjPDOLB3vIN44BRTj4WJeo=
X-Google-Smtp-Source: 
 AA6agR6VKvdqQ4+cP7KE0v6e67EoG2Mt6b0sF6HUR5bR9lLjN6erx/Nb/ABKAGKa+XiEax5d50buf8UZIrOCwPJl828=
X-Received: by 2002:adf:f5c7:0:b0:220:6871:de96 with SMTP id
 k7-20020adff5c7000000b002206871de96mr860624wrp.516.1659606788419; Thu, 04 Aug
 2022 02:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220804041121.5672-1-sundeep.kokkonda@gmail.com>
 <12767.1659586721751863165@lists.openembedded.org>
In-Reply-To: <12767.1659586721751863165@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2022 11:52:57 +0200
Message-ID: 
 <CA+chaQf5nGwAaLifnZxghK2dHiesGo6mpcFpb_PR=fFgp-7vsA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc : stable 2.35 branch updates
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001735ac05e56751cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 09:53:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168841

--0000000000001735ac05e56751cb
Content-Type: text/plain; charset="UTF-8"

Does this fix the build with DEBUG_BUILD?

I don't see any commit related to that nor any update in
https://sourceware.org/bugzilla/show_bug.cgi?id=29249

On Thu, Aug 4, 2022 at 6:18 AM Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
wrote:

> Hello,
>
> Regression tests are performed. Below is the test summary.
>
> Summary of test results *before update* of glibc:
>     146 FAIL
>    4395 PASS
>       2 UNRESOLVED
>      41 UNSUPPORTED
>      12 XFAIL
>       6 XPASS
>
> Summary of test results *after update* of glibc:
>     150 FAIL
>    4393 PASS
>      41 UNSUPPORTED
>      12 XFAIL
>       6 XPASS
>
> There are new 11 failures after glibc update which all are from '
> *localedata*' sub-module. I am looking into the failed cases, suspecting
> that these failures are because of test procedure issue.
>
>
>
> Thanks,
> Sundeep K.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168836):
> https://lists.openembedded.org/g/openembedded-core/message/168836
> Mute This Topic: https://lists.openembedded.org/mt/92807904/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001735ac05e56751cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this fix the build with DEBUG_BUILD?<div><br></div><d=
iv>I don&#39;t see any commit related to that nor any update in=C2=A0<a hre=
f=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249">https://sourc=
eware.org/bugzilla/show_bug.cgi?id=3D29249</a></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 4, 2022 at =
6:18 AM Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmail.com">=
sundeep.kokkonda@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hello,<br><br>Regression tests are performed. Bel=
ow is the test summary.<br><br>
<blockquote>
<div><span style=3D"text-decoration:underline">Summary of test results <str=
ong>before update</strong> of glibc:</span></div>
<div>=C2=A0 =C2=A0 146 FAIL</div>
<div>=C2=A0 =C2=A04395 PASS</div>
<div>=C2=A0 =C2=A0 =C2=A0 2 UNRESOLVED</div>
<div>=C2=A0 =C2=A0 =C2=A041 UNSUPPORTED</div>
<div>=C2=A0 =C2=A0 =C2=A012 XFAIL</div>
<div>=C2=A0 =C2=A0 =C2=A0 6 XPASS</div>
<div>=C2=A0</div>
<div><span style=3D"text-decoration:underline">Summary of test results <str=
ong>after update</strong> of glibc:</span></div>
<div>=C2=A0 =C2=A0 150 FAIL</div>
<div>=C2=A0 =C2=A04393 PASS</div>
<div>=C2=A0 =C2=A0 =C2=A041 UNSUPPORTED</div>
<div>=C2=A0 =C2=A0 =C2=A012 XFAIL</div>
<div>=C2=A0 =C2=A0 =C2=A0 6 XPASS</div>
</blockquote>
<div>There are new 11 failures after glibc update which all are from &#39;<=
em>localedata</em>&#39; sub-module. I am looking into the failed cases, sus=
pecting that these failures are because of test procedure issue.<br><br><br=
><br>Thanks,<br>Sundeep K.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168836): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168836" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168836</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92807904/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92807904/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001735ac05e56751cb--

