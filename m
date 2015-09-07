Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4935560017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 15:14:09 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so87348866wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CmVDPxqazTsDE2w97UK9I9f1ci1jHz/RsPx6gDM4tyQ=;
	b=d3AVEzs4AYK6Fd6tMewCoHK3VzTbTNg6C/cqii3L6iamA7ynn8ncKvzN8sF5bkhP+I
	I8GKLYYoot+K3ChpCifj14k+15yColdiuZ3jkdXQkTjIq/LmfIYKHMJz5RgnBglwlbdi
	aMAPntXq4/2+WQNsBFZfNjUzDgqGXftXqvijn+QS2N3UFJKAdXdPtoPULPHQWW+FR8gn
	MtPmgs0cYO0SWpbpY/KgjesfdL5Z+q4tAhYSdDbKR5+gjDs+NXKHWw0YKWNyYgtmx+Ie
	bXZ6qjsPBzpcgWSR5dFwDRoJ3JQQXvmZvY9r1ZFyScDosRa8DM+jWPS3F1hPvpolEBDN
	08CQ==
X-Received: by 10.180.99.232 with SMTP id et8mr33814154wib.80.1441638848459;
	Mon, 07 Sep 2015 08:14:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cx3sm19885561wjc.27.2015.09.07.08.14.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2015 08:14:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Sep 2015 17:14:49 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150907151449.GB2457@jama>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>
	<55E98B3B.4050704@linux.intel.com>
	<CAMKF1soR0r5ZVYYPnxGg0f+61oC2Cx6Mq0Y2390NXZzZn1-c4w@mail.gmail.com>
	<55ED5ADF.2090907@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <55ED5ADF.2090907@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Mon, 07 Sep 2015 15:14:10 -0000
X-Groupsio-MsgNum: 70758
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2015 at 12:37:35PM +0300, Alexander Kanavin wrote:
> On 09/04/2015 05:16 PM, Khem Raj wrote:
>=20
> >     I will send these patches only when oe-core is updated. Recipe
> >     moving is always controversial, and I don't want to cause confusion
> >     when the change is accepted by one side and rejected by the other.
> >
> >
> > On the contrary you can make a note in patch to destination layer citing
> > the patch for source layer being a prerequisite to be accepted.
> > Maintainers then can schedule it accordingly.
>=20
> Martin, would you prefer this approach? My problem is that the gap=20

yes

> between initial oe-core patch submission and their acceptance is often=20
> measured in weeks and sometimes months, so the corresponding meta-oe=20
> patches would be hanging in limbo, and may be easily forgotten.

I shouldn't forget them, because they will sit in patchwork's
queue or alternatively I'll cherry-pick the removal to my oe-core's
jansa/master together with these changes in meta-oe's jansa/master
branches so I'll build-test them in my Jenkins builds until it's merged
in oe-core.

It's a bit error prone, but the delay will be shorter if we do it this
way.

Full jenkins build test takes over 3 days (depending on sstate reuse,
one MACHINE can take more than 24 hours), so if I add them to
master-next after it's merged to oe-core it will take 3-6 days to
build-test them (6 days if they are sent just after current queue is
sent for build).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXtqegACgkQN1Ujt2V2gBz6bwCfTFNzY0JIxdkOrP5vnGwtIOwi
MKgAn0nsAzuM1GEZyKBSB8rAnkLmcBsa
=6guN
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
