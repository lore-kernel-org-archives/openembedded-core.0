Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 11B586D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 19:06:16 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id b15so3839940eek.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 11:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2r+OQcEE6haRUbvXBneQSzKbdbkzq2hFd8qFD95OXRo=;
	b=MgA9Bbi2ZhTeiMbFEBbwn24VqweKnhwI1m4ykZew8Gs0nZJT0WigdCh073SpIrH53g
	F6JvCqjaabKmLQ71fMpaRLVJyRJvMG+HccgH1+w23f+8a92lgczOq/cjkMM/FOV2JEqV
	6p6VktrkQvW+6k9mK7sx0rGIRDDJMOazQdRS9rv2F1FqZlNipG0oC5G6qFF/0SMrX2L6
	DtHPOy5mk3YoiRdxa/wq8MIK2mqMgtCRhQxF3bTGRJVWEwUVueTqORVgQEy0AutoVYce
	pviQ6Ub61U6qh8oR49eOQVBp8pSZYaW/Xgs20kqsaoZcR4KgnRryn6T6hnb0oZntyYtE
	i9rQ==
X-Received: by 10.14.212.71 with SMTP id x47mr4602481eeo.98.1391454377562;
	Mon, 03 Feb 2014 11:06:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm78722892eeq.15.2014.02.03.11.06.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 11:06:16 -0800 (PST)
Date: Mon, 3 Feb 2014 20:06:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Kristof Robot <krirobo@gmail.com>
Message-ID: <20140203190627.GH3698@jama>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
	<CAFgGSN5skuFQsx_dLEETuO_kq7YCyFr6LbqgXkCAEmBx=8VRdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFgGSN5skuFQsx_dLEETuO_kq7YCyFr6LbqgXkCAEmBx=8VRdQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Mon, 03 Feb 2014 19:06:17 -0000
X-Groupsio-MsgNum: 49803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline

--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 07:50:03PM +0100, Kristof Robot wrote:
> On Sat, Jan 11, 2014 at 4:08 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > Avoid a confusion when including thumb in TUNE_FATURES. In the curent b=
ehavior,
> > if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm" whi=
ch makes
> > no sense for me as a default behavior.
>=20
> I agree that this is confusing, I actually fell for this - thinking I
> was using thumb instructions, while apparently I was not...
>=20
> Any update on this patch?

please test the patchset I've sent
http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0886=
65.html

it doesn't change the default, but it makes it easier to define thumb-only =
MACHINE
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLv6LMACgkQN1Ujt2V2gBz7PQCguw04wXMvEMy4t5mvPcqI5H31
eToAnAojOufGbgGvrfpgf+Jh0AjiN45a
=SleM
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
