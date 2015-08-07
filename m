Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id EF1BD767D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:26:58 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so76054677pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Cd2GCVGXCh8filEMRyckkX0EWGQXfjIu6i+aEeLLqz4=;
	b=sMpk8M7r18Z3S53m2Fcsv0COnXO6+I/oAoyAt5jEB9nFI0clbJ5MtcF6E1zH4pC1tb
	nB5eHRsZaU/ghKO/j9iZaHHNCNfpMVfGaUHCJLFo/08mPRMMaoDj+pQ8XQar/BChOD+F
	PalA8IGSxaaJ6tghKggRPt686jMopd8LS7sJEt7k9iaviLUYiBfiIgn07Aoty2kMCtQZ
	J4sJUcMT6LgZUDW/1fCYKKCUUO8YXpRPQEDTPWUOOmy0Ff/jekOkgP8DrPZuvDwqYX06
	caUDDHSmIhwWj/8LP4R6uV0/n89OfC9cK/780RMX3BHv3dPwgiyvWsnGH4ueaf1c2fcC
	ERcA==
X-Received: by 10.66.145.74 with SMTP id ss10mr18191369pab.28.1438975618713;
	Fri, 07 Aug 2015 12:26:58 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	fv2sm10957685pbd.54.2015.08.07.12.26.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 12:26:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3064000.UnunBGI2RM@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 7 Aug 2015 12:26:56 -0700
Message-Id: <08C4C542-36D0-4009-9492-D2E048CF29DC@gmail.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqKKzPt2z8s8f_3RwH4Zp32HjyXePy0UYTbrqTCuiwdNg@mail.gmail.com>
	<3064000.UnunBGI2RM@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 07 Aug 2015 19:27:01 -0000
X-Groupsio-MsgNum: 69148
Content-Type: multipart/signed;
	boundary="Apple-Mail=_061D56F8-A6B3-4DFC-8CCF-1B860F30CFC9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_061D56F8-A6B3-4DFC-8CCF-1B860F30CFC9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 7, 2015, at 2:51 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Thursday 06 August 2015 19:52:28 Khem Raj wrote:
>> On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton
>>=20
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
>>>> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
>>>>> Added new patch that fixes the memory leak that was introduced in
>>>>> mkdosfs-dir.patch.
>>>>=20
>>>> You should update the original patch then, not pile additional =
patches
>>>> on top. The least painful way is:
>>>>=20
>>>> 1) unpack the sources (manually from tarball, or using bitbake -c =
unpack)
>>>> 2) 'git init; git add *; git commit' to create an git repository =
from
>>>> the sources
>>>> 3) apply the patch that needs fixing, then do the fix
>>>> 4) make a git commit, then produce a patch using git format-patch, =
then
>>>> move the new patch back to the recipe directory and update the =
recipe
>>>> 5) build the recipe to make sure it still builds
>>>> 6) make a git commit with the recipe update, and submit it here :)
>>>=20
>>> On the contrary - the much less painful way (as of fido) is to use
>>> devtool:
>>>=20
>>> 1) Extract source and set the build system up to use it:
>>>   devtool modify dosfstools -x ~/projects/dosfstools
>>>=20
>>> 2) Make whatever changes you want to in the git tree that has been =
set up
>>> in the specified path
>>>=20
>>> 3) Build the recipe (as you would normally) to make sure it still =
builds
>>>=20
>>> 4) Write the modified/added commits as patches back to the recipe:
>>>    devtool update-recipe dosfstools
>>>=20
>>> 5) Make a git commit with the recipe update, and submit it here :)
>>>=20
>>> I'd really like people to start using devtool for this kind of =
thing. If
>>> it's not working for some reason please do let me know.
>>=20
>> This assumes either we use OE-Core or poky, I dont get it to work =
with
>> angstrom out of box
>> what am I missing
>=20
> Well, whatever error / problem you are experiencing seems to be =
missing at
> least ;)


devtool modify dosfstools -x ~/projects/dosfstools
ERROR: This script can only be run after initialising the build =
environment (e.g. by using oe-init-build-env)

so is it must now to use the setup script ? or can be extract some =
needed setup from it to let it work with setups
not using the init script
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_061D56F8-A6B3-4DFC-8CCF-1B860F30CFC9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXFBoAACgkQuwUzVZGdMxSt8QCgh7ivrylcwFOvBfXJQG8WeCjs
fpgAn3EANPa05fd+Xh/wamAmyxwD2BHA
=Msnj
-----END PGP SIGNATURE-----

--Apple-Mail=_061D56F8-A6B3-4DFC-8CCF-1B860F30CFC9--
