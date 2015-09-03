Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6306176DEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:15:19 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so2640813ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2O2GILAUexE5+ImBaVJlXEcREGmNNu5Ss8XGOBF/fu0=;
	b=DTDf/QTOdOcLOAXKkuKHrIGhVvTIXYA5kLs9RYCJlGnuijpgIn6HBxjSXeaECC65LT
	KW+2eHChCIKv7T3RDQ+q+lxZ6P6gTCSrOt4tpwQRQVDd2qhpiETUqMEkKfegkCTMpsKh
	JcvRGGuoafadbvexODnTCLSUtG2ctBRc2TfQb+1v+vDasXjIIVAzqrjxBJbLYg522oRW
	GIx4cyEjEw/SE8ILKzsZ0J3OVswrljvmXxTpyt0Ks9eSr30Ww3BZWMfpDNoj6UmsR3yD
	UvWiZ2WFg4BaQ22Ov2gGRCcYUuh8WKIgN7nK2o3XKRPvV7tZb0nNKYCx7L+CVfAS+PSH
	JXww==
X-Received: by 10.107.25.1 with SMTP id 1mr220719ioz.39.1441314919790;
	Thu, 03 Sep 2015 14:15:19 -0700 (PDT)
Received: from 10.168.190.13-ra01.englewood.co.denver.comcast.net
	(fw01.aurora.co.denver.comcast.net. [198.178.8.81])
	by smtp.gmail.com with ESMTPSA id os9sm188622igb.11.2015.09.03.14.15.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 14:15:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441312024.24871.135.camel@linuxfoundation.org>
Date: Thu, 3 Sep 2015 14:15:12 -0700
Message-Id: <584C7C63-C980-48F9-AFCF-8F18E8C8E442@gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:15:20 -0000
X-Groupsio-MsgNum: 70612
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A37E7EC4-1E6A-4CBC-91A3-43EB8460BC5D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A37E7EC4-1E6A-4CBC-91A3-43EB8460BC5D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 3, 2015, at 1:27 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield =
<bruce.ashfield@gmail.com> wrote:
>>>> To put this another way, I think it is probably reasonable that we
>>>> should be able to build an image from OE-Core with basic =
functionality
>>>> like networking without busybox?
>>>=20
>>> That's what I'd support. If everything you need for the =
functionality with busy
>>> box is in oe-core, to me, it doesn't make sense to go outside core =
to get that
>>> same functionality without busybox.
>>=20
>> irrespective of this change. I see yet another configuration with =
this
>> into OE-core, overall OE-Core should get smaller
>> and case does not sound convincing to me. You dont want to use =
busybox
>> in a fairly large image which has other GPLv2 software in
>> it. Thats fine but doesnt look like a common usecase to me
>=20
> Nobody mentioned GPLv2, that isn't relevant here.

I assumed thats one reason to not include it. I am trying to understand =
reasoning to
not include busybox. Or is is just because its a poster child for =
litigations.

>=20
> I have heard OE being dismissed since it can't produce an image =
without
> busybox in it. The implication is we can't build "big" Linux, only =
small
> embedded things. The pieces we need busybox for are tiny and should be
> easy to replace (like this does).

as we include other alternative providers, they get preference over =
busybox applets
even if busybox is part of it.

>=20
> So I can see a fairly compelling argument for OE-Core to be able to
> generate a busybox free image with standard functionality just from a =
PR
> perspective. =46rom what I gather we have people willing to test and
> maintain it too=E2=80=A6

PR I see. I was searching for technical reasons.

--Apple-Mail=_A37E7EC4-1E6A-4CBC-91A3-43EB8460BC5D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXouGQACgkQuwUzVZGdMxSKGwCgktvP1oGXwdmJdd5Xjr4UKFMs
33AAn1L2TOQ37qHCn0ufukLnTKhIna2o
=54WG
-----END PGP SIGNATURE-----

--Apple-Mail=_A37E7EC4-1E6A-4CBC-91A3-43EB8460BC5D--
