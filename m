Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R2UWV-0005vR-GR
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 22:51:35 +0200
Received: by fxi1 with SMTP id 1so1150989fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V2s8CjCPz1DDzlNz+h/tqbePE/9MH+hUGDKxtl9yeSM=;
	b=Rgtx0LXEY6iKiXCB5PvrLUio0sTQFl1TTNIXltjjnnGXKCZ1GmCq2px2yz9cf6DDcX
	XcvzgLVJB5jxdXsE4E1kAhvVXSouKG0HzduhG2z2j/lGazN7r9VfO5X/YmLHozIjs9Gb
	NIjH2yGNiGNrNVRpxTedVQownOPmQ1B5XJJmQ=
Received: by 10.223.37.81 with SMTP id w17mr1483183fad.91.1315687589544;
	Sat, 10 Sep 2011 13:46:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a17sm5063795faf.22.2011.09.10.13.46.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Sep 2011 13:46:28 -0700 (PDT)
Date: Sat, 10 Sep 2011 22:46:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110910204621.GC5456@jama.jama.net>
References: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
	<4E6BA2E2.7090301@eukrea.com>
	<CA+2YH7uhXW=i+P1UMJRC6WLK_SNQnpoDFVi2dMUnveofKpHOWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+2YH7uhXW=i+P1UMJRC6WLK_SNQnpoDFVi2dMUnveofKpHOWw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: udev mirror
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2011 20:51:35 -0000
X-Groupsio-MsgNum: 9302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 08:17:21PM +0200, Enrico wrote:
> On Sat, Sep 10, 2011 at 7:48 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> > git://mirrors.arsc.edu/kernel/scm/linux/hotplug/udev.git;protocol=3Dhttp
> > worked here yesterday
>=20
> uhm it doesn't work, i have no errors in do_fetch but the git
> directory is empty (and do_configure fails of course). But if i do a
> git clone http://... it works.
>=20
> I did a bitbake -c cleanall udev but nothing changes.
>=20
> I'll manually copy the files to go on but i'd like to understand
> what's happening.

there is patch on oe-devel for using .tar.bz for 173 instead of git,
that's how I work arrouned it yesterday..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5rzJ0ACgkQN1Ujt2V2gBylYACgulkHV89oKhCL5LZGvEQ1sOZJ
oNMAn0SpO6UczCqcn+acUvOvz/4FCq0z
=nqL3
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
