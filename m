Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 12E7C7F52D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 16:57:21 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q12so7916400pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/lzQFFvmoRQMNGEPqJj8t3q5/yvriIFxxxgibAAEnYo=;
	b=ToCTkUzydnx3YNYC32rEERKESZTj65EBPjxKqiR6VfB4g38dV8iPewdQWjyXwwyFgf
	UA+46Q2hRBix2n9HtSDx3zUqQrSV7rPJDWxRMYgzTUSEgwsPZjjVDxsM34yXyK7uMAh5
	YxYK4xw6AlAi6F7JBwda+p2w67h5HR3nLcT1+FlLcJ7U+i3NGAFDFo9VPTr7URugidUT
	BVd+FBNIijnm5oaHyF6McrFGUuoNTgo7J6J4MfcCi7nDmQfAD2Y4MzmhJvyvFzEsbFZz
	OnMrYLcPsCQcfyTYbPDmTCMvQ/x+3K0HSO62r0KyaU3TODDSpNkA8CsPOgPvF+D7B6mZ
	gU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/lzQFFvmoRQMNGEPqJj8t3q5/yvriIFxxxgibAAEnYo=;
	b=E4L00PGh7n1KCeN/VaWtYDFBGj5ZpwXafJbSy0myU7MWoX6vSsrySlfznaNSUCQl/d
	tI6MRnokGhjaFP54RojaMOb97hBN7lZEKQwHTjlqr5MvUaerY8jvjJh2u/nLYxX9Ied6
	zVXr+RqNnZFrrSerFRPORvXfoE53LhX/fb2IRxCMImK4zOZxKZcb93Ezzictk9dmiZWB
	yFzWD9YbVIlbgpZInu15JOR4eCZWQDKOJOg8MEJ5Ryw7JgSXN7irXh0DrArv+S5oxc6e
	bEKT8qbRzTF7O+GkiqavD4RJ3A1pUg0dbopfwYw2tP0UjKqKlT7BNQKDCIb1x/CibcJQ
	xzGA==
X-Gm-Message-State: APjAAAUtVwJJB/NisGAfnJq4dFZT0HnC5NaWcWWcTMAxS6TXCQYJ1Jc5
	FLqSdB6ecMsussa3NpZfFyU=
X-Google-Smtp-Source: APXvYqxzkd5ZTPOkdmoQak4/UhgRGr5jn3W4ji4U+8TDflC1amCdOA11mZZzI9Wd8kNjJPa9cElgiA==
X-Received: by 2002:a17:90a:2044:: with SMTP id
	n62mr24552191pjc.140.1570899443117; 
	Sat, 12 Oct 2019 09:57:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:5c58:2ffd:b6af:7edd?
	([2601:202:4180:a5c0:5c58:2ffd:b6af:7edd])
	by smtp.gmail.com with ESMTPSA id
	x23sm15227708pfq.140.2019.10.12.09.57.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Oct 2019 09:57:22 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <20191011081649.18474-1-nicolas.dechesne@linaro.org>
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
Message-ID: <77b72f58-adea-f929-9f9d-2c0e6d7ff6e4@gmail.com>
Date: Sat, 12 Oct 2019 09:57:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011081649.18474-1-nicolas.dechesne@linaro.org>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [warrior][PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Sat, 12 Oct 2019 16:57:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/11/19 1:16 AM, Nicolas Dechesne wrote:
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> If one has provided external key/certificate for modules signing, Kbuild
> will skip creating signing_key.pem and will write only signing_key.x509
> certificate. Thus we have to check for .x509 file existence rather than
> .pem one.

Is this true for all the kernel versions supported by warrior?

- armin
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 111a0b2eeb..fb1f49327c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -453,7 +453,7 @@ do_shared_workdir () {
>  	cp .config $kerneldir/
>  	mkdir -p $kerneldir/include/config
>  	cp include/config/kernel.release $kerneldir/include/config/kernel.release
> -	if [ -e certs/signing_key.pem ]; then
> +	if [ -e certs/signing_key.x509 ]; then
>  		# The signing_key.* files are stored in the certs/ dir in
>  		# newer Linux kernels
>  		mkdir -p $kerneldir/certs


