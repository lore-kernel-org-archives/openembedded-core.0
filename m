Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C737570018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:11:51 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n186so99781499wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IPdMXRrGtUrqXdvWFuJqpAK/TJbIlz2nwIYdnBZrRXo=;
	b=okZM3STwf/8xvKpzGSksmDi795rioPJ8XxJ0LWYQqaq7IvPRisjg1t4FzZtrJhDZYp
	Vvo04D9AyCrInTYnfTGoba4cJnvqYXTCbIYcofPPumF8nyZzgvEKgzvlapLH+EOz8qHx
	LBCnjhdQB1arXqF7YTkLuOqVBHNgck63Yq378U6GDui9zBVHtiuDfG9DQs1eoPabMTzL
	o5J5wPTjANWzZfQaPYTJCkAldin4tzrnfFWx3hYs4B4OaeGzc4VKfj9EZ/Y2atQEA5iQ
	nTpYPFighqUp1XrMkO7bzKLZ71KcUta5Z5JKuuuI+uGMo5KZLiGRhUYkO+bqTEg30C/e
	Ay7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IPdMXRrGtUrqXdvWFuJqpAK/TJbIlz2nwIYdnBZrRXo=;
	b=SNbJwMMzbaOyOCJr2FOmmJMswtYjyz2kH0DTS407cHK2XBwlbWFIYzmb2p4rg/SO7l
	0z330ExxLFrxB2yjpd1E/b0+nGkOFvVv0CcZJ/SkZnvsYQKvnCldElQgJlHR/h94ImTK
	zA/H/5UktkTesQiyU2RNT5OT1r/SMenIoBKi25srIOEA19XqemBjgsCygv6r69vpYSQW
	1ZUH59fFONfgYDj82bicrxd6MxTiTTsuk1zsIwdqo7cZOZcsVcOdnK5crCWTNNxsEQC1
	qCSVhy1T4pf+oA3uh9P+VTomHXHZEoMCfzOX2I7Fo3Edj5hszuvBVr6PA5nUTN2sktau
	+rNA==
X-Gm-Message-State: AD7BkJI3Aq4mgJBS+TkwaTp9CNNPnAyH5G9ZmWOHONJX76OvqkysE3g5CNEh8SlD+s+dig==
X-Received: by 10.194.201.130 with SMTP id ka2mr22547258wjc.34.1457950312135; 
	Mon, 14 Mar 2016 03:11:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xx3sm21519531wjc.32.2016.03.14.03.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 03:11:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Mar 2016 11:15:14 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20160314101514.GA2560@jama>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
	<56E5D0C1.7010302@gmail.com>
	<1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
	<56E5E180.30408@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56E5E180.30408@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Mon, 14 Mar 2016 10:11:54 -0000
X-Groupsio-MsgNum: 79609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2016 at 05:54:08PM -0400, Trevor Woerner wrote:
> On 03/13/16 16:53, Paul Eggleton wrote:
> > On Sun, 13 Mar 2016 16:42:41 Trevor Woerner wrote:
> >> That's the problem I'm trying to solve: how can I easily keep all the
> >> information required to reproduce this build, exactly. The whole "two
> >> meta's" thing was just a speed bump.
> >
> > Right, understood, and it does make sense. I'm convinced there is an
> > underlying problem to fix that this just papers over though.
>=20
> Okay, I think I see your point, and I agree. There is a layer clone=20
> problem that should be addressed.
>=20
> But again, I think this is a speed bump.
>=20
> My underlying point is that we're purposefully leaving out information=20
> that is vital to reproducible builds.

FWIW: I think this information also useful (even as separate file in
buildhistory).

In most builds it shouldn't change very often (except the revision) so
the diff shouldn't grow significantly.

There are many reasons why people use different forks of some layers,
some of them are valid (like using own fork to verify some change before
submitting it upstream and showing buildhistory diff how you tested it),
some of them are sad, but still needed _to be shown somewhere_ (like
using fork with important fix, when upstream layer is slow or refusing
to accept the fix).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbmjy0ACgkQN1Ujt2V2gBzyPwCgqYWLy8b8k+2MXWcgd3RUoFyw
TUMAoKcOBfkflmlFg5h9B3tpufO70nE4
=E2Mv
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
