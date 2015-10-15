Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id F11CC77085
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:31:25 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so14512334wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w/UWN/dXbYadqovFi99LUBHTigAZ53hF4ZqqTJNHqcs=;
	b=03+IB3QBIhGAHRvHJTIFGCthj0p2bS2fKRYnxqLF4jCDlFxaAqB/ghn9561JiYQy+5
	FTOhWxiF0ZRULmF2wRFvCBh6YfkI9VWnLZDhUwXxRFwOhkWXdxpnBu6yfKQwVKsjIr9D
	U3GbcbqR5L6qmgjHOLWRYwIGzhU1n4syzl2Iwf+cumWHrkj5HvBtohsoGbMmRVJv6I2P
	3pHtA2be9WQWC0pbk755UDgyrnbEjoL4AyRNdo8BF3DJaRhBStwOD62uDqcG94FX+WPR
	/tyfq8XyjwvHO2jIw3T4HcHv6heJTQ9UWLp5d4e9CGr48UpOlVdymYz5J/GjvUa+T/kZ
	8gTg==
X-Received: by 10.194.52.67 with SMTP id r3mr11729379wjo.51.1444908685668;
	Thu, 15 Oct 2015 04:31:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lk5sm11067698wic.0.2015.10.15.04.31.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 04:31:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 13:31:47 +0200
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151015113146.GB2588@jama>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
	<1444906192.5251.63.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1444906192.5251.63.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 11:31:28 -0000
X-Groupsio-MsgNum: 72220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 11:49:52AM +0100, Phil Blundell wrote:
> On Tue, 2015-10-13 at 22:37 +0200, Jens Rehsack wrote:
> > When enabling tune for arm926ejs, poky optionally appends suffixes=20
> > for thumb and dsp support. Since sometimes arm926ejse (ARM code) and=20
> > sometime arm926ejste (thumb code) is used in PACKAGE_ARCH, allow=20
> > both.
>=20
> It seems like it is a bug for "arm926ejste" ever to be showing up in
> PACKAGE_ARCH, and it would be better to fix the packaging code to not
> do that.  ARM926EJ-S is a CPU not an architecture.

It's package architecture for binary feeds with -mtune=3Darm926ejs and it
can be built with or without -mthumb, that's why packages can be built
in arm926ejse or arm926ejste package feed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYfjqIACgkQN1Ujt2V2gBxc0ACghaUsYLr8oT4fy4fqGKS1i5/E
+ZYAniG3W17l86IX72ze7mdz9qw9C2T0
=K08A
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
