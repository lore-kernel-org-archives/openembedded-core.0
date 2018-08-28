Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id A508678E36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 18:28:07 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id r69-v6so4617936oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 11:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nqvzNxtkdHgiMX4sAjPBbTvy8adDYLh9QBAVwjmeanw=;
	b=dkeWNvqpRVrVcFyd4OST9y2gYMxN18xrbE/vYY6Em4gk6Qaj1JtVh2JQS8b4rkI4sZ
	J+WYJuomjm6fvQ4+TVGHOKZwOitC3pMrjBDWvIdZuzOPs9ggOo+SylfFBrHHkmn7w0o3
	aQq4XiS0JoslLM+X8Tgu4ZD7SJlSs2uMnI47M+n4Vb/JSzqVxJQrP0S9y0kAVSq3L5wt
	SEvRn2mVNnyrucmCQfFJfuNs+UjcfIohYG6ZHuk9GL9FbpPsK9QpqCtAE4KIzb76XiBg
	xfI3UZQIcd48muC1eRHntEeF5gMYnSADo/EUKkY5BtRpOedIGwl4gbZLRXf3ebvPG6wV
	ukIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nqvzNxtkdHgiMX4sAjPBbTvy8adDYLh9QBAVwjmeanw=;
	b=J77guywCpzIWQiW5TQq/1C5e0tqUW46GlKlcWGo4k4w1+cNwp6mt89sXwNCz5GcdE1
	o/CmGMsXwTnYq66DhvQDdcr1z+g/yLgTFUeOqtjSzECcdKLBxt3iflhxtAg/sJOKaROF
	4sjldkIK292yPlyg4Hb7FDC72xTJ8R5m9fepHjMynQqnG8xGdYIrl9l/cIc4sSsMMRqV
	GYTlNQufLXRu/H210rPDUAtWdSKQOKK+t7YESyTVDSPPl+3CL7q1dgoGp5XQfS4apFrJ
	XhILTGUdbC4NuI3LRL0KM4AI1XhA9Q5KwTo7hBF8kIvKJM43Z0/oiSgB0wZwaCD4knKZ
	2bkQ==
X-Gm-Message-State: APzg51A3DCbwp1G7NbaL2M6lHlrNZwFBq/pdBSiDDfZNMuAVOo+TbCKw
	RQIpw/jIcoo1rIYUUQtiSN2tjQoSO0iLK6JmHLY4Z+in
X-Google-Smtp-Source: ANB0Vdab76qN8CRssHjhzLYGdNdavjNfIYLgo+YD0mqoe/p4/SNtZoYOkwP1oGxZ/TBWciI/e58S2Slj7PVRosOxPMw=
X-Received: by 2002:aca:aa8d:: with SMTP id
	t135-v6mr1960865oie.218.1535480888626; 
	Tue, 28 Aug 2018 11:28:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 11:28:07
	-0700 (PDT)
In-Reply-To: <CAMKF1spHi-Vi_rs3oRsqx0xjxfbCjW6WpeCvcs5HPdGDGKuUEg@mail.gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
	<CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
	<CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
	<CAMKF1spHi-Vi_rs3oRsqx0xjxfbCjW6WpeCvcs5HPdGDGKuUEg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 28 Aug 2018 20:28:07 +0200
Message-ID: <CALbNGRQNt-tTK=dSOT1Xi=waufsFOiDLNNPu9HwyVa6RAYp=3g@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 18:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 7:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Andreas
>
> On Tue, Aug 28, 2018 at 10:21 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>
>> On Tue, Aug 28, 2018 at 8:43 AM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
>> > On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
>> >>>
>> >>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
>> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>> > ---
>> >>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>> >>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>> >>> >  2 files changed, 5 insertions(+), 1 deletion(-)
>> >>> >
>> >>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-=
graphics/cairo/cairo.inc
>> >>> > index 20e0d2c92a..7347f223ff 100644
>> >>> > --- a/meta/recipes-graphics/cairo/cairo.inc
>> >>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
>> >>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender =
libxext"
>> >>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
>> >>> >
>> >>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', 'x11 xcb', '', d)} \
>> >>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>> >>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} =
\
>> >>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', =
'opengl', '', d)}"
>> >>> >
>> >>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno=
 --disable-xlib,${X11DEPENDS}"
>> >>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
>> >>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gr=
aphics/mesa/mesa.inc
>> >>> > index 5afd0db4b7..dd626d9f00 100644
>> >>> ^ I think this came in accidentaly and it breaks builds when adding
>> >>> packageconfig glesv2:
>> >>>
>> >>> | configure: error: use either --enable-gl=3Dyes or --enable-glesv2=
=3Dyes.
>> >>> Not both at the same time.
>> >>
>> >> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
>> >> try that out.
>> >>
>> >>>
>> > Yes of course I can. But this patch is wrong - we don't have gles as
>> > distro feature - and it is not even mentioned in commit message why
>> > this is done.
>> >
>> I am tempted to send a revert for the cairo part:
>>
>> * Cross: It changes defaults valid for long time
>> * Native: As far as I can remember it causes trouble for cairo-native
>> * It went through without mentioning
>
> opengl as a DISTRO_FEATURE should tie into packageconfigs, the
> situation before this patch was not ideal, people got to work with it.
>
> as seen in the example you cited, we can't mix opengl and gles support
> in packages. other layers have solved your kind of usecase like below
>
> https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-gr=
aphics/cairo/cairo_%.bbappend
* ^The link is broken
* Am quite sure that it breaks cairo-native or dependants (have no
logs at hand - it is some time ago)
* Again: I consider this a major change and it was not even
mentioned/discussed. To me it has nothing to do with 'mesa: Enable
gallium-llvm on x86 and x86_64' - btw: what does that fix?

Let's close discussion here - I think after all these years here I am
able to find a workaround in case of further issues. Thanks for
support.

Andreas

