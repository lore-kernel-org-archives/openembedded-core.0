Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA4178849
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 22:31:14 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id w19so2302286ite.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 14:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S6e8I7H/vc0oGXvBwhiS0Hk4wmjCmTWHFoi++cXisLk=;
	b=TMhC4scwr+YzkmYuTwaZLL1Jy02Wej4TJN37Z8vu1iIjjOFf13PPlxnBu0coJ2LHCv
	AiRLErn3VXczDENou1HXDtap2gTyD8dUiP0Vsl7cfyEPVZ9esaht1Rt4OEhLkAGvAK9m
	fPE5Nt+8FwAeb60Ci8iVZZbkD+oNrkLoOg1sgREOjc01KEFy8UfmKsaQDv3rYdgujmw+
	Q/Nd6nmXTTUjdEAAd0BS0pj1g1bOi5woFyMkB8KxbcRVVMcFpAeyUN06ANf0X77rKEO9
	xR6KNViYHMDl45Vxm6YHfP0rjCAaKcxEzMDvJtgUAv0peTEXyaPVo+VE9tUI3oMHPqy6
	ibYA==
X-Gm-Message-State: APf1xPDLI42qJ9a9C1lRTH1/8evB+Ki3oMJsiTJfHkvKpdp9N2DHcUD+
	9dQleFV3aUwnl6laKkWJOB2g8a+e
X-Google-Smtp-Source: AG47ELtxY2GFWuf9cieqlP5UaCyvP0qCpVNvUUG6KgROpX6sld4HIkHkRZ34dOzUK95UzNFkitWlWQ==
X-Received: by 10.36.122.3 with SMTP id a3mr2840931itc.119.1519425075372;
	Fri, 23 Feb 2018 14:31:15 -0800 (PST)
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com.
	[209.85.214.44]) by smtp.gmail.com with ESMTPSA id
	p192sm1863829itc.29.2018.02.23.14.31.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 14:31:14 -0800 (PST)
Received: by mail-it0-f44.google.com with SMTP id w63so4676436ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 14:31:14 -0800 (PST)
X-Received: by 10.36.208.4 with SMTP id m4mr4615536itg.69.1519425074520; Fri,
	23 Feb 2018 14:31:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.31.76 with HTTP; Fri, 23 Feb 2018 14:31:13 -0800 (PST)
Received: by 10.107.31.76 with HTTP; Fri, 23 Feb 2018 14:31:13 -0800 (PST)
In-Reply-To: <CABcZANkRcuZnE-OHLoNR22FYEWAkG9S2Hp0JLg5kiYLW=yZN6A@mail.gmail.com>
References: <20180223145013.755-1-git@andred.net>
	<CABcZANkRcuZnE-OHLoNR22FYEWAkG9S2Hp0JLg5kiYLW=yZN6A@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Fri, 23 Feb 2018 22:31:13 +0000
X-Gmail-Original-Message-ID: <CAKUP++uyOmjabsVzca3mfg2gfWfO4JQvmaPo1NR8wFwANfdHfg@mail.gmail.com>
Message-ID: <CAKUP++uyOmjabsVzca3mfg2gfWfO4JQvmaPo1NR8wFwANfdHfg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: refactor compile and install for easier re-use
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 22:31:14 -0000
Content-Type: multipart/alternative; boundary="001a1149d018d469540565e8b706"

--001a1149d018d469540565e8b706
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 23 Feb 2018 20:32, "Christopher Larson" <kergoth@gmail.com> wrote:


On Fri, Feb 23, 2018 at 7:50 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> [...]
> Also, this now is very similar to oe_runmake().
>

If it=E2=80=99s similar to oe_runmake, why the long overly verbose function=
 name
for the new function? Is oe_runcmake not viable?


I was contemplating that, but in the end thought no as I'd personally find
it confusing. This is not running cmake, in that cmake alone generates the
build system files (make files, ninja build, msvc solutions, etc). It is
running cmake --build to execute the actual build (make, ninja, etc), hence
the name.

I'm open for other thoughts...

A.

--001a1149d018d469540565e8b706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
">On 23 Feb 2018 20:32, &quot;Christopher Larson&quot; &lt;<a href=3D"mailt=
o:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<blockquote class=3D"q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e"><div class=3D"quoted-text">On Fri, Feb 23, 2018 at 7:50 AM, Andr=C3=A9 D=
raszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"_b=
lank">git@andred.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">From: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:andre.draszik@jci.com" tar=
get=3D"_blank">andre.draszik@jci.com</a>&gt;<br>
<br>[...]<br>
Also, this now is very similar to oe_runmake().<br></blockquote><div><br></=
div></div><div>If it=E2=80=99s similar to oe_runmake, why the long overly v=
erbose function name for the new function? Is oe_runcmake not viable?</div>=
</div></div></div></blockquote></div></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I was contemplating that, but in the end thought no as =
I&#39;d personally find it confusing. This is not running cmake, in that cm=
ake alone generates the build system files (make files, ninja build, msvc s=
olutions, etc). It is running cmake --build to execute the actual build (ma=
ke, ninja, etc), hence the name.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I&#39;m open for other thoughts...</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">A.</div></div>

--001a1149d018d469540565e8b706--
