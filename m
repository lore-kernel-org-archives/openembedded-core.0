Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F9BC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:59:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.5677.1663081140684980809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=ZtrJwcXg;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id o5so5605692wms.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=J0gl+VFVdXarH/s8iCeMMwQyW9lASa4C48OuEDuTzTY=;
        b=ZtrJwcXg9daEwSamvvHVwssSd9Th++p/FGMLunjZhRQToteIwDk9Ug9g97kxnByFTP
         te+sIaQJfJJ7evT2EbJjb+jxef65CeLyMFCx9wyFZ1isNw0LXo4lIStwDt8d2ipT/Tis
         qtpynS5V3+OEIu3Zqmyqooe6am6PjPKGUMeR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=J0gl+VFVdXarH/s8iCeMMwQyW9lASa4C48OuEDuTzTY=;
        b=RVO4xbGkp7zBBks825w3iENpG0vs1Kbo1Os7QO7mTX+x4CURSsuKis6UXo34kC++Vp
         3yfrtwuP6sz4G1WN9WL3eQLob73azOTDHul/j8AsS5E71gYsaxVsy8mC9+hvxKEo0K6y
         jWS96Ms/KiG4wpmorb0l4GcWxtIW74/hjpEhwLBWDNBh6EmQGoLgRl4xgyJ7uAYB26ok
         SLHDIejr/sQZ6iVJdztDR+9NsXMVfae0fw/HwtEMioaUruPy1KOWifYXbg7/paJlCvh1
         3AcqVA4+7VBYcaraLzS76j4GeceCkGOxVrRY94E6rDDnHiV/d/oMGNx0BRGFn6CSsOj9
         dWaA==
X-Gm-Message-State: ACgBeo2ox8hReIGq2M5zlEmCwm/q1astKkHvC1hHEYlt7g2TQhtY8i8K
	4Veb1ZIuT7zRUHJ7tO7sa2NTRxKo5gxCBXbtJixAyg==
X-Google-Smtp-Source: 
 AA6agR5hKgS9GYcn5Kr88OtqV02v7Hvu5w6I15iKl5lTPHobpzIgyKi24leYk1nqJQDdHFq3F2/ylNGHzTZgb2hgFlw=
X-Received: by 2002:a05:600c:3ac6:b0:3a5:c03f:510d with SMTP id
 d6-20020a05600c3ac600b003a5c03f510dmr2779266wms.120.1663081138903; Tue, 13
 Sep 2022 07:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123910.3428647-1-ecordonnier@snap.com>
 <4164993b-6069-cf33-75de-0fb82dd150e0@theobroma-systems.com>
In-Reply-To: <4164993b-6069-cf33-75de-0fb82dd150e0@theobroma-systems.com>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Tue, 13 Sep 2022 16:58:47 +0200
Message-ID: 
 <CAHUKmYbV1LbOTqaXwcJb=uAh6vAU1QnjPsVWLV1gQiXBMbT0rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: add PACKAGECONFIG[editline]
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="00000000000084cf5305e8904049"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:59:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170596

--00000000000084cf5305e8904049
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

yes, editline is replacing readline in python3, even though editline may
have slightly less functionality than readline. I'll edit the patch to add
a conflict between editline and readline.

Thanks,
Etienne

On Tue, Sep 13, 2022 at 2:53 PM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Etienne,
>
> On 9/13/22 14:39, Etienne Cordonnier via lists.openembedded.org wrote:
> > editline is a BSD alternative for readline which is GPLv3.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >   meta/recipes-devtools/python/python3_3.10.6.bb | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb
> b/meta/recipes-devtools/python/python3_3.10.6.bb
> > index 1b28728732..6c4ef5c7d1 100644
> > --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> > +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> > @@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??=3D "readline gdbm
> ${@bb.utils.filter('DISTRO_FEATURE
> >   PACKAGECONFIG:class-native ??=3D "readline gdbm"
> >   PACKAGECONFIG:class-nativesdk ??=3D "readline gdbm"
> >   PACKAGECONFIG[readline] =3D ",,readline"
> > +PACKAGECONFIG[editline] =3D "--with-readline=3Deditline,,libedit"
>
> Is libedit supposed to replace readline entirely in python3? If so, I'm
> wondering if it'd make sense to make readline and editline
> PACKAGECONFIG's packageconfig-conflicts-for-f1 the other so that we
> cannot have both configs enabled at the same time?
>
> C.f. last entry in
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_ref-2Dmanual_variables.html-23term-2DPACKAGECONFIG&d=3DDwICaQ&c=3DncDTm=
phkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqar=
UzFxz3aALck&m=3DBI7ofOMnjkh-6dMCoBr-4L0qc7YYUHte9BK2ektyAy1jXC5OrzARmRie0aB=
AbBBB&s=3D1TEeBYT7HqMmOf5tqLzvd2rnYTyFAx8GHJy2vewKbMA&e=3D
>
>
> Cheers,
> Quentin
>
> >   # Use profile guided optimisation by running PyBench inside qemu-user
> >   PACKAGECONFIG[pgo] =3D "--enable-optimizations,,qemu-native"
> >   PACKAGECONFIG[tk] =3D ",,tk"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170576):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_170576&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFw=
jJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DQwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=3DBmv=
M79DREWtojYRC-ufOj7AZ5khUIuwoZ_cL1VgAGu0&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_93654164_6293953&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DQwQT1E3jSDJ2g0=
NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=3DQhIFYKrLZ1FS_BL-tsQv=
UEZtL5Fm4CrGs9aP-ihyae0&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3D=
LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DQwQT1E=
3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=3DUVe3axFwAeEI=
Sx3bG_8YcrRRpZaV4V3DxhtIETyZjz4&e=3D
>  [quentin.schulz@theobroma-systems.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000084cf5305e8904049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Quentin,<br><br>yes, editline is replacing readlin=
e in python3, even though editline may have slightly less functionality tha=
n readline. I&#39;ll edit the patch to add a conflict between editline and =
readline.<br><br>Thanks,<br>Etienne=C2=A0</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 2:53 PM Qu=
entin Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">qu=
entin.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Etienne,<br>
<br>
On 9/13/22 14:39, Etienne Cordonnier via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; editline is a BSD alternative for readline which is GPLv3.<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.1=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> | 1 +<br=
>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
10.6.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.10.6.bb</a><br>
&gt; index 1b28728732..6c4ef5c7d1 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
&gt; @@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??=3D &quot;readline gd=
bm ${@bb.utils.filter(&#39;DISTRO_FEATURE<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:class-native ??=3D &quot;readline gdbm&quot;=
<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:class-nativesdk ??=3D &quot;readline gdbm&qu=
ot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[readline] =3D &quot;,,readline&quot;<br>
&gt; +PACKAGECONFIG[editline] =3D &quot;--with-readline=3Deditline,,libedit=
&quot;<br>
<br>
Is libedit supposed to replace readline entirely in python3? If so, I&#39;m=
 <br>
wondering if it&#39;d make sense to make readline and editline <br>
PACKAGECONFIG&#39;s packageconfig-conflicts-for-f1 the other so that we <br=
>
cannot have both configs enabled at the same time?<br>
<br>
C.f. last entry in <br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoct=
oproject.org_ref-2Dmanual_variables.html-23term-2DPACKAGECONFIG&amp;d=3DDwI=
CaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMI=
GRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DBI7ofOMnjkh-6dMCoBr-4L0qc7YYUHte9B=
K2ektyAy1jXC5OrzARmRie0aBAbBBB&amp;s=3D1TEeBYT7HqMmOf5tqLzvd2rnYTyFAx8GHJy2=
vewKbMA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.org_ref-2Dmanual_varia=
bles.html-23term-2DPACKAGECONFIG&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hp=
F_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALc=
k&amp;m=3DBI7ofOMnjkh-6dMCoBr-4L0qc7YYUHte9BK2ektyAy1jXC5OrzARmRie0aBAbBBB&=
amp;s=3D1TEeBYT7HqMmOf5tqLzvd2rnYTyFAx8GHJy2vewKbMA&amp;e=3D</a>=C2=A0 <br>
<br>
Cheers,<br>
Quentin<br>
<br>
&gt;=C2=A0 =C2=A0# Use profile guided optimisation by running PyBench insid=
e qemu-user<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[pgo] =3D &quot;--enable-optimizations,,qemu-=
native&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[tk] =3D &quot;,,tk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170576): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_170576&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rX=
IzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DQwQT1E3jSDJ2g=
0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&amp;s=3DBmvM79DREWtojYR=
C-ufOj7AZ5khUIuwoZ_cL1VgAGu0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_170576&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWh=
uk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_=
-172IIy1t&amp;m=3DQwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFl=
csp3W6V&amp;s=3DBmvM79DREWtojYRC-ufOj7AZ5khUIuwoZ_cL1VgAGu0&amp;e=3D</a><br=
>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_93654164_6293953&amp;d=3DDwIFaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3DQwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1Sf=
Snn-87qis_5jjFlcsp3W6V&amp;s=3DQhIFYKrLZ1FS_BL-tsQvUEZtL5Fm4CrGs9aP-ihyae0&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654164_6293953&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DQwQT1E3jSDJ2g0NTR_v12IuTnVPJ=
slfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&amp;s=3DQhIFYKrLZ1FS_BL-tsQvUEZtL5Fm4C=
rGs9aP-ihyae0&amp;e=3D</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&=
amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP=
6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DQwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11=
W1SfSnn-87qis_5jjFlcsp3W6V&amp;s=3DUVe3axFwAeEISx3bG_8YcrRRpZaV4V3DxhtIETyZ=
jz4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzV=
mkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DQwQT1E3jSDJ2g0NT=
R_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&amp;s=3DUVe3axFwAeEISx3bG_=
8YcrRRpZaV4V3DxhtIETyZjz4&amp;e=3D</a>=C2=A0 =C2=A0[<a href=3D"mailto:quent=
in.schulz@theobroma-systems.com" target=3D"_blank">quentin.schulz@theobroma=
-systems.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--00000000000084cf5305e8904049--

