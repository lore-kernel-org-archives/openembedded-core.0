Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id E6F856B5D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:03:33 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so4179897eaj.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kh0CW6GT96IIKUKcmFVWDi2wAa/rUj/oTG5bJpq77IM=;
	b=AUYJo5Xvll57ZofbSY0n5fRwgLUi+ol+N3YM2Aiqjp0Al/CtutCVxA1kgfi1j9ctTl
	GXNXg79GlxD6fxx4FkprsGIbELHfrqqiXc2iBi/vfQaT9Yt0T6FMl0DYL8mfn8GUqfen
	xvDu7nL7UCBCDVvTbFKVU0G0Y1IQ1caVgA5jgYeLY4ZV7aCSrvY1jtzce1QSWCYzoSwR
	1MvdElXYlyrjFnEbHoMftSFaDWAwhFmiSk5G1Jgsv32UusD2XwwvyT0xnGD8HpGmXob3
	z2AvzYAMw3+CxU4bEEdEc7Xab/vBBzO4y1jH/qDHLgR9pRqj6pSINxhlX2bzNu6hh0Ri
	/McA==
X-Received: by 10.14.119.1 with SMTP id m1mr179339eeh.39.1385517813203;
	Tue, 26 Nov 2013 18:03:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm14547561eem.9.2013.11.26.18.03.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 18:03:32 -0800 (PST)
Date: Wed, 27 Nov 2013 03:03:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Message-ID: <20131127020336.GO2870@jama>
References: <72922584.TJuWgrnFYb@yiqingliang-pc>
MIME-Version: 1.0
In-Reply-To: <72922584.TJuWgrnFYb@yiqingliang-pc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel and boost will recompile every time
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
X-List-Received-Date: Wed, 27 Nov 2013 02:03:34 -0000
X-Groupsio-MsgNum: 47657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDuspjMMC1Ui5ypn"
Content-Disposition: inline

--NDuspjMMC1Ui5ypn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 09:51:22AM +0800, Yi Qingliang wrote:
> Hello.
>=20
> 	I know the kernel will recompile every time for recent update, and I=20
> found the boost will also do like that, even I have sstate cache in my ow=
n=20
> server.
>=20
> 	How to debug this problem?

kernel rebuilding was fixed few days ago, do you have latest revision?

You can use scripts/sstate-diff-machines.sh to "store" the signatures
and then compare them when you notice something unexpectedly rebuilding.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDuspjMMC1Ui5ypn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKVUvgACgkQN1Ujt2V2gBwmEQCfbVhqGoEDDns0qbSlBrNF6uM7
Fi0An3oDGYDbZMzpfRjfM9T8OFQe9g2G
=ITq0
-----END PGP SIGNATURE-----

--NDuspjMMC1Ui5ypn--
