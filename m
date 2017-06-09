Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A991782DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 18:57:11 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id l75so23372262ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3YfKdthqReF20cMTGrxu94r7FzwXbXk8kF3OSYDdodk=;
	b=KJtxMKvBykaE9pnBG5KSFiua/JcnA+RdlrJiyPJDVGT3yVUcVlPaxFeDOyQ5UeIQOI
	Ej6/kgiYyUXKTCBlcQ32pYAtLOW2DjsgPKss5rJEW1ArW8b+lnMvdw0EEGu6y6+ItAxN
	HrPJivJQl1MM8M47RUslHs0jZJpECg8pN1OdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3YfKdthqReF20cMTGrxu94r7FzwXbXk8kF3OSYDdodk=;
	b=HJ79109bsmYAK0Q4JP7EnkFCvDLfl+juGs3ER7Aaz4lRwxNLeuZDpmAUA3R4Jipwfp
	jvH7owF9cz13dtV+VNb8pdtdWmaS58LHvQD9uT6iEwzZC6BM3om4TmwW8zH7s3NsVCla
	+vE2S6ukQb9mS2okG4H0nBh3Ft1sK8Wq7FGNBamggOE/JIVefVyzenpSXdlbh5u5Oc2M
	nH+qKdr+0pcLebG8uX1VCox8Y8jWZ1j+G+KBQe4WYpDjXW0TsLLdybLjk7ES6jM6QbS5
	ryKcmmE3JdovSxwgGIP6r5k/ke/NapRgBbTdqukAefFKn6jhVJTurCXDaUHAWtF1KTT/
	BQXw==
X-Gm-Message-State: AODbwcC1ktRdZ7u03W2ambsagzMUyX8op2d2tShKln0CaQ6Y1ULq5Mez
	+7xhjdwVHr5yz4Bc
X-Received: by 10.129.91.136 with SMTP id p130mr15556262ywb.176.1497034632632; 
	Fri, 09 Jun 2017 11:57:12 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id d4sm699238ywd.15.2017.06.09.11.57.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 11:57:12 -0700 (PDT)
Date: Fri, 9 Jun 2017 14:57:29 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170609185729.GJ10782@bill-the-cat>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
	<1496966441-30260-2-git-send-email-trini@konsulko.com>
	<CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Fri, 09 Jun 2017 18:57:12 -0000
X-Groupsio-MsgNum: 98476
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XScEFldhOcFHBV5"
Content-Disposition: inline

--3XScEFldhOcFHBV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2017 at 05:15:07PM +0100, Burton, Ross wrote:
> On 9 June 2017 at 01:00, Tom Rini <trini@konsulko.com> wrote:
>=20
> > In order for the dpkg perl modules to be used the must reside in the
> > versioned perl library directory (as to be in the default include path).
> > Be explicit about this location in our FILES_${PN}-perl directive, so
> > that if this breaks in the future, the recipe will fail).  We can now
> > drop the custom do_configure as it wasn't fixing this problem.
>=20
>   * FILES: removed "/usr/lib/perl", added "/usr/lib/perl/None"
>=20
> Obviously something didn't work right!

Indeed.  How did you try building it, and was 1/3 already applied?

--=20
Tom

--3XScEFldhOcFHBV5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZOu+ZAAoJEIf59jXTHXZSCfcQAJplQjzw0OuE+rL9N3zQjGia
y98Jou73VkKx/Kc4AgFoUyEIvvqgttBOrKvJTJL+AJ/C+muzvcfWBXqoW1QPIVBZ
nAN/AKDfzxjCgSeUTJEhYD+QtaEMIrVdx22lmqFcodvxzUcWtSaBmSFAEldUR7/g
/QDs4G7yzqytln4VqFkjRG0s8y2jiyJN6MKJnHoijosg9Ms01Q87CUwA+FSSi4VJ
SMdBrKW7tXU5hMA7FaWC9ahOiUXsmNKtoU/vYlgNvjhqqO6tPz/CWPOgJ8xkKzZA
tLOG9FNyM9jYyQ9mS+YoFLp1LbscbdTX6in6BHUbiIAHGancFpL/DQzGuk+l/G8x
lzHdWoWpevWEA12aXUKa+KTR+DH2HqB0qF/mNoH9UNaBJAz5dsNriWBBJ4h2AEzR
7b0jemg6Wte/+oYtnxIwcy6j0Fw7AWymqWYEhsmzv2oKCTLafTvn1r4bH5bavX6o
amS9i1WF/QrzgjjocxiecJS9MpR8FCoUzSJ4Hpemfcg1cTMUmYeie0n47s00a1kU
SY9pYD/VrifVbrmitOnp2IT960PKkCzBTMgGYIT84zWRUZVhc3+IzrISuQLCSIfx
rF0WP5Ma+Oo+2wDMMYWHS69oS5tUo0oNQfrySyLiOtikrpkXFx+i/ZtUnd+emz1R
W5RFHnrxe+Txxo0ruJm/
=zThX
-----END PGP SIGNATURE-----

--3XScEFldhOcFHBV5--
