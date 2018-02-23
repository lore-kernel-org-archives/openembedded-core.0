Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2BD760620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 20:32:36 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id k187so6240903vke.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hL3D9fy2zoMJOf99hGlkRDcvzzf4P7V3LgMOKs+aUnY=;
	b=WQc6vOawiAurmG8ob46kNu5yiZpsXrVyYlcti1d7x7HhHfYZQr4VKz5YQtb6zs089D
	vehEGSEDKvZNrYfLnM5qEZxILxb2RxIvTnT4xVD/Qmcz2HD4r22OgvZdIppRD6dUwOCC
	GQDsStr7YU0hevWsHm70ZnLGgUyOEOQNw1t2ua6bvrYNwK8Bm/RC88b+pIBGsc4yjuaj
	gls9j18C/jMr2VFp/FnLkoGe8O+RBRnk2zrMOsGceeut2ssedb71TXR+2IER1pCKhvXp
	GzS/x9LLN1zJWNWhtk3O2fZjgOGlLLvTWWvZFsRUMWCy6SLJLT7wrEYR3PWC0W3EpcAR
	Gm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hL3D9fy2zoMJOf99hGlkRDcvzzf4P7V3LgMOKs+aUnY=;
	b=NWbKnhBVyllYi8IcWhEfXD64YdM3FEV+dYd4uaB/Q4xGO4NNiCSqJojJM06+cZIjRO
	YdCCUc+Gu8vPHlN3riBRg73sQC1QGRg5jSNR05zeSd9TsY4Uxr6KI3oHUJI6zgG6vfye
	9eMGcKz8gGHiAQmbqKoLHAsr3vAoN27o3aQIEET5D/gsCHCwNQkMSzT09e9Zw1pZ8oJo
	uZbztBIx7vwFj3r0y+2QLKYBCUhZyWnxHKNLE/OaTzWHxCrNG1zAfu38BywT0YLEjENR
	RL66xOos+TuiJNwG2MoSYEollHGSed7iONyHKMVkoNpzyB7wv8+H8/uRxoLN2llHJkun
	StGA==
X-Gm-Message-State: APf1xPDWJ5+sikA8qDHhZy97/DYaW9Zun8KspJdPBhfwY9qAIbt0cNZr
	PVp4HBlhiQ/HpMIyyVsTOK2s7bFnh0HqzqgBtbD9Ug==
X-Google-Smtp-Source: AG47ELtoPySj+Xx7ExeD5fLny1XulRveC5r3m4EKJHbqCk1RUY09AE2b/Q4RttfJgFm54vY7sCzD901lUBoA6UwYSfw=
X-Received: by 10.31.226.134 with SMTP id z128mr2204637vkg.72.1519417957373;
	Fri, 23 Feb 2018 12:32:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.61.25 with HTTP; Fri, 23 Feb 2018 12:32:17 -0800 (PST)
In-Reply-To: <20180223145013.755-1-git@andred.net>
References: <20180223145013.755-1-git@andred.net>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 23 Feb 2018 13:32:17 -0700
Message-ID: <CABcZANkRcuZnE-OHLoNR22FYEWAkG9S2Hp0JLg5kiYLW=yZN6A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
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
X-List-Received-Date: Fri, 23 Feb 2018 20:32:36 -0000
Content-Type: multipart/alternative; boundary="001a114daa6a9d5bda0565e70feb"

--001a114daa6a9d5bda0565e70feb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 7:50 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> cmake_do_compile() and cmake_do_install() basically do the
> same, except they use a different --target, and at the
> moment this is copy/pasted code with a minor modification.
>
> Other recipes which e.g. might want to support compilation
> as part of ptest have to do the same. This is a bit
> inconvenient.
>
> By factoring out all of this into a common helper,
> cmake_runcmake_build(), this is easily re-used. An
> (imaginary) recipe can compile ptest support simply by
> using
>   cmake_runcmake_build --target buildtest-TESTS
> (assuming such a build target exists).
>
> Also, this now is very similar to oe_runmake().
>

If it=E2=80=99s similar to oe_runmake, why the long overly verbose function=
 name
for the new function? Is oe_runcmake not viable?
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114daa6a9d5bda0565e70feb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Feb 23, 2018 at 7:50 AM, Andr=C3=A9 Draszik <span dir=3D"ltr">&=
lt;<a href=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Andr=C3=A9 Draszik=
 &lt;<a href=3D"mailto:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;=
<br>
<br>
cmake_do_compile() and cmake_do_install() basically do the<br>
same, except they use a different --target, and at the<br>
moment this is copy/pasted code with a minor modification.<br>
<br>
Other recipes which e.g. might want to support compilation<br>
as part of ptest have to do the same. This is a bit<br>
inconvenient.<br>
<br>
By factoring out all of this into a common helper,<br>
cmake_runcmake_build(), this is easily re-used. An<br>
(imaginary) recipe can compile ptest support simply by<br>
using<br>
=C2=A0 cmake_runcmake_build --target buildtest-TESTS<br>
(assuming such a build target exists).<br>
<br>
Also, this now is very similar to oe_runmake().<br></blockquote><div><br></=
div><div>If it=E2=80=99s similar to oe_runmake, why the long overly verbose=
 function name for the new function? Is oe_runcmake not viable?</div></div>=
-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail=
 dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software =
Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a114daa6a9d5bda0565e70feb--
