Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9057D344
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 15:05:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p77so1203696wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lmu7eRLnQry1rptUDFEsszdDKYdAcqcGJ9NDYSdkcPc=;
	b=mLi/yGhkv+5SjqUcrBERCj/WmA6ke4BnrqRSZY0cT8tSckQhlvuZp4qrTRou++vWN5
	ZTTr5IEjU/EZxf9dAtwv0zKJVejeVOZKBya9k0e1pv6OzzAI9dzCrdxba7M9dGFdmWsD
	Plrs4xnZFxxxEX8ON7opRsApFpvMVgntg0WeBTLZ+VcVR0eovnW2UwPOYZBKi1BRXnMy
	LC+rtQuNLbrHG2b+q6Bxq7rkelcPAWupvU28ZHU/ButiLCyRwiL6051i1v57u95pvHcX
	3ZGCz2oqW04Gez57UzTJkQAt2ORXOBeOZlektxC8ouZ7AxKfd5G3Yemgfm67tsu3uhXv
	yD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lmu7eRLnQry1rptUDFEsszdDKYdAcqcGJ9NDYSdkcPc=;
	b=AORkdigrDo025CPtZYndE5slwjebLJWjMe/5Tsk+6Doe0FLdPiVTQp0IwyIqRd4kg+
	fkW87IN39udXqRvGJ42djT3O4dURADPF6S/pDEMARH3NKfoPwcJu0iXf13Ek/k9qliRr
	KhsBu3Wpn0XViheJsk7HY+SKfomlxEiueXEieNwdxFweGB/IUStkF+rmYcGZpiuz6cqG
	rBpkAWroS5HdsQhClLEQF4U45KEDkOL6CHOBcsiACC0qid3TowUGZN1gi+1Yvl49+/fm
	SqtOttcfDrkX0ClgqwjrdXi2ggIwEImdI+8PVJO/lQCJZxrWdSUy3+Z1fDMxyMN2Q43L
	dZQg==
X-Gm-Message-State: APjAAAUCC3k8OMmHlKyfacrkhVtYBxJfB/mQbcRfyngC9i2zCOEp2BqP
	1Zsw64LdEPaNM/pFhFfLexM=
X-Google-Smtp-Source: APXvYqyiCXkZB5W+wrgxehSp9VS8y9VkmuSTdRjU7uGjRjaNKs9+PN5C93/1Tn6VQ5GzdqHBQSlYtw==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr3326743wmg.63.1565881542656; 
	Thu, 15 Aug 2019 08:05:42 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 39sm8686099wrc.45.2019.08.15.08.05.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 08:05:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Aug 2019 17:05:48 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190815150548.GA1515@jama>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Thu, 15 Aug 2019 15:05:42 -0000
X-Groupsio-MsgNum: 127923
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 10:04:08AM +0100, Richard Purdie wrote:
> On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> > Comparing that build to a corresponding do-nothing build with Thud,
> > the time difference matches those three minutes where I have no idea
> > what bitbake is doing now that it didn=E2=80=99t need to do before=E2=
=80=A6
> > =20
> > Hopefully these time degradations can be solved, because the current
> > state of bitbake is barely usable. We also need to look into possible
> > ways to improve the cooker output when it is running the setscene
> > tasks so it makes some kind of sense again.
>=20
> We talked on irc and you pointed at the commit things started to go
> wrong. Just to summarise things for the benefit of the list, this is
> some quick testing I did:
>=20
> "bitbake -p; time bitbake core-image-minimal -n"
>=20
> 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> 40.3s 7df31ff36892c2f9c65326b06b4c70=20
> 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e=20
> 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c=20
> 76.9s master-next

I know I'm late to the party, but it took really long for the test to finis=
h..

I'm not using poky, so reproduce this testing on our builds I've used
bitbake revisions matching with poky revision RP was testing:

+ oe-core 18cdc087fd5da30e2b31f3d4e81b153cd36ca844 for older bitbake, becau=
se current master isn't compatible with old bitbake (bb.data_smart.Expansio=
nError: Failure expanding variable OE_IMPORTED[:=3D], expression was ${@oe_=
import(d)} which triggered exception AttributeError: module 'bb.siggen' has=
 no attribute 'SignatureGeneratorUniHashMixIn')
and oe-core 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae for newer bitbake (to =
possibly eliminate impact of metadata changes)

tested on 72core (Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz) with 380GB RAM

nothing in TMPDIR/SSTATE_DIR, no SSTATE_MIRRO, no Hash Equivalence Server c=
onfigured

on a build with few more layers:
Parsing of 3238 .bb files complete (0 cached, 3238 parsed). 7632 targets, 1=
927 skipped, 54 masked, 0 errors.

but first doing just core-image-minimal like RP did:

time		poky						bitbake						oe-core
2m8.191s	6c7c0cefd34067311144a1d4c01986fe0a4aef26	18d4a31fdcec1f0e5d2199d61=
42f0ce833fca1a7	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
N/A		a0d941c787cf3ef030d190903279d311bc05d752	doesn't exist in poky/poky-co=
ntrib		18cdc087fd5da30e2b31f3d4e81b153cd36ca844
2m17.053s	7df31ff36892c2f9c65326b06b4c70			1f630fdf0260db08541d3ca9f25f8529=
31c19905	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
2m18.515s	a0542ed3ff700eca35f9195f743c9e28bcd50f3e	f43778c2d19e70d4befd483b=
06aaf247fc65c799	23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
2m22.220s	9983b07fffd19082abded7c3f15cc77d306dd69c	8c26b451f22193ef1c544e20=
17cc84515566c1b8
2m38.185s	master-next					fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
cache.py:446: ResourceWarning: unclosed <socket.socket fd=3D10, family=3DAd=
dressFamily.AF_INET, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3D('12=
7.0.0.1', 41117)>
  value =3D pickled.load()
started showing with this revision
2m17.991s	master-next + fixups				f7cd14f90463957b3e4be6d3876def98b78f1424
2m9.651s	master-next + "Holding off tasks %s" out

now world
253m36.637s	7df31ff36892c2f9c65326b06b4c70			1f630fdf0260db08541d3ca9f25f85=
2931c19905	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
174m13.324s	a0542ed3ff700eca35f9195f743c9e28bcd50f3e	f43778c2d19e70d4befd48=
3b06aaf247fc65c799	23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
   this is time when killed at "NOTE: Executing Tasks" without showing any =
progress on the tasks (unlike other tests) and only one bitbake process is =
running
633m27.475s	master-next					fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
   this is time when killed at (1417 from 71749) - running very slowly unli=
ke other bitbake revisions where the task number changes relatively quickly=
 - about 10 tasks per second
89m13.992s	master-next + "Holding off tasks %s" out
89m59.201s	master-next updated today			85fe627fdb6510f0942917964386fad9d8c4=
79c8

Interestingly old 1f630fdf0260db08541d3ca9f25f852931c19905 is 3 times
slower than recent master-next.

I'll send -P output next.

>=20
> So basically the original changes showed a 25% hit but the performance
> of -next is dire.
>=20
> This is with no hash equiv server configured.
>=20
> It will vary depending on the target used (numbers with -sato for the
> above would be interesting for comparision) and how much was or is in
> sstate, they type of sstate mirror configured and so on.
>=20
> I really need to focus on getting the new code functioning correctly
> before we attempt to optimise but if nobody tests the new code due to
> performance problems we have a different issue. We also have a scaling
> problem with the hash server itself I need to fix to stop the
> autobuilder throwing weird errors. I'm therefore a bit challenged on
> where to start with it all :/.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXVV0ywAKCRA3VSO3ZXaA
HO42AJ9VeZTfQDszqci9fed+8q5m1yn0gQCgtvVX51u7uGgihR0swWb0DAcEcOs=
=TvcF
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
