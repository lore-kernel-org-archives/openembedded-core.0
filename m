Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB93771CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:37:08 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b205so163519783wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KBj18jf/vnFeTz5MuAPOMkKaxohZSiuPWhcrr9HcGfI=;
	b=bgaGhvCWlF/+yTBwuGoisu3a65EnNAiD2/+nfJUzplLcoHXGhvCWOVMqOjjdpQsgk5
	1Mq4kBlmExiPTB3yEm+dQe6Iw4sMSvgWHGwSit+rnQXiDp+GQ4/MsF5GLC4oTVK3BK8u
	jhvJ5nmJVhxLBpSeZGKI9ayHY9Bi7b9QoddDwRDDSzskICDbM6i6GfxCoC5MxU+a/S/Y
	XpiO0Ln9vQpmib6U9qYjHAUqeUthtyt4yJLP4uTEHOv+fZJAPOpv4WlW+++soYsuev6v
	MV9BCAWaj/07U4uG4R9J2/ebCdQFpofr47P7/IZMUILywtHugngibGih61wlU2BVZqSc
	0bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KBj18jf/vnFeTz5MuAPOMkKaxohZSiuPWhcrr9HcGfI=;
	b=k/7/v1meizkm/p1nLcYrDG0SyZZ8Hbhvsdr843EkEf/o/t+XYD2pp5XZk9H8y8nq4x
	345PnBiOSRptsoBxisKI88NWuiZX4nWQy8CYVx2xXmhtNS8K2OP/XjbtYufX7o9535k8
	ptoeZRrv/4GgIBsJYHvQF6onWvIQnZx+IYLPuywlH7O3lljDmvRRp3CA3Uvy7OwldsCj
	KuVfVTWlvTpl87/ZCXl42QiBQ/nnVTskR4uIfcBL2kMmkAWdqJVQxujbPn9XEa6yJCal
	sI+uiuS5aPyOWA3X58D3ur4/rGQaJ9O+0m2o9eYGHAjFJzQkXzlb4ldQsHGmjwvC66YV
	I48w==
X-Gm-Message-State: AG10YOSeLsJ02dL/gjYHU8Jqqk9MkvWMbvy9Jmrk2Ov48rffBvhfBUj2uZVI8ObmCUQrIw==
X-Received: by 10.28.23.75 with SMTP id 72mr13977993wmx.50.1456159029452;
	Mon, 22 Feb 2016 08:37:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v2sm21896127wmd.24.2016.02.22.08.37.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 08:37:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 17:38:01 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160222163801.GF6329@jama>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<20160222154912.GD6329@jama>
	<CAMKF1srkT1+nYhnjdtC15DyfWN-RRrjNbd0k1_gu578kg0XA1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srkT1+nYhnjdtC15DyfWN-RRrjNbd0k1_gu578kg0XA1g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Mon, 22 Feb 2016 16:37:09 -0000
X-Groupsio-MsgNum: 78485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline

--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 08:19:08AM -0800, Khem Raj wrote:
> Can you clone it outside oe

Yes, (at least now)

> On Feb 22, 2016 7:48 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>=20
> > On Sat, Feb 20, 2016 at 08:07:25AM +0000, Khem Raj wrote:
> > > Drop kconfig and options-group support
> > > Forward port cross-localedef support
> > > Assume ssp support in libc when building gcc-initial
> >
> > Unfortunately sourceware git doesn't like us, glibc is failing to fetch=
 :/
> >
> > ERROR: glibc-initial-2.23-r0 do_fetch: Fetcher failure: Fetch command
> > failed with exit code 128, output:
> > fatal: read error: Connection reset by peer
> >
> > ERROR: glibc-initial-2.23-r0 do_fetch: Function failed: Fetcher failure
> > for URL:
> > 'git://sourceware.org/git/glibc.git;branch=3Drelease/2.23/master;name=
=3Dglibc
> > '.
> > Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> >
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/=
glibc-initial/2.23-r0/temp/log.do_fetch.31233
> > NOTE: recipe glibc-initial-2.23-r0: task do_fetch: Failed
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLOWgACgkQN1Ujt2V2gBxAwQCglG/Zg4nKA1Iw/jBbpttGgBtz
zPMAoK5w3uY50bKZ5rzAciXg48KK7/Ja
=AEPM
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
