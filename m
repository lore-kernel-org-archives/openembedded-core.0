Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7815861E92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 13:50:46 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so1372471wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VnIdP21lebwgwvhr6Xghx30cft7tuELtu5G0Ww56ya8=;
	b=Oq0ka9S1fRFY+3Bg9i0LSr7PdKvSudUte94WqrZbLO3hQWeD/5Fx5q9vzA3HYv0kpf
	/jBo03AHa+b5HIUixIc6Lz7htE0W9msjKLURTS1x76grk6l5DNXgC7aJdBscWv0KHBP6
	aJcU9lVbsWtRR3rX3AZgN5H7oyZld3OhOL21vHBBVOCa/sYdNpc49pXfdRMDA6t8TW49
	IFTPbrGYuqAwoeAhwb2okBmZhvdCdZt1qEw3IyDXy9qFUT38hlsOFKcacvUBVRa+n1qC
	bKOspvzhiyR3Uw+bEk6IJGQM+dCo92V0hVcalpinMnIgTp9j2iQgT5BiSWF0BYQDRAzv
	D1cA==
X-Received: by 10.180.9.35 with SMTP id w3mr6655572wia.46.1370440245934;
	Wed, 05 Jun 2013 06:50:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	q13sm10559667wie.8.2013.06.05.06.50.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 06:50:45 -0700 (PDT)
Date: Wed, 5 Jun 2013 15:51:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130605135102.GG30727@jama>
References: <cover.1369922325.git.ross.burton@intel.com>
	<373E49FF-E99D-446B-A4A5-F852FDCAEFCF@dominion.thruhere.net>
	<CAJTo0LbQBvz81gxO1tKTG_TaNnA3jcpMDbB1tRqnhPF04otLfg@mail.gmail.com>
	<CAJTo0LZjJhHrSEXmA==qGDgWbSRDdXQh0_ocwVsFb=wsyVPeTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZjJhHrSEXmA==qGDgWbSRDdXQh0_ocwVsFb=wsyVPeTQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Mesa and Wayland updates
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
X-List-Received-Date: Wed, 05 Jun 2013 13:50:46 -0000
X-Groupsio-MsgNum: 40182
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline

--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2013 at 10:52:07AM +0100, Burton, Ross wrote:
> On 31 May 2013 10:30, Burton, Ross <ross.burton@intel.com> wrote:
> >> At the time of writing that weston didn't support runtime detection or=
 config files entries for selecting the backend, only commandline arguments=
=2E So whatever is getting picked at build time, you're stuck with that. Do=
es 1.1.x address that situation?
> >
> > Sadly, not as far as I'm aware.  I have 1.1 in another branch but it
> > totally broke GTK+ 3 applications (which didn't repaint after the
> > initial creation), which is pretty sad.  Relevant developers harassed.
>=20
> In a massive shock, the weston man page is actually useful.  Sadly
> it's clear that the backend choice is either x11 if DISPLAY is set,
> wayland-over-wayland if WAYLAND_DISPLAY is set, otherwise the command
> line argument finally falling back to the "default" (drm out of the
> box).
>=20
> So if we want a single binary that supports both DRM and fbdev, then
> we need to use command-line options.   I guess our startup script
> should handle this and we can add another optional machine-specific
> config file.

Is x11 backend working for you (e.g. in qemux86-64)?

I'm testing it with core-image-weston and modified mesa (to allow
llvmpipe) and with -Bx11-backend.so added to /etc/init.d/weston:

root@qemux86-64:~# /etc/init.d/weston start
Date: 2013-06-05 UTC
[13:47:50.300] weston 1.1.0
               http://wayland.freedesktop.org/
               Bug reports to:
https://bugs.freedesktop.org/enter_bug.cgi?product=3DWayland&component=3Dwe=
ston&version=3D1.1.0
               Build: =20
[13:47:50.308] OS: Linux, 3.8.13-yocto-standard, #1 SMP PREEMPT Tue Jun
4 22:29:53 CEST 2013, x86_64
[13:47:50.311] Loading module '/usr/lib/weston/x11-backend.so'
[13:47:50.317] initializing x11 backend
[13:47:50.318] fatal: failed to create compositor

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGvQkYACgkQN1Ujt2V2gBxWwgCeMpiyUwtycT+NBB0DAmu96twD
288An3/ZNXzUBTs8KgLQAtkUKKHkFqFy
=KpKU
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--
