Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U8J6Z-0001Nw-Hw
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 00:29:54 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so3134008pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FcoOY9u36jHkbuaEEnaOW+iV9D1Vclb0xuIEMFX1hKk=;
	b=vujlIDoLE7sXovvncv3qK63UTUPcl+iBBx+GxhOxVs4qjFr37xrSn2JD5kDLRWtOkd
	mZbMVyCabQEv5rLToBAsL5DuPeSwxsAmdHe5kW8M3mT7+Tk1um4FC6BAFVbyYbHoclJ6
	SEbNLxQ0xV4J5mqwpnLIQzAGSwrJhMx2cBEruK7WToIMcc+iXzxgUvMFK0yo/mu47WwO
	5i7Vm/S/9+xSBt7eqhNKI2hU9/A64431uDCsYsSVXcQ15h0ZvVP749vJ0F7mGyoshOYY
	swKwSPDvU0I/TsXjXkwoDVdHO432Yc6GV+qPEAWhgFYBk9KPxv9zn43toKfO6VK2m7Bb
	HKLQ==
X-Received: by 10.68.220.133 with SMTP id pw5mr24394888pbc.126.1361402007657; 
	Wed, 20 Feb 2013 15:13:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm107210691pax.22.2013.02.20.15.13.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 15:13:26 -0800 (PST)
Date: Thu, 21 Feb 2013 00:13:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130220231330.GY3300@jama>
References: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
	<CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
	<5124E661.5030004@intel.com>
	<CAJTo0LYmwDKSvJAUPD-PcTC2eUkgOmT67jM=7ZShVVC5JXuS-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYmwDKSvJAUPD-PcTC2eUkgOmT67jM=7ZShVVC5JXuS-A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Wed, 20 Feb 2013 23:29:55 -0000
X-Groupsio-MsgNum: 35697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LEvbv2kWtJBEQZjR"
Content-Disposition: inline

--LEvbv2kWtJBEQZjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2013 at 03:50:09PM +0000, Burton, Ross wrote:
> On 20 February 2013 15:06, Constantin Musca <constantinx.musca@intel.com>=
 wrote:
> >>   Have you tried to build webkit-gtk against this? At one point I had
> >> similar jpeg update in my tree causing webkit-gtk build failure.
> >
> > You are right. The problem is that I can't upgrade webkit-gtk because t=
he
> > new version requires ruby.
>=20
> But we can cherry-pick any libjpeg fixes until we've bitten the bullet
> and integrated ruby.

ruby-native is already in meta-ruby

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LEvbv2kWtJBEQZjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlElWJoACgkQN1Ujt2V2gByl2gCfb7RqM6Au8Z6IYTARDEv3xwz9
H3cAnjKLccdp0eu/gskjZODef+5tElJR
=BuzK
-----END PGP SIGNATURE-----

--LEvbv2kWtJBEQZjR--
