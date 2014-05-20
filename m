Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (unknown [209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 85C1365F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 15:25:08 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so521510lbd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QH/VatxkIkRljKKk+UWNk8NLEp6rqDIPiDup756UpBs=;
	b=FuhBMUN4SAaRlAqIWungXZlHUFYxeLZTMdrlcckpbtZNMtcMKq0qfebaJQOuwCrKtG
	CQVazz3Ilvfbw2Y7ngCiUeLVBUvEUZnGMnh1R8faz2ghQb1kWGV0pB3ylRL8v1+13//m
	S2ub7LM6FPTh6cS16Mgw3V5Ewmsv0nBCb0/aQBliTYwYr4U1RbA+0fVtf+CRM/Gl/qYd
	kM95ZEWRZ7g4sorOSKN3HzunNKXXSCYhxDfYsnOTDoNThRzYEyAZjehsEw9a0+lfVQNJ
	lfC9T/eXh27YE8gFSpFC1QdpTSUubbHZ85Bm3Svj8rKDSCRbRYVyCaBpFWNJK0mKit6q
	Rc5Q==
X-Received: by 10.152.4.137 with SMTP id k9mr22515926lak.46.1400599508685;
	Tue, 20 May 2014 08:25:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vr5sm21106884lbb.21.2014.05.20.08.25.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 May 2014 08:25:07 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 May 2014 17:25:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140520152510.GB2424@jama>
References: <1400155748-26271-1-git-send-email-Martin.Jansa@gmail.com>
	<1400593365.28353.215.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1400593365.28353.215.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: Fix build with older kernels
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
X-List-Received-Date: Tue, 20 May 2014 15:25:09 -0000
X-Groupsio-MsgNum: 53394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2014 at 02:42:45PM +0100, Richard Purdie wrote:
> On Thu, 2014-05-15 at 14:09 +0200, Martin Jansa wrote:
> > * forward port this patch from daisy:
> >   commit c11b29ff4f24af0445c3c6a694b8dc2037dcd7e4
> >   Author: Tom Zanussi <tom.zanussi@intel.com>
> >   Date:   Thu Mar 6 22:26:20 2014 -0600
> >=20
> >     lttng-modules: Fix 3.14 bio tracepoints
> >=20
> > * how is it possible that it's in daisy but not in master?
>=20
> It looks like we have two versions of lttng-modules and friends. The
> patch was applied in master and daisy to 2.4.0 but not to 2.3.3.
>=20
> Why do we have two versions of the lttng pieces? :( One works on arm and
> the other doesn't?
>=20
> Anyhow, the change was in master and daisy.

Yes, in the end I've discovered it as well and sent separate patch for
daisy to apply the same patch in 2nd lttng-modules version:

http://lists.openembedded.org/pipermail/openembedded-core/2014-May/092593.h=
tml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN7c9YACgkQN1Ujt2V2gBz68wCdE5wLXDGEhRR/RoqRR1l4EQ8C
2HwAnR0CniLI5QrW2t+JwijVDoiX0aSu
=KhYV
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
