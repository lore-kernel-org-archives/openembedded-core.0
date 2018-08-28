Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04FF860123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 06:43:09 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id p84-v6so936224oic.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=P2o4RuIoawm80SMI0WH35yHkzK1SYN4gDfir+NqTsZA=;
	b=kS8zCXjGePMWfi4xn14FV1x1OMS1g4VjWfEHUIGOd64t2qnZViS4R1/RmS6q0xkLjo
	JkbXXbMQi3KlsTC14HCejqtx9tjnzJpzn6/8YYRvd/fsELzhxqHyPpdxXmqcJUmzoOPc
	TJY9wMqnFc+UTsGelQ80iefXN0O7qmJEerqqBTIJte9ObXwJhx0PwN9JkCFzVXcBdH8h
	murZ72RKZYbpSuHdjPdNbOy89ytLbxh3RtF52N9CaLlsm4E5mfFVkw7VQrAvFQJBZhAs
	BwO8xMcpf5NDbVKBJqJ2hYNLAltEen4oYeYMWUqc912EzQYzaUdRpu9ceXef53S4PqCt
	bN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=P2o4RuIoawm80SMI0WH35yHkzK1SYN4gDfir+NqTsZA=;
	b=TLbRMd0hBx3cQCYfD9ysrlpFFlZez74+sQrcDB7ejgNiahWoTKxcJnI83YMBBUIjAL
	AxcUL8xtKIZkgLpNzQvHJZtiKkdn0TcD6kXsE+fP/dWaROwVPHKRJFeU/lg0K2Q81R+H
	96e5sfgTSBpu4TtXZaMIB/dbpIDIgBzKPw8VduqR8kvLZNp4FjpDkd2hZq0TywggutU2
	Uo/LXArZrqWkaVkPDBzwL+W7UVYzhG6Tn8X6rTUOHWfdIZDiJwdwFUyL+MNWHciVXNoq
	CI0Rdw2EAmNpleyS36NXKBxdNDA5441/oFl04UyY1wmzVdIbaY+BLHybTPa4MurqPYuC
	XSww==
X-Gm-Message-State: APzg51A2fmGQonDyviTi6CfTb+vsGmUSLrovpfRB6KMkKDCTZCgZbKue
	Ctljh1w+7EKlVW4C5hpS2t9LaF5uduMZYy8/f+g5og==
X-Google-Smtp-Source: ANB0Vdah0nms0PyzOld83rRVTjodwqAthOB2ZDOaptlyYWJfp3axXIG5LI+6W3rIcFOJtg40mz943KFHTzk8aWIJHmk=
X-Received: by 2002:aca:aa8d:: with SMTP id
	t135-v6mr180256oie.218.1535438591006; 
	Mon, 27 Aug 2018 23:43:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Mon, 27 Aug 2018 23:43:10
	-0700 (PDT)
In-Reply-To: <CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 28 Aug 2018 08:43:10 +0200
Message-ID: <CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Tue, 28 Aug 2018 06:43:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>>
>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>> >  2 files changed, 5 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-grap=
hics/cairo/cairo.inc
>> > index 20e0d2c92a..7347f223ff 100644
>> > --- a/meta/recipes-graphics/cairo/cairo.inc
>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libx=
ext"
>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
>> >
>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
x11 xcb', '', d)} \
>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'ope=
ngl', '', d)}"
>> >
>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --d=
isable-xlib,${X11DEPENDS}"
>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> > index 5afd0db4b7..dd626d9f00 100644
>> ^ I think this came in accidentaly and it breaks builds when adding
>> packageconfig glesv2:
>>
>> | configure: error: use either --enable-gl=3Dyes or --enable-glesv2=3Dye=
s.
>> Not both at the same time.
>
> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
> try that out.
>
>>
Yes of course I can. But this patch is wrong - we don't have gles as
distro feature - and it is not even mentioned in commit message why
this is done.

Andreas

