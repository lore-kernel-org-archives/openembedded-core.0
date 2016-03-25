Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C1DBA731F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:35:20 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tt10so38551674pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 21:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ms+wsXmfjLuY7u6mLbroO/KTnFzqbOJu91whdiiR7B0=;
	b=xGrvsy9ORbcDwTsLa+QxRw63lQ+Kq8shmzEX52gKyCjCRgTRwTddvI+tILaggLc5ig
	BRGT/FELyWyd4TP+Ky21azzVGAcGvGy3f2ZGccYOgPXUE+6/fbGgAe6XkterqOb2JCb8
	2mRjZCjP/jh6ngph7cvTPxzcnmIcE446jxjWPWg3GEkTYzLo9EOAYfPaUXUXPOj3wR2j
	3M9pusOYjeYW//rVQ+Iu0hoePo/pz7ZE0mcs0rnnKpC1G0dv3gv1LiTzJOXn8MFaNTjE
	09jPdJJCgE5FJ2RaLxXAWbGTVeKQK51zObHoqn05HcIVdZiSEWIKZQ+9/wbJs0IQ9tmP
	a3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ms+wsXmfjLuY7u6mLbroO/KTnFzqbOJu91whdiiR7B0=;
	b=IDtF1uBPLu6VrhjPypa/ME+E7UH538BRzbbtt4j6I69LB5LmsvpxD8H6BC/AJHqjgw
	Yh6M/rB1QCXH54E1rRFoCbE/ghToMoW7ZF/U0GzHu3fTqeJ266Q5QjTZVrgY47f47kY3
	V1m0w0DeCH7drMkVQrt7Uo7fjbt0PCEF0No7Wyu0l7Atol6YbuBzUKiMH6SO6uK14tS7
	D9bM5m0ISSagpu4uqNQ0KFMlcpyutxktIXMz/n+PQdBSVCPpKnxab2hYrOSGjddfJ579
	dZwui/KLwCOUmz4Z8k2XCbsaoFjiH0xVLxWXV+vKfiOQX3eFDMdLl8r65UdE2rFrh2AH
	Oynw==
X-Gm-Message-State: AD7BkJL173BCojIg2/pXkD4k3LwHnfIdz6V8ujkH62PPMFGDWphRu9uqstLWeT1seov59w==
X-Received: by 10.66.235.129 with SMTP id um1mr17917344pac.17.1458880521531;
	Thu, 24 Mar 2016 21:35:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:19a:36c7:1ab2:7027?
	([2601:646:8800:5a9a:19a:36c7:1ab2:7027])
	by smtp.gmail.com with ESMTPSA id
	qh8sm13309346pac.40.2016.03.24.21.35.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 21:35:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160325042432.GA25837@zardoz.amer.corp.natinst.com>
Date: Thu, 24 Mar 2016 21:35:15 -0700
Message-Id: <9683A4C8-D33B-4849-B85D-48104A450193@gmail.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
	<1458688681-31394-3-git-send-email-brad.mouring@ni.com>
	<CAMKF1spi=cuJpMNXqAoEBL57L7q6rw1+fZ_=+sxhqB04z6YXYA@mail.gmail.com>
	<20160325042432.GA25837@zardoz.amer.corp.natinst.com>
To: Brad Mouring <brad.mouring@ni.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox_git: Fix SRC_URI
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
X-List-Received-Date: Fri, 25 Mar 2016 04:35:24 -0000
X-Groupsio-MsgNum: 80133
Content-Type: multipart/signed;
	boundary="Apple-Mail=_694E4173-B929-42C9-89A5-511407224E6B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_694E4173-B929-42C9-89A5-511407224E6B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 24, 2016, at 9:24 PM, Brad Mouring <brad.mouring@ni.com> wrote:
>=20
> On Thu, Mar 24, 2016 at 07:50:27PM -0700, Khem Raj wrote:
>> On Tue, Mar 22, 2016 at 4:18 PM, Brad Mouring <brad.mouring@ni.com> =
wrote:
>>> Since the commit called out in the recipe is off the master branch,
>>> update the gitful SRC_URI to specify the branch to use for the
>>> recipe.
>>=20
>> no, we want master for the git recipe.
>=20
> The commit, as called out in the recipe, is not on master, but is =
rather
> a stability patch collection=E2=80=A6

then change it to use a valid commit from master.

>=20
> =46rom busybox's history
>=20
> master
> |
> | 1_23_stable
> | |
> V V
> ...
> * 8074a6c udhcpd: account for script delay in lease
> * b996507 Start 1.24.0 development cycle
> | * be947c4 Apply post-1.23.1 patches, bump version to 1.23.2 <<< =
SRCREV
> | * 1ecfe81 Apply post-1.23.0 patches, bump version to 1.23.1
> |/
> * 6968e08 Bump version to 1.23.0
> * ca9c465 libbb: add sanity check in bb_arg_max()
> * 11775ed randomconfig fixes
> ...
>=20
> I have no qualms picking a commit in master, but it's also not really
> my call to make. I am open to suggestions
>=20
>>>=20
>>> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
>>> ---
>>> meta/recipes-core/busybox/busybox_git.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-core/busybox/busybox_git.bb =
b/meta/recipes-core/busybox/busybox_git.bb
>>> index 529ed5b..47c1364 100644
>>> --- a/meta/recipes-core/busybox/busybox_git.bb
>>> +++ b/meta/recipes-core/busybox/busybox_git.bb
>>> @@ -6,7 +6,7 @@ PV =3D "1.23.1+git${SRCPV}"
>>>=20
>>> S =3D "${WORKDIR}/git"
>>>=20
>>> -SRC_URI =3D "git://busybox.net/busybox.git \
>>> +SRC_URI =3D "git://busybox.net/busybox.git;branch=3D1_23_stable \
>>>            file://get_header_tar.patch \
>>>            file://busybox-appletlib-dependency.patch \
>>>            file://busybox-udhcpc-no_deconfig.patch \
>>> --
>>> 2.7.3
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_694E4173-B929-42C9-89A5-511407224E6B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb0wAcACgkQuwUzVZGdMxSGWgCeL7eqwidqrrkcTuUVfbTI568Y
zWYAoIIbXCm2jmrDMF4hr5UOtA9MNOLZ
=Ujuj
-----END PGP SIGNATURE-----

--Apple-Mail=_694E4173-B929-42C9-89A5-511407224E6B--
