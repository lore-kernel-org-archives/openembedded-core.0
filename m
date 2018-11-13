Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id E813C6C277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 12:22:25 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id t13so1490916ywe.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 04:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XSMEY11gBM4Ef5F9liP6W3qLgyOEAuUs/ltOh/EofaM=;
	b=nkymzOAk0SprKpUitt2Xern9BlHU4xjfDG2Vn8aZtG0+9ztVHvZlwV24GrLfcsKjpN
	A/KEPnwMTSMaRvGz6wNSrfU7f1BckE216BM95adlPa4diOQkCgnnM5koDh8WN/ZKFVIm
	nfstzQsHP9FtT/Yy3nup06+tsvR36T655/lfSwYAWbuwpM8ZHTRLdQYsZW5vgbZkABXD
	f4vq4JL3SIlx8igdSqhkd8kE5SRsKvYp6iDmCa34qJulaDl6z6ZD1o+LOqHE1VfiJX5F
	VbAcG86VzDXubO6EwKktNVJp+agITpF5MGwu5XT09mR+LxErVM/gRuGnI5LLVMjpZj3R
	sm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XSMEY11gBM4Ef5F9liP6W3qLgyOEAuUs/ltOh/EofaM=;
	b=Z8Q7yksMyML6HBZcWeCAJwOoBBM6962Ofq8+E4qZhdAfhM2r6zrxfS034TuPfGFF37
	Se7jQ4XwfkGnHjRI4MuD80dk0nbCP3KESOtfE+kW5Q9PsBfrJFvBDLuOhVNpuA4gUj13
	recpQRekzhLi51/TSvl+m970WjrocdscMxlbXWEvFWYI+3fV0cSNsL1gKMoVVbEQxRdS
	WZ80V/lPrmilnMC2bStwoeMulEgNefzMOvcOYDchP5ZjlC0I6sAEw1P9k7dpwFnksA+D
	z2IdSt2C93qHVdPGoH74KNczdd32zxQUtdcK0VrXjjjlvcxJy8A8zwXkIdY4aIrswjir
	9qSA==
X-Gm-Message-State: AGRZ1gJgNdXiU8XHIrrEDlPUbFcJWgTn0zUZvBYipA6PxpNSeIATSgBF
	O5Bwtt9Jx5uq68CUZLOf3wYBbo8NIYqOKvirYNk=
X-Google-Smtp-Source: AJdET5fja2qbpOOpbXULy98HN6So8l9ns7fYEXT/ctlnt35d9c5AHS7nLHLksev0LeHOiTQ0XoL6PRpYiouHoGJN9fk=
X-Received: by 2002:a0d:ed82:: with SMTP id
	w124-v6mr4533496ywe.447.1542111746837; 
	Tue, 13 Nov 2018 04:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20181113101729.19289-1-schnitzeltony@gmail.com>
	<CAJTo0LZmNVBXU+tNYczEqM1C_ed6J1WCeR7--Fda5Xaub8hknA@mail.gmail.com>
In-Reply-To: <CAJTo0LZmNVBXU+tNYczEqM1C_ed6J1WCeR7--Fda5Xaub8hknA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 13 Nov 2018 13:22:13 +0100
Message-ID: <CALbNGRTtA6uc1fE8S7RdyFihWmP-bZDnqXRqBzb97DMHNaXWzg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scons.bbclass: Force rebuild if necessary
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
X-List-Received-Date: Tue, 13 Nov 2018 12:22:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2018 at 12:06 PM Burton, Ross <ross.burton@intel.com> wrote=
:
>
> This make me look at scons a bit closer, somewhat in shock that it
> doesn't have a native way of doing out of tree builds.  Apparently
> abusing the repository argument will sometimes work for out of tree
> (so you could just put B=3D$WORKDIR/build and add B to [cleandirs]) but
> abusing sounds like 'doesn't always work' to me.
>
> I then discovered that the one recipe in oe-core that uses scons
> doesn't in fact use the class, and switching to it breaks because
> there's no standard way of passing install paths (serf tries to
> install to /usr on the host).
>
> So how is your experience with the scons class? Is it actually useful?
>
> Ross
> On Tue, 13 Nov 2018 at 10:18, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/classes/scons.bbclass | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> > index b9ae19d582..286843f74c 100644
> > --- a/meta/classes/scons.bbclass
> > +++ b/meta/classes/scons.bbclass
> > @@ -2,7 +2,16 @@ DEPENDS +=3D "python-scons-native"
> >
> >  EXTRA_OESCONS ?=3D ""
> >
> > -do_configure[noexec] =3D "1"
> > +do_configure() {
> > +       if [ -n "${CONFIGURESTAMPFILE}" ]; then
> > +               if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTA=
MPFILE}`" !=3D "${BB_TASKHASH}" -a "${CLEANBROKEN}" !=3D "1" ]; then
> > +                       ${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=
=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS}
> > +               fi
> > +
> > +               mkdir -p `dirname ${CONFIGURESTAMPFILE}`
> > +               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> > +       fi
> > +}
> >
> >  scons_do_compile() {
> >          ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=3D${pre=
fix} prefix=3D${prefix} ${EXTRA_OESCONS} || \
> > --
> > 2.14.5
> >
Have few recipes in my layers inheriting scons. I build them
frequently in my running 'world image' [1]:

meta-games/recipes-games/pingus/pingus_0.7.6.bb -> Builds 'fine' currently
meta-qt5-extra/recipes-misc/recipes-multimedia/mixxx/mixxx_git.bb
There are others I don't use:
meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb

Mixxx (has QA issues I am trying to fix) is the one on which I found
out that rebuild is not performed in case recipes are changed on which
mixxx depends on.

So yes I consider this class useful :)

[1] https://github.com/schnitzeltony/meta-mortsgna/blob/master/recipes-imag=
e/allgui/allgui-full-image.bb

Andreas

