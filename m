Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id ABE0B601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:42:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a66so1839937wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YIX9DKe+NeCvR2k7zOqDtTUdYECzKNpzKNaS7ViA6qg=;
	b=s9R0GV+fQFBEY+PNRBsiMjp5C0v4MAeOsV104LpsVS0tMvTbMCf2+d1xyhhvBANOC8
	uwYl6NuQPbE8BTJj24aGV621o/dPtBnpETx5FAeIBNkhZXU5PJjo1LA4a/8IuHe+I8hR
	1JXWB36bRNr1H5WTh3z0wvIC88jxtSHm1o2KWFMAHLSmlBnDDsmQ7nLI1l5DgmZtp1LU
	ML8pFwxd77dhFoZmun010Rcpd1riApQZTHiTF5+LuQucuOU8IFYu4phAQpQd8N9VBW0I
	HSXmHEMSZgFoPE6JT9BwWq9SZwNpsvnmtERGAQAD8iJOuRvn23e/cr1vzvf2yJ+AdCos
	yzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YIX9DKe+NeCvR2k7zOqDtTUdYECzKNpzKNaS7ViA6qg=;
	b=Ky3Irhke/QKZK4XSdx0kiTVc7uzlKbJCC00O2gjwyuVkmG7hD79KhJKluGZ+fnOcnC
	G5cOBva7DmlkqVmAN1t3RjLWuenZFGO6tUmt4WNxHoTws1xypNIO3iGweQSqkotTDmwG
	W0jZ9iJhtk5897Zkk03iq1u5cGMnQ/eehuzOK6/0aO0nw5qPyAdIAxcQ3OpsbggfnukI
	TQmjQocufMrgAeOr3w9yZgEy/uTuhczme4zVSQ4vJnvF4sP8+Ew1qd8D392MK+hhH3IC
	ygQujrOtkvVzPjvIfuHI/YFgY34Mwi63Lf9s6YUb3ClsaW0fOaO6u+7+UjFEcsxMB0wf
	Myaw==
X-Gm-Message-State: ALyK8tJj32SdoHaa1GRGo6m2z0kde0qM5q8eTf6D7EZhmi4Xz8HQCsIa6gwuJkWH4nG4HQ==
X-Received: by 10.28.89.6 with SMTP id n6mr8823988wmb.4.1466606541724;
	Wed, 22 Jun 2016 07:42:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	p9sm74436447wjv.21.2016.06.22.07.42.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Jun 2016 07:42:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Jun 2016 16:42:41 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160622144241.GA4153@jama>
References: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: remove the extra dot from the recipe filename
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
X-List-Received-Date: Wed, 22 Jun 2016 14:42:24 -0000
X-Groupsio-MsgNum: 83737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 01:01:19PM +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Even with PR bump RP did it's still going backwards:

WARNING: e2fsprogs-1.43-r0 do_packagedata: QA Issue: Package version for pa=
ckage e2fsprogs-locale-uk went backwards which would break package feeds fr=
om (0:1.43.-r0.1 to 0:1.43-r0.0) [version-going-backwards]

> ---
>  meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43..bb =3D> e2fsprogs_1.43.=
bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43..bb =3D> e2fsprog=
s_1.43.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb b/meta/re=
cipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> similarity index 100%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldqn+AACgkQN1Ujt2V2gBz8JQCgsumdrkASj8QEXTck7EKY2EW3
TbsAoJX3JMLrWv5dqDuPCaObzDc3S7wP
=S5rV
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
