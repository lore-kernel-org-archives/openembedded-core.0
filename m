Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id B30AA7F980
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:22:56 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id v78so5329672vke.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/ANBrQgvjUicpA0hNyrqEyvB0i7Ng+x04c1ieoJzQKs=;
	b=iJ1xZIUefbk0rFT/80pWejB34aq35LVSZq7DMU0KU9TG+YyZKWOJhLvIhjO67fWu+5
	T6VBvA2Bh3Tzl2Tg+8VtUevk5ZjlCgie7+SM3BMkUyjd4Cxn23DOXpsLw1TdNqCyNCJk
	NxYHnDwlCpuSjR6Si/XGxTlF0GDjf4t9PTlaSsvzLqYHP8TePnJay7R1R+/0o7rjVziv
	A/ht18ZLKR9e8x5pJMv/EbbykH5tyjho/dwDa989BF0FOz3mmwSd9ehMj55o22mfq8UE
	IQ/aBP+0sVO/+zEzHWlSeD8jd5UJzmO+wX2ksAzi89DFQKvKyFDxQvrk/pHe4CVG2oRI
	OyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/ANBrQgvjUicpA0hNyrqEyvB0i7Ng+x04c1ieoJzQKs=;
	b=e8GzmITuNpbbUsenA0UfgSU1y7H7vj68LcJOvqQLiQULGET7MhsMiPJ2Y6h8NL6RBk
	mOwZ7NnCqK8uYnuoB68VQI12xIZ7rUgG2oiQxNy9WpBhzyWIaByGMvxaZTkd/fy+D6Dq
	3YaRViuTCLmkP0NZB4IhKWjL7pIFTkhPfr8vQOMCqZ/AyABgwL00a2haVSGVKKpQUrV3
	xVTNCFMkgoSDd/ylYBFuHLOgMmSTJDqzL+2EffMLIKZCWsd1P0Yl7bMCKBddlaMYK7nH
	cT0SZiBlaQWpuKm8D6i8opUsxlv+AQzvXOEpnxk24LwH4zRFTNGWVm4OaEauM/Slr8tL
	eLVw==
X-Gm-Message-State: APjAAAUxP/kqHLH6ePLPhmi/sK4myYT3zU/bAORba/KSoV6wxJgOWjuT
	zNI7Xi6EG2ce+TzoNz9p+TUzAOPttyWCUbhZYqQ=
X-Google-Smtp-Source: APXvYqw3Iox0u0VlEDZloKeNwTmD+nNIqHx8yx3MhzVPf8OT4bXJimz5qsuKLWTgddZqTRsJVYpzbWUjdLlriVioSdc=
X-Received: by 2002:a1f:cac2:: with SMTP id a185mr8548829vkg.49.1571926977466; 
	Thu, 24 Oct 2019 07:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
	<CANNYZj9L7O9a9RfyXpQP7kY2X_HNt5P9yJQCmUONeZq1rWDKwQ@mail.gmail.com>
	<541b19fa-54c4-42ce-0367-27ddd403d34f@herbrechtsmeier.net>
In-Reply-To: <541b19fa-54c4-42ce-0367-27ddd403d34f@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2019 16:22:43 +0200
Message-ID: <CANNYZj80r-WGgREdj=2TYC-uPNpTnWEL3mfZLtG53z-XR71bOQ@mail.gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 14:22:56 -0000
Content-Type: multipart/alternative; boundary="0000000000001ad6b40595a8c5b7"

--0000000000001ad6b40595a8c5b7
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2019 at 15:52, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

>
> > Yes:
> >
> http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/001270.html
>
> Do you have an up-to-date example? The mean.io project is dead.
>

http://meanjs.org/ I guess. The package-lock.json in their tarball is 600K.

Alex

--0000000000001ad6b40595a8c5b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 24 Oct 2019 at 15:52, Stefan Herb=
rechtsmeier &lt;<a href=3D"mailto:stefan@herbrechtsmeier.net">stefan@herbre=
chtsmeier.net</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
&gt; Yes:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-archit=
ecture/2017-March/001270.html" rel=3D"noreferrer" target=3D"_blank">http://=
lists.openembedded.org/pipermail/openembedded-architecture/2017-March/00127=
0.html</a><br>
<br>
Do you have an up-to-date example? The <a href=3D"http://mean.io" rel=3D"no=
referrer" target=3D"_blank">mean.io</a> project is dead.<br></blockquote><d=
iv><br></div><div><a href=3D"http://meanjs.org/">http://meanjs.org/</a> I g=
uess. The package-lock.json in their tarball is 600K.</div><div><br></div><=
div>Alex<br></div></div></div>

--0000000000001ad6b40595a8c5b7--
