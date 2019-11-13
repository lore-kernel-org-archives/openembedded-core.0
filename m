Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 01BF86C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 01:49:26 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n13so475955pff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 17:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DVPmloqEX3RU/BGyuF9Ydx4/rbhs44q2+NE6lKIEw1w=;
	b=MDeWAm4/1W87jcJ4iQAFfKryH/xt4epEnPvOA9p4RK+1+inYkC5LJWp321WStJiN/d
	+OqehquS4OLIWUewhZDY7CIGqDGHGJSm+H7M+C8h8EZkPmIyoZ0kDmZRtZFQGry3pbvP
	nQlQkxT0Saf/DcPeOdDqLbC/E4zyNg/wW4nqiFWvfd0SH2OwuKuOY9LhLb4MZdqEqgS0
	DzGGZhbIjkQO8B9Khv7N0xXBTXZQC2+ZoKDn6Ox2zWVKsrXJ2/rTE99hffHzRYynBB9d
	zjgV5d8G5GhRz7i9TAAJCMBoigiTfQQk5LwhKelPiDgXgnE1mH6FbvNA9U+JNL3HFTmk
	69Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DVPmloqEX3RU/BGyuF9Ydx4/rbhs44q2+NE6lKIEw1w=;
	b=p4hhyhI8vTTHGt6jz2GxnQbOe22464e9YFGum9HcXmOnXDhoX8oe9YIA4ttVNVSdLR
	ZBptEYkiDQixzViwqUBYSC9DVt/9V+n4BsH6PshsA3QFB5VC4yEyS4QSzeZbdZTINdcG
	83O4AQKNrKJQCQYmUvRmlJV/17wav5LzVSGVsTl4HRCqcFunpsDDxSgoZrKKhoLv1rF5
	DGsr7i2Ku458Rpun84BKAhL87OqkvT4xCmZszEPn49EcYZpd6xhcONmdXs9nFnKIMF3J
	qWmUUTCE17M/PnxwUqv5us2TtDFmKIM0/RUlOHZDcwxjWRIm4G1t9u7giYjZj0V3lsZA
	TJlQ==
X-Gm-Message-State: APjAAAU3Q2Y0W9Bk7gcXsmcNdMsMlHZ4BvEqjyEWyBpOCsVr1JEyIdq1
	K9iQaorKTI+VBOlHhhnq8WF7IOOs
X-Google-Smtp-Source: APXvYqxB4zYlOYqysmHCRiXSaQDl+hJFmdxUS68yG3OQ1EY4OIwKgoiexfvREROH+nni5fz3+WfgMA==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr1275641pja.8.1573609767904;
	Tue, 12 Nov 2019 17:49:27 -0800 (PST)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	o125sm243030pfg.118.2019.11.12.17.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2019 17:49:27 -0800 (PST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1573532188.git.akuster808@gmail.com>
	<dbe5d8d0429ddca87fa80f613a8fbab287910696.1573532188.git.akuster808@gmail.com>
	<9d163a7dff4c555896f8426e90f3e14d69ac87ea.camel@intel.com>
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
Message-ID: <fdef298e-b5d2-848a-14f1-047313c04e4a@gmail.com>
Date: Tue, 12 Nov 2019 17:49:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9d163a7dff4c555896f8426e90f3e14d69ac87ea.camel@intel.com>
Subject: Re: [PATCH 14/20] OEQA: move manual bash test to runtime
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
X-List-Received-Date: Wed, 13 Nov 2019 01:49:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/12/19 5:33 PM, Mittal, Anuj wrote:
> On Mon, 2019-11-11 at 20:33 -0800, Armin Kuster wrote:
>> +
>> +class Bsp(OESelftestTestCase):
>> +    def test_bash_installed(self):
>> +        """
>> +        Summary:        The purpose of this test case is to verify
>> that bash 
>> +                        in exists in the image. Test came from
>> manual.
>> +        Expected:       Bash is found.
>> +        """
>> +
>> +        features = 'IMAGE_INSTALL_append = " bash"\n'
>> +        self.write_config(features)
>> +        bitbake('core-image-minimal')
>> +
>> +        with runqemu('core-image-minimal') as qemu:
>> +            result = runCmd("which bash" , shell=True)
>> +            self.assertEqual(0, result.status, "Couldn't find bash")
>> -- 
> We have IncompatibleLicensePerImageTests that tests for presence of
> bash when different LICENSE values are set.
Yeah, I found that later as I was poking around but want to send the
patch just to have the conversation.
>
> Perhaps we don't need this and can consider this case covered by that
> test?

I am fine with that.

thanks,
Armin
>
> Thanks,
>
> Anuj


