Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtEBt-0006tD-AI
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 10:13:05 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so242182pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 00:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CNoydgkL6AyeprEAAEgKbP5aY2M5Oa2JJ7x6VG5y7Gk=;
	b=arH5cdy5NLxyoKRK6C4NceFuS516Q1S9fE/wqwTnjzQGw4QwoDYZC/CmWRIbC3Xc1i
	Djagj03YxIvipbbbWZMwHZw1/gA/70lftQF8rqRTIEJrMtI2/MdRATh7CfqN3aQQ+j4t
	7RA115GdUtgHAnkfp7e05Guh4txQEIBUnC/NJ38ayn2pYeZY7HtKu7cvyF/HqUq3Bk3I
	vLjpOWXyl4uWDSO39ZKxIATaRwzHdebnDPdYqxEzM4Md/adV/Eu2sygHkB4atldkhIH0
	6kVsp6TlXcaIpzBX/hxgL/gnCjYwlQUDHWvvaPlSRLwrPnKd3eBf49jkAeEL6FI0ssQb
	8Vww==
X-Received: by 10.66.9.2 with SMTP id v2mr195596455paa.18.1357808255209;
	Thu, 10 Jan 2013 00:57:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm722667paz.32.2013.01.10.00.57.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 00:57:34 -0800 (PST)
Date: Thu, 10 Jan 2013 09:57:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130110085738.GT3722@jama.palm1.palmone.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
	<7782F5CBD39246A3A6204E6FE729FD71@intel.com>
MIME-Version: 1.0
In-Reply-To: <7782F5CBD39246A3A6204E6FE729FD71@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.10
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
X-List-Received-Date: Thu, 10 Jan 2013 09:13:07 -0000
X-Groupsio-MsgNum: 33658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N7HXVILz59yg1nI8"
Content-Disposition: inline

--N7HXVILz59yg1nI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 07:56:30AM +0000, Ross Burton wrote:
> On Thursday, 10 January 2013 at 07:15, Iorga, Cristian wrote:
> > Well, I have the prior art stand by me.
> > The same technique is applied for netbase.
> >=20
> > And, in this specific case, connman should be machine specific.
> > Can you please give me more detail?
> >=20
> > The configuration file will have only the interface blacklist enabled i=
n case of a qemu* machine.
> netbase is a lot smaller than connman. =20

and also listed in SIGGEN_EXCLUDERECIPES_ABISAFE

>With this change you're rebuilding connman per-machine instead of sharing =
the package between compatible machines, with the only difference being a c=
onfiguration file.

And rebuilding also all stuff depending on connman.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N7HXVILz59yg1nI8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDugoIACgkQN1Ujt2V2gBwwtACcCH1TM+e3lPcGsI2poVR9xHDB
ul8AoJRUd1r0sByfJothcVga4Vettex9
=sG0t
-----END PGP SIGNATURE-----

--N7HXVILz59yg1nI8--
