Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 306F96FD3D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 10:48:17 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u57so3721366wes.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DNU5Bg9fFAkA2BmxiJBvBvq/vByR4D599yxRf0N3nnY=;
	b=nRFOVGBj5Xa31tvUAPQF2FPV++ijsAaaQhVxAucgCBcTGEMBUN54ZzSeNLCB8SlZjX
	8j1H9V7+eplu7a8dGa1Wjv+9quHAoUV6XqV/jFpGTzulzUli7AvkbNftc2xe9/P34g26
	14glGwSkNOwHrbLPLEP2RPLfQ+nwjWMbg9pvV0EhY+HnBF05YsGYGu6Ygp/JV2rN4dqt
	zYF5sc0iUw+6g4+ivwu+yuJPv1xvpEwyf7FShea4HbJ5fAn3mjDPbMd5ut7AEIpYriWH
	7LrOIUPlZ6+PQRlxD9u1xWCaUUoo0a9LXo7q2OG42tBPj+P7cVm+ml7d5mt/0BBU9ZEg
	lUtg==
X-Received: by 10.180.149.240 with SMTP id ud16mr11983331wib.3.1402742898241; 
	Sat, 14 Jun 2014 03:48:18 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id 47sm10255294eed.35.2014.06.14.03.48.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jun 2014 03:48:16 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Sat, 14 Jun 2014 10:48:14 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140614104814.GI24880@gmail.com>
References: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
	<1401290390-5959-3-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1401290390-5959-3-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/2] package_ipk.bbclass: Support hierarchical feed
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
X-List-Received-Date: Sat, 14 Jun 2014 10:48:19 -0000
X-Groupsio-MsgNum: 54113
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Content-Disposition: inline

--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2014 at 03:19:50PM +0000, Paul Barker wrote:
> This patch allows for an optional new layout for ipk feed directories whi=
ch I've
> called a 'hierarchical feed' and is based on how Debian pools package fil=
es. It
> is disabled by default and is enabled by setting IPK_HIERARCHICAL_FEED to=
 "1".
>=20

Has anyone had chance to look at this and see if they think it's a good ide=
a?
The other patch in the series has been merged but I haven't had any feedbac=
k on
this one to say why it hasn't been merged.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJTnChuAAoJEBwoJlo7UPQDVqkH/i/GJISjjIOJy/x/1Rs3S0OX
ZEmhKuLQL/74P0RFfNy8mtDC/wwTbh79EBFoxzn2lETACXXZHdmayJq0RsEZz8na
tqqNcRxcV2d/ezQozD5G/4vvMUdPDtZHhypDMWQCQKUZ/Vtz2EfoiF1TYP4pqoZF
vd82kq17F/MTtdk8jWCt6J9McONGXsVsr+3rXySEJotEnNkWC44nSy6UCXypi+Zm
xHZCdMUYvfC51aJLyuUkFcpHNtSRx2sv0U/yy/wVgBLsMygNC//PWa38J/6wE23y
akrHj/bTQmL683fuTg+z1nr0XbPWA/O9x6oa3l5NB7f63eqa1teiPe9QRrExf+g=
=nAul
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
