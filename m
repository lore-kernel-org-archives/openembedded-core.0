Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36DCA608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 10:15:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so11585496wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VKKARx2uxdQSUcqHePEmuPQjnNWTx0lyCvQ6qApIDAo=;
	b=KJYX6gy/A4RUpdmQDej8J6KXb6ETCLEJxmNsdld/oMaVPzLuLY4l553aEFlQKtzTpc
	ziSZEYjn5j5NAtNiGD+fnxskHpI1SY/D1Wqmdr2K0CurDAF9VmASy7llrTKjngGNlpKi
	EkfNuq2rvWBmFIbrgvdKmn9918DrP7FRWo9tVHY7tT25FH08bYuyo+Rxn3n7VzJDDCpg
	3BNlzuk2X95KwEWVhY4cTHNQe8yd2R1idJRBk7vjn8necJkhBjnqY+2r9EbPMK9uwL8J
	65PJE/I+D+xUsj9eK1uuI5ZLOcyv0d9CWyqLjO5HJi7VUYdb5g9WgcVNsy2wumHzb81m
	v+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VKKARx2uxdQSUcqHePEmuPQjnNWTx0lyCvQ6qApIDAo=;
	b=RDS2/mTwPDpxtYgl1m4B6g9uISHjV+v2WOeAOTF8BVxUlPe2o1ilO2Ao4c3MPfZ6C8
	9VJc8DY5mLX54a4UDx335ToTqk7F8l04kbEDRCCvrBX7Dm0bMcQwx2KzL930+hQOxkwJ
	Ut3HsRM7nY8F8PIKah0ov1he4gsYIBPH/BcfMXxjE+5uKTvNKlYZ3kLquhMqlKQ9gw9/
	tNKD1DUpFjm20bUbmBMzhMlXHRURw5u+xgZIwqHqfZiIy4Ky4cET3Im8QTbWM3/4PVDN
	zWcBgo4Dy04bZxz/eiewWh3gKYJOJvTRNGNRFvQLwm8MXWv5Xg24rD1rjD/FEB5f81YJ
	rRvA==
X-Gm-Message-State: AOPr4FX7kU8AXz5CyC3j7pMSo/IBuCTWg6preokOqeUvKkZJqe4m4lbV7ND+Acs60y5vTg==
X-Received: by 10.28.1.143 with SMTP id 137mr6193825wmb.17.1463566527794;
	Wed, 18 May 2016 03:15:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a75sm8299143wme.18.2016.05.18.03.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 03:15:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 12:15:56 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160518101556.GB2579@jama>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com>
MIME-Version: 1.0
In-Reply-To: <573C365D.3070407@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 10:15:33 -0000
X-Groupsio-MsgNum: 82285
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:
>=20
>=20
> On 05/18/2016 05:20 PM, Martin Jansa wrote:
> > On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:
> >> Hi Martin,
> >>
> >> On 05/18/2016 03:39 PM, Martin Jansa wrote:
> >>> See:
> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970
> >>>
> >>> Just using recipe checksum wont work, because the main reason for PR =
bumps is to
> >>> automatically upgrade the packages when one of the dependencies chang=
es .so
> >>> version, which you won't detect from recipe checksum of the app which=
 is just
> >>> using the library.
> >>
> >> For the development branch like master, yes, that would happen. But for
> >> the stable release like jethro and krogoth, it is unlikely that would
> >> happen, and if if does, the user can manually bump the impacted recipe=
's
> >> PR to fix the problem. The current problem is that when *all* recipes'
> >> PR are bumped, there is no way to fix the problem.
> >
> > You can still stop using PR service and start doing manual PR bumps, but
>=20
> We can't stop PR service and start doing manual PR bumps since we need ke=
ep
> update to date with upstream, the changes from upstream don't do the manu=
al
> PR, and I don't think that we have to if they can be done automatically.
>=20
> > it's quite annoying if you need to bump a lot of recipes you don't
> > control :).
>=20
> What's your opinion about only consider RDEPENDS for PR service's checksu=
m,
> please ?

I would like to have separate handler as described in that bug, option
c).

Not only because of unnecessary EXTENDPRAUTO bumps, but also unnecessary re=
builds.

> >>> On Wed, May 18, 2016 at 8:09 AM, Robert Yang <liezhi.yang@windriver.c=
om
> >>> <mailto:liezhi.yang@windriver.com>> wrote:
> >>>
> >>>      The PRServer bumps PR according to do_package's task hash, that
> >>>      causes it bumps *all* packages' PR when recipes like pseudo-nati=
ve
> >>>      and rpm-native is changed. It is a very bad user experience when=
 we
> >>>      run "smart/opkg upgrade" on running target, for example, when we=
 apply
> >>>      a CVE patch to pseudo-native or rpm-native, or do some slight ch=
anges
> >>>      in their do_compile, "smart/opkg upgrade" will download/install =
*all*
> >>>      the packages since all of the packages' PR are bumped.
> >>>
> >>>      Here are some rough suggestions to fix this problem, and please =
feel
> >>>      free to give your suggestions.
> >>>      1) Do not use do_package's task for bumping PR, the easiest way
> >>>          is simulate manually bump PR -- only bump PR when the recipe
> >>>          itself's checksum is changed.
> >>>
> >>>      2) Add a new task for PRServer, redefine its task hash for bumpi=
ng
> >>>          PR, for example, this task hash only considers RDEPENDS (no
> >>>          DEPENDS), and drop any native dependencies.
> >>>
> >>>      I prefer the first way, and an alternative way maybe add a var s=
o that
> >>>      the user can configure it:
> >>>      PR_CHECKSUM =3D "${BB_TASKHASH}" (current way)
> >>>      Or
> >>>      PR_CHECKSUM =3D "<recipe checksum>"
> >>>
> >>>      --
> >>>      Thanks
> >>>
> >>>      Robert
> >>>      --
> >>>      _______________________________________________
> >>>      Openembedded-core mailing list
> >>>      Openembedded-core@lists.openembedded.org
> >>>      <mailto:Openembedded-core@lists.openembedded.org>
> >>>      http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8QNwACgkQN1Ujt2V2gByTtgCfR04LxtXUA8FBLn8QLmyRyLKZ
ecwAoJ0v0iU404KiTb5ZSA4XXheA6oLo
=vJDA
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
