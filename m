Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3124178DC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:21:38 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x197-v6so4257393oix.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4cye4piUZwiPpX4aPEEH/eyTxzWbrjpJETURHQ/Gn5g=;
	b=VECbV3ngt/qNrHN5HNa+ccI3Bh0ZFg4C+mNHVkXcTRw/ZEEb0dMcs6WCiuvuhdqSjx
	5+KZSVD63vp1tVRey9Zb/ePKZtiWmJCbxN3d+tFIhO7wkHpF8J52ahO2zxY3FtmMHI8n
	Zak8q3jHmNz74eGJEfPTul9eUY6YosTI4tRLejji1aFyPWSyzWvoV3w0uUH6UCLwX0kW
	Sx6+9fEnFnk8g06+yn2SZVhSttgj8YGbZVP6sL7QR2uV4TwA1F97MKxOGe4w7Vga5XFh
	/o6xdzyIkwfnCZzEBNUvb2aK/w7OEsOgVTReSFPHB19W15ApibfaFmUb44BbgojP5l5F
	oazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4cye4piUZwiPpX4aPEEH/eyTxzWbrjpJETURHQ/Gn5g=;
	b=qlBEo+MWJgDvUYlAcWXHtYdPO2m71ckVSdsdX/zoY3OJADlHuDkBT9hkMSYYQn33dD
	sgE52XehOho6ygdWSNFfei3A++xgk+qyBle4egqiz3I/lqSY/IpuDqWGLm4yB1bJeghp
	wLa3eY4PbZZW7nWU+0T3y81LswVnroWvCJG/zEv2c3OSXYjw0hth7Gvy78n42GLzb0Xu
	iwYXfoHlFtBP1oLQ/TpcJ3PHpxbIoxLyTsqzdQ3VzST0d98RjpTFHtoX+zV6WlMJuMDD
	sreAdNly7ZYTbja7K/tCPfG3xE1adsoni4YkmqdGQFpEGkKDqLhFxOmEM8EBCJiUNBva
	BJpA==
X-Gm-Message-State: APzg51AfH/QzSyPWITSYCwaInXb87GnY6dSJnnKJoq6Kk5dsH1H85laT
	PvITcELkUV332agE+ujFVSoSv+3Wfie3c+EiupjkKQ==
X-Google-Smtp-Source: ANB0VdZSwdP1n7Qsg5nbehB6CG1L4HwLEynWdnt4JlymUHjpsLtSRLceJsq1EPuMXEP3POwCgyHnMoLxdFQcDf+DcIE=
X-Received: by 2002:aca:c0c1:: with SMTP id
	q184-v6mr2065444oif.61.1535476900085; 
	Tue, 28 Aug 2018 10:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 10:21:39
	-0700 (PDT)
In-Reply-To: <CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
	<CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 28 Aug 2018 19:21:39 +0200
Message-ID: <CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 8:43 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>>
>>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ---
>>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>>> >  2 files changed, 5 insertions(+), 1 deletion(-)
>>> >
>>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-gra=
phics/cairo/cairo.inc
>>> > index 20e0d2c92a..7347f223ff 100644
>>> > --- a/meta/recipes-graphics/cairo/cairo.inc
>>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
>>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender lib=
xext"
>>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
>>> >
>>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'x11 xcb', '', d)} \
>>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'op=
engl', '', d)}"
>>> >
>>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --=
disable-xlib,${X11DEPENDS}"
>>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
>>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc
>>> > index 5afd0db4b7..dd626d9f00 100644
>>> ^ I think this came in accidentaly and it breaks builds when adding
>>> packageconfig glesv2:
>>>
>>> | configure: error: use either --enable-gl=3Dyes or --enable-glesv2=3Dy=
es.
>>> Not both at the same time.
>>
>> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
>> try that out.
>>
>>>
> Yes of course I can. But this patch is wrong - we don't have gles as
> distro feature - and it is not even mentioned in commit message why
> this is done.
>
I am tempted to send a revert for the cairo part:

* Cross: It changes defaults valid for long time
* Native: As far as I can remember it causes trouble for cairo-native
* It went through without mentioning

Andreas

