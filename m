Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbSVb-000507-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 09:51:43 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3040672eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5++bl7L0YFXImzu4VGgYQfl345ZeXpacTT4sMqYBufg=;
	b=LyzlNN0PMl2e8LQdd8P82cAIh+vMZqOdQxs+ii6ubCHcxoWbWg9XoCZoZfqbOdNQ7Q
	fY4r+GXnXheZeSAvuk8BeohqPGK9K1VEQjruk+kOdQrcwULDeK8mjHVYA44rCB6wusqa
	et/nGVSIwYal5tdRE9CXKEr5+4+on3asMdvh6gZi0B4xjXoQzLInkdH3NSi76pghPv1B
	mlvdIgYluGBjA7tVSU0iGwptWVfcmo/04NuBolpgg+QA8fQ2SAEXXBc/GyDkZDYijIaL
	8ClIWacBuyzBISOrHmnRyiIvfkwAILjp56/elojTOX7gYL/x5d+4PEU5+HJmVzK38l6F
	B9SA==
Received: by 10.14.223.200 with SMTP id v48mr55449606eep.24.1353573457792;
	Thu, 22 Nov 2012 00:37:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 42sm5627383eee.0.2012.11.22.00.37.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 00:37:37 -0800 (PST)
Date: Thu, 22 Nov 2012 09:37:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121122083735.GU12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <50ADE2F7.4070904@intel.com>
MIME-Version: 1.0
In-Reply-To: <50ADE2F7.4070904@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Thu, 22 Nov 2012 08:51:43 -0000
X-Groupsio-MsgNum: 31651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KAk/33nSS6LK84p9"
Content-Disposition: inline

--KAk/33nSS6LK84p9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 10:31:51AM +0200, Laurentiu Palcu wrote:
>=20
>=20
> On 11/21/2012 06:20 PM, Martin Jansa wrote:
> > On Wed, Nov 14, 2012 at 03:21:10PM +0200, Laurentiu Palcu wrote:
> >> > This new recipe is needed because the old driver is unmaintained. Th=
is
> >> > new recipe will follow the new repo.
> > On which MACHINE did you test this? Here it fails in do_configure with:
> > | configure:18796: result: yes
> > | configure:18808: checking whether to include DRI support
> > | configure:18812: checking for /usr/include/xorg/dri.h
> > | configure:18818: error: cannot check for file existence when cross co=
mpiling
> >=20
> > So I'm wondering if it was tested at all.
> >=20
> Martin,
>=20
> I remember that I clearly mentioned, in the cover letter, the commit
> upon which I applied the patches before compiling the nightlies for all
> architectures. Here it is:
>=20
> "The yocto autobuilder nightlies (x86/x86_64/ppc/arm/mips) compiled
> successfully. Compilations were done on top of the following commit:
> 78983e939ab17f02f8911c8b0d0e326b419856b9."

Does qemuarm include this driver? I guess not. I don't know what exactly
is "autobuilder nightlies" but did it include xf86-video-omap explicitly
or just some generic image?

Also I cannot find this commit in oe-core as well as poky (I'm using
oe-core).

> At the moment I was working on the xorg upgrades this was the last
> commit... Did you try the patches on top of this commit? Does the
> compilation fail?

No I try to use master.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KAk/33nSS6LK84p9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCt5E8ACgkQN1Ujt2V2gBy5+ACfb+1o0AzOiViaJAoMHmCxFCTf
Ve8An0EiQoUXeUb75U85jg8z63Fcr52u
=I0ie
-----END PGP SIGNATURE-----

--KAk/33nSS6LK84p9--
