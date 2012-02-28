Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2MFp-0006zW-PB
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 13:34:05 +0100
Received: by eekc1 with SMTP id c1so733282eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 04:25:35 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.28.70 as permitted sender) client-ip=10.213.28.70; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.28.70 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.28.70])
	by 10.213.28.70 with SMTP id l6mr295457ebc.118.1330431935590 (num_hops
	= 1); Tue, 28 Feb 2012 04:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XC/TDfSqezzhWKEY1Ak3jVY3jXXh3IabqM1stqg79ZM=;
	b=fazWHPPIuiw5mso1FobJbV5ge19ASury6811jwSG04eEkkQJCLQ+xQsipgZ1i0Z9F5
	VRlemGAiTo3qjPExoIKbboPUlv85UH4uR/buLFH0uY0qgAK3Zl3Kmlgiaa3e3cm1qpIE
	9R0sonc1VkuCd6zykY61QxtaIa90CxU7WfZR0=
Received: by 10.213.28.70 with SMTP id l6mr218860ebc.118.1330431935501;
	Tue, 28 Feb 2012 04:25:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm69853016eeb.4.2012.02.28.04.25.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 04:25:34 -0800 (PST)
Date: Tue, 28 Feb 2012 13:25:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120228122532.GB3910@jama.jama.net>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios> <4F4C279E.8020801@opendreambox.org>
	<CAP9ODKo=z7tARxZ1yc0sFWf8nhnPn7px9WwyGOJHksC7shqTnw@mail.gmail.com>
	<CA+chaQdCwS+hwFrt+wcBts3B_jewa1mF_P8JpehySaCNwv-Qwg@mail.gmail.com>
	<CAP9ODKo5gwuL+mvhUPiCSYm3pa89gvwR-LvRuOs0Eq0-ZnMqmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo5gwuL+mvhUPiCSYm3pa89gvwR-LvRuOs0Eq0-ZnMqmQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 12:34:05 -0000
X-Groupsio-MsgNum: 18141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 09:16:51AM -0300, Otavio Salvador wrote:
> On Tue, Feb 28, 2012 at 03:50, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >> Not really; let's say if you had done a typo on the depends list it
> >> would be unnoticed in autobuilders and commited onto master.
> >
> > I see your point, but OEBasicHash will notice new dependency and then
> > it will be rebuild
> > at least by poky autobuilders (if they are building qt4).
>=20
> We're not using auto PR yet so let's keep the regular flow for now.

I'm not agains PR bump I'm just saying it would be rebuilt with
OEBasicHash even without PR bump.. and without PRSERV

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Mx7wACgkQN1Ujt2V2gBxorQCgta0vik4YT2FRe5GOs8iMJPd5
/eEAoLOTkrp6sskJHWfRQ0Zo8npZv5gW
=WvQB
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
