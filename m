Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 993467BF0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 15:13:38 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so11309636lja.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 07:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4FrKRskTU67VNR5TnTNf8GI6lCtcdaz8YyqBAu2Vvb0=;
	b=l13FjsvC/CnayyKOKQEMnm1iEt2DeVKkSSNLz+20m0Toihf/eNMKvw/iDGeDC5e7Oo
	/y47io1gXUfxYpf6oucdJmOjSxagbWYPI2hwoG+mFHFoZOQ8DBgScDrFdFAbtd8mq9jV
	Q2iX76Ntpg3csXYXMXbKX8LeElRICs+CXCTcwOGTogwnF7+D5+190jK1OITq3IKulIsG
	ULIbWIeum4H7aP/xgmFQRQN29T7r5NVHIbk+/auYSj94DZMFe27EEIHTgJS9rLhgq30+
	Qpr4JPHOMbIWdIkzi5lhLRph2W+bvsZdXn5XKvKp11Qy4aNVFMNf8yldWPKLG5Nacdwj
	/d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=4FrKRskTU67VNR5TnTNf8GI6lCtcdaz8YyqBAu2Vvb0=;
	b=XtzlQWo72MWELDu9pVNrtcjGansHOhylHtNJZ97PvojHp/bV8vlD6IeuYa1ZRFZV22
	B1VQdgrBXi+dh6GKbAOjijIz18CGmbQsl/YLeFk5w/2eAmo2C82C92HKVHhK7RhB3naQ
	XK21tJuLhRO0VRCxLHB8I8MnffFWGzz3a1FBfynqWXiYQ9ChK+sNPLlim3/17NcDXO0s
	IbxgfcnXvNOwutEICIuAIKGQaMgAq/Y4fYq2jtEmS6bYQwN9r2gv/y+gIViiriWfgVFS
	e6ubxYf4bjWPm8Sly2L2zGQRp6NrY6WqhkH8NidMKUMX4REw7sxR3o9K/ELmIT52el6Y
	R9BA==
X-Gm-Message-State: AA+aEWaY94TV3P4pE1AOQQsDAuV/PXuAG/oUoMuznmONE6/BULQtwrrz
	kQhi7WG69zcNK0QIZLaVD2aNOpiM
X-Google-Smtp-Source: AFSGD/Wdw6KsQyrzDvloQCOncY2t5QFtSinv5An/cVZmE+MrBDXxFIIJThtI16XewPmZ4JfWViV4Hg==
X-Received: by 2002:a2e:8446:: with SMTP id u6-v6mr8846680ljh.74.1545059618907;
	Mon, 17 Dec 2018 07:13:38 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	k14sm2703887lfc.70.2018.12.17.07.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 07:13:38 -0800 (PST)
To: richard.purdie@linuxfoundation.org, Andre McCurdy <armccurdy@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
	<CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
	<abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
	<5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
	<dee546f2355d673d9364e591d56a09be975fd36f.camel@linuxfoundation.org>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <38b79c03-a77d-bb37-9dca-e59446aaaf66@gmail.com>
Date: Mon, 17 Dec 2018 17:13:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <dee546f2355d673d9364e591d56a09be975fd36f.camel@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/13] musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
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
X-List-Received-Date: Mon, 17 Dec 2018 15:13:38 -0000
X-Groupsio-MsgNum: 119296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="cmjtAsjzTHDhQFYb0NaFmpQlSiGqlM8PX"

--cmjtAsjzTHDhQFYb0NaFmpQlSiGqlM8PX
Content-Type: multipart/mixed; boundary="D6s7jXST0dBFmkVZykY0sjB57I6pwDlp4";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: richard.purdie@linuxfoundation.org, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <38b79c03-a77d-bb37-9dca-e59446aaaf66@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 07/13] musl: Ensure GLIBC_LDSO symlink
 target does not exist on reinstall
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
 <1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
 <CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
 <abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
 <5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
 <dee546f2355d673d9364e591d56a09be975fd36f.camel@linuxfoundation.org>
In-Reply-To: <dee546f2355d673d9364e591d56a09be975fd36f.camel@linuxfoundation.org>

--D6s7jXST0dBFmkVZykY0sjB57I6pwDlp4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

richard.purdie@linuxfoundation.org wrote:
> On Mon, 2018-12-17 at 11:49 +0200, Serhey Popovych wrote:
>> Richard Purdie wrote:
>>> On Fri, 2018-12-14 at 11:09 -0800, Andre McCurdy wrote:
>>>> On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
>>>> <serhe.popovych@gmail.com> wrote:
>>>>> Otherwise do_install task will fail on rebuild.
>>>>>
>>>>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>>>>> ---
>>>>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
>>>>> core/musl/musl_git.bb
>>>>> index 9cc875c..4593cde 100644
>>>>> --- a/meta/recipes-core/musl/musl_git.bb
>>>>> +++ b/meta/recipes-core/musl/musl_git.bb
>>>>> @@ -61,7 +61,7 @@ do_install() {
>>>>>         oe_runmake install DESTDIR=3D'${D}'
>>>>>
>>>>>         install -d ${D}${bindir}
>>>>> -       rm -f ${D}${bindir}/ldd
>>>>> +       rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
>>>>
>>>> The correct fix here is actually to remove this line entirely.
>>>> The
>>>> official ruling is that there should be no expectation that re-
>>>> running do_install should work and patches to make it work are
>>>> not
>>>> acceptable.
>>>>
>>>>  =20
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2018-Septe=
mber/273723.html
>>>
>>> Lets be clear, re-running the do_install task *is* supported and
>>> works
>>> today. It is actually meant to work when re-run. do_install clears
>>> out
>>> ${D} at its start so we can assume in do_install functions that it
>>> is
>>> empty at the start of the function.
>>
>> It seems do_install does not clear ${D} or I do something wrong:
>>
>> $ bitbake core-image-sato
>> <success>
>>
>> <Adjust gcc/musl recipe and then run>
>>
>> $ bitbake core-image-sato
>>
>> ...
>> /image/usr/lib64/libc.so
>> /home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/image/lib64/ld-musl-powerpc64le.so.1
>>>> true
>>> Traceback (most recent call last):
>>>   File "/home/serhe/devel/git/openembedded-core/scripts/lnr", line
>>> 21,
>> in <module>
>>>     os.symlink(target, linkname)
>>> FileExistsError: [Errno 17] File exists: 'image/usr/lib64/libc.so'
>>> ->
>> '/home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/imageNone'
>>> WARNING:
>> /home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/temp/run.do_install.77856:1
>> exit 1 from 'lnr
>> /home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/image/usr/lib64/libc.so
>> /home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/imageNone'
>>> ERROR: Function failed: do_install (log file is located at
>> /home/serhe/devel/git/openembedded-core/build/tmp-
>> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
>> r0/temp/log.do_install.77856)
>> ERROR: Task
>> (/home/serhe/devel/git/openembedded-core/meta/recipes-
>> core/musl/musl_git.bb:do_install)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2713 tasks of which 2703 didn't need
>> to
>> be rerun and 1 failed.
>>
>> ...
>>
>>> The only problem may be if you're manually re-running the
>>> do_install
>>> script in WORKDIR/temp. If you're doing that, you have other
>>> problems
>>> like the missing fakeroot environment to handle so the non-empty
>>> directory is only one minor issue, you're missing other setup
>>> pieces as
>>> well.
>>
>> I haven't play with do_install scripts in WORKDIR/temp. Only
>> do_configure and do_build. But anyway thank for pointing for
>> potential
>> problems.
>=20
> I just tried "bitbake musl", then "bitbake musl -c install -f" which
> should have reproduced the above but it worked fine. Admittedly I was
> using MACHINE=3Dqemux86-64. Do those two steps break for you?

Tried for ppc: issue above not reproducible. It seems I ran into
unsupported configuration somehow. Sorry for noise.

>=20
> Something isn't adding up here and I'd like to get to the bottom of
> it...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20



--D6s7jXST0dBFmkVZykY0sjB57I6pwDlp4--

--cmjtAsjzTHDhQFYb0NaFmpQlSiGqlM8PX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcF70gAAoJEBTawMmQ61bByQ8IAI38zfcb8fm43Eqxwgsp4tPr
9Y0zR/FBTI/gB1NWS+RYPPtT+/KonJPXLcVIRZ2fab8ZGkeEfG0fP/tYxQX2N5ms
sNDPQqPSePFMAdhNmmiWuTpH6fBAqNcNn7Ut8QA84lWOOL63oMDb+XkU9dIoTVDu
OyXSzwB9W36g2iX5vFMFA9JrgEVA0PtUAEMETwnceKg58wKb5ssX/pN0RTNwFuot
YOKu+rKuvOGEs9X2CfN2YdMxtfdIKeUfVoY3xmHlr5Kb5oFpuISZS938sdaFdIwy
g7d0kLRGmlWli5Lpaw8eqaZsJqrUlOaHJbuess2O/mbPJWYz/QqRq/xDcnhAH8M=
=ND0p
-----END PGP SIGNATURE-----

--cmjtAsjzTHDhQFYb0NaFmpQlSiGqlM8PX--
