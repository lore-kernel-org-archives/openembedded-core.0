Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833A2C77B70
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:20:12 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.17001.1681226410087867664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l1A3Hqf3;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id r27so10940125lfe.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681226408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wD++LxXI9yV72mj2sJzEL05eevVXBOLbu66W6bczkic=;
        b=l1A3Hqf3FOF7od3NdIQa9U96H0y+3CZ+H0DH6Qr5zOQVGhzZSDpcz5c5W7aANSLWUs
         Z5qhCmCujeG/nnOpKPJn/vyo1hJk8THLD444t8/fbAt7OwgWNHQRz7lT5qPeW0NxJwr/
         hIRjrrmCpYKOaR5SvbtB+3XL+YWXlLCdaH5BMXRdykzUPPDXcUFvzOvUQlp06H2rBqc4
         xcELeV6MPcVcvhJ0yCuMisdBd39xsxNlI3qt1alKSRkw5PUSgHyEAILtiYYVyvb+j6x/
         +iSCgU27c+nkrOdbip6sOkCj/G259FLk9tIIJlU2AWRatFfNyTH52rhYj3VG9+UBdeA7
         WAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681226408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wD++LxXI9yV72mj2sJzEL05eevVXBOLbu66W6bczkic=;
        b=iEVm8X8EuzC0/GVxZIQIOl6ZLfezTmej2XXAKd5Cvw73BuhWkBS3oGAayPI69g0Cxa
         EiZBzrv6ExG5V8J0Pa2O3I7V65hja7PeD8BGnVtPQCcswv82zNcqU2FpJHH6576PEtmv
         UjXTDlpeaYvcPgvqpQG5OeX1pZNIm5Pe37ncW6h+x7umXHh2Dji1IhgPCqLzSMTfSnfI
         988WgRNmPOhBAQjoX5Md6QvSodgR3PJSjmZFR9tfvyyUqrPizVRyPOf2+bhEV8NUnyDP
         EZHr6YPtw9ryHnAxRz3tPLUeXwnZzTBgEMOH3F92oas7DeXZjFT15wuPJcnKsjN0JAH2
         0g3A==
X-Gm-Message-State: AAQBX9csn3d0cNOOnE/lm28NB5EXntF5NwDo9JsUjfa+/sW2KY6mDMYJ
	oVghBJzIjfOHMAWfpGmqlG7HPotU4igGpTddOkct98n1
X-Google-Smtp-Source: AKy350bdXUt3jkEeGm8itXTkMM8JSbEjXRXly2XQfwOw7fS7zoQSIOJQkTzC7/g96KRCMw59tR0qQupbjUG8oxn0yhQ=
X-Received: by 2002:ac2:550e:0:b0:4d5:ca32:6aec with SMTP id
 j14-20020ac2550e000000b004d5ca326aecmr3152731lfk.12.1681226407864; Tue, 11
 Apr 2023 08:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepjPjqTHHwxkKv-9xJHZMoBToUpAvg+tyGKQo6KDN-89A@mail.gmail.com>
 <CANNYZj_dRQx7FDSrbP_F-g9vgSpg2GfASZjLvhxk7PR8iwNXNA@mail.gmail.com>
In-Reply-To: <CANNYZj_dRQx7FDSrbP_F-g9vgSpg2GfASZjLvhxk7PR8iwNXNA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 11 Apr 2023 17:19:56 +0200
Message-ID: <CA+cAkeq++J3KB--ZV8YxNbW-GeKeEELpt4rqQHtTxEECEYHRAQ@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3ed1e05f91106fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179931

--000000000000d3ed1e05f91106fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes  I already did that and manage to get the test last 30mn (see the other
mail thread)

Le mar. 11 avr. 2023, 16:52, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> If you read the code for the test, you'll see a 'bitbake world' in it
> somewhere :) Tweak that to build only the item you need.
>
> Alternatively, you can set up two separate build directories, and
> avoid selftest altogether for investigating and fixing the issue.
>
> Alex
>
> On Fri, 7 Apr 2023 at 17:21, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Hello,
> >
> > I plan to work on
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090  in the coming
> days.
> > To show how things are tested I ran "oe-selftest -r
> reproducible.ReproducibleTests.test_reproducible_builds" but even on a
> strong machine, it took several hours (I waited for 6h and it is not
> finished yet).
> >
> > Does anyone know if it is possible to test reproducibility on a single
> package (here, zvariant) ?
> > Should I tweak the python test class or is there a simple way ?
> >
> > Thanks
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179826):
> https://lists.openembedded.org/g/openembedded-core/message/179826
> > Mute This Topic: https://lists.openembedded.org/mt/98126404/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000d3ed1e05f91106fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes=C2=A0 I already did that and manage to get the test l=
ast 30mn (see the other mail thread)=C2=A0</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 11 avr. 2023, 16:52, Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gm=
ail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>If you read the code for the test, you&#39;ll see a &#39;bitbake world&#39=
; in it<br>
somewhere :) Tweak that to build only the item you need.<br>
<br>
Alternatively, you can set up two separate build directories, and<br>
avoid selftest altogether for investigating and fixing the issue.<br>
<br>
Alex<br>
<br>
On Fri, 7 Apr 2023 at 17:21, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I plan to work on <a href=3D"https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15090" rel=3D"noreferrer noreferrer" target=3D"_blank">https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a>=C2=A0 in the coming da=
ys.<br>
&gt; To show how things are tested I ran &quot;oe-selftest -r reproducible.=
ReproducibleTests.test_reproducible_builds&quot; but even on a strong machi=
ne, it took several hours (I waited for 6h and it is not finished yet).<br>
&gt;<br>
&gt; Does anyone know if it is possible to test reproducibility on a single=
 package (here, zvariant) ?<br>
&gt; Should I tweak the python test class or is there a simple way ?<br>
&gt;<br>
&gt; Thanks<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179826): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179826" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1798=
26</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98126404=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/98126404/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000d3ed1e05f91106fd--

