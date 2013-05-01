Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UXcTK-0002Vo-GL; Wed, 01 May 2013 21:14:16 +0200
Received: by mail-pa0-f47.google.com with SMTP id bj3so996663pad.20
	for <multiple recipients>; Wed, 01 May 2013 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Vz9QGbns9X7s3euur1dnVlyak6BB2AepHpTih1mX5Ac=;
	b=o4qSx+mjX7iV0rM76u4g1WEQQXrqmSFnGHX4fcQV4lmCpo1SixAYdIpbAy6xzWa53s
	uSbWlIbt1t9WMeVHRAhncfxtza1V9QPIOcuaksoMYBjGHLDaPFw5GFHzkdwiHLfghCDy
	JCPv52buj3Y2tt5E+r3QfUABTuF8EtRQEG1WKBLa1vepcn32c4Hy9KPGHMqV9wlHmA/U
	p/qrAeZj17nBBC6SyXMADUWpx+hMzedWwI1jFr+Yf7er2qfM+XJiWesm0R8IC7lhcK0B
	SGIdL7uvVjs7gdW68ZBhiXLZEDE5Jkpg4a26+v1SlUc8vZ9bfv5YXRPlZSqzhDHfK8/o
	mAZg==
X-Received: by 10.66.145.166 with SMTP id sv6mr6511117pab.1.1367434553200;
	Wed, 01 May 2013 11:55:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	hp1sm4742846pac.3.2013.05.01.11.55.49 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 01 May 2013 11:55:51 -0700 (PDT)
Date: Wed, 1 May 2013 20:56:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20130501185607.GF3184@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<924E0E65-7A58-4F98-84F0-0A04BC9F2C23@gmail.com>
	<CALbNGRTtwRSzpGtQuuKhSzST3dxALZObNPtVEXan-+-O5YV8dw@mail.gmail.com>
	<CAHUNapTLCo5YU_=U9cgYqfcLR5amYtpD0UDe0T-Y_+=81Kt37w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapTLCo5YU_=U9cgYqfcLR5amYtpD0UDe0T-Y_+=81Kt37w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 19:14:22 -0000
X-Groupsio-MsgNum: 38600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m0vRWufqUC70IDnR"
Content-Disposition: inline

--m0vRWufqUC70IDnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2013 at 09:12:07AM -0400, Trevor Woerner wrote:
> Would contrib/jansa/test still be the most up-to-date choice for
> building against meta-openembedded?

Depends on what you want to test.

> I just want to make sure I'm not duplicating existing effort.

My jenkins builds are from jansa/test branches, but not from contrib
repo, but from repositories here:
https://github.com/shr-distribution
These branches have all the stuff from jansa/in-test branch, but also
some other stuff like now gcc-4.8 and newer binutils picked from oe-core
ML to test them again with world or some patches I want to test in
world, but haven't even sent to oe-devel ML yet.

If you want to test whatever is in my queue from patchwork
http://patches.openembedded.org/bundle/jama/in-test/?archive=3Dboth
then you can use meta-openembedded-contrib/jansa/in-test

You can also test master branches, but there will be big overlap of
issues my and your builds are reporting.

Maybe start with different architecture or libc or something like that
to cover more ground.

My builds also have some extra setting above distro less defaults, it's
dumped with every build, for example this is from last one:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30430_170512.log/world_fixes.inc
so all my builds are building with systemd enabled, this won't catch
e.g. unpackaged .service files QA issue with only sysvinit enabled..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m0vRWufqUC70IDnR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGBZUcACgkQN1Ujt2V2gBydNACgq4VPLoP7yMePWZYzqWSnLIIC
x7EAn3J3swUgKctbA513A5C9XUQVUfII
=SS2S
-----END PGP SIGNATURE-----

--m0vRWufqUC70IDnR--
