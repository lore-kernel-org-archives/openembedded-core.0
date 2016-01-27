Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0A943758DB;
	Wed, 27 Jan 2016 15:44:09 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l65so150022079wmf.1;
	Wed, 27 Jan 2016 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ov/iUgQVQbfftyhbDp8un/NGgNfjM3+YDN3Fo9mL+wk=;
	b=c8tEWXiHnTfFkfDf0FBvUN2ik7v8ABIdPRcF6hmEhXJioVR+JW5q+643O/8SgEZVO1
	QGDMDq4uD40/topI0WJzeaUsgNp0uiJvvmUjY/1/mQ7272KrqYFteaIMlUKLUgz18j80
	fUZOugDUkuHJGmi6KK5W8JER46150ObUhuIyn8okXDgxIb9n4Ascor3Ou3kS8gkblxjX
	PlPNi3fdumnRRrhjrgf20pGRBUyU8XximhZQ7Kq5GEdi/VjH2hsIob2U+W1W9ZJMVYvm
	qvAA/BqY0M+7f/19fuhxMH61MDKqqC65fCOvM0yNfpqeL1wBkHuZeFmufnYb2/8eIOKH
	mYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ov/iUgQVQbfftyhbDp8un/NGgNfjM3+YDN3Fo9mL+wk=;
	b=D43gKa9CQCzCNSXG7YBcr+8d2YIdUYzZi3rRtGJFl+hhpJJ5kbJhdi/iokU/8CSoyQ
	MNsNtDS3S9rFDVlugDVPIJnFV1UtoYmtCdDa+XM/73H7DW2PCvz2FVTrgZF1J4QiOC8c
	ZSBE+enjmZ4CvlPo6eOWmrosTUOnpo2cynJaFaaYlB0zps+bEfiooFOkxVwav7D9feNU
	MhSZmwF6xkv4ehoyv5G/OJO+CoiFvyqtYyFdZ7x/YN/rKaUIDPn8s9ANDqX3ZOZVusai
	ay5QfvtmRXWa+yF1pTHgTHwqLH0EOk+58TcVMsgjHGu6+y+a5petocK8RsPLWz5Hqckk
	tpuQ==
X-Gm-Message-State: AG10YOSrvPiDMsQlJyFAXvNebb/tSC5Zm4mwDBZmj3EhrfKfIvi3GDENh8iOEOdOfs1eqw==
X-Received: by 10.194.6.98 with SMTP id z2mr29667151wjz.101.1453909449963;
	Wed, 27 Jan 2016 07:44:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m206sm8194735wmf.16.2016.01.27.07.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 07:44:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 16:46:21 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160127154621.GJ2574@jama>
References: <20160127141013.GE2574@jama>
	<CAJTo0LaD+n3yj+wQit+BQ+7jvsYPc2P8aUyLzC9kNwp8u2uChQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaD+n3yj+wQit+BQ+7jvsYPc2P8aUyLzC9kNwp8u2uChQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-25
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
X-List-Received-Date: Wed, 27 Jan 2016 15:44:13 -0000
X-Groupsio-MsgNum: 76989
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6THr7QwYWIbrk6Kt"
Content-Disposition: inline

--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2016 at 03:31:53PM +0000, Burton, Ross wrote:
> On 27 January 2016 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >     * /openembedded-core/meta/recipes-kernel/cryptodev/
> > cryptodev-module_1.8.bb, do_make_scripts
> >     * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb,
> > do_make_scripts
> >
>=20
> I can't replicate these with qemux86-64 and current oe-core master.  Do y=
ou
> have any idea what could be causing this?

linux-yocto is failing for me in various ways for last few months/years,
it could be related to some conflicts with linux-yocto-tiny-kexecboot

http://errors.yoctoproject.org/Errors/Details/30878/
http://errors.yoctoproject.org/Errors/Details/30887/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6THr7QwYWIbrk6Kt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlao5kwACgkQN1Ujt2V2gBzRigCeNJ5xSAbpol4H+PvoaQoWpU9p
CaYAoICL7OuX8RYkABIEN0oxkcUqtKsy
=xeXk
-----END PGP SIGNATURE-----

--6THr7QwYWIbrk6Kt--
