Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 752436BA1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 06:59:00 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so4438055pac.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 23:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=ymFN/ph1hKm8TVGfmAKGq+bHEJKiz186S6XtWA/On9w=;
	b=GCtahnioJo8lAGJUw+BJmR/xhCWGBo515rUtgFdl4k8ngDoshmy8M98I5y4Ebh4Nn0
	fVAs+Uz8w2PNL7KyHlkQogd3PQ37t5Zab42KT2KjF6VTD3tLYnJhsEGDbnP3IOda6oIY
	FwRIznmsKkKNr+334gWrVsLxUgV/Q105my4N5tn6vT7kS0eEoTj14pG4z42cI2B9ApXd
	qK8ksYF5pojfpZOqeCghK5OAeiQwWAd5a3eQvsSXjotQUv1+lYFW6LmBW3HGIQga+1pC
	MvsK3wiiR7RS7dSIsdRtnT0y+13NqknK0/N8gaARnDsqW/WWKW+1si/P4OXpkAqZ/fJ1
	P41A==
X-Gm-Message-State: ALoCoQm3g/izNQBj/nYlH4iYLwvds6qIIBic6EqtZTqnwPRC9oMr4/0kZlAM3JGLukpM9Bzdlmin
MIME-Version: 1.0
X-Received: by 10.68.191.231 with SMTP id hb7mr19259175pbc.82.1377586741224;
	Mon, 26 Aug 2013 23:59:01 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Mon, 26 Aug 2013 23:59:00 -0700 (PDT)
Date: Tue, 27 Aug 2013 07:59:00 +0100
X-Google-Sender-Auth: XjU46mkF7x7wDB770R0TLTOZCWk
Message-ID: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Putting fltk into oe-core (recipes-graphics)
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
X-List-Received-Date: Tue, 27 Aug 2013 06:59:01 -0000
Content-Type: multipart/alternative; boundary=e89a8ffba65b5bb81d04e4e86886

--e89a8ffba65b5bb81d04e4e86886
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

was this thoroughly discussed before? I think the 'fltk' graphics library
is quite lightweight. We still use that instead of qt and gtk on limited
embedded platforms simply because it takes 1.2 MB or a bit more rather than
a full blown Qt with 10-12+ MB.

If I understand correctly there were discussions that gtk should not be
inside openembedded core which I agree about. However, I think it would be
useful to have some lightweight library like this in. Of course, this is
lacking some features that Qt has, but that is why it is lightweight after
all. :-)

It is currently in the openembedded layer. It has a couple of minor
dependencies which should probably be moved, but I do not see anything
major. I think it is a more "core" option for ui building than the
alternatives. This also supports opengl to a certain extent.

Cheers,
Laszlo

--e89a8ffba65b5bb81d04e4e86886
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>was this thoroughly discussed b=
efore? I think the &#39;fltk&#39; graphics library is quite lightweight. We=
 still use that instead of qt and gtk on limited embedded platforms simply =
because it takes 1.2 MB or a bit more rather than a full blown Qt with 10-1=
2+ MB.</div>
<div><br></div><div>If I understand correctly there were discussions that g=
tk should not be inside openembedded core which I agree about. However, I t=
hink it would be useful to have some lightweight library like this in. Of c=
ourse, this is lacking some features that Qt has, but that is why it is lig=
htweight after all. :-)</div>
<div><br></div><div>It is currently in the openembedded layer. It has a cou=
ple of minor dependencies which should probably be moved, but I do not see =
anything major. I think it is a more &quot;core&quot; option for ui buildin=
g than the alternatives. This also supports opengl to a certain extent.</di=
v>
<div><br></div><div>Cheers,</div><div>Laszlo</div></div>

--e89a8ffba65b5bb81d04e4e86886--
