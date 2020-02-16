Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 037E86094D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:45:38 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id y184so4016566vkc.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xWroBllDzPBYTNOuiwSVNr1UR6SEP802KftbLEnTc1I=;
	b=tLbWMuwTZII9UKpJSgEW4mefecNB0gYoaZKQtbDoI9F8we++lrx+EW5rivFMAu5eZO
	2D9DwiBptN6LVuUN1wA//HCfONRBBctoAOjtM6nXd9lUljzFGN0sn5VIiYOq5293yIeQ
	ya7n5nppb2eSl0A7nV6gXUL11CXG0Rbxln38cwOjh+J++cR/+7DpsJ87cpiD5C6+hsnq
	SdOapbKw3Du9FDRFAH2eTt1nJOcW6hPEKdd+ENFLIQ3BwBQJbQKp7RKtPTQiGJ/KA16Q
	Hs7wtWlkuetuDnuVkQmI3LGY7JF0GYAoBMiqPYUNEtPNZ6a/Oxx3VI3EESUnLUoCr63t
	hnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xWroBllDzPBYTNOuiwSVNr1UR6SEP802KftbLEnTc1I=;
	b=FTsbP8Nfe6Xej0NF1r/nF+/zzhEyXFaONF0tWEBJ9i2RjhYXovbUIlncatSmSYqNJQ
	UMjNocCbFzKArmVQftNPRp5FkpkhgIgMBsJ9rCHj++opvEsEhBs+K9wmv1CPumKJa1dx
	O3/BUxQThTwhDrHDgFSGDguFVRL7nfYeFeeOuKVPQxa8DSvIiMsNv9NIm2bCA9AzJ/Ye
	7Gxs73KmeNKhhRR9OSxup1rrbBTv3tKOBiKeh5zL7Xl0dnOjN2/1JdBFguuyAEqR1XXr
	PWHLCMqhCY7iCLeN7Hj6c7HBRD1daK9kb/n7XY7WyxbyK/wsgEsqj1t2HZr46xJhdJt8
	bRXw==
X-Gm-Message-State: APjAAAVI3MNr3QzQBA3UYCmqcHO/S5haP8wo+C76PxKR2ppuydHI7jWT
	vyWE1BhkTJgm+zAmYDV/1/BGNKnMVL0F8mHIg14=
X-Google-Smtp-Source: APXvYqxKp5DvC45B9ZIQIfSLgc4naONGarw8xLNjwR8auuPmhoJN9hLWMWi6HiF3PIWRrfhhPEioSl9+5+HEiYvX0Jo=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr4202390vkc.29.1581885939672; 
	Sun, 16 Feb 2020 12:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
	<CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
	<CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
	<CAMKF1sqrxL4H-gYab-VopR-ZUhiPqo3f3XXQhedaKrZ7eGXtZQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqrxL4H-gYab-VopR-ZUhiPqo3f3XXQhedaKrZ7eGXtZQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 21:45:28 +0100
Message-ID: <CANNYZj_2H6YJ4hO69Rwqqs6NjJynX-yigJhTdhj7tTFgbBroUw@mail.gmail.com>
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
X-List-Received-Date: Sun, 16 Feb 2020 20:45:39 -0000
Content-Type: multipart/alternative; boundary="000000000000826acd059eb785c3"

--000000000000826acd059eb785c3
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2020 at 21:07, Khem Raj <raj.khem@gmail.com> wrote:

> >>> -S = "${WORKDIR}/procps-ng-${PV}"
> >>> +# Upstream has a custom autogen.sh which invokes po/update-potfiles
> as they
> >>> +# don't ship a po/POTFILES.in (which is silly).  Without that file
> gettext
> >>> +# doesn't believe po/ is a gettext directory and won't generate
> po/Makefile.
> >>
> >> Do we miss .in file from tarball ? Or is it missing in a git checkout
> >> This is expected when building in a maintainer mode
> >> Tarballs are produced by maintainers for users
> >> Who wants to build from source
> >
> >
> > The .in is available in tarballs, but not in git repo. It's generated as
> explained above.
>
> right. Then revise the comment, since its expected to be absent when
> we are building from
> git sources.
>

The fix and the comment were copied wholesale and were originally written
by Ross. How is POTFILES.in normally generated (i.e. without involving
custom autogen.sh)?

Alex

--000000000000826acd059eb785c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 16 Feb 2020 at 21:07, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt;&gt;&gt; -S =3D &quot;${WORKDIR}/procps-ng-${PV}&quot;<br>
&gt;&gt;&gt; +# Upstream has a custom autogen.sh which invokes po/update-po=
tfiles as they<br>
&gt;&gt;&gt; +# don&#39;t ship a po/POTFILES.in (which is silly).=C2=A0 Wit=
hout that file gettext<br>
&gt;&gt;&gt; +# doesn&#39;t believe po/ is a gettext directory and won&#39;=
t generate po/Makefile.<br>
&gt;&gt;<br>
&gt;&gt; Do we miss .in file from tarball ? Or is it missing in a git check=
out<br>
&gt;&gt; This is expected when building in a maintainer mode<br>
&gt;&gt; Tarballs are produced by maintainers for users<br>
&gt;&gt; Who wants to build from source<br>
&gt;<br>
&gt;<br>
&gt; The .in is available in tarballs, but not in git repo. It&#39;s genera=
ted as explained above.<br>
<br>
right. Then revise the comment, since its expected to be absent when<br>
we are building from<br>
git sources.<br></blockquote><div><br></div><div>The fix and the comment we=
re copied wholesale and were originally written by Ross. How is POTFILES.in=
 normally generated (i.e. without involving custom autogen.sh)? <br></div><=
div><br></div><div>Alex<br></div></div></div>

--000000000000826acd059eb785c3--
