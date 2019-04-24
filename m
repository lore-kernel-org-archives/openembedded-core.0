Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 656EF6007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 13:53:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f125so6025017qke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aj93FFqHlnefnjVJT4EQIPCycYz4wgFP5WCNfoCJWZU=;
	b=CDzFRwOyXa6RH7BgyWyhTG8vzAJ+T0/KCIEA2/P8RJufuKAOXGy8fCOtj0/B7dKewM
	eZtjTukHWSlBtMgEVm0SLYGFx/88BUCMEz+zqomojvSuy4NAlwF8P6cZRhNDjMkI3qjQ
	H9l99x+6Ia2Vr0n0erBvuvjzzS2T4jinO97Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aj93FFqHlnefnjVJT4EQIPCycYz4wgFP5WCNfoCJWZU=;
	b=PvAvM/aVY0xJ2e0W6qkP4UT3fxVkLQdV7npCcqFpzLKVxuUChRUwrHWkTOyaouxscO
	c9Y4c32a8dQ03M6KP/UWeYB5ay3gOei7namFQocTrT8nlgy53XIgJlusIy5NuihwdihY
	nF6+NzjNi2TESq/tkvI59ny6QulZ9FhKRe3Kv0FYdGp/RcsrU+t0WF2cbxs7tXXtORSu
	/lbbutE4QlRYfvZWGXHa6UrIWTRpSQFWW3HWk8PgRBmBRyeZrP8kREn5U0guVUZcUqDm
	kqO8CyPL7dcRV3Ydu7teI5eX63qvn1Psf/GVn1j21XsyYX3pkBWiIMTiqlwxn9PYitkE
	priA==
X-Gm-Message-State: APjAAAXpcFiALaVEzYuQZ5ueD0UjxHXgywVgvwYA/7ktNRe8x0F84feQ
	0CJ4hEar50Ci3SEGWxf3QBZgRg==
X-Google-Smtp-Source: APXvYqycjBXxyroWDCZjkx1Qb9XvLqzD59Ymy1ZTuDklY4lCSxZrayvYB/W1d2lvFhbPiv2mqyAAUw==
X-Received: by 2002:a37:85c4:: with SMTP id
	h187mr25513206qkd.226.1556114039227; 
	Wed, 24 Apr 2019 06:53:59 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	o64sm9570785qkd.12.2019.04.24.06.53.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 06:53:57 -0700 (PDT)
Date: Wed, 24 Apr 2019 09:53:28 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190424135328.GX31207@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
	<f0092d0d82b7fe8fda61bb0baee724926264820f.camel@linuxfoundation.org>
	<20190424112943.GB31207@bill-the-cat>
	<61f5389ee7e594055a18f5ce7a2e040a2b04de90.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <61f5389ee7e594055a18f5ce7a2e040a2b04de90.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 13:53:58 -0000
X-Groupsio-MsgNum: 123682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2COlia7yG8D6H0/1"
Content-Disposition: inline

--2COlia7yG8D6H0/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 02:50:51PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Wed, 2019-04-24 at 07:29 -0400, Tom Rini wrote:
> > On Wed, Apr 24, 2019 at 08:40:01AM +0100,=20
> > richard.purdie@linuxfoundation.org wrote:
> >=20
> > > What does "locale -a" show for you?
> >=20
> > On Fedora Core 29:
> > C
> > C.utf8
> > en_AG
> > en_AG.utf8
> > en_AU
> > en_AU.iso88591
> > en_AU.utf8
> > en_BW
> > en_BW.iso88591
> > en_BW.utf8
> > en_CA
> > en_CA.iso88591
> > en_CA.utf8
> > en_DK
> > en_DK.iso88591
> > en_DK.utf8
> > en_GB
> > en_GB.iso88591
> > en_GB.iso885915
> > en_GB.utf8
> > en_HK
> > en_HK.iso88591
> > en_HK.utf8
> > en_IE
> > en_IE@euro
> > en_IE.iso88591
> > en_IE.iso885915@euro
> > en_IE.utf8
> > en_IL
> > en_IL.utf8
> > en_IN
> > en_IN.utf8
> > en_NG
> > en_NG.utf8
> > en_NZ
> > en_NZ.iso88591
> > en_NZ.utf8
> > en_PH
> > en_PH.iso88591
> > en_PH.utf8
> > en_SC.utf8
> > en_SG
> > en_SG.iso88591
> > en_SG.utf8
> > en_US
> > en_US.iso88591
> > en_US.iso885915
> > en_US.utf8
> > en_ZA
> > en_ZA.iso88591
> > en_ZA.utf8
> > en_ZM
> > en_ZM.utf8
> > en_ZW
> > en_ZW.iso88591
> > en_ZW.utf8
> > POSIX
> >=20
> > And then my Ubuntu 16.04 regular build env:
> > C
> > C.UTF-8
> > en_AG
> > en_AG.utf8
> > en_AU.utf8
> > en_BW.utf8
> > en_CA.utf8
> > en_DK.utf8
> > en_GB.utf8
> > en_HK.utf8
> > en_IE.utf8
> > en_IN
> > en_IN.utf8
> > en_NG
> > en_NG.utf8
> > en_NZ.utf8
> > en_PH.utf8
> > en_SG.utf8
> > en_US.utf8
> > en_ZA.utf8
> > en_ZM
> > en_ZM.utf8
> > en_ZW.utf8
> > POSIX
>=20
> Does vim build cleanly on the 16.04 box? My working theory was the lack
> of iso88591 locale variants may be causing some kind of issue...

Yup.  I do a nodistro build of my changes before posting to be sure it
builds somewhere at least.

> Failing that can you send me the log.do_compile from a successful build
> offlist and I can compare to my failing one (or send you my failing
> compile log).

Coming up in a moment.

--=20
Tom

--2COlia7yG8D6H0/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcwGpYAAoJEIf59jXTHXZSGEkP/3hpL3sFvjlESv25+XrQOoN6
FXqs0i9ncENnO1a37+vjxCvmXhBVLXwLQZqEI5HTNB3C+FsR+K2wpBRy85iB6IHX
TihDXziIV2Sc/syeGHJWyreSFHnBbFSmFuAi20CS9x/Sf+sf7C/Kpmft3/8L/Rfh
LrRdAwidcfDj9UxanDRweR4kQRyCom22Jh3PYxTQNjBEXNg8IR9dgR6HsClQSdnt
jdF0ttrELAV+GknlqL6xVC0CmPOtRGbd0LpsUt8faRIjcROZ3H9DSRrajLz7db+1
sKV1hORso8FvtJWyPs0yuECidy6JxwW2RgoCgs+DC49C11a0Re3YQ/2PX/zWMvXO
iGRSYmJzjvSunXX3ktJsXzKAFNGuL0b0u6KbP+/YOTW3JEmjBcrszfnMy0/htHUE
NBYrV9WByycF7FvgmnRt7F8xpuwSZd+3oBcd78D4BJYYSdh+eHt7KlhrIrmm1qPC
IK1q5dwIW8uxw8SzaRCyekN8dUPRgj+EdkP4MMQRTpvbzUjKVd3erAUFJOZHd1mO
qAL5rsH+D+rZ+3c69tqkBvuT16Ag5aZ6gp0oZW/B4LG8uoocFgKHBeTu6sdF4i44
3HFvgcTOua+oLL6r6KrNnsqEAOLW+u5IYbRwKzhwnaz9xE8JdWvMqBTjY25pAjRZ
Xj/1BR1JUlZpOssA6n70
=hsfU
-----END PGP SIGNATURE-----

--2COlia7yG8D6H0/1--
