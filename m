Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSvbn-0005VO-Jl
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:02:19 +0100
Received: by ywb20 with SMTP id 20so381660ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LNYwlfwg9a1eRMbHKiB4tPlMqewKUeaz5zPaXi7w2O8=;
	b=Rg6sG1xJpSKBMIImpVSN4Qx9AcNqC5voFUyj9g4+ZkZnzMt9kzRAZsS+UtxsuPd7uP
	YZSwv5+8z2v4y5p5Tzj7fqa6HZ0HIA2D5ymRjhA/xgZt5IAEscUXb+GP7KFEU1Ibw8fc
	U5oNY+wu4bCeq5fmVry3D1RKo/gyMv3XZi7M0=
Received: by 10.152.104.130 with SMTP id ge2mr12786072lab.43.1321988147349;
	Tue, 22 Nov 2011 10:55:47 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	me18sm13475168lab.10.2011.11.22.10.55.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 10:55:46 -0800 (PST)
Date: Tue, 22 Nov 2011 19:55:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111122185543.GQ3565@jama.jama.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321899155-19575-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1321899155-19575-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH 2/2] pulseaudio: update to 1.1, delete 0.9.x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 19:02:19 -0000
X-Groupsio-MsgNum: 12739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o99acAvKqrTZeiCU"
Content-Disposition: inline

--o99acAvKqrTZeiCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 07:12:35PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> As indicated in the subject, this is an RFC, please review and test.
>=20
> 1) the ARM_INSTRUCTIONSET workarounds have been removed, so for people us=
ing thumb1, please test
> 2) this is only buildtested on armv7a, more buildtests and runtime tests =
are on their way, so please test=20

Ah, please update or drop
meta/conf/distro/include/default-versions.inc:PREFERRED_VERSION_pulseaudio =
?=3D "0.9.23"
with your patchset.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o99acAvKqrTZeiCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7L8C8ACgkQN1Ujt2V2gBz0hwCgjPWLpGNYnx41bX8Q4paVYtBM
kzwAni206iFj0HS/Kf5/8Z66Dq7FhYOW
=NNfS
-----END PGP SIGNATURE-----

--o99acAvKqrTZeiCU--
