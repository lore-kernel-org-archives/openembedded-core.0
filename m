Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C58C77B61
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 07:56:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.6770.1680940609359671817
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Apr 2023 00:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AZouPcCU;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id e20so607635lji.6
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680940607;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDI2yGJMnBgSPj2qYeP0yZj+6KXoX3Mc4S/K7gJDRNA=;
        b=AZouPcCUmNYLwBBsXNp0iAkAQFoXPcRqCQEfdpmADe+d7Erkt1PMQ0OgpJP3nyF1wM
         pIPTpVlc5qJS8D5aKNdBhoyM2yvZ3AsNkSriUBysviDNpedu5Wk5z8Ve0zfoMTz0Hl4b
         sY7vXTPSLtAAbHoHN189nDgrhw+9zmuDPfvULTR3NQvP5S8vVD9UDb+LfKmm5gRuWDlC
         S8ent5wmMWUGoRivbYGHbhSl2Dopcpp53JaF3GHtH/32lWufKTtVYpnBA1bWTg/gWdDv
         oS3XlBZheXdwikJpV0GzS56SViFok2PoHeZOrADZi6pwXk/VHyOxKmppyndsD/dwORE0
         6Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680940607;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDI2yGJMnBgSPj2qYeP0yZj+6KXoX3Mc4S/K7gJDRNA=;
        b=IhP+Nvy97OqO/+gDZ2598E+oJWDtPqW98OweN7rMc41OYaWkToZkeLIxELIom98yx3
         bz4aE8YKiRddfI1YAH6LCn3GdEqGn4PzdWIpRfAuH30jUePE+OSNplYFYsNgCo9UGIFJ
         gPkbJyT7x2IzufIxCguaHf+K3HGoi3/1nYZfd1+IfGZt2LmiJzbWfwC2kNItMeL1h5Ys
         6dVdi73G347ghdUs9z3RsxLOOieWsxMGKW3wgSmOkBthYjrmcDZUu9PtPyXljirKu9tx
         yfQhZr8bjEpngWRqAitQP807b/iWqTXs9q7yMVEOQvMq+7c+7ZbElePnD7UORuH5cYhn
         ixsg==
X-Gm-Message-State: AAQBX9c3fHzyStv4VtG2rotgc1n4VRQ71AQdpYRVCRVP3dfrqbueOLCg
	CGuQYP43mP4utDfTyYFe4m/KKZnNfpAN5wWQ52HGELY3AEQ=
X-Google-Smtp-Source: AKy350Zt45l3uiBxsjEgBikjbdnZ/6BLVKxef4GmmVJfWb0KsyAgGAB220TG7a48oR7fkhw8bCBMO3VynvDgLqTd9Ms=
X-Received: by 2002:a2e:2e18:0:b0:29b:d21c:e859 with SMTP id
 u24-20020a2e2e18000000b0029bd21ce859mr1263960lju.3.1680940606811; Sat, 08 Apr
 2023 00:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
In-Reply-To: <1753B0402875C548.11304@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sat, 8 Apr 2023 09:56:35 +0200
Message-ID: <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c1f24805f8ce7b7b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 07:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179829

--000000000000c1f24805f8ce7b7b
Content-Type: text/plain; charset="UTF-8"

Forget my previous question,

I simply edit
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py#n137
to replace by zavariant, and with OEQA_DEBUGGING_SAVED_OUTPUT set , I
managed to see the html diff

Nevertheless, It took one hour, but it seems that it cannot be avoided
since there are two builds and one
without any shared state.

On Fri, 7 Apr 2023 at 17:21, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> Hello,
>
> I plan to work on https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090
> in the coming days.
> To show how things are tested I ran "oe-selftest -r
> reproducible.ReproducibleTests.test_reproducible_builds" but even on a
> strong machine, it took several hours (I waited for 6h and it is not
> finished yet).
>
> Does anyone know if it is possible to test reproducibility on a single
> package (here, zvariant) ?
> Should I tweak the python test class or is there a simple way ?
>
> Thanks
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179826):
> https://lists.openembedded.org/g/openembedded-core/message/179826
> Mute This Topic: https://lists.openembedded.org/mt/98126404/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c1f24805f8ce7b7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forget my previous question,=C2=A0<div><br></div><div>I si=
mply edit=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/lib/oeqa/selftest/cases/reproducible.py#n137">https://git.openembed=
ded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py=
#n137</a></div><div>to replace by zavariant, and with=C2=A0OEQA_DEBUGGING_S=
AVED_OUTPUT set , I managed to see the html diff</div><div><br></div><div>N=
evertheless, It took one hour, but it seems that it cannot be avoided since=
 there are two builds and one</div><div>without any shared state.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, 7 Apr 2023 at 17:21, Frederic Martinsons via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;frederic.martinsons=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I plan to work on=C2=A0=
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090" targe=
t=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a>=
=C2=A0 in the coming days.</div><div>To show how things are tested I ran &q=
uot;oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds&=
quot;=C2=A0but even on a strong machine, it took several hours (I waited fo=
r 6h and it is not finished yet).</div><div><br></div><div>Does anyone know=
 if it is possible to test reproducibility on a single package (here, zvari=
ant) ?</div><div>Should I tweak the python test class or is there a simple =
way ?</div><div><br></div><div>Thanks</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179826): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179826" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179826</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98126404/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98126404/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c1f24805f8ce7b7b--

