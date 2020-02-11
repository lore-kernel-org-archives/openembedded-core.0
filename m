Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 557C160F42;
	Tue, 11 Feb 2020 17:59:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z7so13508313wrl.13;
	Tue, 11 Feb 2020 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qs1f7tQ3t6iHk6tNThsJwke1SVRbraBD+TZ9GCvspZM=;
	b=AkA9XibKxIItoNxasb2+oQGTRCI09YqqZ5ZMzpTlX/vEF3AAw0OU0VDnepJLpR+j/f
	soCOw1I+RfTqloaXA+KpbLXhotqocPY55leh7OQ9npBrIKWJkbuW4iK+te2LKDT2wC6j
	Du2lKdtM0g9YW/03JHvGw1IlsF+rr8K5Ov42s8ydfzMC+nzcGBPEbCwIs7Vu9ohl0W2e
	+c6JGi5TsiDMxBVkVwmJSC7dXed9ePoqSR0rkblMnNaAWAh/27IchYzRxwbVknSYmBbT
	ajT9s2zQXPeIeb3/oBPMj4eU+OcIprU/UXPNSrK4Phmy129bivl6Ep1/8MOxfM+syo1/
	x4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qs1f7tQ3t6iHk6tNThsJwke1SVRbraBD+TZ9GCvspZM=;
	b=Qte5eBnVIFU9UZUpiJ0dCDpL4VXD0XCKz+C+IEC/Kq6j0SqkT/1Sb1UnSOA5OnjSfA
	0LF1ZEzkd+uewmlXh0MSILL5EvqvFCnjRjsibqne6Rsy9qUKVH7l6w4OaXlhaggnI7xM
	oePwrjiXZQzfstAUCkGQOmLpFeXfEvcx0D3l1TkemJLiGuOGwNRRBFsNtZYSXkNtosW5
	hnLW5aiVPkeGRP/ZQG8V8I1q2kiCYOccLMY13HL9PSGZrxHdicqq7ngNHVLjS6t3gWMs
	qZCNF2ywsDUeYpBrBpP4okpHvdfCe5eyIhronEbZqni6Nihi1hTAJge5DPjLWAK8vHD/
	2rsg==
X-Gm-Message-State: APjAAAVCXN/lAxm8xpidfhNMD2btos9deeBsc6i87ho2L3ZWG3z2KGEl
	yhloYFWxZGeQ8Y4FOOcgBBY=
X-Google-Smtp-Source: APXvYqw8OrISJrtn5p/Y1tXf/xzBWVUMoOwGxQztBhiXCiHJG5Jwtty5tBsMv3zWDBmSC93frKMTtw==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr9640492wru.227.1581443998968; 
	Tue, 11 Feb 2020 09:59:58 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	133sm5096949wme.32.2020.02.11.09.59.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 09:59:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Feb 2020 18:59:57 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200211175957.mmmyembd5z4bhvwr@jama>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 17:59:58 -0000
X-Groupsio-MsgNum: 134827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pb3wqnsf2ldjequt"
Content-Disposition: inline

--pb3wqnsf2ldjequt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 05:53:38PM +0000, Richard Purdie wrote:
> I still strongly believe we need something in core which pulls together
> all our pieces into a UI where you can test key elements of what we
> build. If we don't have sato how do we actually test the core or demo
> it?
>=20
> I think we shouldn't rush into things here. We should ramp up our
> wayland testing and make the wayland images more useful/comprehensive
> and then look at moving more of our tests from sato to the wayland
> images.
>=20
> So in summary, yes, I think we do retarget our testing over time and
> strengthen when were testing under wayland. I probably don't see that
> needing to happen quite as quickly as you do though!

Agreed,

it might be nicer to have x11 separated in some meta-x11 layer and
meta-sato in another layer as well, but as long as there is no clear
replacement and x11 in oe-core doesn't cause too much work I think that
dropping x11 from DISTRO_FEATURES is working quite nicely for people
who don't care about x11 at all already.

Maybe it would make sense to remove x11 from default DISTRO_FEATURES
and/or include opengl+wayland instead?

Cheers,

--pb3wqnsf2ldjequt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXkLrnAAKCRA3VSO3ZXaA
HHTLAJ4/cSb8Bw5SiMaoDimWJFLsCY9ULwCgi6/qqwIJWHlWV6jS5DdQ5w8ZS6s=
=pwa7
-----END PGP SIGNATURE-----

--pb3wqnsf2ldjequt--
