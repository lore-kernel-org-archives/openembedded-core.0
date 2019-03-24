Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 653BF7C7A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 18:45:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id j26so2852025pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ylesLClXw1w2xoOEIgxaQmzW8iiHu0zrLkmukszpNkE=;
	b=Q7M4rb1Mk4oV3aIX1rRQBrmplVqgimnxeiQQE3Ow8/brFn2xs0Hxs8FxCJv64NI7G3
	2Z8sBhrQm+tt0I+dXQnxXMl3qoMlDCtantA7dDtu75jxZgrw1apBH8r2uMxSKzlfNp8C
	GpCI4JCdIbn0khaSSJr/5FiKX2q1ScYofqbZSkKcSp/Cu6/PMkS4QVRDLd8MOppcJOmO
	1HFCQcbuS7z32oYsvDysIfNZRsQePGBZPWHqz5J2k0IN/o7neHS5OIZBnUEySCuUZhtE
	seMGzucqycALxIUmIHVHdunGkWUYNdtxenrZ2aJUvgreGryjBcflGzw1syEGFIoV4qzK
	IK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ylesLClXw1w2xoOEIgxaQmzW8iiHu0zrLkmukszpNkE=;
	b=Ska6rr4EXG6D6n2bTvw4lqagSo0PVfC9MabpzPANzYB8P6r2Rzmc41LOH/DHTiBLAU
	R6MsslxsiGS8eizUHrGanRdLK3DBc5Jp9rL6PJ0W6dPXJYDnRU61jb7Hlp44u4uz+NSD
	gaNcVKa9iZXSU2mCVBkQ0fuXCUEop1+WBZ4bBxyQY8sC0rPB0DA8vuaigIEL8Xs1CK9h
	I59Xp49EzK/MmLd48o7ok7fwml5ikhHByksv8AbXM50ijIdPvWAribmdBfBBmf1Ad5+V
	GfDCmJqIhiH7twqcN+MPciwK2qIzK1cwko6Fne/uwsiOl0Fh3wlJyfoJREbMaYYz0VK1
	kd+w==
X-Gm-Message-State: APjAAAUrih3KKzVQA1UE5UW/KRGYxiUmcgfESj1lqki/0MAcNQqBh0iX
	f2RD8MiV2lhajQ26vm4UVNxufWcY
X-Google-Smtp-Source: APXvYqxKfdPwYGWFU+XpvEajmHy/+EBfQhrpM+/DUfCJxwhCbNu/nBfAXst1IP2g0ww1SAcU8FwWuQ==
X-Received: by 2002:aa7:8d01:: with SMTP id j1mr20677313pfe.122.1553453111996; 
	Sun, 24 Mar 2019 11:45:11 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7099:fa84:daac:3491?
	([2601:202:4180:c33:7099:fa84:daac:3491])
	by smtp.gmail.com with ESMTPSA id
	j1sm15996121pgp.84.2019.03.24.11.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 11:45:10 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Mikko.Rapeli@bmw.de
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
	<20190319075206.GK20077@hiutale> <20190324180113.GA1947@jama>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
Date: Sun, 24 Mar 2019 11:45:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190324180113.GA1947@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Sun, 24 Mar 2019 18:45:11 -0000
X-Groupsio-MsgNum: 122555
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="A4tSvo4PAtmIzGNIfuf4mEIHdHuI2x75m"

--A4tSvo4PAtmIzGNIfuf4mEIHdHuI2x75m
Content-Type: multipart/mixed; boundary="iuGBiiTQsFvYKHSasQWU3kfkfoy9aDe6o";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Message-ID: <f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
Subject: Re: [OE-core] [thud][PATCH] Revert "boost: update to 1.69.0"
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
 <CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
 <20190319075206.GK20077@hiutale> <20190324180113.GA1947@jama>
In-Reply-To: <20190324180113.GA1947@jama>

--iuGBiiTQsFvYKHSasQWU3kfkfoy9aDe6o
Content-Type: multipart/alternative;
 boundary="------------CDA3F967F67661C481FF52EC"
Content-Language: en-US

--------------CDA3F967F67661C481FF52EC
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/24/19 11:01 AM, Martin Jansa wrote:
> On Tue, Mar 19, 2019 at 07:52:06AM +0000, Mikko.Rapeli@bmw.de wrote:
>> On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=FCller wrote:
>>> On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster <akuster808@gmail.com> w=
rote:
>>>> This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
>>>>
>>>> This package update slipped in doing the maint process. Removing it.=

>> <snip>
>>> Just my opinion - don't consider this as NAK.
>>>
>>> * I already fixed the recipes that failed for me. For at least one th=
e
>>> change is no more compatible to 1.68.0.
>>> * This makes PV going backwards
>>>
>>> Thanks for addressing - what do others think?
>> I'm not using thud yet, but updating boost in stable branch would brea=
k
>> too many things and I would have to revert that change in our trees. S=
ome boost
>> updates are in the end quite trivial and just require recompiling
>> everything but still, I would prefer that boost is not updated in stab=
le
>> branches unless there is a huge security/stability issue with the old =
version.
> Agreed.
>
> I care less for PV going backwards nowadays, it's probably less annoyin=
g than
> bumping PE first in master and then backporting PE bump to thud.
>
> People with build issues related to boost upgrade probably never
> built whole image to push it as an upgrade to end devices.

So do you agree with the revert?

-a rmin
>
> Cheers,
>


--------------CDA3F967F67661C481FF52EC
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 3/24/19 11:01 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20190324180113.GA1947@jama">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Mar 19, 2019 at 07:5=
2:06AM +0000, <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Mikko.=
Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Mar 18, 2019 at 06=
:03:05PM +0100, Andreas M=FCller wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Mar 18, 2019 at =
5:45 PM Armin Kuster <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ak=
uster808@gmail.com">&lt;akuster808@gmail.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.

This package update slipped in doing the maint process. Removing it.
</pre>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">&lt;snip&gt;
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Just my opinion - don't =
consider this as NAK.

* I already fixed the recipes that failed for me. For at least one the
change is no more compatible to 1.68.0.
* This makes PV going backwards

Thanks for addressing - what do others think?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I'm not using thud yet, but updating boost in stable branch would break
too many things and I would have to revert that change in our trees. Some=
 boost
updates are in the end quite trivial and just require recompiling
everything but still, I would prefer that boost is not updated in stable
branches unless there is a huge security/stability issue with the old ver=
sion.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Agreed.

I care less for PV going backwards nowadays, it's probably less annoying =
than
bumping PE first in master and then backporting PE bump to thud.

People with build issues related to boost upgrade probably never
built whole image to push it as an upgrade to end devices.</pre>
    </blockquote>
    <br>
    So do you agree with the revert?<br>
    <br>
    -a rmin<br>
    <blockquote type=3D"cite" cite=3D"mid:20190324180113.GA1947@jama">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Cheers,
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
  </body>
</html>

--------------CDA3F967F67661C481FF52EC--

--iuGBiiTQsFvYKHSasQWU3kfkfoy9aDe6o--

--A4tSvo4PAtmIzGNIfuf4mEIHdHuI2x75m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcl9A1AAoJEO6LtJn0Vuf5VW4QAJqpAqHhch/n5ppb3ZxhJ5lh
qlwN1YsgMYD57jasn+FULv1jLpErgDs2jdIKqOlBv6ZbgIYpTzJlAwhuXIDnMnL8
Hb6mEcRWTjBM6Y/LstUzGty49XCugcXYLeTTs50IZ4pzuHPjI1+IWaht/zXb5yC2
NUYN2wLTsryWrsAt87qJv1n9OSTqJne2k8yzodgpVUJiHV8/Wyd8E38SgwBwTb2S
Tmw+9S4g9nfsMM/dX/BXN27VHVQtdzkaPK2tqC76rHnd6UHebuT+rNJ3a/XfjDvY
rd4zrhGG/ec+RnnXDOWsXP4H64ZKQpiHXIKY76A1rG9Uf49i1WSDpblGI1MRsFxe
7qBpPUr4pcYzXuaN0xOhEdZ2+/u63ryqeCszQ4ogVwOMv1AnqmxUIdKzKg0wAOR4
mGUuC4hPo+OwMfzMdi1A7kua+1K3oQPHa03rxkyksaNiEr2cGN6NWlVyf3qd0Poi
0wxBfVrGk0yMEHIQ3iwNm2XINo+2NDRzxVUMEKDN1fhrx1NxLK95oyihtQ7NGf+8
wXIMDjkoCYVV2by8Tkwo38vLZqbMeR6STQw0jikJVpXdnPmR9Xapg9NpEoXKP2yU
MU6tmvkbZ0uLBhhXZmzegeu6nC9mJ/5Yap5wWVyu/K45sa4lWfP401kihMW05Ard
DzVVFIYZ3/XjCaV+tOYV
=S7c0
-----END PGP SIGNATURE-----

--A4tSvo4PAtmIzGNIfuf4mEIHdHuI2x75m--
