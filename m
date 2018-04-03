Return-Path: <msundius@sundius.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 08040744C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 20:04:36 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id a14-v6so2645675otf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sundius-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=XLLK5YmmV3TOQXWfkWUoGb5WiKsHckVVqZgTY27KADk=;
	b=D9GAusIbCwDuay3z8Y8jAgdiUrpeIw42OuusspVf2Y4OHA2pk263fJWQz3q9OMsHDj
	2FC7loweiLjpYXZ/i+cYDjXApDZpmCMx4bPOFyqd/C9yXeNtC1QeOi+sFfgQxpK9xsy6
	JjXlq7rLSqT3Tdy0EgQJX+oQNsaMe7bGbyyydsu1Y7+o/JTjocUu3Megpx2DUYhAu+9e
	J+63/xtRfuX5vU+q8srBWqWxym9wgHovTe2uYPSW9cKbDjlyQLZAzU8OhGTdA0dues1f
	uOQkmrKX2DrV3W+Ipg5HxllFmkImMfZlGDOwp84At8sH4V/09eqT7hUzq6jx4ahnRxAq
	ytPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XLLK5YmmV3TOQXWfkWUoGb5WiKsHckVVqZgTY27KADk=;
	b=dD8t7xUJqw/BVYBtR/NBJLacFEBpEmCpvrC9YHLFb63DJ86nmJc20SK1SciKOgI/rF
	EyyPna1oM9uMh64QH1vMJLVoyyGtvMF1/JNZwqfZ0oaanXZMM4dxilLOFM9lngT+0xB4
	hOEvQhJ2iQcgKBgI71sCX/QeI525h6H+eJL3xjy4+iQfwP9UIl6u/KZzFtBw1Y46Lfpv
	iOmpbu5tlK7R/aef+1sZGuLBNO5DGtrPWKE5jm+5sZer3akkjki3lCzuFG25/zvDF+//
	/YRoRfuiKQqGl1T3qjnrimR11/NOSwLJiRCxTvkyPADAsjlmmfCdFkl1eqf7/4rUlzyg
	MzJQ==
X-Gm-Message-State: ALQs6tBgUP/Vrnoc5b6eU9SCIhJnroIfprlqQn5ubPfoltwsTjb5vRxM
	c/AutBnwl/TUVu3iBMXJPXh+5dZFh4IoDEEYnNLOh8qr
X-Google-Smtp-Source: AIpwx4+LGEdSxoMCOhRPK0qVYOFjnvS1DBVP+KQksYumA0iobhW33X1d3uy9gj2BwMxD4eY9cgrClBWsyRgVOoUnZOI=
X-Received: by 2002:a9d:38e5:: with SMTP id
	k34-v6mr8381937ote.99.1522785877021; 
	Tue, 03 Apr 2018 13:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.199.19 with HTTP; Tue, 3 Apr 2018 13:04:36 -0700 (PDT)
From: C Michael Sundius <msundius@sundius.com>
Date: Tue, 3 Apr 2018 16:04:36 -0400
Message-ID: <CAGVhguFaRNREK3U6ivU7Z6xc2tuTFPpZ6dtsBB6rYjD0wTp=_w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: netmap
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
X-List-Received-Date: Tue, 03 Apr 2018 20:04:37 -0000
Content-Type: multipart/alternative; boundary="00000000000045ce210568f73776"

--00000000000045ce210568f73776
Content-Type: text/plain; charset="UTF-8"

I do not see netmap in the most recent version of meta-openembedded
(i.e.  http://info.iet.unipi.it/~luigi/netmap )

though, while googling around I see references to a recipe that existed
some time ago.

did this get removed for some reason  ... it didn't work well or there are
better more reliable solutions for mapping network io data into userspace?

thanks
Mike Sundius

--00000000000045ce210568f73776
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>I do not see netmap in the most recent=
 version of meta-openembedded<br></div><div>(i.e.=C2=A0 <a href=3D"http://i=
nfo.iet.unipi.it/~luigi/netmap">http://info.iet.unipi.it/~luigi/netmap</a> =
)<br></div><div><br></div>though, while googling around I see references to=
 a recipe that existed some time ago.<br><br></div>did this get removed for=
 some reason=C2=A0 ... it didn&#39;t work well or there are better more rel=
iable solutions for mapping network io data into userspace?<br><br></div>th=
anks<br></div>Mike Sundius<br></div>

--00000000000045ce210568f73776--
