Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 187A87892B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 20:51:49 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b15-v6so5323851oib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1i2Q/bxPPxuGlPNkk1jfw/ShpjPby3t2OP5tLjfCpbE=;
	b=NH9FixvePKPXjzalUJ6jxvbDa4JZZvGzpfuhNw7kJF5jBV80nSawLyh2XR28KPb/nU
	cn2iXXooqYuLoVtkRlRYXFcQuPVAb6/VtwUWs52JoMeqxO6kOhH4hclmW1ZSZyCC4F9K
	mAsw+FYCS21+U65cKdxbHtAu7PkXD/hP68WexgxaYJxwg+w79EGMlQ/Rs1USI+jaRcam
	meCSh1PEAM9uP18AtWwybuCQykE1f0Zfrw7ss2DBfCKGFzRs7upAcY0RnEJCqLOc91B1
	mNkH33Tx3rhYoMRzcDgJcvJ7Ig4QcHGDbHNNaFreWkN7CDnpP4ETKZgarR0DDp0Ocs2b
	2vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1i2Q/bxPPxuGlPNkk1jfw/ShpjPby3t2OP5tLjfCpbE=;
	b=slRwBiSfqMnIoxzX9s34fwgF1tZ/VapuzPKPf17hOZa5HCfl47zU8Rmsukq6/nXjyT
	wCPyl8zoWopUshYsvbqOhNeYotrRS/KcoExnufoOU1wHRR0BZfS7x1Hd29pQv1+eNWpA
	7WZsttqI4StN0ovznvI+7/+K9gVO7LB4jGj8Vma6QsE8ealwZ/TAAvgkh+4Ly2EtBR0r
	vk/LWy2W8NB/d3leCBT1+ASmGPtFGZwiHF4a6lzT2ZVfExT7jZy3x2b4pbEYxAKX1Nze
	/VQc/40H9KHXoPsAdxIa5YC2PjT0iLSaQxfCcBHDFMbmuMT6QfFwbl+woCcDYSwdNI2M
	4EZA==
X-Gm-Message-State: APzg51DaSKHbZbiU/7B9PkOf+LoHuznOSRXqKV5crq5CHzuDlK2B3bw6
	imvpDCbGXpU1l/N6YjRukpySVtngJk50PTS1K+A=
X-Google-Smtp-Source: ANB0VdYQaITtxnJcy4P3PDptVpsKhLCx9rUGEqzX8WpE733omqp+fOyT9Hm56caASgpgBafiOFnoG/XodUW1J/z/9LA=
X-Received: by 2002:aca:dc55:: with SMTP id
	t82-v6mr2294708oig.159.1535489510882; 
	Tue, 28 Aug 2018 13:51:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 13:51:50
	-0700 (PDT)
In-Reply-To: <CAMKF1sozJp8fyw6ShFE+ByQJR3RGrW1NORDTDn3gUyrVsKHUMQ@mail.gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
	<CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
	<CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
	<CAMKF1spHi-Vi_rs3oRsqx0xjxfbCjW6WpeCvcs5HPdGDGKuUEg@mail.gmail.com>
	<CALbNGRQNt-tTK=dSOT1Xi=waufsFOiDLNNPu9HwyVa6RAYp=3g@mail.gmail.com>
	<CAMKF1sozJp8fyw6ShFE+ByQJR3RGrW1NORDTDn3gUyrVsKHUMQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 28 Aug 2018 22:51:50 +0200
Message-ID: <CALbNGRQDQ4ALiL9fKTYYkhMQ1x+pw1L+dctOZbA4XoCub1fVYg@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 20:51:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 10:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Andreas
> On Tue, Aug 28, 2018 at 11:28 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>
>> On Tue, Aug 28, 2018 at 7:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Hi Andreas
>> >
>> > On Tue, Aug 28, 2018 at 10:21 AM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
>> >>
>> >> On Tue, Aug 28, 2018 at 8:43 AM, Andreas M=C3=BCller <schnitzeltony@g=
mail.com> wrote:
>> >> > On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wro=
te:
>> >> >> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony=
@gmail.com> wrote:
>> >> >>>
>> >> >>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wr=
ote:
>> >> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> >>> > ---
>> >> >>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>> >> >>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>> >> >>> >  2 files changed, 5 insertions(+), 1 deletion(-)
>> >> >>> >
>> >> >>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recip=
es-graphics/cairo/cairo.inc
>> >> >>> > index 20e0d2c92a..7347f223ff 100644
>> >> >>> > --- a/meta/recipes-graphics/cairo/cairo.inc
>> >> >>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
>> >> >>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrend=
er libxext"
>> >> >>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
>> >> >>> >
>> >> >>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', 'x11 xcb', '', d)} \
>> >> >>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d=
)}"
>> >> >>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d=
)} \
>> >> >>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl=
', 'opengl', '', d)}"
>> >> >>> >
>> >> >>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=
=3Dno --disable-xlib,${X11DEPENDS}"
>> >> >>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
>> >> >>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes=
-graphics/mesa/mesa.inc
>> >> >>> > index 5afd0db4b7..dd626d9f00 100644
>> >> >>> ^ I think this came in accidentaly and it breaks builds when addi=
ng
>> >> >>> packageconfig glesv2:
>> >> >>>
>> >> >>> | configure: error: use either --enable-gl=3Dyes or --enable-gles=
v2=3Dyes.
>> >> >>> Not both at the same time.
>> >> >>
>> >> >> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
>> >> >> try that out.
>> >> >>
>> >> >>>
>> >> > Yes of course I can. But this patch is wrong - we don't have gles a=
s
>> >> > distro feature - and it is not even mentioned in commit message why
>> >> > this is done.
>> >> >
>> >> I am tempted to send a revert for the cairo part:
>> >>
>> >> * Cross: It changes defaults valid for long time
>> >> * Native: As far as I can remember it causes trouble for cairo-native
>> >> * It went through without mentioning
>> >
>> > opengl as a DISTRO_FEATURE should tie into packageconfigs, the
>> > situation before this patch was not ideal, people got to work with it.
>> >
>> > as seen in the example you cited, we can't mix opengl and gles support
>> > in packages. other layers have solved your kind of usecase like below
>> >
>> > https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes=
-graphics/cairo/cairo_%.bbappend
>> * ^The link is broken
>
> ah see cairo bbappend here
> https://github.com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-gr=
aphics/cairo
That is more or less the same I am doing in

https://github.com/schnitzeltony/meta-misc/blob/master/appends-packageconfi=
g/oe-core/cairo_%25.bbappend

So meta-wpe will break from now on when used together with a distro
layer enabling opengl in DISTRO_FEATURES - right?

Meanwhile I've checked the native case: It builds fine. To understand why I=
 did:

| bitbake -e cairo | grep ^DISTRO_FEATURES
| <...>
| DISTRO_FEATURES=3D"<...> opengl <...>'
| <...>

and
| bitbake -e cairo-native | grep ^DISTRO_FEATURES
| <...>
DISTRO_FEATURES=3D"ipv6 x11 xattr pulseaudio bluez5
gobject-introspection-data ldconfig"
| <...>

Some magic which I can't find right now, removes opengl from
DISTRO_FEATURES =3D> You patch does not break anything.

Maybe you should send some patch to meta-wpe :)

Andreas

