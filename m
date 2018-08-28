Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2FC678D2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:37:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id o15-v6so2655297qtk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cH0UethUhtUY+CkkXY7uAXPBKW/AlOnXSvP4q3GQUoc=;
	b=qAWni2FVXFzKs+D3xzRdv+teLx+Pe0f2F0TtA+r0/P3vX5vCrNS7LNcJiOWM3ZkP35
	HlWB/mEBmvKAFq9ubf7pqHG4KQhcOiN2JiW6p3gveNHhg01ppzFwdZmZz2JKSLK2Hqt9
	mUK60ZWSY7BxhoQ3CRcJLJL/ZNoizM4UkOawPL2+ciIn3+n8tZILNa0IrhIvCnf6Kf1v
	Qy4L9YtXYC5EX13tcewr3ypwtha8ZqV4+4PxmTsRVQSARcrERK9i6G7F6MMoXoYNJIKU
	QJqWkpm9m3qVFs+JgQ81fau/96pXmYPf1ATyIx1p/JJBpm3qkjfy6LxLBqkP8ajTy6oM
	rsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cH0UethUhtUY+CkkXY7uAXPBKW/AlOnXSvP4q3GQUoc=;
	b=pBCiUgjjGv7WemKAAD9So3nQAHFkGP2D5Pt9388OhwYS31ex9rwLfEdWA+Q6m3Fcfu
	IocK4D6RjVNw9DCEGFYsvNPKvYk/DJdDJafriWOePbOI3Tpg0Xp4JMn1V3rdqWamvtHc
	CoiG+4ObzEYcDj9AGr8cQ54fqDcwk0l59fT1WuoRX15YmiX+g40r0P1aLSbkTpZBZsbm
	Ds1ooEs2M3JMKhpfaTKjOQ3qWsICU1Iz7BVYv7mjkkrrZgOBF3VRz/HY8AGCadkE7BTg
	Em2EGtkKuu4HN++1kh1SQi0J21JqyhXr6rwxhNzuaXddohoUyunypo7+2/3YV5xpwyMV
	tM/g==
X-Gm-Message-State: APzg51As/lHzq8Qs/SoxFg3eh9pSyLlBrP+f/Qo1mdWY1FDXNzG/g0ZT
	qlVXZm6ChP25f21OWNO91BddpqgAAvqpXNYatPQ=
X-Google-Smtp-Source: ANB0VdY4XYiyoeRrjk4eusT8PiqcsOv55LO8xOKb/4DZF7INAALZ9JhiZngdzabq+GG3LjcjruyLI/rLTAlj2MvSUD8=
X-Received: by 2002:a0c:e205:: with SMTP id
	q5-v6mr2661819qvl.224.1535477834341; 
	Tue, 28 Aug 2018 10:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
	<CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
	<CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
In-Reply-To: <CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 10:36:48 -0700
Message-ID: <CAMKF1spHi-Vi_rs3oRsqx0xjxfbCjW6WpeCvcs5HPdGDGKuUEg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:37:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

On Tue, Aug 28, 2018 at 10:21 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Tue, Aug 28, 2018 at 8:43 AM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> > On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> >>>
> >>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> > ---
> >>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
> >>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
> >>> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >>> >
> >>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-g=
raphics/cairo/cairo.inc
> >>> > index 20e0d2c92a..7347f223ff 100644
> >>> > --- a/meta/recipes-graphics/cairo/cairo.inc
> >>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
> >>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender l=
ibxext"
> >>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
> >>> >
> >>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11'=
, 'x11 xcb', '', d)} \
> >>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> >>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> >>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', '=
opengl', '', d)}"
> >>> >
> >>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno =
--disable-xlib,${X11DEPENDS}"
> >>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
> >>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gra=
phics/mesa/mesa.inc
> >>> > index 5afd0db4b7..dd626d9f00 100644
> >>> ^ I think this came in accidentaly and it breaks builds when adding
> >>> packageconfig glesv2:
> >>>
> >>> | configure: error: use either --enable-gl=3Dyes or --enable-glesv2=
=3Dyes.
> >>> Not both at the same time.
> >>
> >> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
> >> try that out.
> >>
> >>>
> > Yes of course I can. But this patch is wrong - we don't have gles as
> > distro feature - and it is not even mentioned in commit message why
> > this is done.
> >
> I am tempted to send a revert for the cairo part:
>
> * Cross: It changes defaults valid for long time
> * Native: As far as I can remember it causes trouble for cairo-native
> * It went through without mentioning

opengl as a DISTRO_FEATURE should tie into packageconfigs, the
situation before this patch was not ideal, people got to work with it.

as seen in the example you cited, we can't mix opengl and gles support
in packages. other layers have solved your kind of usecase like below

https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-grap=
hics/cairo/cairo_%.bbappend



>
> Andreas

