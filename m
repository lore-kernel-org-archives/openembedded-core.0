Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1E261037
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:33:30 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so276283eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4iaZOYyO+Jl4mZ0+Nm4vOX3iirearbFMrp6olHMPCN4=;
	b=A0lIjERh3PyVr5zc5Zp2cPSiBQgbTHPdmJMkrAOWeghtrWqSsg222n6t9EPRRO3/bn
	fV/xPvWQ1oM+0nh1Ypw9xKA6SjfXqkH/033fimSLiz4Y4KgA5Roxin+BP74UUpHQTi5m
	VeASJ+pV23y+9wr9IWbDbB3AyZTMdHn5i2Hojkd3u3hh9e0okq22KmdbTKY/+NjZKVPM
	RgFJhcXknM2Ge+TYB2XDcyuhrcrV8gORqhjI6HUqvgipzMHYQQ7mJaoIuHKAd4deGSn6
	ObRKiIXfAxcfquPEmn+Wyf9A4Z562apDakRnC0XyQwTpJzssP9BoawCuA97/HHAy52L1
	4Deg==
X-Received: by 10.15.64.194 with SMTP id o42mr3003515eex.62.1376562811153;
	Thu, 15 Aug 2013 03:33:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm83295258eeg.5.2013.08.15.03.33.30 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 03:33:30 -0700 (PDT)
Date: Thu, 15 Aug 2013 12:34:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <20130815103422.GB17945@jama>
References: <520C9F8A.7080703@windriver.com> <2523779.jWvvpX7hhR@helios>
	<520CAA18.1080706@windriver.com>
MIME-Version: 1.0
In-Reply-To: <520CAA18.1080706@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 10:33:31 -0000
X-Groupsio-MsgNum: 43423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UbqA5qh2E+WCbFAw"
Content-Disposition: inline

--UbqA5qh2E+WCbFAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 06:14:48PM +0800, wenzong fan wrote:
> On 08/15/2013 05:44 PM, Paul Eggleton wrote:
> > Hi Wenzong,
> >
> > On Thursday 15 August 2013 17:29:46 wenzong fan wrote:
> >> We have seen some problems like this:
> >>
> >> $ bitbake libcap
> >>
> >> ld: warning: libaudit.so.1, needed by .../lib64/libpam.so, not found
> >> .../lib64/libpam.so: undefined reference to `audit_open'
> >> .../lib64/libpam.so: undefined reference to `audit_close'
> >> ......
> >>
> >> The libaudit has been available and libpam build with it, after we run
> >> another build with sstate-cache and w/o libaudit, the error occurs. The
> >> solution in these cases is to use PACKAGECONFIG to lay out dependencies
> >> on optional packages and make them explicit. We need to run an audit a=
nd
> >> catch all of these issues.
> >>
> >> A probable ways maybe:
> >>
> >> 1) Run world build to generate the sysroots as much as possible;
> >
> > (See Ross's reply for a pointer to the new test-dependencies script)
>=20
> That would be a good start point, I have run that script once, but looks=
=20
> not any failure occurs.

I don't believe it, see "State of bitbake world" thread where I've sent
results from last 3 executions.

There is plenty of issues for everybody :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UbqA5qh2E+WCbFAw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIMrq4ACgkQN1Ujt2V2gByc0wCeKiJqJod1Alk3tW5CvQqsZuuA
BaYAnjmNjEh8wtwOSga2kyDzplf95EqV
=z73o
-----END PGP SIGNATURE-----

--UbqA5qh2E+WCbFAw--
