Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 34165772AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:36:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2016 12:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; 
	d="asc'?scan'208";a="877232198"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2016 12:36:59 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	richard.purdie@linuxfoundation.org, benjamin.esquivel@intel.com
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<2011452.Q9kTNeH3mx@peggleto-mobl.ger.corp.intel.com>
	<56B3B0B8.3010600@linux.intel.com>
	<4933227.rYH5s4XHH6@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B3B6E0.4000309@linux.intel.com>
Date: Thu, 4 Feb 2016 14:38:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <4933227.rYH5s4XHH6@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 23/28] Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable"
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
X-List-Received-Date: Thu, 04 Feb 2016 20:37:00 -0000
X-Groupsio-MsgNum: 77545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="6BFLERlxTwirIj9PqaFfMqARPin5hESmI"

--6BFLERlxTwirIj9PqaFfMqARPin5hESmI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Comments below,

On 02/04/2016 02:19 PM, Paul Eggleton wrote:
> On Thu, 04 Feb 2016 14:12:40 An=EDbal Lim=F3n wrote:
>> On 02/04/2016 12:34 PM, Paul Eggleton wrote:
>>> On Tue, 02 Feb 2016 18:30:35 An=EDbal Lim=F3n wrote:
>>>> This reverts commit 303985d3f402013c7c4a3355f19d48b1cef1c12f.
>>>>
>>>> As discussion with Paul Eggleton, he don't want to have env variable=
s
>>>> to change the behaviour of what the env script needs to print,
>>>> i'll redirect the output in oeSDK.run() method.
>>>>
>>>> I didn't agree because it can hides another messages like error ones=

>>>> and with the variable you can control what prints or not.
>>>>
>>>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>>>
>>> We don't want to add this and revert it in the same series.
>>
>> Ok, then i'll send another series without this commit and this revert =
in
>> another commit.
>=20
> If you mean without both the commit and the revert, then yes.
>=20

No i don't mean that way because i don't agree with this change and i
consider this as *CENSURE* because if i someone don't agree a change the
why? information need to be placed in the git repository for future
references.

I'll make the changes that you requested to drop the two commits (i'm
still disagree) for don't stop the process of integrate the eSDK tests
that we need for a some time ago.


Cheers,
	alimon

> Cheers,
> Paul
>=20


--6BFLERlxTwirIj9PqaFfMqARPin5hESmI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWs7bkAAoJEGJqcE9h3glgUW0P+weukwIiewoYzVKm36lMgor6
MDIaUwVjHXZu0I7jxqYFQYCgmUL1RlQZm3a+amFRaWt8rHR6pAUh/n2QsM39l3FY
aP+PSTgskxyBso97BGIIXB5OJD0urFj4+Km7Pj3ZiiQax1L/9kPR23A4KFpGUofP
fpcjo/ZXIEVAcG2lvRTYInZSkc9nSdLuh7Y4dEiC3CslU0ugLVndFrKzoKgAHdhH
mL/7yS1So+raw/5UUAOSAc1ari1eFOT+my5IiRE+iCm+zoolngc+TEwabfKyxpFt
5wTj21RxB0Xn3WX+Yy8VDUQ5YDuAauUkXxX/h5g7ZgZtkbtpEUsG4JOagJX++g/K
UpoanAPvrw0sGLQbnc7lZ0tGXkFB/gqtD6kTx6DGNTQRskMhVKbhRuW1/FSr+Ryw
mXGEqbAPt/i0wtD9n0BtaL4M0f4AJyC7sAxM0FymVlsRSZflhg4YXHowqYjAqWvh
wlnnGxtpgGs47k0IcKGlFXuF3zVKyUxIjZO+zKyP1751iL5qUQslYW/T0yNg047U
TUdyAuZ01Yi11iuX5D5avwwoa/UMt4mUZNP2K/xkDlA170vhoNW8VpBzzzSCkdfx
szKX2Tec/VJJ06vspOb6+xKz2M3xJy3Wl1gKoZgdaQuRZuBIUhFvTOVlMs5ajs6R
o1Lfo5QUuMv+qWhV9EN6
=9vfI
-----END PGP SIGNATURE-----

--6BFLERlxTwirIj9PqaFfMqARPin5hESmI--
