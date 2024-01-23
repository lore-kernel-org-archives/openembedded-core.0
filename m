Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C84C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 04:56:16 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.4755.1705985775472124621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 20:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeJmlJsH;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3674202276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 20:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705985774; x=1706590574; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ENb2SyibqKDIj/rosEte3sMG0IMM+BZJ1adC4o07V6s=;
        b=jeJmlJsH2HN0LHeX5uuT9qaFvLLPX/sPwPONxzqMFh+gZ7FtuhjJoAiQ4hKgrLL13S
         nTOFO4gDGVgLaGXU6Bvl+iSAy8ABE2uRBG1ZKwDzQAU9NdtupuaXQaps9kbMASOdYb6C
         7naYKqF3cuWChLZPxQV0JShdRN1R9DnPkJfW8zymeVS8rV5qSb6JfxhcuvswHd9+ybFf
         ya7rRqWbau/Jzj/GzhT+Cmt5um+pqr2yjSwKCGwoUQyoZzLcDh88YDgwoPOjeB4IWc4d
         PFFuxgQTN6m2n6YMYSS6MHk3QAN4WlyGilO+NeiPW6Q7dUUAfEA5cQW/Fw6o9WNqRD/S
         +WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705985774; x=1706590574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENb2SyibqKDIj/rosEte3sMG0IMM+BZJ1adC4o07V6s=;
        b=bJF5frr7jwwModu/XxjINUlt0lc6OagmwJ4+KMolSYmn3orwr4R72xbmWQ6sJqoBdI
         kAu0yonnM5FEK+BtlcsGMTDXEAMmhGhkmAAdlY97hR3wJQIqD/aUU7YxdXu1O9lDoUmP
         vAaIVfwFiRRb4DjW4Ut4o3CNCA86zwLN+02+V/giuJJJKDxy/bcrhWt9T1Sezkli/fuY
         YKJJarOl0EnigGZSSN49+BW86qZxktikFUvnTDS6JYmQVWDE4nLdBD/dt3EHzxcq5XKk
         mKV4ZHky5wlo2I6egM+v6U/+fW44UzwJYyErmmqHYNlFjBqhxZpjA27Qin2bqoddp7bg
         qOlQ==
X-Gm-Message-State: AOJu0Yyzv9demD2KeDbUrywgFxjUKpGZnIcCReDyTEPSeZ/FITfpBOpQ
	18ZS3tGNb2SUFAx9EFWJBU3qNqCR407YBKSERz8jg9bhstalbKiyMNVB1yZtg34W5Ff13B5SHhC
	FEma97gVKTy6MUaTdsVrfCiTpXmI=
X-Google-Smtp-Source: AGHT+IFIijp9CqrYf4/SQn8IZjRBZ8EE/ewcwoymjVD+RCazRki7Ouablf8/k0bdiyeWz2Y/7XfnHrZQ5IPrhRYTDAU=
X-Received: by 2002:a25:4986:0:b0:dc2:26dd:8a0f with SMTP id
 w128-20020a254986000000b00dc226dd8a0fmr4221275yba.56.1705985774600; Mon, 22
 Jan 2024 20:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20240122200704.21018-1-reatmon@ti.com> <b9a69f67-802a-4c94-88ec-1c16d787d3da@smile.fr>
 <88033e10-0c89-4498-a785-058d4334c532@ti.com>
In-Reply-To: <88033e10-0c89-4498-a785-058d4334c532@ti.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 22 Jan 2024 20:56:03 -0800
Message-ID: <CANx9H-BHxgwksQS6mWaFDzMRyuWh--skJvUht8X5j_txW6e01w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-yamllint: Add recipe
To: reatmon@ti.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="00000000000016474f060f95c4de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 04:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194199

--00000000000016474f060f95c4de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 3:36=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:

>
>
> On 1/22/2024 4:30 PM, Yoann Congal wrote:
> > Hi,
> >
> > Le 22/01/2024 =C3=A0 21:07, Ryan Eatmon via lists.openembedded.org a =
=C3=A9crit :
> >> Add recipe for yamllint.  There is an upcoming change in u-boot where
> >> the binman tool is now configured to call yamllint to verify the confi=
gs
> >> during compile time.
> >>
> >> There was a previous patch a year ago from Trevor Woerner that never
> >> made it into oe-core.  This patch is a reworking of his patch but
> >> pointing to a newer version.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> ---
> >>   .../python/python3-yamllint_1.33.0.bb             | 15
> +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/python/
> python3-yamllint_1.33.0.bb
> >
> > FYI, this new recipe lacks a maintainer and throw this warning :
> > WARNING: python3-yamllint-1.33.0-r0 do_recipe_qa: QA Issue: Recipe
> python3-yamllint in [...]/poky/meta/recipes-devtools/python/
> python3-yamllint_1.33.0.bb does not have an assigned maintainer. Please
> add an entry into meta/conf/distro/include/maintainers.inc.
> [missing-maintainer]
>
> Tim,
>
> Do you mind being the maintainer for this new python recipe?  You are
> maintainer for many other python modules including pyyaml which this
> module depends on.  I can submit a v2 updating that file as well if you
> are willing.
>

That=E2=80=99s fine with me.

=E2=80=94Tim

>
>
> > Regards,
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194195):
> https://lists.openembedded.org/g/openembedded-core/message/194195
> Mute This Topic: https://lists.openembedded.org/mt/103894761/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000016474f060f95c4de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"></div></div></div><=
div><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 22, 2024 at 3:36=E2=
=80=AFPM Ryan Eatmon via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.c=
om@lists.openembedded.org" target=3D"_blank">ti.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
On 1/22/2024 4:30 PM, Yoann Congal wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Le 22/01/2024 =C3=A0 21:07, Ryan Eatmon via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> a =C3=A9crit=C2=A0:<br>
&gt;&gt; Add recipe for yamllint.=C2=A0 There is an upcoming change in u-bo=
ot where<br>
&gt;&gt; the binman tool is now configured to call yamllint to verify the c=
onfigs<br>
&gt;&gt; during compile time.<br>
&gt;&gt;<br>
&gt;&gt; There was a previous patch a year ago from Trevor Woerner that nev=
er<br>
&gt;&gt; made it into oe-core.=C2=A0 This patch is a reworking of his patch=
 but<br>
&gt;&gt; pointing to a newer version.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" t=
arget=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-yamllint_1.33.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-yamllint_1.33.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 15 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a hre=
f=3D"http://python3-yamllint_1.33.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-yamllint_1.33.0.bb</a><br>
&gt; <br>
&gt; FYI, this new recipe lacks a maintainer and throw this warning :<br>
&gt; WARNING: python3-yamllint-1.33.0-r0 do_recipe_qa: QA Issue: Recipe pyt=
hon3-yamllint in [...]/poky/meta/recipes-devtools/python/<a href=3D"http://=
python3-yamllint_1.33.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ya=
mllint_1.33.0.bb</a> does not have an assigned maintainer. Please add an en=
try into meta/conf/distro/include/maintainers.inc. [missing-maintainer]<br>
<br>
Tim,<br>
<br>
Do you mind being the maintainer for this new python recipe?=C2=A0 You are =
<br>
maintainer for many other python modules including pyyaml which this <br>
module depends on.=C2=A0 I can submit a v2 updating that file as well if yo=
u <br>
are willing.<br>
</blockquote><div dir=3D"auto"><br></div></div><div><div dir=3D"auto">That=
=E2=80=99s fine with me.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>=E2=80=94Tim=C2=A0</div></div><div><div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)"><br>
<br>
&gt; Regards,<br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194195): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194195" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194195</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103894761/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103894761/924729</a><br>
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
</div>

--00000000000016474f060f95c4de--

