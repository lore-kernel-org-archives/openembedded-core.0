Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE860766
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:22:16 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id r9so1260386paz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=xVI2HCwB37+XTCY1fznh8EW45PgvErkD7FHPN3yqaRA=;
	b=BeGzVAowTZZlQPFr8TicJkiUMvmm6aox1H7qPNXUoidU1gmWu+kh4FMNgeQNKhqg5U
	PlJZtZ98xWQAU5wt0ajHHKm64fOFLwM6ryOGDZ6x9f73sAjtNhjnOdAVB2rqKBh85PlT
	KwkmX8RP7XWZUNCQcomJTspbNOnZ3skvHyGzOAUW7bagJxLTPr0Bo6ix16FA9D7zZRhK
	aA77EMfzddjFLgHTeWYNnzs72LljbH/uCtjRSlUA/XAZVGZqYTAdZ0w6lpnLzUuF6FL7
	91ob2PZVg/Rz+I6Dk5ZT1BMIGcybKs0LIGxGU2jCAZ0dZiKCWqZDrj9kaCKh3f2gHBZi
	rA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xVI2HCwB37+XTCY1fznh8EW45PgvErkD7FHPN3yqaRA=;
	b=VgmQXeRUFN39IiioqYpeqboe5MFTQrCm7zw5/9zJkO6Bp7NCHVvii0jc9iBtw/ceH7
	CNlwdoAydVFLFjieuWo7s6kR9m3127KTPInfdyj1Afzw51VfK8d6aW599WTaWbZZz+7Z
	sSYkKinDMo4SswNzqwLExhBPl2JV/YtENHhsDmcYep5pH8xZ5YumdzLuTb66Pr5X3CoW
	YDwa5uiD1fcPhGJiV+23Kyn0ebHfrlEGqRvkkS8cEOBdMKsfL8+TaoVEyZpiyvSmdy6v
	y9IadaOjSdApi4SR+BK7ehwWopTNHPahWOOQG8FIqkghodE9dVJhsBMBETDDvKsPvUkI
	UhSw==
X-Gm-Message-State: AA6/9RlaEtIFYC4ByQN5oDlQRjjP8MmHKani+UThbfOzcjbFsk/uuOPzClaqaeZLrcIqnQ==
X-Received: by 10.66.156.5 with SMTP id wa5mr22288996pab.149.1475767337502;
	Thu, 06 Oct 2016 08:22:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:d4a2:778a:22df:ef?
	([2601:646:8882:b8c:d4a2:778a:22df:ef])
	by smtp.gmail.com with ESMTPSA id f2sm2275137pfg.73.2016.10.06.08.22.15
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 08:22:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
Date: Thu, 6 Oct 2016 08:22:09 -0700
Message-Id: <4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
	<CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
	<687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 06 Oct 2016 15:22:16 -0000
X-Groupsio-MsgNum: 87961
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BA63F1AB-102E-4D00-A56E-59636CDF425A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BA63F1AB-102E-4D00-A56E-59636CDF425A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 6, 2016, at 7:21 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 10/5/16 9:59 PM, Khem Raj wrote:
>> On Wed, Oct 5, 2016 at 7:33 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>> On 10/5/16 9:11 PM, Tan, Raymond wrote:
>>>> Greetings, I would like to know if there is any plan / schedule to =
upgrade to openssl 1.1.0 into OE-core?
>>>=20
>>> Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not =
scheduled to be LTS.
>>>=20
>>> For the upcoming release (soon), I would NOT expect 1.1.0 to be in =
it.  There
>>> are still too many incompatibilities with other components.
>>>=20
>>> For the next version of OE, I think it is appropriate to include =
1.1.0, but I
>>> would also like to maintain 1.0.2 for the time being.  (Beside LTS, =
it also is
>>> still the only way to have FIPS-140-2 module, as there is currently =
no module in
>>> the 1.1.0 -- and there may not be for a while.)
>>=20
>> What do we get with 1.1.0 ?
>=20
> Latest and greatest code of course.. :)
>=20
> Reality, not a lot more over 1.0.2... there are some significant =
redesigns that
> should help improve overall security of the OpenSSL library and items =
using the
> library.  But various things will have to be updated to make use of =
this.
>=20
> The OpenSSL community itself is looking at 1.1.0 as a transition to =
newer and
> better design/api/etc... which is why it is not marked as a LTS =
release.

api changes can be a bothersome point from integration POV, do we know =
if there
are some forwarded porting incompatibilities in APIs already?

>=20
> Beside my basic understanding (above) there should be information as =
part of the
> 1.1.0 release notes.
>=20
> --Mark
>=20
>>>=20
>>> --Mark
>>>=20
>>>> Thanks!
>>>>=20
>>>> Raymond Tan
>>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_BA63F1AB-102E-4D00-A56E-59636CDF425A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf2bCUACgkQuwUzVZGdMxTADQCfTOf0u1UtyB53gX7B0LVFAKve
V3wAoIDa08nmmZYmd7DH7TXfTvoeT/Dq
=9bc3
-----END PGP SIGNATURE-----

--Apple-Mail=_BA63F1AB-102E-4D00-A56E-59636CDF425A--
