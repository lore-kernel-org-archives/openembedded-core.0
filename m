Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB0AC19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 14:09:44 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.5067.1660399778791468397
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O5kc4zB0;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id w3so4422467edc.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yUhpmjL3yZ6FlGY0Pk1mwYdPInProNQ1QpB2/et/SAc=;
        b=O5kc4zB0E2t0eVj4RgFvqQeL7Jytkw7nq2i/08QPD897FKyZkf7mxH9yHUJYvzIrX0
         760zprqfLvHdcsGeSeldBzvZ88OS0q5y+nVu8nYO2IR11N0cm+CsX/yhFMQXYjF2xrZD
         otwOSnq4L9h2HzbfG1rXr8LpGxI8NFQ+R/hiVW7XGEAz1vDWo9VSqOdReKc6L3FSzB71
         KNVdVrPCiATz7ZGXBh64keHFXcbDDXQE3fwZpR+DzMABRtt7vJWc6ogjLW5eMHFYNgse
         KN5pcDbaOR7sj/qARDCI+MAxVoIvyyExrEfDcw1pC1054YFaw6sfANcDikq6FxULBxr+
         nQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yUhpmjL3yZ6FlGY0Pk1mwYdPInProNQ1QpB2/et/SAc=;
        b=w7sCbfFa7GaZ7Din3IHViCLE5iY6b6XVStzKnwJkUdNFfsfCr7tFp0NXM2snCPf7ZX
         gm5sYYg5k4LBywbxmhm54c3gyoooS3RtGxrfOsLlK3UEQU/coI+y9HAo7QC+hy9RwRc7
         twnfGcSBqIpzJd4JRyMJtjiFjF0X9dl61G8C96xVH7Dzy/gy0pLgDcAUVaXCN835++xI
         kX6ZghYTndyJ7/2wn5TiE9KJDfe/iyiBQcGkOvtefvhLHJueK/f2TCSJ6jlMr46NJO9J
         0Xr2xlIbOrBVE6wOm2jmJqg9mB2Xj+k2i//rOtUoNvfVYaq7LR94S1oe9ERujPFe3eyX
         AX5w==
X-Gm-Message-State: ACgBeo3lxMEcDI8qS71bi8hfO0FgDiF/JXUQ/25zkYPPkI2kGTG5JW3m
	gL4KeWyD2ESqBNXOd5jPbQWfXaQD+tWygPlvLDs=
X-Google-Smtp-Source: 
 AA6agR7Bg/jFqc9JRX3ndb+19n8/TMhxUkkRkAkd7htTTeXJCuLmBA8BOXrSzWrKcNuAlfVFc330TSt7gBSUXH0KIEI=
X-Received: by 2002:a05:6402:3287:b0:43d:bcda:bd20 with SMTP id
 f7-20020a056402328700b0043dbcdabd20mr7613030eda.414.1660399777201; Sat, 13
 Aug 2022 07:09:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 13 Aug 2022 16:09:24 +0200
Message-ID: 
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e7c28a05e61ff2b6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 14:09:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169307

--000000000000e7c28a05e61ff2b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fine for me, I'll do.

But where to place it?
 * meta-openembedded/meta-oe/recipes-support
 * meta-openembedded/meta-oe/recipes-devtools
 * meta-openembedded/recipes-devtools
 * poky/meta/recipes-devtools/

Jan,


On Sat, Aug 13, 2022 at 1:36 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> No need to ask. Make a patch, write a good commit message and send it :)
>
> Alex
>
> On Sat, 13 Aug 2022 at 12:11, Jan Vermaete <jan.vermaete@gmail.com> wrote=
:
> >
> > Could it be useful to transfer the makeself recipe from the no longer
> maintained intel-iot-refkit into meta-openembedded?
> >
> >
> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/re=
cipes-core/makeself/makeself_2.2.0.bb
> >
> > https://github.com/megastep/makeself
> >
> > It's useful as a native recipe to create self extracting installers for
> firmware updates, as an example.
> >
> > br,
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169301):
> https://lists.openembedded.org/g/openembedded-core/message/169301
> > Mute This Topic: https://lists.openembedded.org/mt/92997365/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000e7c28a05e61ff2b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fine for me, I&#39;ll do.<div><br><div>But where to place =
it?</div><div>=C2=A0* meta-openembedded/meta-oe/recipes-support</div><div>=
=C2=A0* meta-openembedded/meta-oe/recipes-devtools</div><div>=C2=A0* meta-o=
penembedded/recipes-devtools</div><div>=C2=A0*=C2=A0poky/meta/recipes-devto=
ols/</div><div><br></div><div>Jan,</div><div><br></div></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 13=
, 2022 at 1:36 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">No need to ask. Make a patch, write a good com=
mit message and send it :)<br>
<br>
Alex<br>
<br>
On Sat, 13 Aug 2022 at 12:11, Jan Vermaete &lt;<a href=3D"mailto:jan.vermae=
te@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Could it be useful to transfer the makeself recipe from the no longer =
maintained intel-iot-refkit into meta-openembedded?<br>
&gt;<br>
&gt; <a href=3D"https://github.com/intel/intel-iot-refkit/blob/master/meta-=
refkit-core/recipes-core/makeself/makeself_2.2.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/intel/intel-iot-refkit/blob/master/meta-r=
efkit-core/recipes-core/makeself/makeself_2.2.0.bb</a><br>
&gt;<br>
&gt; <a href=3D"https://github.com/megastep/makeself" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/megastep/makeself</a><br>
&gt;<br>
&gt; It&#39;s useful as a native recipe to create self extracting installer=
s for firmware updates, as an example.<br>
&gt;<br>
&gt; br,<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#169301): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/169301" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/169301</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92997365=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92997365/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000e7c28a05e61ff2b6--

