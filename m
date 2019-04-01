Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8277D13C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:26:22 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id n78so1013120itb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dNQGJuD1FlPO50ymQ14WYkXhVsOdPPVvgYdryE3AL6Y=;
	b=KJWtfGAcWwr4QkCyufqTe+j0e6o9dyWOeyJco3IBdD2yVCQoh4MCctZCIMgEzkT9rB
	Wj+CN7HTgAucl/nBqqT3MLFUih4INNK/VIZb/14kbhR+JZgcmI0ma6ToOF9/LqQgxedi
	F0hzpP8YSi9wigBF8Mk+902I2RejnVh8H3C8JqNls8j7peeKDOVZvD9h+fFbcquy9Txn
	8SditBx8IjY+5XQdLuk9widUG7QboSRMdRP8UcCqeQyFJLNHXjs5GLhjw3D6rR4StcfW
	jJrIi9ABIdq5QFDTQpdlxgeyWn5/tyfCST3rlNTgnVIpQp8/St+yNwN18iepBB63CO5Q
	lt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dNQGJuD1FlPO50ymQ14WYkXhVsOdPPVvgYdryE3AL6Y=;
	b=YWGEElGwoIWH1HOMSJwT57RgqIlQCGG00ab9Iemi+aVC4oKAcW7uEbM1yM8qSjZGJW
	PBzQXtemrvTrrF5MX8TyT70niNBkI3/4W1JvNDxECo7HIa8sM8jCoa4kjJ8i4sbPImDa
	Yd/1TgYqIWwZ1tGC8iXnlNXumtIu9xYLP4Wwm3b4t8R4haBszo7uI/bEmLqI5yfFZf3d
	HSLAiFyh+EX3fPbc0whZY5w6mEiQAJH2AQH4B05wP83Ui7b8x3yLiVpO/KcBAcb5hAOc
	Cm49fh0fEcIBbKvvFYY1rF2ymnpi6FXHZBmOopd1J5Hc/eataNjeIqLhf/7QTI/ewajw
	Vbrw==
X-Gm-Message-State: APjAAAWS8q5csmflqqOklLU5e3qdipkhqXR3EvlX/jAkP029YSZKYQ7U
	cM0heAar8FkBlL/uz78DvxZppHinUCJVM0xKnaI=
X-Google-Smtp-Source: APXvYqzvodIBLTpY7AAgZTcAiVDVAAQoihg1afuK1ko4H5OYWkXFsCeFrreHSB5KFRkytL/0gwnyjcGBk/1s0pIA8lw=
X-Received: by 2002:a02:212c:: with SMTP id e44mr1416600jaa.5.1554146783213;
	Mon, 01 Apr 2019 12:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
	<CANNYZj_=Xwi4P88jqwPbR3xOom-LQkutRY=Vs11UcCpU=WTNtg@mail.gmail.com>
In-Reply-To: <CANNYZj_=Xwi4P88jqwPbR3xOom-LQkutRY=Vs11UcCpU=WTNtg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Apr 2019 21:26:11 +0200
Message-ID: <CALbNGRSOVaZWcMAVWn5RenYU40Cujvp1E_Jup7nqGW4kbHk-JA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 19:26:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2019 at 6:36 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> On Mon, 1 Apr 2019 at 18:21, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> > > I honestly don't remember why the whitelisting was considered a good
> > > idea, but I think it would be better to drop it altogether? That way
> > > there will be no silent regressions (when upstream decides to rename
> > > the option, for example, which does happen).
> > >
> > Whitelisting would make sense for for projects where gir is mandatory
> > and cannot be disabled by configuration - are there any?
>
> For autotools, basically no, as they all use the same m4 macro file
> which allows disabling.
>
> For meson or other build systems the answer is also no, because in
> this case we would have to patch the upstream code to either make gir
> generation optional (and then 'inherit gobject-introspection'), or
> disable it altogether (and then don't inherit g-i at all). The reason
> is that introspection data generation is done through running a target
> binary, which requires a functional qemu usermode, and for some target
> MACHINEs qemu won't work (e.g. mips-n32, some flavours of powerpc etc
> - g-i class determines that and does the right thing to disable
> introspection automatically).
What about musl? Am not sure that my information is still valid:
Broken qemu or not?
> Here's an example of such patching:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtool=
s/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-=
or-gtkdo.patch?id=3Df06d14b2963e9d5145041057c3ad0e48654f1501
>
> (newer versions of libmodulemd made g-i optional, and so the current
> oe-core recipe and its patches reflects that).
>
I will prepare follow ups:

* remove whitelisting (see what we get)
* adapt recipes in oe-core

Seems all this is too late for warrier (that was my target - am again
too late - maybe next time :).

So I think I'll continue with gnome-de for warrier first (with oe-core
as is). Maybe I get patches landed before doors are shut for
meta-gnome...

Will come back then

Andreas

