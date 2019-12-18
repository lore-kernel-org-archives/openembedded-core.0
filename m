Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A94A7BFB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 16:24:31 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id p21so1761137vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=299smluu0PbXv0/moc2lxA6m6UqwQzMuEBA6Fk4A1/0=;
	b=sW4ZtN+x4kz1tjYTzLomxGyY9FROt5ExUR7UH5TYCeh3Z7MZ+xaPHMebbSjVbzaeik
	zIEKkcjCySaJLNmA66uCbi+kb7Gn3s/YGbhtWK0pL6KKFEzAV2cIBVLAn688THW+NYRZ
	FUEt30/mlijRZv4DMMzA62g09g/frT2zc4QRYIVZrEkXt6s7upsY1vuuAqOrnVjm9EHm
	mFAlKCXfQzuxL1mnj+hqiPDBRCG/Nx7n+5Y58GmHjWJnMpOg5/6J2A89MfsL9rlTlFJm
	w8PFlYVwqLoIj0iqoSzh+4+9vuV8qEtg2ItUrli/BPv5Wi7ITWHm2NmYNJ6XJQleE1Za
	ujcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=299smluu0PbXv0/moc2lxA6m6UqwQzMuEBA6Fk4A1/0=;
	b=VRv2/Q4puVnr5fcmb4fMGcr0R3RBzTGsa8o0h10S8TM29tVErvbkbpor0NEXQhYK3v
	3hrRsarmoIkwID2lYMQ8mf5v9q/gH2vVtzDj6mpREfeznpqF3d6Zf1qnnLZYKkuaOSSi
	KG1sywuudUl/2VZp6d8MIpXwK1CXoIDfyrB2C7uNB4PNwQV8LDzw2HgZpzMamEgQTZVl
	z9TX4e9P9L93iwhLJp8UJ75sKI+LAAgzLPLJfC0EeBrb2IeuxR06RYtOPU4IFlcB77b4
	BfJKfBU5G3MD8dNrz0JeMIPw7F4v106B6xg0KRQKnXfHdCwTolE8z3iQ2LdP2Ax+16oY
	nGqg==
X-Gm-Message-State: APjAAAUPrZfe1VpLXmS4m/c5qdLe+r3khZ2MAVVVjfY1MJBwmqpUuJp5
	PI5lICchv+koQEOxFze9b79cAGE6WM9m9NwDA54=
X-Google-Smtp-Source: APXvYqxwh28C2jpuDt0ozccY50/s7gwrk+R/LCFOANMs04rYAbWnSo9Rttb3tHmnLPVsqh6Wu8RKw8uSn0GlJd4xJ/s=
X-Received: by 2002:a05:6102:d1:: with SMTP id
	u17mr2030590vsp.23.1576686272530; 
	Wed, 18 Dec 2019 08:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-13-alex.kanavin@gmail.com>
	<20191218091834.41b49324@seebsdell>
	<CANNYZj9yLNUhmU0tWcyeWJ7tRXQKGd31X-_GKNKshYzYaE3Auw@mail.gmail.com>
	<20191218102154.5bbf52e0@seebsdell>
In-Reply-To: <20191218102154.5bbf52e0@seebsdell>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 17:24:21 +0100
Message-ID: <CANNYZj97BZUwF=G7WCaGwbh4zrJAYvS=ayWQSRZxHOemQ86BDA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/25] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 18 Dec 2019 16:24:31 -0000
Content-Type: multipart/alternative; boundary="000000000000324cd70599fce154"

--000000000000324cd70599fce154
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Dec 2019 at 17:22, Seebs <seebs@seebs.net> wrote:

> > It won't, as attr upstream moved the definition of ENOATTR from one
> > header file to another.
> >
> > attr is supplied by oe-core though, so we have control over which
> > version is used.
>
> So basically, if I want to maintain support in pseudo for older xattr,
> I need to figure out a way to try both. Thanks, attr devs. :P (Pseudo
> is still sometimes used outside of oe-core.)
>

You can also supply your own definition of ENOATTR, as it doesn't change.

Alex

--000000000000324cd70599fce154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 18 Dec 2019 at 17:22, Seebs &lt;<=
a href=3D"mailto:seebs@seebs.net">seebs@seebs.net</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>&gt; It won&#39;t, as attr upstream moved the definition of ENOATTR from o=
ne<br>
&gt; header file to another.<br>
&gt; <br>
&gt; attr is supplied by oe-core though, so we have control over which<br>
&gt; version is used.<br>
<br>
So basically, if I want to maintain support in pseudo for older xattr,<br>
I need to figure out a way to try both. Thanks, attr devs. :P (Pseudo<br>
is still sometimes used outside of oe-core.)<br></blockquote><div><br></div=
><div>You can also supply your own definition of ENOATTR, as it doesn&#39;t=
 change.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000324cd70599fce154--
