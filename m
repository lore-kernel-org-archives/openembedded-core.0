Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0A01E605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:09:50 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so92195150qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 12:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cpq49kiTHqAoWdLqAHK9h36R1mpmQBb5/CfJu7GDLz4=;
	b=fRfFs6IevpB9027T9tSJbZjDU0SAAVXh4nukKjDaEQ0YGphgnyEHocwVdneyPtUiJa
	+R/4IzUnh7ZufFtJauIYaO2gpTzT4Mvk5Wjk4S1IthldzGM9eBK8ElrTl3uxr6UgfjdR
	ZqInWR0o5Y7yNJqHIoGvsYVIIo0MMUUhK1kwY7KPhJkvtIkBcQ4E0xmh/b0mzCz5MYbu
	LZnBNYedjtDF4ayYO+ljG+N5uXpcftvM7gXSuM+6vaqo8GnOqC05dbPiHZewqLiEVRuq
	ciXk3PUrQJ9dgDfnQcD7DeJ90+T1di14AeE2ePqUtfvGOD6u+efwjZRpYr52V9PoM/5L
	plVg==
X-Gm-Message-State: ALoCoQnNkb1D0PFYVB4x4lYvcetkvRD/lqw1ASzG88+jILLAwjYQB2KeWLeX8lx5aQqWi2BenpTU
X-Received: by 10.140.235.77 with SMTP id g74mr35423087qhc.64.1429124957494;
	Wed, 15 Apr 2015 12:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 12:08:57 -0700 (PDT)
In-Reply-To: <CALbNGRQXPWs8TEYpveP7ugcXGuCU0pJfg_1fLZ+aTQc-ZNd7Ng@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
	<552E2FBF.9030701@windriver.com>
	<CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
	<CALbNGRQXPWs8TEYpveP7ugcXGuCU0pJfg_1fLZ+aTQc-ZNd7Ng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 20:08:57 +0100
Message-ID: <CAJTo0LZ5mBADZOmotHiiKc2SKrB3q+odn2ayEzXF814aEoBUCw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 19:09:52 -0000
Content-Type: multipart/alternative; boundary=001a11354a006ea0760513c8150d

--001a11354a006ea0760513c8150d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 April 2015 at 18:27, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> Patch [1]: util-macros no more required in DEPENDS
>

What's the point of this?  util-macros adds functionality and doesn't
depend on X in any way, it's just some m4 macros.


> Patch [2]: allow build for x-less environments
>

I'm glad this demonstrates that simply disabling GLX works but FWIW I
wouldn't accept this into oe-core as it's not deterministic.


> I don't have time to prepare patches, but maybe somebody wants to take a
> look.
>
> Ahh before I forget: libepoxy should inherit pythonnative - all source
> file creation is done by pythonscripts.
>

Isn't pythonnative only required if the Python needs to use modules that
were previously built natively?  Bitbake is Python so if it's just "run
this bit of basic python code" then the host Python is sufficient.

Ross

--001a11354a006ea0760513c8150d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 18:27, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":6ci" class=3D"a3s" style=3D"overflow:hidden">Patch [1]: util-macros =
no more required in DEPENDS<br></div></blockquote><div><br></div><div>What&=
#39;s the point of this? =C2=A0util-macros adds functionality and doesn&#39=
;t depend on X in any way, it&#39;s just some m4 macros.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":6ci" class=3D"a3s" style=3D"=
overflow:hidden">
Patch [2]: allow build for x-less environments<br></div></blockquote><div><=
br></div><div>I&#39;m glad this demonstrates that simply disabling GLX work=
s but FWIW I wouldn&#39;t accept this into oe-core as it&#39;s not determin=
istic.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6ci" =
class=3D"a3s" style=3D"overflow:hidden">
<br>
I don&#39;t have time to prepare patches, but maybe somebody wants to take =
a look.<br>
<br>
Ahh before I forget: libepoxy should inherit pythonnative - all source<br>
file creation is done by pythonscripts.</div></blockquote></div><div class=
=3D"gmail_extra"><br></div>Isn&#39;t pythonnative only required if the Pyth=
on needs to use modules that were previously built natively?=C2=A0 Bitbake =
is Python so if it&#39;s just &quot;run this bit of basic python code&quot;=
 then the host Python is sufficient.<br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354a006ea0760513c8150d--
