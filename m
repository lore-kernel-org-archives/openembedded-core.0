Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id D18AC6187E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 12:13:30 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id y3so573888uae.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 04:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=thU/rvZSG+L2w7pNfWyKvxp2JCz0XwkAwF53gWCZ82g=;
	b=U0S/CYnLI8/T/zYTFtbQne0/D6z25enabvhQ31MFzzXwKrFM1XTIVpOQmOrCUhGcHE
	gQvSWRCWndPe2Wg7yc2Kaprhs3PehuOP8XF+SIkXhcTttwwTIGxmm+3DrUonK3Y197K5
	2zGYG2eT83YgvH1xm073Go770aBXfsIV7ISPiMElrFvy5VDDCU/lSxERoNBdb+7WLh7O
	4AZFCIsAp+7muwXWMSJTn43fAK/mDGIz8xBOwjbuqHdUh3LOAfVm4DI0kCaqhHANX8FU
	4UbEWFwG4bDxw8wz7IvY5xhJ4Kgwj5YoDikL2tCbWjLcVRlC44cZjNFbUBH6PHk8oUok
	vUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=thU/rvZSG+L2w7pNfWyKvxp2JCz0XwkAwF53gWCZ82g=;
	b=feZUi1CUlWYCvbjoY5fjm8uTW4u9O5p1OY1Gw0X2ZaF9nCIdKlms7EfsJvmbJlJEfM
	HiX2rP5I7AsmXD2vD4VFJrYj3oG69rPvYR9cZQpazys2gbO7yq4NsN1SciRkqmtzX7sQ
	jXbdUsJbOvL/smauRSlJsJcFpsUZa7uVXwrOpzjGCiY3ymyHpV8AgjxD2vRFG6JJWRYu
	vKIL5IWTVi/1vFlBrP9TPIfjxEFfxDw+qTfAztRN/DKIayS2pyTJhCHAsyDc5mO05vtp
	9PBmgXuHvYjkxDWVAYlVreCG6PxpTUNK5iqx7KEsRKBoljUb4wDClWDxRRJ3JyEBJhZm
	oNuA==
X-Gm-Message-State: ANhLgQ1lNftA0o9nCHh7tkrGzJXzPRh29ZXIqHNkFwk0GddkZ0xBzWPf
	cGQqw2DuNC8zucUuRAb0jk0m9nHqHQxBU2ivboWrmKDy
X-Google-Smtp-Source: ADFU+vupk5BmQQ1M6Mfs1El55wV1YRAro6OUxTF5FbK0hroY7ilNeTNQJ2qN2ut/oQGqGGpqKj8cmx4muOWn0y9kEQk=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr1264407uae.89.1583324011607; 
	Wed, 04 Mar 2020 04:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
In-Reply-To: <20200304113217.GB7923@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2020 13:13:19 +0100
Message-ID: <CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Wed, 04 Mar 2020 12:13:31 -0000
Content-Type: multipart/alternative; boundary="00000000000046bafa05a00659fe"

--00000000000046bafa05a00659fe
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2020 at 12:32, Adrian Bunk <bunk@stusta.de> wrote:

> I am sure there will be an update to the announcement if this doesn't
> reflect current reality.
>

Who is expected to do the actual work of tracking CVEs, making action
points and performing the actions? The current reality is this: the
security update work is done ad hoc by community, even for stable branches.
There is no rigorous security process like in Debian, and no roles to
follow in that process. This means that if no one bothers to make a patch,
the security issue will remain unfixed, and this does happen often. If you
are expecting anything else (e.g. that listed recipe maintainers should do
something), you're setting yourself up to be disappointed.

Alex

--00000000000046bafa05a00659fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Mar 2020 at 12:32, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
I am sure there will be an update to the announcement if this doesn&#39;t<b=
r>
reflect current reality.<br></blockquote></div><div><br></div><div>Who is e=
xpected to do the actual work of tracking CVEs, making action points and pe=
rforming the actions? The current reality is this: t<span class=3D"gmail-im=
">he security update work is done ad hoc by community, even for stable bran=
ches. There is no rigorous security process like in Debian, and no roles to=
 follow in that process. This means that if no one bothers to make a patch,=
 the security issue will remain unfixed, and this does happen often. If you=
 are expecting anything else (e.g. that listed recipe maintainers should do=
 something), you&#39;re setting yourself up to be disappointed.</span></div=
><div><span class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-i=
m">Alex<br></span></div></div>

--00000000000046bafa05a00659fe--
