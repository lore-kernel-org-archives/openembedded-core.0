Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3E30C6EAC2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 12:03:04 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so2079463eak.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 04:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JmRntKPn2LmhRalWTFV/zcTBOMgimhUzNaUixY14nAM=;
	b=fLSmzKensL9NTozc9HetGu7AWqsX8XTlm32TFO6tltO5B1hI+Vjh4UrgZZ2X/e7lyq
	jM40wcoTEFWLzOzj59WUJ4OcIe0w8k3jdGsRnwlnbJgbK62RgEg//OHv54iSKM28U6w3
	zSNqN9OgaJuBlUk4ltNOb4dB2wLU4SyXNHc8q08lLAPXM+dw1hwtkpW0mV26LC2BT22u
	wDNvH5QlXcWFtXmdfdIy1RZmxZTxjER4oOopZkmydATMrnrLeNEc31ZCOqquKQnXfaYf
	HOElBheYqKujJcM40Jm6LUkq+tB0YVCCP8o/l8JtK8YjyWOpplBzr23hH7y9YpglHKtz
	iC4A==
X-Received: by 10.14.87.129 with SMTP id y1mr14157987eee.38.1393070584890;
	Sat, 22 Feb 2014 04:03:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm38094541eef.12.2014.02.22.04.03.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 04:03:03 -0800 (PST)
Date: Sat, 22 Feb 2014 13:03:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140222120340.GM3854@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama>
	<CAMKF1srH-UE7rtqDZJGorWXwoQYdGwzTvZwK8mE5u0ooTikzjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srH-UE7rtqDZJGorWXwoQYdGwzTvZwK8mE5u0ooTikzjg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Sat, 22 Feb 2014 12:03:05 -0000
X-Groupsio-MsgNum: 50441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vdqwC0msT4ilQ2it"
Content-Disposition: inline

--vdqwC0msT4ilQ2it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2014 at 08:32:49AM -0800, Khem Raj wrote:
> On Fri, Feb 21, 2014 at 7:16 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > Thanks for upgrade
> >
> > I've noticed pulseaudio failing to build when it tries to detect old
> > libsystemd-login lib:
> >
> > | to the PKG_CONFIG_PATH environment variable
> > | No package 'libsystemd-login' found
> > | configure:26263: $? =3D 1
> > | configure:26277: result: no
> > | No package 'libsystemd-login' found
> > | configure:26310: error: *** Needed systemd support not found
> >
> > do we want to enable compat libs or update pulseaudio to use new
> > libsystemd?
>=20
> I think we dont have such a big legacy with systemd yet may be if its
> few packages then lets fix the packages instead of enabling legacy
> support if we can. in my local tree ( not yet pushed ) I was
> explicitly enabling it and disabling kdbus support to see if I can fix
> the logind not finding dbus issue
> it seems to happen for all architectures

Agreed,

I've found another one: polkit:

| checking for LIBSYSTEMD_LOGIN... no
| configure: error: libsystemd-login support requested but libsystemd-login=
 library not found
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/polkit/0.111-r0/polkit-0.111/config.log
| This file contains any messages produced by compilers while
| running configure, to aid debugging if configure makes a mistake.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vdqwC0msT4ilQ2it
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIkhwACgkQN1Ujt2V2gBxhrwCgt13ISej0xfYS+f5cIHlWEZEN
s4MAoI5pegpjLv5dRmzatc3Sspm30Zg3
=guEq
-----END PGP SIGNATURE-----

--vdqwC0msT4ilQ2it--
