Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8101719F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:56:15 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id f8so1697348wje.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 10:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ja1DPp8vc2x3Tysm4Mm1PPP3I7qn3OShXR/AKsLbIME=;
	b=ulN9uEvyP1grn97uyk4g2u923jOsTucT1r842D9vZehUMZti+5HS0Glx40oW2Mildl
	tYRJvOgK6dq549j5QchL14sMhlqitlGTw0+52spShOIAROJI6REkjZhiWuQAOfzg7Y8Z
	v+LKnQszdOHFYbwFBsoJ0wJDyZlS8djxosTx/DXDys+1jZnBgiCKMYpGH4bV4+xqrHVo
	LS/qixznN1KtQfANS6ZPj7I+MzvREqB02MrlUYZAq49k1XHTyKrdXufEEWR6vQ79SQAa
	8q7SnK3wAGxFHC9j8cczjkmFX+ysrODaMgtFjmiSPjmeMGn6MsYIX170BCrOP/5/ap3m
	JQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ja1DPp8vc2x3Tysm4Mm1PPP3I7qn3OShXR/AKsLbIME=;
	b=ZUjjL+09iHOEFV6UCNhD4Q5qQA/ZcNiUk+YprWWzd0KxBabFDfepg38sD16EmrffVg
	3U95oPDZmiHS9+K/41hE/q5QRyWnPi4hyy673zv5iFmJLOL51AC8EZQtfVjDieZFG3D4
	30by9Gm4n7x28tuqhe5h5kni7j5PX9DNX0eRUXpC7px6m7r6JJ1y/415MOm6fOQdowZc
	yQpMsFGPNI77bnV1JO0RzdAEwJVrG1OVpluw0g92rE2yEfCrcidoNZyKIP6F0DsstrnY
	v/PElHdOSL1TrnjNW7naUeoBKzqzr19AZBp7e5EzQTCgxJCgTLq+HUlLvt/P9Kytxd0Y
	V4/w==
X-Gm-Message-State: AKaTC01LL3P5QdazSfhyufR6mldZxtYRbDBWrdIyknheXf2jxLyxz4cs9R6Jx3pU1E/cYw==
X-Received: by 10.194.125.114 with SMTP id mp18mr4411145wjb.106.1479927376568; 
	Wed, 23 Nov 2016 10:56:16 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w8sm4193091wmw.4.2016.11.23.10.56.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 10:56:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 19:56:17 +0100
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20161123185617.GH3265@jama>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Wed, 23 Nov 2016 18:56:18 -0000
X-Groupsio-MsgNum: 89774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Content-Disposition: inline

--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:
> On 11/23/16 12:10 PM, Martin Jansa wrote:
> > On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
> >> This is a Wind River specific patch and not generally applicable.
> >=20
> > Then why is it sent to oe-core ML?
>=20
> As noted in the cover letter, I'm required to by Yocto Project compliance
> requirements.
>=20
> As indicated LAST time I got scolded, I was told to indicate this in the =
patch
> summary email -- which I did.

Sorry I've noticed the cover letter only after the response.

So it's only because of this requirement from Yocto Project compliance?

"Have all patches applied to BitBake and OpenEmbedded-Core (if present)
been submitted to the open source community?"

Shouldn't the wording be change to something like "all applicable
patches" or "all generally useful patches"?

It seems strange to send project specific patches together with cover
saying that they aren't generally applicable and shouldn't be merged,
just because of this requirement.

Regards,

> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>  meta/conf/layer.conf | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> >> index 24b4df0..a94e524 100644
> >> --- a/meta/conf/layer.conf
> >> +++ b/meta/conf/layer.conf
> >> @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core =3D "5"
> >>  # cause compatibility issues with other layers
> >>  LAYERVERSION_core =3D "9"
> >> =20
> >> +LAYERRECOMMENDS_core =3D "oe-core-dl-2-2"
> >> +
> >>  BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-core"
> >> =20
> >>  # Set a variable to get to the top of the metadata location
> >> --=20
> >> 2.9.3
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDXmUQAKCRA3VSO3ZXaA
HPkVAJ9kpetbnO7R5isGthTCEmii6ngiUgCgokp76k+5Njdgn65QCN2USAPq4Xg=
=euPN
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
