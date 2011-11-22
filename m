Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSvaa-0004W8-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:01:04 +0100
Received: by ggnh4 with SMTP id h4so575536ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hg6X0ZiKTBbS4lyO5yoQypvsOU24h8MMHu0RIHSyFAQ=;
	b=x1Dtc9DbameCYfyLESkZ/urgakfmlXaInm4uhI7Jph60Rv8AATVSTcuIxyBRFFqD8C
	TRtVxgT7iForpetg3HnBGeN8+sqDYGWtP8VsGifwgkEBeHckPmNi5WjbQZUO0ns7WAxi
	B69f0702ODUUEyXNaYhJ8zXCPVcfFLNzZLJk0=
Received: by 10.152.111.170 with SMTP id ij10mr9529422lab.5.1321988072441;
	Tue, 22 Nov 2011 10:54:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ne3sm13478684lab.7.2011.11.22.10.54.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 10:54:30 -0800 (PST)
Date: Tue, 22 Nov 2011 19:54:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111122185417.GP3565@jama.jama.net>
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
X-List-Received-Date: Tue, 22 Nov 2011 19:01:04 -0000
X-Groupsio-MsgNum: 12738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JQ29orswtRjjfiJM"
Content-Disposition: inline

--JQ29orswtRjjfiJM
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

FWIW all my 5 devices including armv4t and armv5te built it fine today,
definetely improvement wrt ARM_INSTRUCTION_SET, thanks for update!

> 2) this is only buildtested on armv7a, more buildtests and runtime tests =
are on their way, so please test=20

I haven't done any runtime test at least yet as I wasn't using pa and
don't plan to use it soon.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JQ29orswtRjjfiJM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7L79kACgkQN1Ujt2V2gBxoggCfc/aNDiiAkBpwKfkbVzf5ZYOe
+1AAn2terDzwexbC3vCl5Nr8J3hg3Cxs
=1UvJ
-----END PGP SIGNATURE-----

--JQ29orswtRjjfiJM--
