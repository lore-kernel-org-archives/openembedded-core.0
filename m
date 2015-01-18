Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAC6728A1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 17:06:05 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so27721588wes.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 09:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O9EQaXg96sGnBAbPAJ4FaCBa3NBE6DOjJFXK1YpHCzk=;
	b=tcAyVII5WyO7JGzOOJu2VAxszrIxmGrMBiDOpVtGRzGRol/w7OktQh0CKE6kIPXpDX
	10L2gT+94F/rG9SCc8JhUnwcBzOyMaFrd8NW2UPYKtMxaipD27MqIaOimDgEKwa85dr8
	0uVnXxHBUuGHrCSOOdSueEaXq90puF8zRR8tEfJbGs5sF8+JsdTqzPqsZU+LQJBndJVJ
	L+LbfQdyIzDhVUZOS+Z69vGlToGGIfdWL9yNULioVIIklWm4Iv/Mk3nby7T/mhAx77Dz
	O93IymGeEFoNqNAY//LCKrkSYkBFv09tgP8GAaL2OwIuF8WFf/1DH2Z33/fhK4e7j8Vo
	XFGA==
X-Received: by 10.194.192.4 with SMTP id hc4mr45018285wjc.117.1421600766044;
	Sun, 18 Jan 2015 09:06:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ww4sm14025848wjc.47.2015.01.18.09.06.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jan 2015 09:06:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 18 Jan 2015 18:06:15 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150118170615.GB2454@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv2 1/4] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Sun, 18 Jan 2015 17:06:06 -0000
X-Groupsio-MsgNum: 61467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 03:18:34PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      | 2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 5 ++++-
>  meta/recipes-graphics/xorg-app/xprop_1.2.2.bb      | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Ping, this patchset is stalled since July 2014 :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS76AcACgkQN1Ujt2V2gBznlQCfcIYDc446JJQnsi86F49Rmcpf
LC0AnjgKvP1e51aigiTKLasGFZo581zE
=6ubz
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
