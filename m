Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7A2C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:15:35 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.73701.1705310126132311072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=IrTcwL78;
 spf=pass (domain: snapchat.com, ip: 209.85.208.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-558b5f4cf2dso3538473a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 01:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705310124; x=1705914924; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zkbnho5GexzX+9MmtD8kUjRdx9zhEY6x8/6hXVagKoY=;
        b=IrTcwL78DByPvplXjt/3o6RKXAet6S3IcZUApcABeP/bTDhFnudpvLKAG8IRbFEvDw
         jugGbRZBIcJaAIYy0zJgzBYZaMLw/4k/acuC/6hh52Q7ssBdhQNzmTlrmAEmqiidX85W
         6MD+PxmihNNKgXtZmlrdK9Rl4GJp6WXQYQndc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310124; x=1705914924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zkbnho5GexzX+9MmtD8kUjRdx9zhEY6x8/6hXVagKoY=;
        b=kt3vVhRut9SzJDGcXrZNY7JXkDdqzrg9r3U6jgPcE4d2x0PklEEjY75P8pVhtlcr2i
         FqGT5a3H0JV6cN0bB/DxN/L6HtCqqBTGPUDw1PuV3KueYS3t/nzSDCQhGTRKrb4sMt/5
         kaEYObuuaDkur9BeS1NLgAMFPOhJJwq7ARB6QR5n1ET+4klTQLCc980cB+tPppuX8bI/
         KhNWAsKgkheaRgEpw0LeN2ISyj8Fs2zEztVZ/T5d+c7R49b5OdTHCs8ZUwGyTZDXRx5H
         yoWEMXT2neSOUhzBFF2q3zzpNugH5kYV8wlmMu+fAUdSBsAtvitTLAwptCbm3CA7sPiC
         nAYQ==
X-Gm-Message-State: AOJu0Yx/St6Nz/EHWfMgCh64C8JHJB2VINIqMt/lxjyj7JkP/yVUAH8X
	VTRVdiMImJmNia0BlsyKVl9h2rdzhZGJG0yGyqpCtREyJC787A==
X-Google-Smtp-Source: AGHT+IF2ueDdV8hW5zfTuCiac69hqBeJu01lfBs3snceDl6TXU+rwT6Xl4a3up7tHA6fD28Vjajj9tuWP0RHoOJa9Ak=
X-Received: by 2002:a17:907:7f11:b0:a2b:29bc:f1de with SMTP id
 qf17-20020a1709077f1100b00a2b29bcf1demr2743031ejc.9.1705310124487; Mon, 15
 Jan 2024 01:15:24 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org> <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
In-Reply-To: <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 15 Jan 2024 10:15:13 +0100
Message-ID: <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jasper.Orschulko@iris-sensing.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034527a060ef8748d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193651

--00000000000034527a060ef8748d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jasper,
one thing to keep in mind is that for some repositories, downloading a
release tarball is significantly faster than cloning the whole repository
(since the tarball is much smaller than the git repository containing the
entire git history).

Etienne

On Mon, Jan 15, 2024 at 7:38=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 15 Jan 2024 at 07:26, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
>
> > I'm also curious about what osselot outputs that can't be done with a
> > oe-core class directly? Is something missing in existing create-spdx
> > classes? Here's for example what osselot provides for busybox, but I
> > can't really make sense of it:
> >
> >
> https://github.com/Open-Source-Compliance/package-analysis/tree/main/anal=
ysed-packages/busybox/version-1.36.1
>
> Okay, I've read the README file in that repo, and if i understood it
> right, the process is:
> - run fossology
> - have a human inspect the output, and correct it on a file by file
> basis (tremendous waste of time and limited developer resources even
> when done the 'open source way' if you ask me but whatevs)
> - place the corrected output into the above repository
>
> Do you really really need the 'human corrected' part of all this? It
> will never possibly cover all of the packages you need to ship and
> match all their versions. If not, then maybe using and improving this
> layer is a better way out?
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_meta-2Dspdxscanner_&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr7zIQ1hCuaw4Wi_3=
pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&s=3DTRpMNG5GBFN9HHhbGEuDci=
vc9L3M4YJoBiOCfnMpvgE&e=3D
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193634):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_193634&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&s=3Dz3C=
FxWVTjcEstB_nG_JPATqWSmPa3VDD0K-AfVudff4&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103730186_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr7zIQ1hCuaw4W=
i_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&s=3DHr3qkkZmag5Ih91KHUu=
xVDIqcVKHLvgZMAwazFeWlSk&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr7zIQ1=
hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&s=3Dbkuz8C12_AoH=
FBh1nsC9EAgy1CUR7G5ymbxEdXabqA4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000034527a060ef8748d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jasper,<br>one thing to keep in mind is that for some r=
epositories, downloading a release tarball is significantly faster than clo=
ning the whole repository (since the tarball is much smaller than the git r=
epository containing the entire git history).<br><br>Etienne</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 15,=
 2024 at 7:38=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Mon, 15 Jan 2024 at 07:26, Alexander=
 Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
<br>
&gt; I&#39;m also curious about what osselot outputs that can&#39;t be done=
 with a<br>
&gt; oe-core class directly? Is something missing in existing create-spdx<b=
r>
&gt; classes? Here&#39;s for example what osselot provides for busybox, but=
 I<br>
&gt; can&#39;t really make sense of it:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/Open-Source-Compliance/package-analysis/=
tree/main/analysed-packages/busybox/version-1.36.1" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/Open-Source-Compliance/package-analysis/tr=
ee/main/analysed-packages/busybox/version-1.36.1</a><br>
<br>
Okay, I&#39;ve read the README file in that repo, and if i understood it<br=
>
right, the process is:<br>
- run fossology<br>
- have a human inspect the output, and correct it on a file by file<br>
basis (tremendous waste of time and limited developer resources even<br>
when done the &#39;open source way&#39; if you ask me but whatevs)<br>
- place the corrected output into the above repository<br>
<br>
Do you really really need the &#39;human corrected&#39; part of all this? I=
t<br>
will never possibly cover all of the packages you need to ship and<br>
match all their versions. If not, then maybe using and improving this<br>
layer is a better way out?<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_meta-2Dspdxscanner_&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&a=
mp;s=3DTRpMNG5GBFN9HHhbGEuDcivc9L3M4YJoBiOCfnMpvgE&amp;e=3D" rel=3D"norefer=
rer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_meta-2Dspdxscanner_&amp;d=3DDwIBaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2Fhz=
gXSrFqApMp&amp;s=3DTRpMNG5GBFN9HHhbGEuDcivc9L3M4YJoBiOCfnMpvgE&amp;e=3D</a>=
 <br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193634): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
3634&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pu=
m0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&amp;s=3Dz3CFxWVTjcEstB_nG_JP=
ATqWSmPa3VDD0K-AfVudff4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_193634&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqAp=
Mp&amp;s=3Dz3CFxWVTjcEstB_nG_JPATqWSmPa3VDD0K-AfVudff4&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103730186_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M06Ud=
jBoG2FhzgXSrFqApMp&amp;s=3DHr3qkkZmag5Ih91KHUuxVDIqcVKHLvgZMAwazFeWlSk&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103730186_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP4=
6ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&amp;s=3DHr3qkkZmag5Ih91KHUuxVDIqcVKHLvgZM=
AwazFeWlSk&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0WMoAGtRcnP46ZIUSk5U39M0=
6UdjBoG2FhzgXSrFqApMp&amp;s=3Dbkuz8C12_AoHFBh1nsC9EAgy1CUR7G5ymbxEdXabqA4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dr7zIQ1hCuaw4Wi_3pum0=
WMoAGtRcnP46ZIUSk5U39M06UdjBoG2FhzgXSrFqApMp&amp;s=3Dbkuz8C12_AoHFBh1nsC9EA=
gy1CUR7G5ymbxEdXabqA4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000034527a060ef8748d--

