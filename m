Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.32488.1631000684379934443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HOTThFgi;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id j19so7519794vsi.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CpvTcHaCYZICM09CKKHDE8LSbyH/Pj6AShGl5/EOy6I=;
        b=HOTThFgiaX4hS2I5+btd8h4fletln9Xo9ZTOJBxPHaNypZTvlImtPES9lWaIpdOWZf
         Vqv8TakyQam8MCTFONHXAJ5d95qRUMGNlE2FWP6o/vgttZ7NJPIC/asykLaPpDcR9gMQ
         2ko5xBXbnJvSG4Fc1m6Kx26FTo9xR7QlXybhsFBnYH8LGiEKrrVa1fQN3ceMYXupiBNW
         afcCqk71secgB70gs+F7B+pp6kq9vOm0eJcMSIycH+X7O/yestp97AqpW1R/kWyPTIya
         1RikUKyvMT7oYwL1TQNk/j6101/ec1c0yynPXq1HUy3pW2j34RyhER/HNBGp7VGxMEnd
         f4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CpvTcHaCYZICM09CKKHDE8LSbyH/Pj6AShGl5/EOy6I=;
        b=mdWVAe9Q521J976f6vUJjPlshbd9gUMIr6eJgZ5RuWaOfs/ByetgoTppqAsy1a2sdp
         fzieyLWUw6y+ssI/GBLQ3zQKLRhfZiZW6PWjCqPstf7yxzyDXfNL9Ul3OneU9tu/VYKh
         OuVv4do0zDLMQO1qD2nHGsCOsOPqT6d0gxpsj0+kjaJt9Jo1mNXM8sU2zW1Qz8KRWt1n
         +NuRiFnr0084SKZgNMuviC4dvxi3+yVbYhTMw6QvBJcBUMm1nSFJvH5sxnoyf52bPCZI
         0mYFhsCrzGNeHhQDs2By5Z8NqVZWDnezXZUgPJpJphifOKaNP8zz7YJojIVMx8WCjdpg
         PORw==
X-Gm-Message-State: AOAM533WhkU3JgQAi0Osx7yKuCzIi2thGruZlML6Bd89geZTRzEss6w1
	Kgt0zV4LDZHaNC0et0yRIF/VIMXr2tbNZhjDjSc=
X-Google-Smtp-Source: ABdhPJz00l1M3J0RR0QTypishuXr5l5+aCk5Iub8QkleOuZcU5IQa+Yz+uFW9tGE/XJAepOCUfCZqBnKX9Dh0ALVtkI=
X-Received: by 2002:a05:6102:134e:: with SMTP id j14mr7971720vsl.18.1631000683535;
 Tue, 07 Sep 2021 00:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <21fb5d8a-6733-90f4-95dc-b50c1b9df2cb@windriver.com>
In-Reply-To: <21fb5d8a-6733-90f4-95dc-b50c1b9df2cb@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 7 Sep 2021 09:44:32 +0200
Message-ID: <CANNYZj8fQDzsdx4sU8MbhrFTm=nRw6vx8+pcB6fC73eK=60CxA@mail.gmail.com>
Subject: Re: [OE-core] License issues for assimp_5.0.1.bb
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: multipart/alternative; boundary="0000000000005ee10f05cb62f031"

--0000000000005ee10f05cb62f031
Content-Type: text/plain; charset="UTF-8"

I'm not sure what, if anything, uses assimp anymore - it used to be a
dependency of (old) vulkan-demos, but not anymore. And nothing in meta-oe.
Qt5/6 has it as an optional dependency in qt3d, off by default.

I'd say, remove.

Alex

On Tue, 7 Sept 2021 at 09:35, Robert Yang <liezhi.yang@windriver.com> wrote:

> Hello,
>
> It seems that meta/recipes-graphics/vulkan/assimp_5.0.1.bb has license
> issues,
> its license is BSD-3-Clause in the LICENSE file, but a few files can't
> be redistributed with out written permissions:
>
> * scripts/StepImporter/schema_ifc2x3.exp
>
> Copyright by: International Alliance for Interoperability, 1996-2005 All
> rights
> reserved. No part of this documentation may be reproduced, stored in a
> retrieval
> system, or transmitted in any form or by any means, without the prior
> written
> permission of the owner
>
>
> * test/models-nonbsd/X/dwarf-Read-Me.txt
>
> RESTRICTIONS: This model pack is available for use in freeware, shareware,
> commercial games/software with the following restrictions:- **You may not
> sell/re-sell this model pack or claim it as your own. ***You may not
> redistribute this pack in some other model pack through a website or on a
> compilation CD of any kind, without my written consent. Psi
> http://www.psionic3d.co.uk
>
> * test/models-nonbsd/B3D/turtle.source.txt
>
> Copyright 2004, Psionic Design e-mail: psionic@blueyonder.co.uk Used with
> permission. RESTRICTIONS: This model pack is available for use in
> freeware,
> shareware, commercial games/software with the following restrictions:-
> **You may
> not sell/re-sell this model pack or claim it as your own. ***You may not
> redistribute this pack in some other model pack through a website or on a
> compilation CD of any kind, without my written consent.
>
>
> It seems that we even can't add these files to a mirror like:
>
>
> http://downloads.yoctoproject.org/mirror/sources/git2/github.com.assimp.assimp.git/
>
>
> Maybe we should add LICENSE_FLAGS or remove the recipe?
>
> --
> Thanks
>
> Robert
>
> 
>
>

--0000000000005ee10f05cb62f031
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not sure what, if anything, uses assimp anymo=
re - it used to be a dependency of (old) vulkan-demos, but not anymore. And=
 nothing in meta-oe. Qt5/6 has it as an optional dependency in qt3d, off by=
 default.<br></div><div><br></div><div>I&#39;d say, remove.<br></div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 7 Sept 2021 at 09:35, Robert Yang &lt=
;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
It seems that meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a> has license iss=
ues,<br>
its license is BSD-3-Clause in the LICENSE file, but a few files can&#39;t<=
br>
be redistributed with out written permissions:<br>
<br>
* scripts/StepImporter/schema_ifc2x3.exp<br>
<br>
Copyright by: International Alliance for Interoperability, 1996-2005 All ri=
ghts <br>
reserved. No part of this documentation may be reproduced, stored in a retr=
ieval <br>
system, or transmitted in any form or by any means, without the prior writt=
en <br>
permission of the owner<br>
<br>
<br>
* test/models-nonbsd/X/dwarf-Read-Me.txt<br>
<br>
RESTRICTIONS: This model pack is available for use in freeware, shareware, =
<br>
commercial games/software with the following restrictions:- **You may not <=
br>
sell/re-sell this model pack or claim it as your own. ***You may not <br>
redistribute this pack in some other model pack through a website or on a <=
br>
compilation CD of any kind, without my written consent. Psi <br>
<a href=3D"http://www.psionic3d.co.uk" rel=3D"noreferrer" target=3D"_blank"=
>http://www.psionic3d.co.uk</a><br>
<br>
* test/models-nonbsd/B3D/turtle.source.txt<br>
<br>
Copyright 2004, Psionic Design e-mail: <a href=3D"mailto:psionic@blueyonder=
.co.uk" target=3D"_blank">psionic@blueyonder.co.uk</a> Used with <br>
permission. RESTRICTIONS: This model pack is available for use in freeware,=
 <br>
shareware, commercial games/software with the following restrictions:- **Yo=
u may <br>
not sell/re-sell this model pack or claim it as your own. ***You may not <b=
r>
redistribute this pack in some other model pack through a website or on a <=
br>
compilation CD of any kind, without my written consent.<br>
<br>
<br>
It seems that we even can&#39;t add these files to a mirror like:<br>
<br>
<a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2/github.com=
.assimp.assimp.git/" rel=3D"noreferrer" target=3D"_blank">http://downloads.=
yoctoproject.org/mirror/sources/git2/github.com.assimp.assimp.git/</a><br>
<br>
<br>
Maybe we should add LICENSE_FLAGS or remove the recipe?<br>
<br>
-- <br>
Thanks<br>
<br>
Robert<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005ee10f05cb62f031--
