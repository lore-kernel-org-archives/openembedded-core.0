Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B29E5605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:36:05 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id n5so47056702pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=TIHpc8RQscmTrhP5I39UeJoiq+5zKXJ4WoUzGEHRkSY=;
	b=CJ/CUuvSumwb5M/AzWb4e8uxi5+8ApS6Xz0UYoJM0Plgq+R9yj4DLSRFtgEx+1XUJT
	PrVVEAC8YXyRkCBt0YHYgLCzBhMkMoyLTFcIZmsKULG0Dyr67TyQWXZJC82YKHaYwe4c
	uMpeHAz4f9FeaUsoiidu702nt+wQYG+PxA8lJykhXeixYBYLEZvh3kSwzcrogUnS6xyl
	IKbXD4G9qbIhqg6owDhpeiEVPlHrXpRHNYAcbd9uGGB4WCzSRuioRIrakrlDda952QVt
	O7Y5oUaQt2zbMaO10Zm0ooPuxezu6WkLyexaXJFE1oE3QWO9O/WBKdb/m+PWKH9YWEgp
	jn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TIHpc8RQscmTrhP5I39UeJoiq+5zKXJ4WoUzGEHRkSY=;
	b=fIAqdAyVQfeAexlRsKi6AjEvV4MD8rswKS7X2tX7e8V+CrO6kd98H2PWpthZyZDhvv
	B+yXFhpBVz2Ho4QizQ2ykmAht5dipOeApBuRUX/x69cMZcDv6Lz3H4J0aelN6UwIYHBn
	lJXxg+hnldJ7f3jnMGixgJpDSap3e2hDGwsIOP1i2DzI7+AuBmcMw7PMozSQx7wPuARQ
	nXUIqhcDAtpPsO20d708NgmF2RBIEQp+1ISwrNiH56N3pzN1vW7tD22OYbAzXtr9KpgT
	No4mbHqCAO8L7ut7q3D8dYz11OffdU/jVDrpQoVsBJMdMBKzVfHXwffDpaj0MeIlA+Bh
	1IQA==
X-Gm-Message-State: AD7BkJKxtq71rWCG2Q/ccZZ4xhMvZw+ThF6IH3xg8Ff4PLamsB5yMt6rBage4IxJnnHtKg==
X-Received: by 10.98.40.200 with SMTP id o191mr14636240pfo.83.1459355766059;
	Wed, 30 Mar 2016 09:36:06 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:153e:3940:320e:6ae3?
	([2601:646:8800:5a9a:153e:3940:320e:6ae3])
	by smtp.gmail.com with ESMTPSA id
	b74sm7129482pfd.24.2016.03.30.09.36.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 09:36:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56FBF8CA.20809@windriver.com>
Date: Wed, 30 Mar 2016 09:36:00 -0700
Message-Id: <0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
To: Dragomir Daniel <daniel.dragomir@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Wed, 30 Mar 2016 16:36:07 -0000
X-Groupsio-MsgNum: 80306
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F6C5EEF8-0758-494D-B8CF-F8050F1A1620";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F6C5EEF8-0758-494D-B8CF-F8050F1A1620
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2016, at 9:03 AM, Dragomir Daniel =
<daniel.dragomir@windriver.com> wrote:
>=20
>=20
>=20
> On 03/29/2016 07:07 PM, Khem Raj wrote:
>>> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>=20
>>> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>>>> For AArch64 state, the default tune is aarch32 and include which
>>>>    include just the aarch64 feature.
>>> I don't really understand what this sentence is trying to say.  Can =
you
>>> re-phrase it so as to be more accessible to non-experts?
>>>=20
>>>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>>> If you are deleting existing files, please mention that in the =
commit
>>> message.  And in particular, if you are removing a file that =
supports
>>> generic ARMv8 (if imperfectly) and replacing it with something that =
is
>>> specific to ARMv8-A, please explain why this is a good thing.
>>>=20
>>>> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', =
'-crc', '', d)}"
>>>> +ARMPKGSFX_FPU_64 =3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', =
'-crc', '', d)}"
>>> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are =
not
>>> related to the fpu.  Also, the fact that you need to duplicate both =
this
>>> and the crypto one for both FPU and FPU_64 seems like an indication =
that
>>> something elsewhere is misdesigned.
>>>=20
>>>> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'fp-armv8', '-fp-armv8', '', d)}"
>>> I don't entirely understand why this one doesn't have an FPU_64
>>> equivalent.  Are you always enabling vfp for A64?
>>>=20
>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', =
'aarch32', 'aarch32:', '' ,d)}"
>>>> +MACHINEOVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', ':aarch64', '' ,d)}"
>>> As previously discussed, I am not wild about "aarch32" as the name =
of an
>>> override which really means "ARMv8 in AArch32 state".  I know there =
is a
>>> school of thought that says that the execution state of older cpus =
is
>>> not AArch32 even if in practice it is indistinguishable, but this
>>> doesn't seem to match either the expectations that a rational user =
of OE
>>> is likely to have, or the information in the published literature.
>> Don=E2=80=99t disagree with technical argument I said that previously =
too. All I am trying
>> to say is lets take this opportunity to simplify arm tunes starting =
with armv8
>> we have this opportunity and what you suggest will keep the thread =
alive with
>> prior tunes. With armv8 we should match what we do for x86 and x86_64 =
ideally.
>=20
> We'll need to take a decision on this and continue the work on tunes.
>=20
> What is the best way to name the armv8a tunes:
> aarch32 and aarch64 or armv8a32 and armv8a64?

We are catering armv8 here and not 64bit or 32bit arm. Thats the =
difference.
may be those could be added in a common file?
its fine to call them armv8a32 and armv8a64 it doesnt matter
but break the inclusion of .inc files that will drag it
into pre-armv8 world and define a consistent 32bit tunes
such that when we think armv8, we get three options
aarch64, aarch32, aarch32t2, all the vfp options
may be folder into these three and also neon and others
Can we reach that somehow ?


>=20
> Who else need to express his opinion about this and make the decision?
>=20
> Daniel
>=20
>>=20
>>>> +ARMPKGARCH_tune-aarch64            ?=3D "aarch64"
>>> This seems a tiny bit short-sighted since presumably there will be =
an
>>> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be =
then?
>>>=20
>>>> +BASE_LIB_tune-aarch64            =3D "lib64"
>>> This seems like more a matter of distro policy and I'm not sure it
>>> belongs in a tune file.  If it does then can't you rely on the =
aarch64
>>> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having =
to
>>> duplicate this for all four of the tunes (and the -be equivalents)?
>>>=20
>>>> +# Duplicated from arch-arm.inc
>>> Please add a comment explaining why you can't include arch-arm.inc.
>>>=20
>>> p.
>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_F6C5EEF8-0758-494D-B8CF-F8050F1A1620
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8AHQACgkQuwUzVZGdMxQQ5gCfWZgUOBkprSDd2T+VybGdAjNZ
M2EAoIBQSNXWLhc2oKg+sMvBVDnbBdAd
=AQQU
-----END PGP SIGNATURE-----

--Apple-Mail=_F6C5EEF8-0758-494D-B8CF-F8050F1A1620--
