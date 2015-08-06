Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id D47B076424
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 16:16:14 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so33983854pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=yvprCnY0pTSKRbirFX7jZQpbVEW9UruZt5QFLXjYH60=;
	b=dF5p+die9i5uDq9IKX1ih2DM8aVNF2T3aKgGE2rAQDBsHG/xTps8A4ErLgGXTmVKj2
	ELplVOcVtUERf/uxqqw53ihTS3y3Abylm8YFVjTIbuYIJ7Kpx1P18s9xylg9oje0g4k3
	+CjF5hRfF20ij+teHvl8DHzXZnUQbCpgQJTx+/V1ffCvLUyQoPOCa8qLOz3B7HiCEc0g
	R/vLS7pwYvhY6QaKLpCl9iaohTw41LIgVcF0AtmS5gdBRdtbpil1saWYj5paO+BVM1nu
	XiJyG5hJyoRNOzwj5lsUUBHm6SkVyV+tb7EIllHzn1EnBYHa4GYz1V/ueAyHTY1x9MIZ
	F41g==
X-Received: by 10.66.230.201 with SMTP id ta9mr4807745pac.95.1438877774234;
	Thu, 06 Aug 2015 09:16:14 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e860:4e8d:f547:a4e?
	([2601:646:8601:4580:e860:4e8d:f547:a4e])
	by smtp.gmail.com with ESMTPSA id
	un2sm7090479pac.28.2015.08.06.09.16.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Aug 2015 09:16:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1845103.Q4jRGBvf17@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 6 Aug 2015 09:16:08 -0700
Message-Id: <B2F2739B-4305-4013-96E2-7366D717F569@gmail.com>
References: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
	<3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
	<4ABFBF94-9F87-48E7-8C32-9401658709CE@gmail.com>
	<1845103.Q4jRGBvf17@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: cd to relative directory
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
X-List-Received-Date: Thu, 06 Aug 2015 16:16:16 -0000
X-Groupsio-MsgNum: 69053
Content-Type: multipart/signed;
	boundary="Apple-Mail=_11BE719A-34FF-436E-94EF-D6D4650E93E4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_11BE719A-34FF-436E-94EF-D6D4650E93E4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 6, 2015, at 8:16 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Thursday 06 August 2015 08:05:40 Khem Raj wrote:
>>> On Aug 6, 2015, at 1:38 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>>> wrote:>
>>> On Wednesday 05 August 2015 20:33:48 Khem Raj wrote:
>>>> On Wed, Aug 5, 2015 at 2:01 AM, Ed Bartosh =
<ed.bartosh@linux.intel.com>
>>>=20
>>> wrote:
>>>>> create-pull-request -d path creates empty patches if directory
>>>>> is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
>>>>> It behaves expected way only if script is run with -d bitbake, =
i.e.
>>>>> relative dir name doesn't contain '\'.
>>>>>=20
>>>>> Fixed this unwanted behaviour by changing directory and running
>>>>> git format-patch in it with --relative, without specifying
>>>>> relative path as a parameter.
>>>>>=20
>>>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>> ---
>>>>>=20
>>>>> scripts/create-pull-request | 5 ++++-
>>>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/scripts/create-pull-request =
b/scripts/create-pull-request
>>>>> index 216edfd..7eac618 100755
>>>>> --- a/scripts/create-pull-request
>>>>> +++ b/scripts/create-pull-request
>>>>> @@ -177,12 +177,15 @@ mkdir $ODIR
>>>>>=20
>>>>> if [ -n "$RELDIR" ]; then
>>>>>=20
>>>>>       ODIR=3D$(realpath $ODIR)
>>>>>=20
>>>>> -       extraopts=3D"--relative=3D$RELDIR"
>>>>> +       pushd $RELDIR
>>>>=20
>>>> can we avoid using pushd so it works with non bash shells too ?
>>>=20
>>> Should be possible, but it's worth mentioning that this script =
already
>>> starts with #!/bin/bash.
>>=20
>> Does it have to be ?
>=20
> Are you volunteering to fix any other bashisms in the script? If so no =
;)

looking at the script there seems to be none and checkbashism confirms =
it

checkbashisms scripts/create-pull-request
could not find any possible bashisms in bash script =
scripts/create-pull-request

so in effect this will be the first one. May be in your V2 you should =
remove /bin/bash from interpreter
as well.

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_11BE719A-34FF-436E-94EF-D6D4650E93E4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXDiEwACgkQuwUzVZGdMxSwHACfYDo5bA5zREbzewGr8waiADjh
tW0An0fuZ1yAQZ6/VlmgG0axRhVGrrdU
=lAUj
-----END PGP SIGNATURE-----

--Apple-Mail=_11BE719A-34FF-436E-94EF-D6D4650E93E4--
