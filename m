Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B9445731A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:49:23 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so161448833wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HRFKTU0AQZMGkGbuzlcjsDTjK4zj/z3oCbETdk82J6w=;
	b=VTjabSyt1xkKNJByIQ7r78AFL2jm5NX2uucePkqJPFOaW/XT07YRinrFwANVdcGQzo
	l7J+iUgsE1KSLtZtjLAj0Ho1aLwI49k3baovBn4tanp3SlAtlFJgmppmt1wV4rHDzPDv
	eey5epWnRhiW9wGJZfei9PQ4LbfECADREi13aexrL7ScsPdRYp0aCZOSFGIKG0VbW0F1
	k6gCOsr3iPZjb8N30aDSZuu5nnT+Tnk0qpsBtUBwasATvqo4YbmGXXrt7CubcfcaWQQW
	PRDIRDpaGlFknb0TaTcCXdScfPELOmxcrW2qwL4h9/WOzzSIkzRC/9DUJVAY19L+luDJ
	+TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=HRFKTU0AQZMGkGbuzlcjsDTjK4zj/z3oCbETdk82J6w=;
	b=mX+D26V7o7lmCP4KCqZLm8xnCOVeyrHlDIZI7j/GuoZn/1/o/y/paQOx6TNbIkrULc
	7dZpb6SGrmTtCta7mIe6jAqc6eP6KYnGTzasNFDaPa/q8jmcRl+MeqkJJChX0JktHHHg
	KiIpoHQCo3x1Jyc2pAFhCHAOAx1wB1B5OatN6yWAslb8FrdzONzaEFIf7X3jVLTJ1S2J
	E+1it+IHTew+RH4pTWiNqhwV3IYt6Thgp0NrQleSwCImT/uD/G3eKzEt7XyotArar3pA
	pn8OnO+8NZwoq+B9V6Bp48LBa69FV2I7AdmaaYHT64dEZv7889yEHfypaij5zEgcyhrL
	/cGA==
X-Gm-Message-State: AG10YOS6M+w6H/FOT9OJha+sCskQiY9/iKaHFJMVH26uM6eZrt0jZyEjegPAXp7pzVQWuQ==
X-Received: by 10.28.188.138 with SMTP id m132mr20504218wmf.29.1455641363898; 
	Tue, 16 Feb 2016 08:49:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	az10sm31057429wjc.28.2016.02.16.08.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 08:49:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2016 17:53:44 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20160216165344.GC2581@jama>
References: <056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
	<56465E1B.8040900@yoctoproject.org> <20151116205235.GB2240@jama>
	<CA+f-kVLqbm=TpPiG5WyxmQuLbg1qgD8dSSdPsmPT-dcOwRG4Yg@mail.gmail.com>
	<5659F2A0.7070003@gmail.com>
	<CAHUNapQyuQ9zSVdMsSnvempu4edsHTgih5QcwjjjTv55fhWB3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapQyuQ9zSVdMsSnvempu4edsHTgih5QcwjjjTv55fhWB3A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Tue, 16 Feb 2016 16:49:24 -0000
X-Groupsio-MsgNum: 78234
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 11:40:52AM -0500, Trevor Woerner wrote:
> It's great to see the OE Commit mailing list is being updated again, than=
ks! :-)

but only from meta-openembedded repo :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbDVAcACgkQN1Ujt2V2gBzkgQCfVyyiAHzX98M4oH/R+ft3rQ5C
dIYAoKAMDo8V4/T3MFPnUvgzHdgzM8ir
=QNhP
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
