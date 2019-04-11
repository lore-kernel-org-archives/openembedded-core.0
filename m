Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3550C7D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:44:19 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id t8so5433306otp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=96Ds3QQs67Ky3auvz1AzFMtVXjGHXzZqDZfB/PsPIPI=;
	b=UXwxgEg3rRsjTx1gerufeMIWGK1O8wMcowsKAl3V5mAMvWQdYGknvzMQon8fqOdxgB
	xgUKcRSUyg9/cVFD/9ec5HeY8L9fxwJkXhStbndrE654h/zfRQqjj53cTdJQjPlb33UA
	2oMxfiynCrjmaP5hTU6NAxG7yFpXJIXTKXDwxtga9C2tQ7Ar9d9YXCZmtCaQKansDSs2
	Ssr7slDZXaZzGfZ51tfDB0IIGI7gxsaxPWi6Tc6t6xCZTNaS3U74gA/Q5nBy/QQ1v+MB
	axNQBYE9mvE8TM9XN1ZYDh0zcuKVrGcLvEAmfmDmPsjNNg5wqRDYyDoIYg2y2OQ7yW4i
	LKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=96Ds3QQs67Ky3auvz1AzFMtVXjGHXzZqDZfB/PsPIPI=;
	b=a91o8B0F9LC6teq1tl8G1lMcIoLhcc3xk9XL62L0GaC6lES8Re5UP9T3ZFhaVC85Hy
	zUY+PCGUlQUljR6jS9AxepSw5nRJTQYyjOybMMqXF829fvUMyxGKcottLpDi1vwYiNBM
	4gO5h0c6jVe1+EtoLW8FedbH4dGXiZL1dBEz9/EoRriIGrbs4KlOClzqhNlZv9B40TE6
	/AuppY3TvlpAo3Oy43NMmddfxboibcBTM0UBSNlFIzQgxRsXAtOhFhcEl4cJbDkMHEBM
	18ctettEZbCVmosvLOLhbMz8vHNbs8CiLT35fOc3ASCLrcpg86XK7cZpe1pOmmBckq83
	IQZQ==
X-Gm-Message-State: APjAAAWJ4M4VeFWxVw5p6jN/hXrrUj8U5ooC2DiYypSLctEvWGjX4rr5
	RzqzBDydlZuuXLzwVdLIThwTsH3LmHevg0pk0U8=
X-Google-Smtp-Source: APXvYqwhbyTmwXVetHLBKiNJn8JDtB8A9fiLkllrLXORemI5tt+a4xccLDRiuoTWMPFgmgJ0PBQXRnNLESJ4P+zXSTk=
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr32735255oto.237.1554993860752;
	Thu, 11 Apr 2019 07:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
In-Reply-To: <3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 16:44:09 +0200
Message-ID: <CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 14:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Generally because generating introspection data is disabled for native
packages, as a matter of policy (do not build something which is
unused and untested).

If you could add
EXTRA_OEMESON_append_class-native =3D " ${GI_DISABLE_FLAG}"

to the gdk-pixbuf recipe, and re-test (without your fix, to be extra
sure) that g-ir-scanner is not invoked and nothing shows up in its
cache, I would appreciate.

Alex

On Thu, 11 Apr 2019 at 15:10, Jason Wessel <jason.wessel@windriver.com> wro=
te:
>
>
> Please understand I have no idea how gdk-pixbuf-native is supposed to com=
pile.  Perhaps you can elaborate further as to why g-ir-scanner cannot be c=
alled in this case.  I did not observe any obvious way that the g-ir-scanne=
r was explicitly disabled for the build of the -native package with in the =
do_configure stage.
>
> Looking at the log files from the compilation phase it appears to use mes=
on as the build tool.  The compile log file indicates that it is using the =
pkg-config tool to find g-ir-scanner and subsequently use it.
>
>
> Log file: x86_64-linux/gdk-pixbuf-native/2.38.0-r0/build/meson-logs/meson=
-log.txt
> =3D=3D=3D
> Called `/poky/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.38.0-r0/rec=
ipe-sysroot-native/usr/bin/pkg-config-native --variable=3Dg_ir_scanner gobj=
ect-introspection-1.0` -> 0
> /poky/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.38.0-r0/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner
> Got pkgconfig variable g_ir_scanner : /poky/build/tmp/work/x86_64-linux/g=
dk-pixbuf-native/2.38.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/bin/g-ir-scanner
>
> =3D=3D=3D
>
>
> Jason.
>
> On 4/11/19 6:14 AM, Alexander Kanavin wrote:
> > gdk-pixbuf-native should not be running g-ir-scanner at all, as we
> > explicitly disable this for native builds. Can you please look into
> > why it is happening, because the patch is really treating the symptom
> > rather than the problem.
> >
> > Alex
> >
> > On Wed, 10 Apr 2019 at 23:54, Jason Wessel <jason.wessel@windriver.com>=
 wrote:
> >>
> >> Investigation of an end user going over their quota in the user's home
> >> directory showed that the gobject-instrospection is writing files into
> >> the ~/.cache/g-ir-scanner when building -native packages.  The test
> >> package in this case was gdk-pixbuf-native.
> >>
> >> Setting the GI_SCANNER_DISABLE_CACHE in the bbclass should be all that
> >> is needed.  The qemu wrapper was already setting this properly, but we
> >> also need it for the -native builds.
> >>
> >> meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.=
bb:131:
> >> export GI_SCANNER_DISABLE_CACHE=3D1
> >>
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> ---
> >>  meta/classes/gobject-introspection.bbclass | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes=
/gobject-introspection.bbclass
> >> index 4ceb0c68b1..359620fba7 100644
> >> --- a/meta/classes/gobject-introspection.bbclass
> >> +++ b/meta/classes/gobject-introspection.bbclass
> >> @@ -27,6 +27,9 @@ DEPENDS_append_class-nativesdk =3D " gobject-introsp=
ection-native"
> >>  # This is used by introspection tools to find .gir includes
> >>  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
> >>
> >> +# Disable writing to $HOME/.cache/g-ir-scanner
> >> +export GI_SCANNER_DISABLE_CACHE =3D "1"
> >> +
> >>  do_configure_prepend_class-target () {
> >>      # introspection.m4 pre-packaged with upstream tarballs does not y=
et
> >>      # have our fixes
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

