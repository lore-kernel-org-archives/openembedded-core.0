Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4F93E65CBC;
	Tue, 10 Nov 2015 16:02:46 +0000 (UTC)
Received: by wmww144 with SMTP id w144so124064967wmw.1;
	Tue, 10 Nov 2015 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aVcR124jafNolJbSl8bYe+iEAZrJ+euLEUYNsOU/MKc=;
	b=uMKTzadVrq1rHXBovWx1lBKK1H7OT1NZ96FDGr74C8Z3kJYv1PmJlUmV0+TGyliL3G
	cOmVBu7ET1BJK+44eP85pW0Pz7QYwWEQ0LPv/Psj/Yauc7jm19f9k6RRUDzj+M7ssmnk
	FMTv/TVQFQWWW1dG3vrNJPg+GK4uIZNB05iAZwuIiPUnHoxftu1FoIBp3C6JEp9C69r4
	1KlGmrhok0XeBU0jUUFE9DmNK09nEoqalw15cEIMEzQNP9HQQwuDRByVwoREsJQv/R+8
	+wEuTuHkQtha7XIHbQEYxOzTROFFviVxkUqbuwy4XNKnXSIPQ6ZFwoveS0l7wlte64iv
	7OuA==
X-Received: by 10.194.84.4 with SMTP id u4mr4916708wjy.149.1447171366593;
	Tue, 10 Nov 2015 08:02:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c194sm4796158wmd.13.2015.11.10.08.02.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 08:02:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Nov 2015 17:02:50 +0100
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20151110160250.GB2561@jama>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 16:02:48 -0000
X-Groupsio-MsgNum: 73191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 04:22:07PM +0200, Jussi Kukkonen wrote:
> Hi all,
>=20
> There's currently no software built with vala in oe-core. That's not great
> for vala (as it's not getting the automated testing that high quality
> maintenance would require) and it's not great for oe-core (as maintenance
> effort is better spent on components that _are_ used).
>=20
> Based on the above there's a feature request** to remove vala from oe-cor=
e.
> Please comment here or on the bug if you think this is an inappropriate
> idea or have suggestions.
>=20
> If the plan goes through I intend to send a patch to add vala to another
> layer to minimize disruption: I guess that would be
> meta-openembedded/meta-oe as vala seems to have one user in this layer and
> another one on that layer ... Suggestions welcome on that as well.
>=20
> Alex, note that this might affect your GI patch set (or the other way
> round).

It was moved from meta-oe, so if you decide to drop it from oe-core then
meta-oe is where it should return:

commit 807285c751862aaa775db5a13293007bfb3c29df
Author: Mihai Prica <mihai.prica@intel.com>
Date:   Mon Aug 26 11:50:46 2013 +0000

    vala.bbclass: add class from meta-oe
   =20
    This can be used by packages written in vala.
    It is required by the Midori web-browser.
   =20
    Signed-off-by: Mihai Prica <mihai.prica@intel.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 649b48557d8702daaf4f28482848ab0b07abed83
Author: Mihai Prica <mihai.prica@intel.com>
Date:   Mon Aug 26 11:49:26 2013 +0000

    vala: add version 0.16 from meta-oe
   =20
    Vala is a C#-like language dedicated to ease GObject programming.
    It is required by the Midori web-browser.
   =20
    Signed-off-by: Mihai Prica <mihai.prica@intel.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZCFSkACgkQN1Ujt2V2gBzBzACfYKJI3YDRPkIs1Y1n5CLuDvFW
vJMAnjS05hDcpNoLgfSVyEKNRdgRyNtW
=Vola
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
