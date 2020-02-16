Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 107C061406
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 16:56:31 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x18so9233043vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5wT9rHeFQI0TE8WUdG11I4ZlB8tbgNkm6K4PWnac2eg=;
	b=sZLzu1aE6yx8O4Hlu73EWwIALz0JALq3J5E05FvqzKB/4RcJfWXPJGFy4DItAIbm/M
	MH2CCCyohbhwcnANjS8afqzzGnmBP3y0So6BZR4p2H+68d9fW0UNhjv9OUY+OpojLn2e
	LmgCdM6ojgpBN54baRTng8pRtAEl8wCvuJpkc6+U4tB9MFFWsbW7gqJDYNNl6SFg0XFT
	ZoKO31nQN1aPzzZjmINXispyMhjVAwxmhfLHwSIA0MPBkO4dKT2WL5mxfwnGfNEF/BO+
	criB+Jk8mTm7lKq+t6vaXC7/DfXOB+nefjLPAOl9vjfOoW8I4CfFGrmql8QkizFA85pj
	Kv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5wT9rHeFQI0TE8WUdG11I4ZlB8tbgNkm6K4PWnac2eg=;
	b=VJJ8myzW5vWEj7RD659ro9o7lo3aE1mO1w/r3olm99mYd/YsfRfpMSuzlxidc/0A6a
	/otbHkNIDiYOhvm9BRpbXvXRewAiKETditzMffmmHVi3GMKJF8vuv7IaQ0gCixigcDvt
	zyT0AeyA8KkZ6P++TWnYZklgM/bi7r09KTtDiIGgX7aUISFScSTYR3mOCU+z+0G9VXbZ
	HzMI2p1YywhW0ydYlRvAbMnRz34Qvil8XZ51Y7EyhaiWR343k8gQqDr8rWT/EjxrxzzK
	acDPGe/6Dz0suVjn7VTwaCEbi//t6MfamTB4memRqqzGkFgZl16OjHhydRgYd8SwauWf
	vePA==
X-Gm-Message-State: APjAAAUZXkfK3/52C4PXR4MrSZozTMQlU5fo3nWSwd2BUelvHqbUI5w2
	ltyEogXGz87ITJUrk42ZyvWMMRcRtPpgK+4S1Y8=
X-Google-Smtp-Source: APXvYqwz8uG7E+izS63MgyBUWiYE87N5Bu87VgYb5uunseZqduvIaaHfsUgJm83/hMDhhaahkpZRQBkCWpHfpePUoT0=
X-Received: by 2002:a67:7987:: with SMTP id u129mr6307727vsc.83.1581872192996; 
	Sun, 16 Feb 2020 08:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
	<CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
In-Reply-To: <CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 17:56:20 +0100
Message-ID: <CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Sun, 16 Feb 2020 16:56:32 -0000
Content-Type: multipart/alternative; boundary="00000000000024c830059eb4520e"

--00000000000024c830059eb4520e
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2020 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:

>
> -S = "${WORKDIR}/procps-ng-${PV}"
>> +# Upstream has a custom autogen.sh which invokes po/update-potfiles as
>> they
>> +# don't ship a po/POTFILES.in (which is silly).  Without that file
>> gettext
>> +# doesn't believe po/ is a gettext directory and won't generate
>> po/Makefile.
>
> Do we miss .in file from tarball ? Or is it missing in a git checkout
> This is expected when building in a maintainer mode
> Tarballs are produced by maintainers for users
> Who wants to build from source
>

The .in is available in tarballs, but not in git repo. It's generated as
explained above.

Alex

--00000000000024c830059eb4520e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 16 Feb 2020 at 17:54, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
-S =3D &quot;${WORKDIR}/procps-ng-${PV}&quot;<br>
+# Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y<br>
+# don&#39;t ship a po/POTFILES.in (which is silly).=C2=A0 Without that fil=
e gettext<br>
+# doesn&#39;t believe po/ is a gettext directory and won&#39;t generate po=
/Makefile.</blockquote><div dir=3D"auto">Do we miss .in file from tarball ?=
 Or is it missing in a git checkout=C2=A0</div><div dir=3D"auto">This is ex=
pected when building in a maintainer mode</div><div dir=3D"auto">Tarballs a=
re produced by maintainers for users</div><div dir=3D"auto">Who wants to bu=
ild from source </div></div></div></blockquote><div><br></div><div>The .in =
is available in tarballs, but not in git repo. It&#39;s generated as explai=
ned above.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000024c830059eb4520e--
