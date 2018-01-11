Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id A367778062
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=YHKOpQ8COlmMPWsEOTvFbLGBEbJtl5Y/tX3gum3c2UI=; 
	b=f2Anr1yiu9c3NGlOU6YAblJoT9yDDUXKB4wMvDCow17ayNVMfYUo7eeEmBm2w49tg3gC1Nx76bGVmS6+/6rvDn/t1CXQSi/JLtld9h4yUGNX5XM5ON5Nadhrzq2m58jAWtXErtGlTsJbDserzFHjLP9L3yEYi83iEr2BKfZDuv/PLfh0cOnoHtHabJ6k97hPjN5uyhhrUQLX6aMHAQxHEW9e4R4MHGGfS7rj47tUefFAsQO2FWQTks1sUvBjmV56eENWugrgS4V1H7BUpezhRIhxOPR6boGavmEbn9GEySp9EyS+o5VinA07y/hCX5W8cl0RD02KLibspJirp1bAEA==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1eZchX-0002RH-Gp; Thu, 11 Jan 2018 14:15:23 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180111040858.22280-1-clopez@igalia.com>
	<1515666561.29722.115.camel@linuxfoundation.org>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <3ea7fc30-6099-7c74-ee90-db3ab55b6020@igalia.com>
Date: Thu, 11 Jan 2018 14:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1515666561.29722.115.camel@linuxfoundation.org>
Subject: Re: [PATCH] tune-i686: Add new tune for better support of 686-class CPUs.
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
X-List-Received-Date: Thu, 11 Jan 2018 13:15:24 -0000
X-Groupsio-MsgNum: 106888
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="2oHlvEInpRfHlGEs38MF3MP72dMQFIkqt"

--2oHlvEInpRfHlGEs38MF3MP72dMQFIkqt
Content-Type: multipart/mixed; boundary="a6r2lO9EJMkF3x3vTAfktRSuX84Qr6SBW";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <3ea7fc30-6099-7c74-ee90-db3ab55b6020@igalia.com>
Subject: Re: [OE-core] [PATCH] tune-i686: Add new tune for better support of
 686-class CPUs.
References: <20180111040858.22280-1-clopez@igalia.com>
 <1515666561.29722.115.camel@linuxfoundation.org>
In-Reply-To: <1515666561.29722.115.camel@linuxfoundation.org>

--a6r2lO9EJMkF3x3vTAfktRSuX84Qr6SBW
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 11/01/18 11:29, Richard Purdie wrote:
> On Thu, 2018-01-11 at 05:08 +0100, Carlos Alberto Lopez Perez wrote:
>> There isn't currently any tune available for i686 x86 optimizations.
>> The tune for i586 doesn't enable i686 specific optimizations, and the
>> one for core2 enables things that won't work on a i686 CPU (like
>> SSE3).
>>
>> This patch also changes the default tune for the qemux86 machine from
>> i586 to i686. This should cause no issue, as "runqemu qemux86"
>> already
>> defaults to run with "-cpu pentium2".
>>
>> The tune for core2 now inherits from this one, which allows to remove
>> the override on the X86ARCH32 definition.
>>
>> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> ---
>> =C2=A0meta/conf/machine/include/tune-core2.inc |=C2=A0=C2=A07 ++-----
>> =C2=A0meta/conf/machine/include/tune-i686.inc=C2=A0=C2=A0| 25
>> +++++++++++++++++++++++++
>> =C2=A0meta/conf/machine/qemux86.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
>> =C2=A03 files changed, 28 insertions(+), 6 deletions(-)
>> =C2=A0create mode 100644 meta/conf/machine/include/tune-i686.inc
>=20
> Please don't do multiple things in a single commit like this.
>=20
> The qemux86 default tune change isn't as simple as it might first
> appear as it changes the output artefacts which may or may not mean
> changes to the testing infrastructure (I'd hope not but I also know the=

> reality).
>=20
> Adding the tune itself should be more straightforward.
> > We do need to keep track of the comment "Set x86 target arch to i686,=

> so that glibc enables SSE optimised memcpy, etc." as i586 verses i686
> does make a significant difference to the glibc config.
>=20

Sure, I will keep track of the comment. I'll follow-up with a new patch.

Due to this significant difference in performance for glibc, it seems to
me it is worth to try the change on the default tune on qemux68 machine.
Hopefully it will speed-up a bit the testing times both on the testing
architecture and the developer machines.
Will splitting the patch in two will help with this?


--a6r2lO9EJMkF3x3vTAfktRSuX84Qr6SBW--

--2oHlvEInpRfHlGEs38MF3MP72dMQFIkqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlpXY2oACgkQllCJzmuV
+ILceg//WCdj0gHQGPZ9fursLOb9UydPl8ngYcnZ7+HvWkdJtLK378MScDuIFkfB
/UPN6VE8+Co5RInG2UNghwq4y1DHVVnPyFFQFSOiCTgwGjGnko2SXhdGlTBtnPX9
l4r78TdCsSnv4i2ev0wodI0bDX8aYabeH5uEN3xuHR1pCsu+HLk8bfyLaBPZvuNb
HPX/9gM26jibuROBiNvdxYfhp8K25XL4FjVi6NgKbVb8zy7cHATrtFYOQVYbVOly
O9Rwhv6eiLMv1rNC+7hDcZ6AlxMOpWHxnrYHrg2bmWWDUKeG8Z3VLmHRg/ivLSMj
2tMtL129DgEhARMNoAmFfi9Tf3QXTG97HerbtgHsIyJXThr0NKh0fRAvdpNKKxpn
ZbMKJ8uVf5t8buRbjlp+LQUeUSvwHH8wg+fOCUzBtNHVzuP76J/tDotQI69SGCDG
Z/Uc+3chO9/YCdZ94JhUsppYtucJpD+beQkkq3I1/68IsekaMNuq/l0f+JtglI9B
hq+UtrUYwa2DmV2ZDUeYPdhukBCin/luQzzczJV5t+jNi9G/9rOH1zphDYMYf21r
Gtf/3+ofD3OP4xDq+yhrIpEyc86UqGwALJXZFQXUmG/FHSSpd0U5H461o5hBsDCl
1uRrzy69nxGtqegxNhdTlItfjgOKiG4LoumWsdNdCoxB72OLRjs=
=T7h2
-----END PGP SIGNATURE-----

--2oHlvEInpRfHlGEs38MF3MP72dMQFIkqt--
