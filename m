Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB4076762
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 18:54:51 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so74556839pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=SZxRubPbNT4bkrFj83R7D7Bbb9hvXNcAbwUo91jm5Qw=;
	b=WM3kTG0opvdgUhz8Q+M4xjlUKblDYTVb1jDhcIizE5T7OTYutQMHuRwQM1pBZxB0zI
	4vVH5VNXkOosChb6oP7++D88UDjkpEW5u7/mxM+NFoSTKQ5+b4rv6NGjOtCpsNMlHfvC
	fuaIB2KP/eTYTWgI/8ifZVDxoId/cCimSBYg4OwefpiQIKTLmj7iZtGG42w0nfEsRpt+
	IMMx3o8QDGIruvFfY9chTRNa1kTSd5E+cqWDH1IgABPxKJqRBI6GTvgHwwich/v69Koe
	1/opJWYSEE4r93Wzr1ol5CKVra07bhAyXvba40ayPgjUxH96fa2Qh0xTQFusNXPS87Ap
	cP8w==
X-Received: by 10.68.196.233 with SMTP id ip9mr28655407pbc.139.1439060091690; 
	Sat, 08 Aug 2015 11:54:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	y6sm14338504pdl.61.2015.08.08.11.54.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 11:54:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2404070.xrxV9F6QNR@peggleto-mobl.ger.corp.intel.com>
Date: Sat, 8 Aug 2015 11:54:45 -0700
Message-Id: <D525FF28-FAA1-4D3F-A4FF-99E60401DC45@gmail.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<3064000.UnunBGI2RM@peggleto-mobl.ger.corp.intel.com>
	<08C4C542-36D0-4009-9492-D2E048CF29DC@gmail.com>
	<2404070.xrxV9F6QNR@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Sat, 08 Aug 2015 18:54:55 -0000
X-Groupsio-MsgNum: 69158
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1C1FDC3D-C2D6-4D26-A6FB-0B22AC605E35";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1C1FDC3D-C2D6-4D26-A6FB-0B22AC605E35
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 7, 2015, at 12:54 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Friday 07 August 2015 12:26:56 Khem Raj wrote:
>>> On Aug 7, 2015, at 2:51 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>>> wrote:>
>>> On Thursday 06 August 2015 19:52:28 Khem Raj wrote:
>>>> On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton
>>>>=20
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
>>>>>> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
>>>>>>> Added new patch that fixes the memory leak that was introduced =
in
>>>>>>> mkdosfs-dir.patch.
>>>>>>=20
>>>>>> You should update the original patch then, not pile additional =
patches
>>>>>> on top. The least painful way is:
>>>>>>=20
>>>>>> 1) unpack the sources (manually from tarball, or using bitbake -c
>>>>>> unpack)
>>>>>> 2) 'git init; git add *; git commit' to create an git repository =
from
>>>>>> the sources
>>>>>> 3) apply the patch that needs fixing, then do the fix
>>>>>> 4) make a git commit, then produce a patch using git =
format-patch, then
>>>>>> move the new patch back to the recipe directory and update the =
recipe
>>>>>> 5) build the recipe to make sure it still builds
>>>>>> 6) make a git commit with the recipe update, and submit it here =
:)
>>>>>=20
>>>>> On the contrary - the much less painful way (as of fido) is to use
>>>>> devtool:
>>>>>=20
>>>>> 1) Extract source and set the build system up to use it:
>>>>>  devtool modify dosfstools -x ~/projects/dosfstools
>>>>>=20
>>>>> 2) Make whatever changes you want to in the git tree that has been =
set
>>>>> up
>>>>> in the specified path
>>>>>=20
>>>>> 3) Build the recipe (as you would normally) to make sure it still =
builds
>>>>>=20
>>>>> 4) Write the modified/added commits as patches back to the recipe:
>>>>>   devtool update-recipe dosfstools
>>>>>=20
>>>>> 5) Make a git commit with the recipe update, and submit it here :)
>>>>>=20
>>>>> I'd really like people to start using devtool for this kind of =
thing. If
>>>>> it's not working for some reason please do let me know.
>>>>=20
>>>> This assumes either we use OE-Core or poky, I dont get it to work =
with
>>>> angstrom out of box
>>>> what am I missing
>>>=20
>>> Well, whatever error / problem you are experiencing seems to be =
missing at
>>> least ;)
>>=20
>> devtool modify dosfstools -x ~/projects/dosfstools
>> ERROR: This script can only be run after initialising the build =
environment
>> (e.g. by using oe-init-build-env)
>>=20
>> so is it must now to use the setup script ? or can be extract some =
needed
>> setup from it to let it work with setups not using the init script
>=20
> Well it needs to be able to run bitbake internally (directly and using
> tinfoil), hence the need to have the environment set up to do so. I =
don't
> really see a way around that.
>=20

Then limited use of  devtool should be documented as available

--Apple-Mail=_1C1FDC3D-C2D6-4D26-A6FB-0B22AC605E35
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGUHkACgkQuwUzVZGdMxTWTgCeNo9FXstNpgz4pYVJQxgsQucg
0RYAn1d7h/5z4c2Pg7Pow7O0EpkZ0/ti
=aO1u
-----END PGP SIGNATURE-----

--Apple-Mail=_1C1FDC3D-C2D6-4D26-A6FB-0B22AC605E35--
