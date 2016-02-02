Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 810C3755F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:14:32 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 128so125773781wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 08:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XP/Iz592Z6gyyHD1zUs2kNgPP4v89ah8RX3fkFAmnQk=;
	b=QEV6gSIdPpnUiRVJjeaIliiSN6N2i9ZKs5TNW/1gu0AzlquFsBFV52hxr/120m6oYM
	YXm4ldAtvzq8wiqOzqM1MoGbJRRD75Khqcd6wMO3eIz+3fmqRTwmDl5J/2rUBmnjotEK
	24ObyM6eqHvGdsCOSZEvb3U1oqrY+lr2FvRbceU1aRVDpBpOhl0rABWpySeTYO5JqA4q
	VbJAmlFcdVOrYqDIMnucJuneHFJQPyL8jcIUad+JuizYemhiDibUh71d8khuL/LYN1lN
	3eNd8FwXF3em5u7y7ALkF8YXK6ssodJk7GO7ZTV7yI7K7vcXcRyh6XIYnmUSfXs+0kCd
	hxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=XP/Iz592Z6gyyHD1zUs2kNgPP4v89ah8RX3fkFAmnQk=;
	b=lroIlfIspao82nSCwap34hMyg9i3bMWSgEhI6YWkNKxWsepY0j7+RAK5sIa3IMh3zd
	gttAfDvo0d6+OMMdTxq+0lsY/u2EptQGlJcruKOnMwrg5udME/DUFunEwWofFKtTnFFD
	EHQoMdFoajYGYLG5y4IO/S/llVOCjPhgATyrZu9lHC/XWJgh5sCaxPwgDmZK8YtcFI+3
	EIgF3RGkMZaOYvmV8qWT5cODMDvFFBrbu92dqyK0EECwSJ4X4KLBKJ9LGmN66VeyEBS6
	+Q6d+efMbaAc2yDcFuM3OFf/HJZia0n9KwcvZoLxcsX2EkCJF3ThIfw5z5u0reCzHxbG
	QtaQ==
X-Gm-Message-State: AG10YOQ5llityFg0G8YkVCg0PAAbtAlD6ShfiRy4wQiMbnqQd8qid5+zKF34URgw+9pLHw==
X-Received: by 10.194.113.38 with SMTP id iv6mr29270239wjb.19.1454429673124;
	Tue, 02 Feb 2016 08:14:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c7sm2681428wmd.13.2016.02.02.08.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 08:14:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Feb 2016 17:17:26 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160202161726.GC2607@jama>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454428874.27087.87.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 02 Feb 2016 16:14:35 -0000
X-Groupsio-MsgNum: 77322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline

--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 04:01:14PM +0000, Richard Purdie wrote:
> On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > bitbake.conf currently contains:
> >=20
> > EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> >=20
> > Back in November[1] I submitted a patch that allowed this default
> > value to be overridden without affecting anything else that was
> > appended to it. I received feedback that the default value was no
> > longer useful and that it would be good to get rid of it.
> >=20
> > So, this patch series fixes the two recipes that still appear to be
> > relying on the previous default and then makes the default
> > EXTRA_OEMAKE =3D "". After these changes core-image-sato builds
> > successfully for me (although I have not run it.)
> >=20
> > Mike.
> >=20
> > [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-No
> > vember/112393.html
>=20
> This is a pretty major change and we likely need a bit more of an idea
> of impact.
>=20
> Which architectures did you test? Often, x86 is a bad choice here and
> we'd need something cross (arm/mips/ppc) to ensure it really is doing
> the right things. We also need to assess a bit more than just sato. We
> can run this up on the autobuilder and see what happens.
>=20
> A post to the architecture list is probably needed so everyone knows
> this is happening (or at least being considered).
>=20
> I do worry how much of meta-oe may be affected by this.=20
>=20
> Martin: Any opinion on this?

I can give it a shot in next rounds of jenkins builds, but the state is
already quite bad, so it will be hard to spot new issues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaw1pUACgkQN1Ujt2V2gBxtMACeNXwGHt8c8qwSBF2PCudyYHxY
MyEAnjnQwj23/QU2AuX8ZjtMMf7Gn6FN
=dmFx
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
