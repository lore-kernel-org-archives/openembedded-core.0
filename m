Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2855CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 13:17:06 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.281362.1697635019640460290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 06:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSBFKjrk;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so75901461fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697635018; x=1698239818; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7UUTJKUPd0G1YIWLmcIza52su5i5nayRdK8VbCJrCCo=;
        b=SSBFKjrkTCK3kHOhE7Widv3WQag8qlpJTbsdVcJthDj+/PaZYTBBo+upfdZYwC6kDE
         fhNW0j1O+NDfUzbfIJhnKm6Dfvtsc/90hJvyumfvPIZIdvN91lFh6jWxY/vVAnc5qs8O
         9HVmb+Js0PDaaHVXs0qek5VsJEwYczVIO94daFqz1YGIQxQgjT57vV67dcboxIJFDG5n
         F58amtjLuTnciHzpYIGvK5k2Y83JqxY3ZU7jGf/b4OSq8hN8f0p6prE/5UxpU8Jd36UM
         kmGJ90II1WYdM5bhMbC7I3iFi8K4NYBgsDUJbhZYZNIfKW3voSOMbUikfpJLuL3qf4HL
         Z+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697635018; x=1698239818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UUTJKUPd0G1YIWLmcIza52su5i5nayRdK8VbCJrCCo=;
        b=vIxi4Q4se9z2EE8ACZReCzwpXn9GsCJx0m2BLk0prRbGMhC+ERKM6OEvcZxOzKWw6v
         R/dN9xhVR7GSgqETaLxYQo2xKuxg6YgL8Oh4UJMttywRs3Dh1WBLz/CDOSAw0ZpdsvPp
         jU9HgSz2loNzObk4mm3qzsK6ZopXzNrg77XNhbjAVIWtrYX/nFLanfObBwe/kyDdjxUB
         uCwJZ9kLcVXqTFaNAonPH7JOP3lP3YO0OWgDkUrlcxW3XN2Z3pGPl39l5/oeGEAMFbZZ
         q5mAtMY7zqomFvzIXNANNOZcyooMKYoRLrKB+kP8OhkWhPPGSDXca3P51DYBTRtf4fCT
         e5kg==
X-Gm-Message-State: AOJu0YzFpTlEUuRlvlLaXyl/hci+20R90JkhJ/mGaY9SDTzucVGDqNSw
	ry8FWBCjafpwcnvcPfCoZ40ETGvlzD8vzi42Z3w=
X-Google-Smtp-Source: AGHT+IF7NHeOBqpevuUmkvaF/7pSnkyy7zziBIlmozfjwU31xRRbHsUUaV7cVZxQV8IkQqmHAxruSVHc8+JvG20wwqI=
X-Received: by 2002:a05:651c:1070:b0:2c5:3322:c2d6 with SMTP id
 y16-20020a05651c107000b002c53322c2d6mr3290757ljm.7.1697635017364; Wed, 18 Oct
 2023 06:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
In-Reply-To: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Oct 2023 15:16:45 +0200
Message-ID: <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
Subject: Re: [OE-core] gitsm:// question
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002b19530607fd74f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 13:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189389

--0000000000002b19530607fd74f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just add the name to pytorch repo url and use only that in SRCREV_FORMAT,
you probably don't care about representing the other repos in SRCPV if
you're updating them only together with main pytorch update.

On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormenyi <zboszor@gmail.c=
om>
wrote:

> Hi,
>
> I have a working python3-pytorch recipe which originally used this:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> addtask do_git_submodules after do_unpack before do_patch
>
> do_git_submodules[network] =3D "1"
>
> do_git_submodules () {
>          cd ${S}
>          git submodule update --init --recursive
> }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> I would like to replace the above with a series of gitsm:// SRC_URI lines=
.
> Here's a subset of submodules that shows the problem I am seeing:
>
> SRC_URI =3D " \
> git://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2.=
1 \
> ...
> gitsm://
> github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1=
;destsuffix=3Dthird_party/fbgemm
> \
> gitsm://
> github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuf=
fix=3Dthird_party/fbgemm/third_party/asmjit
> \
> gitsm://
> github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;dest=
suffix=3Dthird_party/fbgemm/third_party/cpuinfo
> \
> gitsm://
> github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;dests=
uffix=3Dthird_party/fbgemm/third_party/cutlass
> \
> gitsm://
> github.com/google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;dest=
suffix=3Dthird_party/fbgemm/third_party/googletest
> \
> gitsm://
> github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=3Dhttps;name=3D=
fbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party/hipify_torch
> \
> ...
> "
>
> As you can see, there are recursively placed git submodules
> and do_fetch fails with an error message about SRCREV_FORMAT
> having to be set.
>
> The above is a limited subset of the complete list and
> some of the repositories (like googletest, gloo, glog and pybind11)
> occurs multiple times as child submodules of upper ones,
> with different SRCREV values in different leaf submodules.
>
> I have not found a conclusive example to use SRCREV_FORMAT
> with git:// + gitsm://
>
> Can someone enlighten me how to use SRCREV_FORMAT properly
> for this case? Should I stick to the proven working nonstandard way
> and just run git submodule update --init --recursive?
>
> As an easy way out, is there a flag to git:// to process its
> submodules automatically?
>
> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189388):
> https://lists.openembedded.org/g/openembedded-core/message/189388
> Mute This Topic: https://lists.openembedded.org/mt/102038382/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002b19530607fd74f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just add the name to pytorch repo url and use only that in=
 SRCREV_FORMAT, you probably don&#39;t care about representing the other re=
pos in SRCPV if you&#39;re updating them only together with main pytorch up=
date.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormenyi &lt;<a href=
=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I have a working python3-pytorch recipe which originally used this:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
addtask do_git_submodules after do_unpack before do_patch<br>
<br>
do_git_submodules[network] =3D &quot;1&quot;<br>
<br>
do_git_submodules () {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${S}<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git submodule update --ini=
t --recursive<br>
}<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
<br>
I would like to replace the above with a series of gitsm:// SRC_URI lines.<=
br>
Here&#39;s a subset of submodules that shows the problem I am seeing:<br>
<br>
SRC_URI =3D &quot; \<br>
git://<a href=3D"http://github.com/pytorch/pytorch.git;protocol=3Dhttps;bra=
nch=3Drelease/2.1" rel=3D"noreferrer" target=3D"_blank">github.com/pytorch/=
pytorch.git;protocol=3Dhttps;branch=3Drelease/2.1</a> \<br>
...<br>
gitsm://<a href=3D"http://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;na=
me=3Dfbgemm;nobranch=3D1;destsuffix=3Dthird_party/fbgemm" rel=3D"noreferrer=
" target=3D"_blank">github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Df=
bgemm;nobranch=3D1;destsuffix=3Dthird_party/fbgemm</a> <br>
\<br>
gitsm://<a href=3D"http://github.com/asmjit/asmjit.git;protocol=3Dhttps;nam=
e=3Dfbgemmasmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit" rel=3D=
"noreferrer" target=3D"_blank">github.com/asmjit/asmjit.git;protocol=3Dhttp=
s;name=3Dfbgemmasmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit</a=
> <br>
\<br>
gitsm://<a href=3D"http://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;n=
ame=3Dfbgemmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo" re=
l=3D"noreferrer" target=3D"_blank">github.com/pytorch/cpuinfo.git;protocol=
=3Dhttps;name=3Dfbgemmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/c=
puinfo</a> <br>
\<br>
gitsm://<a href=3D"http://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;na=
me=3Dfbgemmcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutlass" rel=
=3D"noreferrer" target=3D"_blank">github.com/NVIDIA/cutlass.git;protocol=3D=
https;name=3Dfbgemmcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutl=
ass</a> <br>
\<br>
gitsm://<a href=3D"http://github.com/google/googletest.git;protocol=3Dhttps=
;name=3Dfbgemmgtest;destsuffix=3Dthird_party/fbgemm/third_party/googletest"=
 rel=3D"noreferrer" target=3D"_blank">github.com/google/googletest.git;prot=
ocol=3Dhttps;name=3Dfbgemmgtest;destsuffix=3Dthird_party/fbgemm/third_party=
/googletest</a> <br>
\<br>
gitsm://<a href=3D"http://github.com/ROCmSoftwarePlatform/hipify_torch.git;=
protocol=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/thir=
d_party/hipify_torch" rel=3D"noreferrer" target=3D"_blank">github.com/ROCmS=
oftwarePlatform/hipify_torch.git;protocol=3Dhttps;name=3Dfbgemmhiptorch;des=
tsuffix=3Dthird_party/fbgemm/third_party/hipify_torch</a> <br>
\<br>
...<br>
&quot;<br>
<br>
As you can see, there are recursively placed git submodules<br>
and do_fetch fails with an error message about SRCREV_FORMAT<br>
having to be set.<br>
<br>
The above is a limited subset of the complete list and<br>
some of the repositories (like googletest, gloo, glog and pybind11)<br>
occurs multiple times as child submodules of upper ones,<br>
with different SRCREV values in different leaf submodules.<br>
<br>
I have not found a conclusive example to use SRCREV_FORMAT<br>
with git:// + gitsm://<br>
<br>
Can someone enlighten me how to use SRCREV_FORMAT properly<br>
for this case? Should I stick to the proven working nonstandard way<br>
and just run git submodule update --init --recursive?<br>
<br>
As an easy way out, is there a flag to git:// to process its<br>
submodules automatically?<br>
<br>
Thanks in advance,<br>
Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189388): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189388" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189388</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102038382/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102038382/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002b19530607fd74f1--

