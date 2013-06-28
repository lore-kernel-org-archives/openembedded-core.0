Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 013536A3EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 06:50:10 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so821021eei.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K9LwGaaBeYm1BTD5a8ahlQnVNfg1JihWlRz88w8GeTM=;
	b=PCJmprnjrbaRyJZx7uidCyRi2hDKuQ8bDkjI7jlKzkr6dNgue3/qcPi0W68lYCsZ5Q
	uZRrrpX+Y5JKUJ8/l5Rz2e0DUGGa16wmYhqys09KRwYphP8l7axSpRY3MjPaYwTxzti7
	+MNyVXyn4U3zCCw3ODOCgRnFfqXeFs6WUIenpHDa1RLYJSWn0wEK/F4997PH/AychhCr
	bvHCCMi0W1hvo8afnqLV+13F5kKxKaZ/l+forv37YDgkd3dEfK6gFPbaJex2crxh9OID
	KGalMh61vT9wiUZTZYZhqRmEErUtp7qviWo9cG57vkq1MmmAZegRm3INIwARKkH6FQti
	5iPg==
X-Received: by 10.15.109.200 with SMTP id cf48mr12347383eeb.46.1372402211114; 
	Thu, 27 Jun 2013 23:50:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm8536033eeb.8.2013.06.27.23.50.09 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 23:50:10 -0700 (PDT)
Date: Fri, 28 Jun 2013 08:50:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20130628065050.GJ3261@jama>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<51CA5F8E.9070504@windriver.com> <51CB1145.4060009@linux.intel.com>
	<51CCEF2E.6070800@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51CCEF2E.6070800@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] make DESCRIPTION support newline
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
X-List-Received-Date: Fri, 28 Jun 2013 06:50:11 -0000
X-Groupsio-MsgNum: 41067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline

--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 10:04:30AM +0800, Robert Yang wrote:
>=20
>=20
> On 06/27/2013 12:05 AM, Saul Wold wrote:
> > On 06/25/2013 08:27 PM, Robert Yang wrote:
> >>
> >> Ping for this one.
> >>
> > Robert,
> >
> > There were some comments on your patch set and I think an issue with th=
e ipk one.
> >
>=20
> Hi Saul,
>=20
> I think that you meant Martin's comment on the ipk one, Phil had explaine=
d to
> him, and it worked well with the opkg-utils.

I've confused DESCRIPTION and SUMMARY, but I was talking about this
change:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=3D7f0a7976c=
29b34feaf4f6b00f0a63626614d1c7d

And longer description here:
https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.html

So please make sure that your change doesn't break it, but with this
applied it shouldn't.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHNMkoACgkQN1Ujt2V2gByiRACZAfoGnCDVwwdPnELPZqFUDSeh
WbEAn0DKVXCTdinsqUatbm6HHLM6aM2d
=j2ii
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--
