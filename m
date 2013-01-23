Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ty857-0005EI-5Z
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 22:42:40 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so3968961dan.37
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 13:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QKvpEV+hAKag40uqLIY9M+XFVsGek26Cr+hzs4B6ekw=;
	b=xQMSZ0Zcic9ek0Zs00BFOUlapoCh/GbyoeVwCxniv+hA0aufxcbMn/oXGIJvv4QtXw
	S9fmQij+omsNFstWhCPbA44gyWVuBYHeTH6w53Q0o7pajtu5L99XHbGbKrBMyaqXzIC2
	Tb/p2kYcWdmKh2Hj1TGsa7Q8e6y4DHxjIaXoqdpxOFCKfJArDh8q7c8c3vYo7DoHz9uK
	5MoO9dm40LbKxGaGaLku43VYbkNWLnOsfuoYB9CLJhc5ML3/0ezkIFHEVmT8X3obK4RJ
	rd0XTzswdi1YrnUMNTK/AtSDnJOl1l8uQgrzVkozZfPJisEiQVO+i8cqE9srGZ/SaYSS
	8S4Q==
X-Received: by 10.66.88.6 with SMTP id bc6mr8396473pab.5.1358976392522;
	Wed, 23 Jan 2013 13:26:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id us7sm13444101pbc.40.2013.01.23.13.26.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 13:26:31 -0800 (PST)
Date: Wed, 23 Jan 2013 22:26:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130123212632.GC14381@jama.palm1.palmone.com>
References: <2021B186DC632746BD5A3CE32F12BD289FCCF37B@EU-MBX-03.mgc.mentorg.com>
	<51005369.70401@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51005369.70401@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Belal, Awais" <Awais_Belal@mentor.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Openssl - config file not being pulled in on the install
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
X-List-Received-Date: Wed, 23 Jan 2013 21:42:41 -0000
X-Groupsio-MsgNum: 34303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2013 at 01:17:29PM -0800, Saul Wold wrote:
> On 01/23/2013 12:10 PM, Belal, Awais wrote:
> > Hi Guys,
> >
> > This probably went un-noticed because I forgot to put a subject the
> > first time around... my bad!
> >
> > I have a question regarding openssl. The openssl.inc file under the poky
> > package creates a -misc package which is not directly installed unless
> > either put in RDPENEDS or RRECOMMENDS. This package (-misc) contains the
> > openssl configuration file which is required while generating
> > certificates on the target otherwise the command says:
> > /
> > WARNING: can't open config file: /usr/lib/ssl/openssl.cnf//
> > Unable to load config info from /usr/lib/ssl/openssl.cnf//
> > /
> >
> > In an older version of the recipe attached here, the correct method is
> > being (this is my understanding) to get that file in on the target while
> > installing.
> >
> > Any guidance here would be much appreciated.
> >
> Based on reading some of the history and such, I think the best answer=20
> would be to move the openssl.cnf file to FILES_${PN} line, since=20
> ordering wise it will get pick up that file and it is needed, not=20
> recommeded.

Can you please use u-a for that config file if you decide to do it?

Some recipes want to provide own openssl.cnf which requires bbappend
like this one:
https://github.com/webOS-ports/meta-webos/commit/f2650858ae6f78b016107e622a=
b7be8a67e954c7

Cheers,

>=20
> We would welcome a tested patch.
>=20
> Thanks
> Sau!
>=20
> > BR,
> > Awais Belal
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEAVYgACgkQN1Ujt2V2gBy/twCgtE8Kn9xoWcAc94kNjKE4RVru
JKUAniG5g+z02qlIY+aBDF544kpCFIk4
=8lHs
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
