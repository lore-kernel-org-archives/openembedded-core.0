Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BF2C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 17:52:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10760.1655920362774196648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 10:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ArihwPML;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e4so20315596ljl.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qv/2QUjl8MCeQVJOkTeK2PSHHaz8W1EqIhNIw9f5gxc=;
        b=ArihwPMLFEws+C+JgsKn/CHi/EK8JhhVc1vBdYDEGOPc9YXiETOFFfT0c8vl9w0Pvm
         /6EA9LTvaiyj2AP3PzYoE3/c8DO7U2yMNPV4E6jDQL9yl46t1bRvu4PydGPTeMAS5av9
         scOGYbO7Iyot86p7bMGkOdV7K9Hho8CNhIhpHfOmRj+ufUm0wYxGIZgzAwIMj5QdtvmT
         rRvnjq2QOVz8bEX3Jl4plG3u9e0wzWlrLsJVYMPYe77UPp+uGy4105g3PwcPL1VgpOe/
         JFVotBXvp066vq6H8Ub5khYjnnTf5TA5+cDLRuO/dwnf00n+pFQrN4ehNsJ5VKhuS8Ue
         4Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qv/2QUjl8MCeQVJOkTeK2PSHHaz8W1EqIhNIw9f5gxc=;
        b=n35Ig3vSCQ1pXoQh1iGoAajVYbwKcEtVs8RHeo9vxvRlbf1myfJCS4TWoJVsAqClAd
         IwERiPbDb6C4lOa5nDMTM0bRdMHHyeK43GaqIbw2V2Lvj1lfqahEH2NgWahozUC9gbP4
         TgOvyAbbvUwuE94PXIDdSt7M4eZK5MV45iZz8EAK0aTKT5Hc9FCEpu1zIHPjv2CcYQwe
         FWgkJIt5aG+OPMLNu9S0aCArPhQx3wwQAGD6+3ung0DnDu+7eadHd3jnHKce9Z51KlrC
         jKkmUbjLlk3A74OGnOGptgvEDojVJQp7NPwLLUV2N6GcAB/I7t8cw/1EqWoZnhe66CGv
         gpLw==
X-Gm-Message-State: AJIora+tCS0bY4ihy/MRmQpT8esFAMeP8lQ3+SMEPHnwwo1ddCtYNYS+
	FwZJdEO6LEaGVVQmo7Iw0r/F7jCpNTdDG3v63Cs=
X-Google-Smtp-Source: 
 AGRyM1v871P04Ejufek8zgTZOL/c2nSdcBeYw5vcCQp3K8/7zi8KdyQMUih3q840YTKY/ljLyLxUgu4q4FvvRVmnHRw=
X-Received: by 2002:a05:651c:1a1e:b0:258:f021:8020 with SMTP id
 by30-20020a05651c1a1e00b00258f0218020mr2545701ljb.273.1655920360774; Wed, 22
 Jun 2022 10:52:40 -0700 (PDT)
MIME-Version: 1.0
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
 <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
 <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
 <976357c9-f919-bf53-afe6-dbf71ee2c75f@weidmueller.com>
 <4f80bb16-6601-f3b7-fe37-d8fa545e5dce@t-online.de>
In-Reply-To: <4f80bb16-6601-f3b7-fe37-d8fa545e5dce@t-online.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Jun 2022 18:52:29 +0100
Message-ID: 
 <CANPvuRkDaGHrggCtEMGszEtvWrQh=-KKHzHp7gawDja5W-EU5w@mail.gmail.com>
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e15e6505e20d0039"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 17:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167247

--000000000000e15e6505e20d0039
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Markus Volk <f_l_k@t-online.de> escreveu no dia quarta, 22/06/2022 =C3=A0(s=
)
16:28:

> I had not tried it, but in the meantime I did and it works with
>
> PACKAGECONFIG ?=3D ""
> PACKAGECONFIG[optviewer] =3D "-DPY_PYGMENTS_FOUND=3DON
> -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DON
> -DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,python3-pygments
> python3-pyyaml"
>

As said previously and if it is contaminated by the host python packages we
need to provide the native version
so cmake will search for it on native systroot. if the tools are not there
it will use the host version again.
Is this right or I missing something?

Jose


> Markus
>
> Am 22.06.22 um 17:06 schrieb Stefan Herbrechtsmeier:
> > Hi Markus,
> >
> > Am 22.06.2022 um 16:18 schrieb Markus Volk via lists.openembedded.org:
> >> Hi,
> >>
> >> couldn't we just do it like this?
> >>
> >> PACKAGECONFIG ?=3D ""
> >> PACKAGECONFIG[optviewer] =3D
> >>
> "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=3DOFF=
,,python3-pygments
>
> >> python3-pyyaml"
> >>
> >> Depending on wether the PACKAGECONFIG option is taken it looks like
> >> this in CMakeCache.txt:
> >>
> >> //No help, variable specified on the command line.
> >> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF
> >>
> >> //No help, variable specified on the command line.
> >> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON
> >
> > Have you test it? The config-ix.cmake file sets the
> > LLVM_HAVE_OPT_VIEWER_MODULES variable [1].
> >
> > Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set PY_PYGMENTS_FOUND,
> > PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.
> >
> > [1]
> >
> https://github.com/llvm/llvm-project/blob/main/llvm/cmake/config-ix.cmake=
#L693
> >
> > Regards
> >   Stefan
> >
> >> Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:
> >>> Hi Richard,
> >>>
> >>> Am 22.06.2022 um 15:10 schrieb Richard Purdie via
> >>> lists.openembedded.org:
> >>>> There is a reproducibility issue which shouldn't be too hard to fix =
if
> >>>> someone had a few minutes to help out:
> >>>>
> >>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845
> >>>>
> >>>> It is in llvm and is a cmake configuration issue. Rather than settin=
g
> >>>> that option based on the presence of python modules (with python fro=
m
> >>>> the host), we should add a configuration option to force it to be
> >>>> disabled in our case. Should be upstreamable with the right patch.
> >>>
> >>> I'm not able to test it at the moment but it should be possible to
> >>> set the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP_FOUND
> >>> and PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:
> >>>
> >>> -DPY_PYGMENTS_FOUND=3DOFF
> >>>
> >>> The find_python_module function in config-ix.cmake returns early if
> >>> the variable PY_${module_upper}_FOUND is defined.
> >>>
> >>> Regards
> >>>   Stefan
> >>>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167242):
> https://lists.openembedded.org/g/openembedded-core/message/167242
> Mute This Topic: https://lists.openembedded.org/mt/91921251/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e15e6505e20d0039
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Markus,</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Markus Volk &lt;<a href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; escreveu no dia quarta=
, 22/06/2022 =C3=A0(s) 16:28:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">I had not tried it, but in the meantime I did and it works wi=
th<br>
<br>
PACKAGECONFIG ?=3D &quot;&quot;<br>
PACKAGECONFIG[optviewer] =3D &quot;-DPY_PYGMENTS_FOUND=3DON <br>
-DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DON <br>
-DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,python3-pygments python3-py=
yaml&quot;<br></blockquote><div><br></div><div>As said previously and if it=
 is contaminated by the host python packages we need to provide=C2=A0the na=
tive version</div><div>so=C2=A0cmake will search for it on native systroot.=
 if the tools are not there it will use the host version again.<br>Is this=
=C2=A0right or=C2=A0I missing something?</div><div><br></div><div>Jose</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Markus<br>
<br>
Am 22.06.22 um 17:06 schrieb Stefan Herbrechtsmeier:<br>
&gt; Hi Markus,<br>
&gt;<br>
&gt; Am 22.06.2022 um 16:18 schrieb Markus Volk via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a>:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; couldn&#39;t we just do it like this?<br>
&gt;&gt;<br>
&gt;&gt; PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt;&gt; PACKAGECONFIG[optviewer] =3D <br>
&gt;&gt; &quot;-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_M=
ODULES=3DOFF,,python3-pygments <br>
&gt;&gt; python3-pyyaml&quot;<br>
&gt;&gt;<br>
&gt;&gt; Depending on wether the PACKAGECONFIG option is taken it looks lik=
e <br>
&gt;&gt; this in CMakeCache.txt:<br>
&gt;&gt;<br>
&gt;&gt; //No help, variable specified on the command line.<br>
&gt;&gt; LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF<br>
&gt;&gt;<br>
&gt;&gt; //No help, variable specified on the command line.<br>
&gt;&gt; LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON<br>
&gt;<br>
&gt; Have you test it? The config-ix.cmake file sets the <br>
&gt; LLVM_HAVE_OPT_VIEWER_MODULES variable [1].<br>
&gt;<br>
&gt; Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set PY_PYGMENTS_FOUND,=
 <br>
&gt; PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.<br>
&gt;<br>
&gt; [1] <br>
&gt; <a href=3D"https://github.com/llvm/llvm-project/blob/main/llvm/cmake/c=
onfig-ix.cmake#L693" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/llvm/llvm-project/blob/main/llvm/cmake/config-ix.cmake#L693</a><br>
&gt;<br>
&gt; Regards<br>
&gt; =C2=A0 Stefan<br>
&gt;<br>
&gt;&gt; Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:<br>
&gt;&gt;&gt; Hi Richard,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am 22.06.2022 um 15:10 schrieb Richard Purdie via <br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a>:<br>
&gt;&gt;&gt;&gt; There is a reproducibility issue which shouldn&#39;t be to=
o hard to fix if<br>
&gt;&gt;&gt;&gt; someone had a few minutes to help out:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D14845" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D14845</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It is in llvm and is a cmake configuration issue. Rather t=
han setting<br>
&gt;&gt;&gt;&gt; that option based on the presence of python modules (with =
python from<br>
&gt;&gt;&gt;&gt; the host), we should add a configuration option to force i=
t to be<br>
&gt;&gt;&gt;&gt; disabled in our case. Should be upstreamable with the righ=
t patch.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m not able to test it at the moment but it should be pos=
sible to <br>
&gt;&gt;&gt; set the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP=
_FOUND <br>
&gt;&gt;&gt; and PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -DPY_PYGMENTS_FOUND=3DOFF<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The find_python_module function in config-ix.cmake returns ear=
ly if <br>
&gt;&gt;&gt; the variable PY_${module_upper}_FOUND is defined.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards<br>
&gt;&gt;&gt; =C2=A0 Stefan<br>
&gt;&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167242): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167242" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167242</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91921251/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91921251/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000e15e6505e20d0039--

