Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3B66E767A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:16:18 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so58556744pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=f3DNg0IAdpe3IOCxU4ceh9krqcNBKW7mvpKAdYFm1Ak=;
	b=vyvDKfxMWaLm4f2hb+SdaPxKf5wuGZ0lilAxJLWsz7eboLdbGE68cULPEDLD5F7tWq
	S9x8LQBQpBU9guXZ7VdgMFjAYGlqDi1otj2jp12X7/l8Cx+ikkll2UIQPdGiiYGs6+hT
	Vmvgo6dvk33MHG8QaoS6fsh2KxXE/ARb8j4//+HAnscSR9qdX6HEXftWVuvKtYNgffnC
	sLIUq+uuDqGqRLOatmra2IlDU3oCqqJCLbcXPJWNDywmHFBYhSlblHralK2moVCBRDmW
	Ztyry0LSTe2ayIYoJr5CkaoQr2kI9Swe4kNpJKQZ3JdCyOm+nsA9TR31tDtYyYavBLtj
	5Bng==
X-Received: by 10.68.178.65 with SMTP id cw1mr17705653pbc.111.1438974979325;
	Fri, 07 Aug 2015 12:16:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	x2sm10971194pdx.63.2015.08.07.12.16.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 12:16:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55C4A405.6050209@linux.intel.com>
Date: Fri, 7 Aug 2015 12:16:13 -0700
Message-Id: <673E27E5-D87E-41F2-A7EE-2B2676C9FEF8@gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Fri, 07 Aug 2015 19:16:26 -0000
X-Groupsio-MsgNum: 69146
Content-Type: multipart/signed;
	boundary="Apple-Mail=_14DC48D1-829D-4024-927E-50B9639D5916";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_14DC48D1-829D-4024-927E-50B9639D5916
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Aug 7, 2015, at 5:26 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 08/07/2015 12:17 PM, Philip Balister wrote:
>=20
>> Thanks Khem. I also do not agree that we lack a self-sustaining
>> community. OpenEmbedded has functioned independently for far longer =
than
>> the Yocto Project has existed.
>=20
> By 'self-sustaining' I mean 'being able to continuously produce =
quality work'. Looking at layers in meta-openembedded, not all of them =
are of high quality. Meta-gnome in particular is badly out of date, =
because no one wants to maintain it properly. If oe-core starts taking a =
lot more volunteer contributions,

what a bizarre statement. Let me remind you OE is a open source project =
still and maintained by volunteers.

> and the same thing happens (a volunteer contributes a large set of =
recipes, then disappears), what is supposed to happen then?

someone else picks it up or it rots and get relegated.

>=20
>=20
> Alex


--Apple-Mail=_14DC48D1-829D-4024-927E-50B9639D5916
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXFBAAACgkQuwUzVZGdMxQwGACdEQjbNKCD08KmdWUCMjMQOkY0
NboAnAwxDI4I2AgKKQZ2zphnpYLRad5w
=f4Er
-----END PGP SIGNATURE-----

--Apple-Mail=_14DC48D1-829D-4024-927E-50B9639D5916--
