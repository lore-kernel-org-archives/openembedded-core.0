Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8D06017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:21:55 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so12630832wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qhyOLlxy85A1B4DACGSs3pjxUsdaOYds1+6uCGPzXuo=;
	b=hmlwbN+MNri8SVu4DbVg/BnrIpxlMlBkPl37juAC8gMz9nmMOnLLfPQ6DxPTGQxmu/
	fIAhtD+eEstPDBj6AKwRWLy0eVuk4fq8zRc8n0Kn3fwiH92WXnqi/ZWYbFXBeaQ3cttR
	c+sIzCPWDGAvOHmV0tzD8YNhpSTBjWPVxp0xm8sOyuypYoc3xNBEdAcZjMWs+IBgIZOR
	MVGZfsGWOiFStG6kqgrEDlv3zR6+FJi5A5OazGlVRTITqx8kz8sN8+kpLPLiM8TjPFSm
	VyxzR8arVXkpDstdUyk9XDijtCXkUVF7k6doHrLkmk/gE6/c65HXGaQYiNutJHy+xs6P
	BMCQ==
X-Received: by 10.180.215.8 with SMTP id oe8mr4727369wic.0.1436530915113;
	Fri, 10 Jul 2015 05:21:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wx9sm13397590wjb.6.2015.07.10.05.21.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jul 2015 05:21:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2015 14:22:14 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150710122214.GD2397@jama>
References: <cover.1436452048.git.cristian.iorga@intel.com>
	<ffb48ef3e2d7e9eb1e0adcff1226dd77b9b10553.1436452048.git.cristian.iorga@intel.com>
	<20150709143248.GC2446@jama>
	<CAJTo0LYjQBPh1qBRvrasYTyknaVG+hKbxmS8kcFpRjrgrjgxKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjQBPh1qBRvrasYTyknaVG+hKbxmS8kcFpRjrgrjgxKw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Fri, 10 Jul 2015 12:21:55 -0000
X-Groupsio-MsgNum: 67807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline

--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2015 at 04:09:59PM +0100, Burton, Ross wrote:
> On 9 July 2015 at 15:32, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > aren't github archives regenerated from time to time with different
> > checksums?
> >
>=20
> Yes.  I keep on meaning to write a QA test for this. :)

FWIW: someone in systemd herd said that now the archives on github
should be stable as long as git-archive is stable.
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg33014.h=
tml
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg33015.h=
tml
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg33017.h=
tml
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg33016.h=
tml

Now they are using them instead of proper tarballs:
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg33054.h=
tml

> Cristi - if this is the best libical has as a tarball release then we
> should do a proper git clone.  Amazingly, the download button on their
> website links to a tarball of master which is borderline reckless.
>=20
> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWfuPQACgkQN1Ujt2V2gBzE/wCgmz73dz9rQFtQxbHjEUsjYf4U
698AoIBb52Sm7mmdGrF1wJ09kVe5UfU4
=UeiC
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
