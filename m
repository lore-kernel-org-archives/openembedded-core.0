Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.5994.1631186393144899390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 04:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pv31N7OX;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id m39so756060uad.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 04:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3kdZGB9J98rD3z+pHSn/cEm2q7UpNMMeRRH69R2mSUU=;
        b=pv31N7OXiptB1/emDRupB7brjT9Gf/KpK5yQ408B+wn5sGt9ENTgJ/BL2s/JW6Czau
         lnsTX9ewu6Z/fWhzsZUpdUvDSGnEzT8ONEIFAb8n3Bp1LADNyWq8If/GFU5Aa+4s14dU
         47Vfo1wY5mk4MriT7UmuKk8uFQ1J2NmcpYEAyHoiA6QtvtW+ntjwiZpygO0A1DI1tBcC
         +1JYEuSXE0cYvUckUK0apBEgDAeMyIsmAbDDb8Mafns8ral0Xs3qBcesVVRcT7AOnXsg
         7NEOaVmPZvmUMvnGPcaKWUqi1vZ+WDjSUYTCfq1QgT7+bRDkQzJ1wPtI41mRZdrzz0Pu
         AcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kdZGB9J98rD3z+pHSn/cEm2q7UpNMMeRRH69R2mSUU=;
        b=18x1WoQQPLBBJivLPqpJiw+Rz3X9QTO9sEibPFG60SRTkQf+tohcJrpo/9cj0Gm1Nm
         KL63bRs4E7uT8oPYDbQRNwW1Ug5db147kNpNKMp0c1gUa8cKVyqJK8jeVQLMR8L4MJHt
         iLHe3RizkxO7hqBvKEtnPELX8xBrCOnXGQfmvGDD9wF4+bO4GJ/7uKiDsfUqyhEOyN+7
         n+w2Ocd+Ed51D0TBZlipDmzKvycRQOHlrSMEQ2Dpwy2MB6raosG8V0nTzggZEZnkQchX
         1soN9qviR44/ELypoRoKxz7seilvhx2L8SwEkH9mnIl+YXxwWZtxUesn+UN1bbCGbpJj
         W62Q==
X-Gm-Message-State: AOAM532EnfYH/lbeAygJjrXVqSJiCnOBaohg6Sa6L2+yxyXs9+Zo2k6n
	4SuZN7FUNZ9hktnbWuOoQsEEfwbzjoyJcY/0crI=
X-Google-Smtp-Source: ABdhPJy7X2Emk8ODe/VoGayEiYIuq/KDFqQQFWDC24uy6jW7EB4zQvUG+T6T97y+6o87UAZMYq4kMpOMUVkIWT9csgo=
X-Received: by 2002:ab0:7a57:: with SMTP id a23mr1118382uat.100.1631186392279;
 Thu, 09 Sep 2021 04:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com> <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
In-Reply-To: <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 9 Sep 2021 13:19:41 +0200
Message-ID: <CANNYZj-XMkH31UvtUoNRUQ6AJb07oGVcafLaSqbWRQNAa7jGuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] assimp: Remove it
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000796eff05cb8e2d9b"

--000000000000796eff05cb8e2d9b
Content-Type: text/plain; charset="UTF-8"

Right, that test is orthogonal and independent of the recipe, so should be
kept until there's a replacement.

Alex

On Thu, 9 Sept 2021 at 12:26, Robert Yang <liezhi.yang@windriver.com> wrote:

> Hi Khem,
>
> On 9/9/21 1:06 PM, Khem Raj wrote:
> > also delete meta/lib/oeqa/sdk/cases/assimp.py
>
> It's a test case for testing cmake, it should be OK to keep it? Or we need
> add a
> new one to replace it.
>
> // Robert
>
> >
> > On Tue, Sep 7, 2021 at 1:46 AM Robert Yang <liezhi.yang@windriver.com>
> wrote:
> >>
> >> The following changes since commit
> 70de1dbb660461bdf0613494f53ec4c78738ae2a:
> >>
> >>    vim: Add packageconfig for sound notification support (2021-09-06
> 09:49:13 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>    git://git.openembedded.org/openembedded-core-contrib rbt/assimp
> >>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp
> >>
> >> Robert Yang (1):
> >>    assimp: Remove it
> >>
> >>   meta/conf/distro/include/maintainers.inc      |    1 -
> >>   ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
> >>   ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
> >>   .../use-GNUInstallDirs-where-possible.patch   |  257 ---
> >>   meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
> >>   5 files changed, 1980 deletions(-)
> >>   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> >>   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
> >>   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> >>   delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >>
>
> 
>
>

--000000000000796eff05cb8e2d9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, that test is orthogonal and independent of the=
 recipe, so should be kept until there&#39;s a replacement.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, 9 Sept 2021 at 12:26, Robert Yang &lt;<a hr=
ef=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Khem,<b=
r>
<br>
On 9/9/21 1:06 PM, Khem Raj wrote:<br>
&gt; also delete meta/lib/oeqa/sdk/cases/assimp.py<br>
<br>
It&#39;s a test case for testing cmake, it should be OK to keep it? Or we n=
eed add a<br>
new one to replace it.<br>
<br>
// Robert<br>
<br>
&gt; <br>
&gt; On Tue, Sep 7, 2021 at 1:46 AM Robert Yang &lt;<a href=3D"mailto:liezh=
i.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit 70de1dbb660461bdf0613494f53ec4c=
78738ae2a:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 vim: Add packageconfig for sound notification support=
 (2021-09-06 09:49:13 +0100)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 git://<a href=3D"http://git.openembedded.org/openembe=
dded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.or=
g/openembedded-core-contrib</a> rbt/assimp<br>
&gt;&gt;=C2=A0 =C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-=
core-contrib/log/?h=3Drbt/assimp" rel=3D"noreferrer" target=3D"_blank">http=
://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Drbt/assimp</a><=
br>
&gt;&gt;<br>
&gt;&gt; Robert Yang (1):<br>
&gt;&gt;=C2=A0 =C2=A0 assimp: Remove it<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 -<br>
&gt;&gt;=C2=A0 =C2=A0...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |=C2=A0 =
=C2=A032 -<br>
&gt;&gt;=C2=A0 =C2=A0...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -=
----------------<br>
&gt;&gt;=C2=A0 =C2=A0.../use-GNUInstallDirs-where-possible.patch=C2=A0 =C2=
=A0|=C2=A0 257 ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://assimp_=
5.0.1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a>=C2=A0 |=
=C2=A0 =C2=A026 -<br>
&gt;&gt;=C2=A0 =C2=A05 files changed, 1980 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp=
/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp=
/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp=
/use-GNUInstallDirs-where-possible.patch<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/<a hre=
f=3D"http://assimp_5.0.1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.=
0.1.bb</a><br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000796eff05cb8e2d9b--
