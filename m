Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6026B7FC4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:57:08 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r11so2158457pgf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=t+Q0hZVVhC6LpZe+5ACWXM4mZ4UPbU5ZWqHuKPC8d5w=;
	b=lWKhqe5kQyGOAp9oDd9bA0G/+eV+RhdX2OEvKoHwuaUdvWA2AfZ3qFJ4I4JaKQq2dq
	sZ0D2wsOEpgx242Cwl8jxG6PRGoDJRcPTwH1AvPiL8uXRI9BBQsrXG7K1U8wBQlj+5ai
	Ljbh8xjqBQD7J/nB8kM0hEksTxERS5LNwV4+IfCG2z6Hs2OL34Kz70m7Oar3QbSwbXk8
	VDaZQnNfDKJ4IdmtmeLpv6S20SRN34ZTgCZHdK+cwPbpOr7YhXnj8jci+O9dNambSO8/
	yVMMhPVyH7cKBrRVlczCWZ6AO5isVB8d2f3IzpbEz3gbxSvDLLczgkLTo4Bcj419iN/I
	+J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=t+Q0hZVVhC6LpZe+5ACWXM4mZ4UPbU5ZWqHuKPC8d5w=;
	b=BFaOcMHlbvvE4VefSjSl6tuP1ildkyvu2P1CkigS9/249iwQtbIsCE99TE5qm5H3zq
	14eOcKIcWYiJsM2sN1Ifal1fOpU2tcvEWJbpyYW21YOKLKwGizT/rdqmm4Xajsdh6U3C
	hDaz2r55O3zQosdEbeqFk5zwbN8srhzKgYknkyoCgtaIwrAITScUnitW3kQyyFBrOkm6
	427W/OriAyQkH9c2PPs0dKNfiTXYRPkP9RgyBb9VVgNddExZ8r0NnWYwBSp7qFDwMlJY
	8i1XRmpc7JYMDfWlijdBGEWPTxPxcxiLJKnvH6Ypx6QnZrqEVHfkcYbhBaxhSO+9LunW
	laLw==
X-Gm-Message-State: APjAAAXfJl/ZvQutDqcCfidByUypbj+Km2g1X8sdmAQJmEdTwLn9/K99
	nwM5WOdZsIrVeW1SbjZOH+Q=
X-Google-Smtp-Source: APXvYqxD6lNkuL3SXEgX336WgeQmzO9WpX52eSV4BB7ih6PO28tI+OTC/rmLj4UwueJaSEiNkwNaeg==
X-Received: by 2002:aa7:9145:: with SMTP id 5mr538176pfi.74.1579820229499;
	Thu, 23 Jan 2020 14:57:09 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:682c:76b9:6d8a:bbd2?
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id
	b42sm3913887pjc.27.2020.01.23.14.57.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 14:57:09 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>, Jon Mason <jdmason@gmail.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
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
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
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
Message-ID: <cf40baea-61d3-7e1b-4c25-853bcda2753f@gmail.com>
Date: Thu, 23 Jan 2020 14:57:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:57:08 -0000
Content-Type: multipart/alternative;
	boundary="------------EE09101DABFC61EDE7358042"
Content-Language: en-US

--------------EE09101DABFC61EDE7358042
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 1/23/20 2:17 PM, Ross Burton wrote:
> On 23/01/2020 21:43, Bruce Ashfield wrote:
>> On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org>
>> wrote:
>>>
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Many BSPs require ARM Trusted Firmware (also known as Trusted
>>> Firmware-A).
>>> To avoid duplicating efforts of adding very similar recipes to BSP
>>> layers,
>>> add an upstream reference implementation to openembedded-core, which
>>> can be
>>> customized by BSPs, if needed.
>>
>> Isn't this one of the things that Jon Mason is trying to
>> standardize/support in meta-arm ?
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recip=
es-bsp/trusted-firmware-a
>>
>>
>> What's the delta between the two ?
>
> That was precisely my thought too.=C2=A0 meta-arm isn't exactly well kn=
own
> right now, but ideally it should be a central place for common pieces
> that are specific to ARM hardware (unlike anything that is needed for
> qemuarm itself).

Per meta-arm's README:

|meta-arm:
This layer provides support for general recipes for the Arm architecture.=

Anything that's not needed explicitly for BSPs, the IOTA distribution,
or destined to be upstreamed belongs here.


So does that package belong in meta-arm based on what Arm is trying to do=
?

- armin

|




> Ross


--------------EE09101DABFC61EDE7358042
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/23/20 2:17 PM, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com">On
      23/01/2020 21:43, Bruce Ashfield wrote:
      <br>
      <blockquote type="cite">On Thu, Jan 23, 2020 at 4:00 PM Denys
        Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denis@denix.org">&lt;denis@denix.org&gt;</a> wrote:
        <br>
        <blockquote type="cite">
          <br>
          From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
          <br>
          <br>
          Many BSPs require ARM Trusted Firmware (also known as Trusted
          Firmware-A).
          <br>
          To avoid duplicating efforts of adding very similar recipes to
          BSP layers,
          <br>
          add an upstream reference implementation to openembedded-core,
          which can be
          <br>
          customized by BSPs, if needed.
          <br>
        </blockquote>
        <br>
        Isn't this one of the things that Jon Mason is trying to
        <br>
        standardize/support in meta-arm ?
        <br>
        <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a">http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a</a>
        <br>
        <br>
        What's the delta between the two ?
        <br>
      </blockquote>
      <br>
      That was precisely my thought too.  meta-arm isn't exactly well
      known right now, but ideally it should be a central place for
      common pieces that are specific to ARM hardware (unlike anything
      that is needed for qemuarm itself).
      <br>
    </blockquote>
    <br>
    <font size="+1">Per meta-arm's README:<br>
      <br>
      <code><font size="+2">meta-arm: <br>
          This layer provides support for general recipes for the Arm
          architecture. <br>
          Anything that's not needed explicitly for BSPs, the IOTA
          distribution, or destined to be upstreamed belongs here.<br>
          <br>
          <br>
          So does that package belong in meta-arm based on what Arm is
          trying to do?<br>
          <br>
          - armin<br>
        </font><br>
      </code></font><br>
    <br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com">Ross
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------EE09101DABFC61EDE7358042--
