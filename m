Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E91274994
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 10:28:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a8-v6so13243525wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aEjj5S1V2CtetNC+r3TLtPter+A93EMOd75qg0wrztY=;
	b=SFIU9aeBL+RXOI7ZHj5zIoCRkXuPHJO/FzUZrdrI+7LQ+RErcqNvx5nchc7G/k2GdR
	Oc9yLqh60IkN/eTxfMuHCrvezJPY1QRN2llAca7IgWR5UGs9blbKmb/M2BtIsApf2g0t
	pj08b6NttGOL0jwcsroqTfTlIwb3ScAyNLgnHVmn8QPGzS/JlvfRSW3hF7MvuitVjDSZ
	kljQlyT37fvLziGcIsYB+Ld7k9fW85J4csxNxJTCsLJONyIaiWwn7951aMJVaUBtOSyG
	BzWLUJgup5bXkaDmfnmtqGYn11r22mi1XquWyeKxKVy5lAaAqVKf3egGR5zPOeLvPGJA
	o39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aEjj5S1V2CtetNC+r3TLtPter+A93EMOd75qg0wrztY=;
	b=Ot5DYwSmbXGZnGTPwiP56bIIcWJn9Q4vDvC+nLWIrC6HzvBcCTqJsMnT7dRbZzUzks
	6m7f02/XtJfm89cKW8Np7Byy6dS9iXr5Jxo58TcFgZBQonV81KA1Z7BkhR9WbzpDy+1L
	8Jl7b3sRGPT+lu8Y3xyxeOiT8of3NVwoL7Byuou87dShaCjxWJUwsoZikYdVQLO0fP1r
	SrWS3j18yGlsOCHXGOwTbms43Eg++lsN+nxllpN4zFdrZVBt+3Xy3Y7e5vRmsgU5Dp87
	Ci+Qzsw26wB6GezzCLAWGiLuG/muGvjFXvdKmj8q8EvUHRamuTTEW545bC24bK8pUNky
	V2ZQ==
X-Gm-Message-State: ALKqPwd8s9D7CktLVFd/lXMB4zI8/gnPON7NNLwUpgTTEcG0C2jfsFAc
	YaqomdoMUdpPdHFSkx8pWo4=
X-Google-Smtp-Source: AB8JxZoq3lcgqcwQxZRNS1TirgRSr1cut2M3E50sRf24OExHSfSL89f3psnVs9J0c3inFPzIvZ9XNA==
X-Received: by 2002:a1c:12d0:: with SMTP id
	199-v6mr3872916wms.153.1526639318583; 
	Fri, 18 May 2018 03:28:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	60-v6sm6387910wrj.62.2018.05.18.03.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 May 2018 03:28:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 May 2018 12:28:40 +0200
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20180518102840.GA1398@jama>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
	<411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
	<d2c9a503-a8ff-34f8-2d0c-ccea52e4ee7d@windriver.com>
	<44b92914-6c05-d08f-1d94-bd041c6b7733@windriver.com>
MIME-Version: 1.0
In-Reply-To: <44b92914-6c05-d08f-1d94-bd041c6b7733@windriver.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Mike Looijmans <mike.looijmans@topic.nl>, peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Fri, 18 May 2018 10:28:38 -0000
X-Groupsio-MsgNum: 111497
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 06:07:16PM +0800, ChenQi wrote:
> On 10/13/2017 05:53 PM, ChenQi wrote:
> > On 09/18/2017 09:56 PM, Mike Looijmans wrote:
> >> On 18-09-17 15:24, Mike Looijmans wrote:
> >>> On 18-09-17 15:08, Burton, Ross wrote:
> >>>> On 18 September 2017 at 12:31, Mike Looijmans=20
> >>>> <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>> wrote:
> >>>>
> >>>>         This is basically the same change as I first sent a patch=20
> >>>> for in
> >>>>         April, and
> >>>>         last pinged this Friday... The only real difference is that=
=20
> >>>> this one
> >>>>         misses
> >>>>         passing error output from resize to /dev/null (which it=20
> >>>> should do to
> >>>>         handle
> >>>>         the case where tty exists, but resize does not).
> >>>>
> >>>>
> >>>>     Yeah, indeed.
> >>>>
> >>>>
> >>>> Apologies for missing that patch!
> >>>>
> >>>>     Other problem is that "resize" outputs shell script on stdout=20
> >>>> to be
> >>>>     executed, so the proper "total" invokation would be:
> >>>>
> >>>>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
> >>>>
> >>>>     The "eval" part is missing in your version...
> >>>>
> >>>>
> >>>> Who is going to submit the One True patch with all the fixes in?  I=
=20
> >>>> promise to merge it.
> >>>
> >>> I'll send the one ring, eh, patch, in a few minutes. I'll merge the=
=20
> >>> two into a single as well.
> >>
> >> On second thought, just use Peter's patch "as is".
> >>
> >> I've been experimenting with the "eval" part and it doesn't behave=20
> >> well. Tends to confuse minicom, create garbage, and in particular=20
> >> when run from "profile", it seems to result in counterproductive=20
> >> COLUMNS=3D0 and LINES=3D0.
> >>
> >> I'm actually wondering why the call to "resize" is being done at all.=
=20
> >> Just calling "resize" has no effect, since it outputs the results on=
=20
> >> stdout as shell script, and that is being discarded. Looking at the=20
> >> commit that introduced it:
> >>
> >
> > Looking at the codes in busybox (console-tools/resize.c), I can see=20
> > that tcsetattr is actually called.
> > The output is due to:
> >
> >     if (ENABLE_FEATURE_RESIZE_PRINT)
> >         printf("COLUMNS=3D%d;LINES=3D%d;export COLUMNS LINES;\n",
> >             w.ws_col, w.ws_row);
> >
> > I can confirm that calling 'resize' is needed. Otherwise, you might=20
> > get input wrapping on the same line when typing long commands.
> >
> > I just tried busybox init based system and I also met '-sh: command:=20
> > not found' error message.
>=20
> Sorry for the noise. Just noticed that oe-core has enabled 'command' for=
=20
> busybox by default. It's my own busybox defconfig that hasn't enabled it.

I was just hit by the same. resize and tty work fine, but command applet is
missing in my images.

Is enabling command applet in busybox now hard requirement for all the
builds or is anyone still planing to send follow-up on this?

At least to show some more meaningful error when it's not available?

"you probably need to fix your busybox defconfig, because some old thread o=
n oe-core ML says so"

Cheers,

> Best Regards,
> Chen Qi
>=20
> > I think Peter's patch ([OE-core] [PATCHv2 1/1] base-files: profile:=20
> > Avoid using "command" to determine if programs exist) is correct.
> >
> > Best Regards,
> > Chen Qi
> >
> >> cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)
> >>
> >> that already has no effect whatsoever. See the man page for resize:
> >> https://linux.die.net/man/1/resize
> >>
> >> I also would consider running some program's output as shell script a=
=20
> >> bit spooky, it looks like a security hole waiting to be exploited.
> >>
> >>
> >>
> >> Kind regards,
> >>
> >> Mike Looijmans
> >> System Expert
> >>
> >> TOPIC Products
> >> Materiaalweg 4, NL-5681 RJ Best
> >> Postbus 440, NL-5680 AK Best
> >> Telefoon: +31 (0) 499 33 69 79
> >> E-mail: mike.looijmans@topicproducts.com
> >> Website: www.topicproducts.com
> >>
> >> Please consider the environment before printing this e-mail
> >>
> >>
> >>
> >
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv6q1wAKCRA3VSO3ZXaA
HEegAKCz+QOKY8Lrn+WW6ZVQA4IpxDL9egCbBXyWex5kXvg/NdkhMW6H2TPCM3k=
=r590
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
