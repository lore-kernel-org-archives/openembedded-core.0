Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DED19775E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 23:09:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so13189979wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 15:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fIftWF86U0Fm4sgqKNBoFRrVX0e4OOyh8MXW3mLar6g=;
	b=W3pVRRq2x0VeN7HVxocFHbfnHKaQCQK4pKeujAOU3fMP6lrbtN8tIOvybr+EJlr9zw
	sqHIsE1N4cd27lKV0RTE9D7BcPP11SDfbvfffIa9j2sN21zrucOoQFJOV4KnhKtDJLxv
	ZzouuWwvxaQ+xElpX8M4lFIJLY+Qnj3stRxzVTMypId6QEqlNqm2RgNJjV97TzmuDeEy
	fabQoDKAfIYS27j4LG+Y0mPadi/mq0uWM9vGEF4PB/s8moduHSao7Hty0JmVQL0w4sO3
	yVr4Yzw0UpcMZCscCXI6n6Y90CRe+V5cPo7NVvsmOiBebuF7wvwbKTXlhTxyFhEhatUj
	wqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fIftWF86U0Fm4sgqKNBoFRrVX0e4OOyh8MXW3mLar6g=;
	b=nwmt6eOnPqAsrbrx+j7KspRZSq6cWspi9atV/hiqP9ttiKj38QUd6KefziMj1NVt/p
	oin51tC7f4p34Ur1CqvY+lcGKqEJH+ihLc40cKOV0up1Kv9/ZB5rUnGadTgAac7ZZIw5
	7EKtrkOUvk4GUMxXfyGAOHb8CYSeEfwZCPIBZqhfXizWtod8Q2Os/xrDxtDOQ9p7Fo2U
	DG107TlUMyZBiDrK+eT1ZPUzZLowvOJ5O2N5I0JrL2n7U9UmJc/27bhDUfBQ1GNy2CMG
	0OGOdzQXZr/vcrKPo5LkWrSG110CQcqxrxDqVyB3IbZjUNVzV6eT/KA6BhOzYOqpRuHN
	y/pg==
X-Gm-Message-State: AMke39lFnPeauegw1tPx+/CsmKD2eg99BWw5htyfOSYxERJpVtplS5IrbGeA3NvCPV1YBw==
X-Received: by 10.28.187.213 with SMTP id l204mr28406327wmf.104.1489100980423; 
	Thu, 09 Mar 2017 15:09:40 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l138sm520420wmd.7.2017.03.09.15.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Mar 2017 15:09:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Mar 2017 00:09:40 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20170309230940.GA3273@jama>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
	<CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
	<CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
	<CA+chaQdhW4w9Uf5sgQPY8DaBMr4nT9qt4gUXkF5L-PZCc+wVFQ@mail.gmail.com>
	<CAJ86T=WueHo4NqqsWMFay4wiwyrQfwNqpVRR88M44hVj0_8vmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WueHo4NqqsWMFay4wiwyrQfwNqpVRR88M44hVj0_8vmw@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Thu, 09 Mar 2017 23:09:41 -0000
X-Groupsio-MsgNum: 94495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 12:09:51PM -0800, Andre McCurdy wrote:
> On Thu, Mar 9, 2017 at 12:18 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Shouldn't we change default ARM_INSTRUCTION_SET while we're at it as we=
ll?
>=20
> Yes, that's the longer term goal. It needs to be done a little
> carefully though - ie in a way which doesn't ever enable Thumb by
> default for cores which only support Thumb1.

Why carefully? If we assume that DISTRO maintainers will select
DEFAULTTUNE correctly then we can assume that they will enable thumb
only for MACHINEs which support Thumb2. I think it's smaller change for
OE users than this already merged change of DEFAULTTUNEs.

And if they decide to use thumb also for qemuarm like I do in bitbake
world builds, then it should work as well.

> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9213
> >
> > On Tue, Mar 7, 2017 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy <armccurdy@gmail.com> wro=
te:
> >>>
> >>> On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> > On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com>
> >>> > wrote:
> >>> >> Defaulting to softfp probably isn't the best choice anymore,
> >>> >> especially as there are now ARM BSP layers which leave DEFAULTTUNE
> >>> >> entirely up to the distro:
> >>> >>
> >>> >>
> >>> >> https://lists.yoctoproject.org/pipermail/yocto/2017-February/03463=
7.html
> >>> >>
> >>> >
> >>> > I like this patch and want to clarify that it changes the default I=
SA
> >>> > to thumb2
> >>> > which we should use anyway due to size reasons and other distros us=
e it
> >>> > as
> >>> > default too.
> >>>
> >>> No, it doesn't.
> >>
> >>
> >> That's right I wanted to say to make that default while you are at it
> >>
> >>> The choice between ARM and Thumb(2) is made by the
> >>> ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
> >>> that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
> >>> a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
> >>> and above which ignore ARM_INSTRUCTION_SET, but that's a separate
> >>> topic).
> >>>
> >>> > I am not sure of we should change it for armv6 though. since some a=
rmv6
> >>> > has t1 and some has t2 so lets leave that as it is.
> >>>
> >>> I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
> >>> have a reference?
> >>>
> >>> (But again, to be clear, this commit doesn't change the default in
> >>> terms of instruction set - all builds will still use ARM).
> >>>
> >>> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >>> >> ---
> >>> >>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
> >>> >>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
> >>> >>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
> >>> >>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
> >>> >>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
> >>> >>  10 files changed, 10 insertions(+), 10 deletions(-)
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
> >>> >> b/meta/conf/machine/include/arm/arch-armv6.inc
> >>> >> index 91f0f07..5e1f973 100644
> >>> >> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv6"
> >>> >> +DEFAULTTUNE ?=3D "armv6thf"
> >>> >>
> >>> >>  TUNEVALID[armv6] =3D "Enable instructions for ARMv6"
> >>> >>  TUNECONFLICTS[armv6] =3D "armv4 armv5"
> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> >> b/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> >> index 5446048..bad1c27 100644
> >>> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7a"
> >>> >> +DEFAULTTUNE ?=3D "armv7athf"
> >>> >>
> >>> >>  TUNEVALID[armv7a] =3D "Enable instructions for ARMv7-a"
> >>> >>  TUNECONFLICTS[armv7a] =3D "armv4 armv5 armv6 armv7"
> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
> >>> >> b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >>> >> index 42d8d04..4d9260f 100644
> >>> >> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7ve"
> >>> >> +DEFAULTTUNE ?=3D "armv7vethf"
> >>> >>
> >>> >>  TUNEVALID[armv7ve] =3D "Enable instructions for ARMv7ve"
> >>> >>  TUNECONFLICTS[armv7ve] =3D "armv4 armv5 armv6 armv7 armv7a"
> >>> >> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>> >> b/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>> >> index 53994ef..2cadbee 100644
> >>> >> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>> >> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv6"
> >>> >> +DEFAULTTUNE ?=3D "armv6thf"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv6.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa15.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa15.inc
> >>> >> index 03de602..25e99f9 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa15.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7ve-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa17.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa17.inc
> >>> >> index f659a62..40392f9 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa17.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7ve-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa5.inc
> >>> >> index 93f9ca4..1f0cda6 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa5.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7a-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7athf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa7.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa7.inc
> >>> >> index 52e06b8..52415d9 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa7.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7ve-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa8.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa8.inc
> >>> >> index a831bd5..8ee8de9 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa8.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7a-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7athf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>> >>
> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa9.inc
> >>> >> b/meta/conf/machine/include/tune-cortexa9.inc
> >>> >> index 8b84e60..0cf323c 100644
> >>> >> --- a/meta/conf/machine/include/tune-cortexa9.inc
> >>> >> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> >>> >> @@ -1,4 +1,4 @@
> >>> >> -DEFAULTTUNE ?=3D "armv7a-neon"
> >>> >> +DEFAULTTUNE ?=3D "armv7athf-neon"
> >>> >>
> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>> >>
> >>> >> --
> >>> >> 1.9.1
> >>> >>
> >>> >> --
> >>> >> _______________________________________________
> >>> >> Openembedded-core mailing list
> >>> >> Openembedded-core@lists.openembedded.org
> >>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMHgtAAKCRA3VSO3ZXaA
HN0YAKC7NMsnYjnmq4Ewf8zbnyjAt1WxGQCfRMR9hzxzmmHLuJOJtZI9E0glk0E=
=Dr6S
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
