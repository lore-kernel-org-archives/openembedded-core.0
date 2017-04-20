Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB1A72F39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:03:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so10694803wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WAQslSHI10JeqrGCbiXG8jb1wuXx5C11Q7e4WubKT0Y=;
	b=c9eEZ4VcGLWZUc+BEQjOPRUoKjB4hh+7JVzOwWwuZRTlkthVLYrrclGiHo877TnI9N
	7uDiLXbOFJhjI4YyplFQudgxB3aB82GPKXoU9GhAnTt/WZS53dEeaBpTFcJzYYlqBOJQ
	lq/bjEG4KKAOg24Un0xe92sUBKmZwFuYGhQsGHfxF72hKvumVf43VPB9SkQEeZk6CA2V
	Wb3QeAz1PTLVAA9HNxKY+pN1iZ/vGyWLNw1KZPHnJa8+uKqJJS5SjW/hzSvEg69v1wwv
	0LOl1oCaZ2MFMLGy4lWaQShr/FreOJKHovUY1VHHWBINh6ksqEnVGCTZJ7wEatWrlPkT
	HN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WAQslSHI10JeqrGCbiXG8jb1wuXx5C11Q7e4WubKT0Y=;
	b=eV0bWMW7rqDCMTnhkYZe8mVsaDF1h6Ch7b0cYz3ChWxXBECnHEgBNbbHF7JGP3qdV7
	nsxiDGMrUTaX0E9mr2NSOp6aCCCRBdsV3u1/tv0nrzX4ONtMSR+exrxDTX8GqIp5jHQY
	p7hBEsr+xNHqlPz/Za6RUcwt8cfDFqsyHrwXTq4YV7mPwaN2rOAILFdoUsWqp714Mc6x
	r8B6ld9R8XjRx6CTDnxG1CbVGXWx6SXOPeqtcWA2/c4qaVQn7nojiXOenQ8WJRa5UNES
	5rhuCJrxDfQFRBWsfWtsleml+r+nQtqEyQDpX1XMPqBcn3eLBWyae0nr1Wdaa6PICOrq
	0AJg==
X-Gm-Message-State: AN3rC/7hZE7TUr/ze5J7FWupQa5dpfK65UUPhKL41Q44TAr8vCTr/ZgJ
	Gm8NrSpk7TnZbw==
X-Received: by 10.28.93.13 with SMTP id r13mr2994511wmb.136.1492693433762;
	Thu, 20 Apr 2017 06:03:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z38sm7571752wrc.36.2017.04.20.06.03.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Apr 2017 06:03:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Apr 2017 15:04:00 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20170420130400.GC3059@jama>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
	<5023360.N8L8OyXh3V@crde-port-20.cahors.local>
	<d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
User-Agent: Mutt/1.8.1 (2017-04-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Thu, 20 Apr 2017 13:03:53 -0000
X-Groupsio-MsgNum: 96483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline

--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 03:37:24PM +0300, Alexander Kanavin wrote:
> On 04/19/2017 04:03 PM, David Vincent wrote:
> > The problem is that I must be able to manage the configuration of a mac=
hine
> > without physical intervention and only via package upgrades. A new
> > configuration can be applied simply by incrementing the PR of a configu=
ration
> > package.
> >
> > But maybe this is a use case only needed by me and I should manage it i=
n my
> > own specific layer ?
> >
> > Now that I think of it, I have the same kind of problem for all machine
> > specific configurations. For now, I just replace the PACKAGE_ARCH in my=
 BSP
> > layer with a machine specific one to indicate that a package contains a
> > configuration valid only for a specific machine. Maybe, in a future rel=
ease, it
> > should be desirable to create -conf packages based on the CONFFILES var=
iable ?
> > I don't know if it's a good idea, but maybe I could bring that up on the
> > architecture mailing list ?
>=20
> By all means please do so. Yocto lacks a solution for configuration=20
> management, and this was discussed some time ago, although I cannot=20
> anymore find where it happened. Mark, do you remember?

I still haven't seen any argument why not use u-a like for any other
alternative files.

All you have to do is create openssl bbappend (this part might be
integrated into oe-core):

inherit update-alternatives
ALTERNATIVE_${PN} =3D "openssl-cnf"
ALTERNATIVE_LINK_NAME[openssl-cnf] =3D "${sysconfdir}/ssl/openssl.cnf"
ALTERNATIVE_PRIORITY[openssl-cnf] ?=3D "1"

And then in your recipe which provides alternative config add similar
fragment:

inherit update-alternatives
ALTERNATIVE_${PN} =3D "openssl-cnf"
ALTERNATIVE_LINK_NAME[openssl-cnf] =3D "${sysconfdir}/ssl/openssl.cnf"
ALTERNATIVE_PRIORITY[openssl-cnf] ?=3D "10"

And that's it. We're using this for last 4 years since:
https://github.com/openwebos/meta-webos/commit/b13980be3f28bf60582ec3f691e3=
92db03942e21
and it worked fine until this oe-core change was merged (and I had to
undo it in the same bbappend).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPixvwAKCRA3VSO3ZXaA
HItvAJ9PU6/1tjp9rGN/uX/em8dY42vFZACgjdx6ifLn3XobRM5/FppEt+dA5Pk=
=WGX8
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
