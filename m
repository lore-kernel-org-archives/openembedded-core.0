Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvtVE-00055V-OC
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 18:43:49 +0100
Received: by mail-pb0-f51.google.com with SMTP id ro12so1516089pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EYSn5AQWCfJ2TnQ129evF2+31JEtCttWY8Icktq3WVQ=;
	b=Hg+teOnLNptZ6nGu7sQJE5tFhgOElvzjkt3KMu/LCGZ+RBVgRC4nbaOrnZdAVOJ37M
	GtqCr5q3FQfaI462hm5MFC7B3CNfZ1no7JZaLGQJ/VRC6NNZplDIA10vNcxnikvmGO9s
	2uBB81wa6vMtju/KUmtNl6o/vpFlrcDRtdC7H4FLYUhjCtzf0ftXPT9oh6Y9R9oC3RYu
	l6HJnxZpaycgOGTvwxI/tE+ccckEZiVhXfjw0CnyBsqQk/UBZJCTL9uxGOPSMGTy2Aht
	Xe3UHCr4qjEO6k78xN4fBINNqjPrpXp18lwWFqP4ZVFPl5OYVJgrh2b0Wq9Guc9kdEZ1
	DI3Q==
X-Received: by 10.68.251.136 with SMTP id zk8mr15386093pbc.82.1358443704597;
	Thu, 17 Jan 2013 09:28:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i5sm1683501pax.13.2013.01.17.09.28.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:28:23 -0800 (PST)
Date: Thu, 17 Jan 2013 18:28:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Message-ID: <20130117172817.GK3067@jama>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
	<065b01cdf4b6$e1510160$a3f30420$@st.com>
	<20130117134619.GI3067@jama>
	<068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>
MIME-Version: 1.0
In-Reply-To: <068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Thu, 17 Jan 2013 17:43:49 -0000
X-Groupsio-MsgNum: 33983
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline

--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 05:59:00PM +0100, Giuseppe CONDORELLI wrote:
>=20
> >-----Original Message-----
> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
> >Sent: gioved=EC 17 gennaio 2013 14:46
> >To: Giuseppe CONDORELLI
> >Cc: 'Giuseppe Condorelli'; openembedded-core@lists.openembedded.org
> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir
> >
> >On Thu, Jan 17, 2013 at 02:30:55PM +0100, Giuseppe CONDORELLI wrote:
> >> Hi Martin,
> >>
> >> Do you mean applying the patch you highlighted in libc/configure?
>=20
> Hi Martin,
>=20
> Please untar the attachment and run the test I sent you.
> It reproduces the same scenario as in the libc/configure eglibc file.

Ah I see it's not used as regexp.

But doesn't upstream have some good reason to require 2.20 and newer?

It was incremented from 1.17+ to 2.20+ in
http://www.eglibc.org/cgi-bin/viewvc.cgi/trunk/libc/configure.in?r1=3D17195=
&r2=3D17385

Cheers,

> >> >-----Original Message-----
> >> >From: Martin Jansa [mailto:martin.jansa@gmail.com]
> >> >Sent: gioved=EC 17 gennaio 2013 13:42
> >> >To: Giuseppe Condorelli
> >> >Cc: Giuseppe CONDORELLI; openembedded-
> >core@lists.openembedded.org
> >> >Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc
> >> >dir
> >> >
> >> >On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli wrote:
> >> >> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
> >> >>
> >> >> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI
> >wrote:
> >> >> > > Fix routine to check as and ld version check in the configure,
> >> >> > > to
> >> allow
> >> >> > system
> >> >> > > to correctly check for version 2.1x.
> >> >> >
> >> >> > Does it build with gold now?
> >> >> >
> >> >> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
> >> >March/020310.html
> >> >
> >> >does it?
> >> >
> >> >--
> >> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >
> >--
> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD4NLEACgkQN1Ujt2V2gBza7QCfTg9Y3JqotGxN3Nua5Pij0zRG
DXQAniacxRAPor/yPPbNfFe7Gcgj4xz+
=mef1
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
