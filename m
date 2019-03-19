Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F426600BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 14:52:13 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 8so10465072pfr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Zqh6m3kTRMxpolA/Lg38gNhDm9mlHFdTsTlOQPCE/RA=;
	b=ukdLNoFhZjrK9pYgnaX5qngeKVY0NG8IRWu2gHBLBKVx+Je6dJW93rdYusnnEePt3C
	E7odihixBXI04HZX/b9MKd2/EIClFX8egwAg9RetoU78Xqogcnu9HVqjxg0UPQ0QurUW
	zt4uF/BdmHHogCD9BEmD3WeHQWO35EjMfRdxnqB0xeeYxsqg/TW32+bgPnjjJJ92k3yN
	fKkM9DodMi0PqnjM9FIAn5vN5+/b4yXdZtYMwz8kps9NPtSR2Y90siqFz967cHYgMFC+
	+H4Y3wkACrKb3W0DTU8fIdfoYaGRVe+2iGNgAFdmoqyD9Zkx/B4gjve0LOMlYYRiY7N0
	VdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Zqh6m3kTRMxpolA/Lg38gNhDm9mlHFdTsTlOQPCE/RA=;
	b=gI/Wa5Lq5Uvwv2PQsx6WkBe6RCAEPYKFsUJicJ0L+j8/7qvSO0JTkZyrpNLB9kB0VN
	B40XnXOJs5TcBvJH+iV8nhDSSg/40TNd6+98bApVIOgcUvaVRZlQW4D/D9M3CKguZI86
	g6+TJn/b7pB1ZLJ8aJgtVNyFfQ/qXYt4TaaG2i4GEGRFTS9hBXIIJBlPKkqMHbp5nFgj
	JGFN+X2vRHTUX7DxBQNYy6M6hmdUq3nlQ8nwlQYpKFYeCqmH11jFZeQMxAXs3CgmLj+o
	qgrb0jXRnAGKzpAk/UIxfTWnhlAJ0qn8Hf4P8Qc1uuwVswoHbgo2JQ5xwO2b4t+ZopJ2
	SAnw==
X-Gm-Message-State: APjAAAVIh5jUf4zauYKBodmHREPiuIEAjydKJpIXsXmoPvMIXX8l+2Vp
	JoI+Qv7GHIvltQxJTswUeTN2UY/9
X-Google-Smtp-Source: APXvYqx+ZGPbMW6axkX+qODqokwskUboc5nzNLcOU1V5RXCdj1mf3W9tFUc5b4/26eXwRUoDo8142Q==
X-Received: by 2002:a63:94:: with SMTP id 142mr23195081pga.277.1553007134180; 
	Tue, 19 Mar 2019 07:52:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d1a0:fa36:18e7:9b05?
	([2601:202:4180:c33:d1a0:fa36:18e7:9b05])
	by smtp.gmail.com with ESMTPSA id s4sm8775147pgp.89.2019.03.19.07.52.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 07:52:13 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
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
Message-ID: <cc444886-066d-6cf9-f309-7d35702ae065@gmail.com>
Date: Tue, 19 Mar 2019 07:52:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190319085532.GF1994@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 14:52:13 -0000
X-Groupsio-MsgNum: 122412
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3gVWoJVwoBRqahSAff4P7SRobTQsrJXAu"

--3gVWoJVwoBRqahSAff4P7SRobTQsrJXAu
Content-Type: multipart/mixed; boundary="D3QvTQ2ibYBcax0EWciei3itaznsgfCeG";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <cc444886-066d-6cf9-f309-7d35702ae065@gmail.com>
Subject: Re: [OE-core] [PATCH 00/26] thud patch review
References: <cover.1552962581.git.akuster808@gmail.com>
 <20190319085532.GF1994@jama>
In-Reply-To: <20190319085532.GF1994@jama>

--D3QvTQ2ibYBcax0EWciei3itaznsgfCeG
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/19/19 1:55 AM, Martin Jansa wrote:
> On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
>> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>>
>> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed=
355ed:
>>
>>   mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)=

>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib stable/thud-next
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/th=
ud-next
>>
>> Alexander Kanavin (1):
>>   ca-certificates: upgrade 20180409 -> 20190110
then this gets dropped
> This depends on openssl >=3D 1.1.1 since:
> https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e5=
034d1e16ca52be6a10cb3334
> some people might not use new openssl with thud.
>
> More detail in:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/28=
0234.html
>
> Cheers,



--D3QvTQ2ibYBcax0EWciei3itaznsgfCeG--

--3gVWoJVwoBRqahSAff4P7SRobTQsrJXAu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJckQIbAAoJEO6LtJn0Vuf5RB4P/R8jXCo4LHqbT/urBpe1Z0Fi
vJeKEGP2HOQAlXPGCdhu0spTgoLqxNr9gxDpbQ+zDvnYX+hRm0BjJ3GnhAE6ij6B
XV1QKplFWl+xs+P7aa30p9uKFIDpCOZ8Y8E37buEAHOI1GwxrDjw9kFu75L/KNFi
P8ltmxOB9PiA0WV5ySZQimkVZB1iTzbtGz73pmARAXyOefeCWBzGIbeZ/Kd3jfIC
RnfkjbQwaOyPaThVFyeb/1NIN7eMaMlJ6lyuR4NgcwTOIPn6oJ6vxpiUDN3viWFS
SNBvulZXxr3qRAjcAbCpYXcu2wdUV69AmEqV5kBdmzaxTHbkBwfyDI4nUoYxgrLM
MM2xfzC1C3Cp2RxNjR4497avUTtM1vclBmD0/9GqKGJN2EbAC0o2wzRzQ8wzv8dw
ozeFbzMqT9CQLgY+ySzbHq4QeWwzFHl+VVjp0NQ33NpzS6yWE9VeLjDGhPNwVJLV
sizvlseouYvKY7Tqm0OYwhdTT4Xo+g5JkofuU6xKPR9XfP2ZwdJqGYJkmnrLwaHQ
7Y9gMuBy1NXRuPm2f0wZG8ObfzW73pw8xjs1QROYXyNjY3r9VbIvN9vrWce8Tu/7
G1HRsJTjbR/riKtrZxlIG9QHGd5IMSKgSPI7ptXu+LDtXD3JqIXP6dZn7ZNCTHdn
TckaI6kr0uhSMFoVNgkc
=EyTe
-----END PGP SIGNATURE-----

--3gVWoJVwoBRqahSAff4P7SRobTQsrJXAu--
