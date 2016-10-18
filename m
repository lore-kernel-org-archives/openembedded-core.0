Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6777760290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:53:24 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r16so77674pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=7sQcCjaqQynKvYOXmnTU6ZJnQHRRLLac4RDKr2iy/fA=;
	b=BbAmtt8h0OCiQTJZh6aVSHdMTR+XXN63moxepssWRs9Ty/ydqMJ57bN4HBZlpfjnHr
	qx3W06MzhNaOsZR9s5wrmnIn5iw3WvQi/mWRbIOMYag51unuucrlh6MfMEp/RczC024O
	bhe08xxnFUtlSH13x0Xz1lmogRaVLEmyQxGdU/0yrNOG6lGMjrLmH/WaIoHvVs/gckgN
	0BwldQjBd41zmnQdrz/OrQS+l8JJ7Da/qgC3NsK3f6Ox0QrQPq+OdXCDJnJ/nMaK2uv2
	X2mXqsdbkjOePVwvwZ8J/MHLUEoOVjzudN6GskdvYxpf6jmcbnsUdwduHSh0j3WiUyoT
	knKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7sQcCjaqQynKvYOXmnTU6ZJnQHRRLLac4RDKr2iy/fA=;
	b=CoArpvQAOoT7dkAb/DqA9EtKtjuGJIb6K3IYL3Z0OwsE8lZQveMFtiTbq+0rZG0NBs
	IjJcbWpX1cZFwK2Bfn2DRjDe4iDmf2R/UTbSlmU4eF14IhcULvSYsyfHw/fXUHhjr4F5
	mF5soPMn+E1fc3XDcnc+QOq/5H3hqCLR+u1koo8VIDSg6gmN/oHL2FbrYQwJGBKaU/nS
	awXpTt5LK5UCTZmSoZPCoy+m8rFjrmUW5pTs3XPscIL+AUR9X1+MD8JNUZui4KHE0ILz
	6l3MjeRHaCrxFEuZdLY0A8Fuwka5AxP+I1XoIedPn4OPgvu0yYcke3sBGQgQR4fbJUCE
	ga3A==
X-Gm-Message-State: AA6/9RlF1AI6vvllKhPM6ZUPTdn9dC5P/4B3mHrxtr7iRtCzCyIyIJ+Ke0OL1lUS+p8czQ==
X-Received: by 10.99.97.76 with SMTP id v73mr2235199pgb.154.1476813206670;
	Tue, 18 Oct 2016 10:53:26 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	h185sm27033177pfe.35.2016.10.18.10.53.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Oct 2016 10:53:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61189B148@ORSMSX112.amr.corp.intel.com>
Date: Tue, 18 Oct 2016 10:53:21 -0700
Message-Id: <C5BBB3EA-468F-456B-ABBA-E692E204FBAC@gmail.com>
References: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
	<F6C44CA5-B615-4B5E-9878-A3BE33E35822@gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61189B148@ORSMSX112.amr.corp.intel.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: Add xtensa and arc into valid_archs table
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
X-List-Received-Date: Tue, 18 Oct 2016 17:53:25 -0000
X-Groupsio-MsgNum: 88329
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8264E8EE-A95D-4B94-9747-77368C32491F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8264E8EE-A95D-4B94-9747-77368C32491F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 18, 2016, at 9:13 AM, Bystricky, Juro =
<juro.bystricky@intel.com> wrote:
>=20
> The single purpose of "map_kernel_arch" is to set
>=20
> export ARCH =3D "arch_xxx"
>=20
> Presently, we must set ARCH even when building baremetal toolchains =
only,
> without any need to build kernel. However, in this case we may
> encounter a bogus error such as "cannot map arch_xxx to a linux kernel =
architecture".
> The simplest way to avoid this is to place arch_xxx into the table
> "valid_archs". (That was the main reason for the patch).
>=20
> A better but more complex way would be to modify the code so
> map_kernel_arch is not called at all when NOT building kernel or =
kernel
> modules. This would also allow building baremetal cross-toolchains for =
arches
> that don't have Linux kernels at all.
>=20
> Another way to consider is perhaps just getting rid of the table
> "valid_archs" entirely.
>=20
> "map_kernel_arch" maps arch_aaa -> arch_xxx for some cases.
> If there is no explicit mapping, then it could simply map
>=20
> arch_aaa->arch_aaa
>=20
> resulting in export ARCH=3D"arch_aaa"
> There would be no error generated. If ARCH is not a valid
> arch for a Linux kernel, we would encounter a build error at some =
point.
> But that, I believe is the same case now if we try to build a kernel
> with a valid kernel ARCH but not supported actively in OE or extended =
OE ecosystem.

I think you should add a check for testing TARGET_OS and if its not =
linux then
ignore the valid kernel arches check.

>=20
>=20
>=20
>=20
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Monday, October 17, 2016 4:40 PM
>> To: Bystricky, Juro <juro.bystricky@intel.com>
>> Cc: openembedded-core@lists.openembedded.org; =
jurobystricky@hotmail.com
>> Subject: Re: [OE-core] [PATCH] kernel-arch.bbclass: Add xtensa and =
arc into
>> valid_archs table
>>=20
>>=20
>>> On Oct 11, 2016, at 9:31 AM, Juro Bystricky =
<juro.bystricky@intel.com>
>> wrote:
>>>=20
>>> Both "arc" and "xtensa" are valid Linux architectures, add
>>> them into valid_archs table.
>>>=20
>>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>> ---
>>> meta/classes/kernel-arch.bbclass | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-
>> arch.bbclass
>>> index 8a4bef1..ea976c6 100644
>>> --- a/meta/classes/kernel-arch.bbclass
>>> +++ b/meta/classes/kernel-arch.bbclass
>>> @@ -14,7 +14,7 @@ valid_archs =3D "alpha cris ia64 \
>>>               parisc s390  v850 \
>>>               avr32 blackfin \
>>>               microblaze \
>>> -               nios2"
>>> +               nios2 arc xtensa=E2=80=9D
>>=20
>> there parisc etc as well so in essence patch is ok but I wonder if we
>> should
>> remove the arches we dont actively support in OE or extended OE =
ecosystem.
>>=20
>>>=20
>>> def map_kernel_arch(a, d):
>>>    import re
>>> --
>>> 2.7.4
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_8264E8EE-A95D-4B94-9747-77368C32491F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgGYZEACgkQuwUzVZGdMxTCMQCeIrNPUzpEixMK4WewaZ6xc21v
uIEAn04gTh6+1QuWtVpKdj6egZPO2pBE
=+hA3
-----END PGP SIGNATURE-----

--Apple-Mail=_8264E8EE-A95D-4B94-9747-77368C32491F--
