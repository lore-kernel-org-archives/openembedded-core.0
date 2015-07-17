Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7598573E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:02:07 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so53236147pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=W6lc3VOypSuv2ZqiNBb7x8R8WAeaC4IrWy8pZFsPVgY=;
	b=S0YUq5HLUQeG8NKjNOyUt7XDL+Qqmpo1XO23Xt+qbnXOfxV6etpGRXVoabyVHAIXd2
	iHanvR6TpIgvbAiOR7W61dufOEKUSLB7hP6BzjY+TIS9ski0emr1m10cjlkL/e8knsKG
	T1T3KC7MCvIwJsA0EdJB0MiIY6irv4BwzEO9xnJ6A1QmD0szAiP/0tcAQ+SGuOWjYsil
	Jv3/UVXVfHC8wR7qLsy6GnqrBMvGwT/JaqNO1N0s9WR1IOBI8yOSS1mrpQiCsVskVDya
	6VpDJVw4hZ8pTMyPWDl3OHVL4WlIzvZZDW+xBYMM9Pj/rXwfsj5ahtY3bFjL4fKD6mFj
	Vd3g==
X-Received: by 10.66.119.136 with SMTP id ku8mr24472424pab.26.1437102128080;
	Thu, 16 Jul 2015 20:02:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7d56:4293:a344:bdf2?
	([2601:646:8601:4580:7d56:4293:a344:bdf2])
	by smtp.gmail.com with ESMTPSA id
	ld1sm9384290pbc.26.2015.07.16.20.02.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jul 2015 20:02:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=XJ1AR1cnYAYRJCJbMmaV9uBTDnFs4_SnwA89ee-ua4Mw@mail.gmail.com>
Date: Thu, 16 Jul 2015 20:02:02 -0700
Message-Id: <14036360-50B0-4BD1-A630-2BEE7FE9CB96@gmail.com>
References: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
	<CAJ86T=VE7a7rUMZMB8LTX0emuqkLOE=E_PvARh4JcQwZuJ+WCw@mail.gmail.com>
	<A4E25F8E-FBB2-4DF9-B208-3A58A2DC71C3@gmail.com>
	<CAJ86T=XJ1AR1cnYAYRJCJbMmaV9uBTDnFs4_SnwA89ee-ua4Mw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2102)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] glibc 2.22
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
X-List-Received-Date: Fri, 17 Jul 2015 03:02:09 -0000
X-Groupsio-MsgNum: 68091
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF5A1595-9612-4131-A147-C39C05830B37";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DF5A1595-9612-4131-A147-C39C05830B37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 16, 2015, at 1:41 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Jul 14, 2015 at 5:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Jul 14, 2015, at 2:56 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> Hi Khem,
>>>=20
>>> On Mon, Jul 13, 2015 at 10:37 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>> Hi All
>>>>=20
>>>> glibc 2.22 will release end of this month. For some time I have put =
together the update here
>>>>=20
>>>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D02e73ea526d94f21c7ef82eb96b062eff8ebb825
>>>>=20
>>>> It works pretty well for machines I have tested it on ( arm/x86 ) =
but would be interested if more wider trial could be carried
>>>> out and issues reported between now and release can be addressed.
>>>>=20
>>>> Please give it a try if you have spare cycles
>>>=20
>>> This was building OK yesterday, but today
>>> "0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch" is
>>> failing to apply due to this upstream change:
>>>=20
>>> =
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Dedcfe9eab03ea=
3dd1b3e04b6056a7663c40265c4
>>=20
>> Thanks for reporting. It has been fixed and branch rebased
>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3Dc43cd1969696970affb094fc0b20ca02c966ecbd
>> is new commit in rebased tree
>=20
> It looks like upstream changed again last night:
>=20
>  =
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Db632bdd3f7c0b=
a0c79f23f5e4404eebb87ebdaa8
>=20
> so 0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
> needs another update.

ah. Bad time for folks to be adding test cases :) its updated now.

>=20
>>>=20
>>>>=20
>>>> Thanks
>>>> -Khem
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> yocto mailing list
>>>> yocto@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/yocto


--Apple-Mail=_DF5A1595-9612-4131-A147-C39C05830B37
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWocC4ACgkQuwUzVZGdMxTYlACgkAl9eEGl0wfSJbAdyEfU/PLL
+8AAnAj95E7YuVGoaqJ5gHNR2auZ3cgu
=84/Q
-----END PGP SIGNATURE-----

--Apple-Mail=_DF5A1595-9612-4131-A147-C39C05830B37--
