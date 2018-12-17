Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 814387BDB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:50:06 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u6-v6so10409466ljd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=E9iN49vLqbu36b8Vc/Txhap2kIKh/N323KWh21q46nU=;
	b=GTGsGctExYNqC9TJFt7n9n98R1a1HingPUftwWtgty6oB4x1DnhArNOgZcfPdJz5/V
	StRu7zuFvd9lhLPWQNCOIzZoWPvytBz78g0OdNffsviCF8wzS6pNZ7mXsBzgAN6kp5e3
	jq+7sIYD9QeiVqwmHsA4KyqNW+98EuSbavbHtlm1YjKHDxcJFB9BWpAv3612VMpO2scZ
	pG86PfvPXP9r1ozk9QpgHbbEgmCMLGtRBcbiq0gnrekb1umRlC2BeEhtjNXXiNv0+4PY
	UZ63m6gIbY5RuXsCXZjSWTrD1PxwL/oFtL0eGDiT/YLsiGRIEg7sqHYV9vVR7fyoHPD2
	MPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=E9iN49vLqbu36b8Vc/Txhap2kIKh/N323KWh21q46nU=;
	b=gpCdEikMC8/E+z4b4LHm8I5yNsRFrBYBMpvfK/8Xthla3j+iX6+10cFM/JfUG/K+eM
	nbXcxd4d54ilXvvIIZ9cZfRb+ZhZM04gzJa/bFGaEpIzbSU3RDI0AHq+vd3uGCh8lJcJ
	wUJPLFPornFRLteT8hPA3JXxaTdjD8AvJ+DLJ33EDUN+07l2U+pjzB3szcqMlA8GLfb/
	gQLx9P3q/7CtVloi7/6npGt5eAnlvhWrKsANbnsDn+qtB3SuJGCLobFO/2lb7gii6lS2
	dCpdgJAfQ6BHH93VNb5mNR+sTjSTXMEqMTpIYN459OKO6AXQCtttg59NGdYWxCBFaM5B
	t2mg==
X-Gm-Message-State: AA+aEWbdxzfQIFzZ2lR6JddAulqvaMO2t7sRqbHm4unjikrOm4laN+IB
	pdQV/Orld4b0aPBzAPtgieyl+xO8
X-Google-Smtp-Source: AFSGD/XkmEuVULCndKbTK1+xWnG1jMjE7jIcNtrnYnIt4u7Yuwa3ID6z512b3MGpXK8ur2GuQZ8FeA==
X-Received: by 2002:a2e:9a84:: with SMTP id p4-v6mr6869729lji.73.1545040206701;
	Mon, 17 Dec 2018 01:50:06 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18])
	by smtp.gmail.com with ESMTPSA id p91sm2603736lfg.4.2018.12.17.01.50.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 01:50:06 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andre McCurdy <armccurdy@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
	<CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
	<abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
Date: Mon, 17 Dec 2018 11:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 17 Dec 2018 09:50:06 -0000
X-Groupsio-MsgNum: 119279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="W9PrRJpOpbEYeerpeLcA9cd9McTt46Ysf"

--W9PrRJpOpbEYeerpeLcA9cd9McTt46Ysf
Content-Type: multipart/mixed; boundary="DQ0ajjle0EivtodUJaY6pDlZxa55qV98b";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 07/13] musl: Ensure GLIBC_LDSO symlink
 target does not exist on reinstall
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
 <1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
 <CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
 <abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
In-Reply-To: <abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>

--DQ0ajjle0EivtodUJaY6pDlZxa55qV98b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Fri, 2018-12-14 at 11:09 -0800, Andre McCurdy wrote:
>> On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
>> <serhe.popovych@gmail.com> wrote:
>>> Otherwise do_install task will fail on rebuild.
>>>
>>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>>> ---
>>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
>>> core/musl/musl_git.bb
>>> index 9cc875c..4593cde 100644
>>> --- a/meta/recipes-core/musl/musl_git.bb
>>> +++ b/meta/recipes-core/musl/musl_git.bb
>>> @@ -61,7 +61,7 @@ do_install() {
>>>         oe_runmake install DESTDIR=3D'${D}'
>>>
>>>         install -d ${D}${bindir}
>>> -       rm -f ${D}${bindir}/ldd
>>> +       rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
>>
>> The correct fix here is actually to remove this line entirely. The
>> official ruling is that there should be no expectation that re-
>> running do_install should work and patches to make it work are not
>> acceptable.
>>
>>  =20
>> http://lists.openembedded.org/pipermail/openembedded-core/2018-Septemb=
er/273723.html
>=20
> Lets be clear, re-running the do_install task *is* supported and works
> today. It is actually meant to work when re-run. do_install clears out
> ${D} at its start so we can assume in do_install functions that it is
> empty at the start of the function.

It seems do_install does not clear ${D} or I do something wrong:

$ bitbake core-image-sato
<success>

<Adjust gcc/musl recipe and then run>

$ bitbake core-image-sato

=2E..
/image/usr/lib64/libc.so
/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe-=
linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/image/lib64/ld-musl-power=
pc64le.so.1
|| true
| Traceback (most recent call last):
|   File "/home/serhe/devel/git/openembedded-core/scripts/lnr", line 21,
in <module>
|     os.symlink(target, linkname)
| FileExistsError: [Errno 17] File exists: 'image/usr/lib64/libc.so' ->
'/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe=
-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/imageNone'
| WARNING:
/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe-=
linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/temp/run.do_install.77856=
:1
exit 1 from 'lnr
/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe-=
linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/image/usr/lib64/libc.so
/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe-=
linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/imageNone'
| ERROR: Function failed: do_install (log file is located at
/home/serhe/devel/git/openembedded-core/build/tmp-musl/work/ppc64p8le-oe-=
linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-r0/temp/log.do_install.77856=
)
ERROR: Task
(/home/serhe/devel/git/openembedded-core/meta/recipes-core/musl/musl_git.=
bb:do_install)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2713 tasks of which 2703 didn't need to
be rerun and 1 failed.

=2E..

>=20
> The only problem may be if you're manually re-running the do_install
> script in WORKDIR/temp. If you're doing that, you have other problems
> like the missing fakeroot environment to handle so the non-empty
> directory is only one minor issue, you're missing other setup pieces as=

> well.

I haven't play with do_install scripts in WORKDIR/temp. Only
do_configure and do_build. But anyway thank for pointing for potential
problems.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20



--DQ0ajjle0EivtodUJaY6pDlZxa55qV98b--

--W9PrRJpOpbEYeerpeLcA9cd9McTt46Ysf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcF3FMAAoJEBTawMmQ61bBhNcH/1Fqy5EvzwlWaryvNC0kgY3n
IbRP5fbLcgn57tRyibxb8eEntmpX+sZ0KUMU425R9DTjzzG6vFp0djUU0K8dhE8V
01juTumpKL98occbytW/UvpttIoOLxxgY/FcjdcjJ3W1KklWBRMkD0/aFyvQMwJa
zsrWUCwu7vUbCYBOIOlykfbd5QArWa2TyciX7o57bM8MLwH+1qEj7Oh2xx4ykOzV
KTy9KYnnC2Id3MpH2jFjAQxVZ9wJ2ouBRDpcIecU+mkgSYcZ7+UqRwATZr5gCtZC
9FU8tdyEU34vfiiis+p2/TVR/UViz1MMjyKuy/pv0zKr5DHWwuiBEzxgbxLAST4=
=d0rY
-----END PGP SIGNATURE-----

--W9PrRJpOpbEYeerpeLcA9cd9McTt46Ysf--
