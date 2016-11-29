Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1619171999
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:51:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2016 06:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; 
	d="asc'?scan'208";a="792136757"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.146])
	([10.219.5.146])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2016 06:51:08 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480362425.6873.209.camel@intel.com>
	<967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
	<1480368843.6873.215.camel@intel.com>
	<e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
	<1480409468.6873.232.camel@intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <7c6ae4e8-1bc8-e77c-5335-5a7f8bfd9d5d@linux.intel.com>
Date: Tue, 29 Nov 2016 08:51:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480409468.6873.232.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Tue, 29 Nov 2016 14:51:08 -0000
X-Groupsio-MsgNum: 90006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="UqDWTolhn0l2aeEoHB5fqN00MsmXgveLL"

--UqDWTolhn0l2aeEoHB5fqN00MsmXgveLL
Content-Type: multipart/mixed; boundary="7ERvWhEse8CTG21RBD5N4CQVx3Dma9O6J";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <7c6ae4e8-1bc8-e77c-5335-5a7f8bfd9d5d@linux.intel.com>
Subject: Re: [OE-core] [PATCH V2] scripts.send-pull-request: Avoid multiple
 chain headers
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480362425.6873.209.camel@intel.com>
 <967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
 <1480368843.6873.215.camel@intel.com>
 <e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
 <1480409468.6873.232.camel@intel.com>
In-Reply-To: <1480409468.6873.232.camel@intel.com>

--7ERvWhEse8CTG21RBD5N4CQVx3Dma9O6J
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/29/2016 02:51 AM, Patrick Ohly wrote:
> On Mon, 2016-11-28 at 16:35 -0600, Jose Lamego wrote:
>>
>> On 11/28/2016 03:34 PM, Patrick Ohly wrote:
>>> On Mon, 2016-11-28 at 14:28 -0600, Jose Lamego wrote:
>>>> Agree. Please provide feedback about below comments and I will submi=
t a
>>>> v3 patch.
>>>>
>>>> On 11/28/2016 01:47 PM, Patrick Ohly wrote:
>>>>> On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
>>>> More than 1 "In-Reply-To" and "References" message headers are in
>>>> violation of rfc2822 [1] and may cause that some email-related
>>>> applications do not point to the appropriate root message in a
>>>> conversation/series.
>>>
>>> Fixing that makes sense. Just add it as reason and the "why" part is
>>> covered.
>>>
>>>>> And I don't understand why this proposed change has the described
>>>>> effect. Does changing the threading parameters change the output of=
 "git
>>>>> send-email" and thus indirectly the mail headers of the following
>>>>> patches?
>>>
>>> The "how" part still isn't clear to me. Perhaps I'm just dumb, but wo=
uld
>>> you bear with me and explain a bit more how changing the sending of t=
he
>>> cover letter affects sending of the patches?
>=20
> I've tried out your proposed change with
>   bash -x ../poky/scripts/send-pull-request --to=3Dpatrick.ohly@gmx.de =
-p pull-11827
> where pull-11827 is my recent bitbake submission.
>=20
> The resulting emails are still broken because that one line that you
> modify isn't event used. It's under "if [ $AUTO_CL -eq 1 ]" and I am no=
t
> using the -a option that enables that behavior.
>=20
> Even when I use -a, the result is still broken.
>=20
> The root cause of the problem is that both create-pull-request and
> send-pull-request allow git to insert In-Reply-To headers.
>=20
> "git send-email --help" explicitly warns about that:
>=20
>         It is up to the user to ensure that no In-Reply-To header alrea=
dy exists when git send-email is asked
>         to add it (especially note that git format-patch can be configu=
red to do the threading itself). Failure
>         to do so may not produce the expected result in the recipient=E2=
=80=99s MUA.
>=20
>>  What I'm doing
>> here is to include no reference to any root message at the first call,=

>> then including a reference at the second call to the very first messag=
e
>> in the chain, which is either the cover letter or the patch #1.
>=20
> No, that doesn't work. Whether the first call uses --no-thread or
> --no-chain-reply-to has no effect whatsoever, because when "git
> send-email" only sends a single email, it doesn't add headers, and the
> second call was left unmodified in your patch.
>=20
You are right, I wrongly tested using patches created with
git-format-patch command, and then send-pull-request which produced a
correctly created chain with only the first change, but didn't tested
creating a pull request in the first place, which is the appropriate.

> The right fix (tested successfully here) is to use --no-thread in the
> second call which sends the sequence of patches. I'll send my  change
> for review separately.
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--7ERvWhEse8CTG21RBD5N4CQVx3Dma9O6J--

--UqDWTolhn0l2aeEoHB5fqN00MsmXgveLL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYPZXeAAoJEFJAtowlSEbnarYH/A17dYMFQ5RaMqa6E91Vazux
HreK/xhbvEKVULPEXEovGuR/mMcqoGJtEQY67/avJbdqDVeLfRfzjMCiRtGLMBvD
13moXf0khkrNctzVz7szMD7CGB9aW3zTj9jd236HgkWb4FHbse2ET/1VBw+lK6bJ
T/KDPGNoyrG/uxRDgBy/E3ZAwcBf5xDfA5XAhX/dSesG3CXJavLi19ktLwnq6wIk
FhDpvFRITBSnHhP1xxBvUywHCHsnyTSKyC1tjwC4CmqBqmc3BVDEJHgo+GllzPHN
e1FXKGmajqTqTOq/LL2Xrm5mFiRGuZKJZD2PWA0bp2X0j6oF60zA4o1HuOs32mo=
=WDFi
-----END PGP SIGNATURE-----

--UqDWTolhn0l2aeEoHB5fqN00MsmXgveLL--
