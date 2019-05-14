Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 67FEF7DAF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 23:47:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w22so349347pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 16:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nfjME4GQUqjTryVHpdQz3WJn9SP+mNCjNmJHy1v+Okw=;
	b=Vx4dubCcdYFrpT6RT38sRN2Tz5HXirEpaYeWQD9L9KGgMefrh40ZF0mzNtjf57takU
	fv2+I4NfmISFGD9gRR5o/au/+HcPEzF+iVRvRh0eQb2ABM19J7fg25wAmKnHqCz7tfoD
	PyrTJBy2GqHAHGi35cmFzty8HtXuMUDcU9r2pANrg3VVUFE2oMhFXkP0+q+kFl8iBdu6
	MTX8RvlGe0RHe+L+MRC01wupcq4ugi/IyYfQIejtcMKVv4pUruvHjX6QCRFXZq4qkjuL
	I7fAkyT5XfEq6OH2heURn6cE7B/wM92BTURujPLp2dROhqEkX0urdSOVGRxA45fYq9qz
	gSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=nfjME4GQUqjTryVHpdQz3WJn9SP+mNCjNmJHy1v+Okw=;
	b=eezZy0n5E3uvDN91Rr/fHFFltEctLwZ90MDpFjkP57IDR56UnfBV/2aH/TOCaGHIhv
	S82mVq2UUHtWGou+aPtmvxiRv0XTtGJln2n5Ar6L13o/dsxTU+jjfbyeu0znIpR+PxVz
	X3z4w5dHZikpyG70B2Sn7Npmdf4Bt9skcMQKU88x+LGjdsVkGluxdY34YbcaXo0IYEUB
	3Bjgh8gu4tho+Zw4YAjX5gUwD9meIAcVN6NKUEitoLoIFbVvIIIxzkoXR5fylMWgMVtq
	zo4NU5acKuprufXllTMn81lmPNcc+Z1mJQGwhe1o5ty2Fl+NyqeO3asjv1uxEzRbZ2x9
	kOTw==
X-Gm-Message-State: APjAAAWBWS1azN4u1tS8mQnlaQkpW0XeCrGCqm8dM3lO2AzAChewFbOY
	eO+iXuIvYuTLOPRg/WoCKQCvbY4o
X-Google-Smtp-Source: APXvYqwn4SS18oaDIto6QqyCzZpgAgmjR5ZARcnjz/jNPepnB1fEcrtoJd70YWOSNwVCPBgydZlBmw==
X-Received: by 2002:a62:a511:: with SMTP id v17mr17000959pfm.129.1557877664918;
	Tue, 14 May 2019 16:47:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d909:eb3d:d2ab:fd1d?
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	n27sm310319pfb.129.2019.05.14.16.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 16:47:44 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190514215604.24839-1-richard.purdie@linuxfoundation.org>
	<20190514215604.24839-2-richard.purdie@linuxfoundation.org>
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
Message-ID: <eb3a0ba8-ede4-9a2f-9019-9d75a87a93f6@gmail.com>
Date: Tue, 14 May 2019 16:47:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514215604.24839-2-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/2] ptest: Add RDEPENDS frpm PN-ptest to PN package
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
X-List-Received-Date: Tue, 14 May 2019 23:47:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/14/19 2:56 PM, Richard Purdie wrote:
> Many different ptests are breaking as they assume that ${PN}-ptest
> depends on ${PN}. It doesn't currently but should. If we fix this, many
> different ptests start passing when they previously failed.
Ah, cool, noticed this with some my recipes and fixed them.

BTW, if you run ptest with core-image-minimal ( with openssd) more
dependences can be found.

> It does depend on fixing an issue in the dbus-test recipe which is done
> in the preceeding patch (mentioned in case this gets backported).
will put it into the bucket.

- armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/ptest.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 936bf82736e..fa4c36ec769 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -13,6 +13,7 @@ PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
>  PTEST_ENABLED_class-native = ""
>  PTEST_ENABLED_class-nativesdk = ""
>  PTEST_ENABLED_class-cross-canadian = ""
> +RDEPENDS_${PN}-ptest += "${PN}"
>  RDEPENDS_${PN}-ptest_class-native = ""
>  RDEPENDS_${PN}-ptest_class-nativesdk = ""
>  RRECOMMENDS_${PN}-ptest += "ptest-runner"


