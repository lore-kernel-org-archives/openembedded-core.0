Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 326C37FC46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 22:41:25 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id z124so12313005pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Z3eDBW99iTcxkehNUiEGCiHj0oyQ/a0kG6xFUp+/J+E=;
	b=tXtGr1aV0j/+PQzT1w/Z/QQu7+oSe4JGSqpnaPG+bfgc6pWjABqyesDn/5pA5zZyUE
	2/vSILQ77fq4bAPM2kQuRzs9fQAktnUxI49ibw1BR52DLXj2dh9K6837kY5ceKYanKEk
	jsp1gbTc8yTlV9l3y8PUGYEFpvJgSb3vxc50zeK+UQg8BrRGD05sp/0cc2JMQ3qGfqtq
	9/RDM+v9OTl/HR15CEN3cP0EZ1qDmWrP8jGljRM5b7q5cOCWZ7x37MAe8ij83lDH8/EP
	EGwCWHHeB85MolDykrGZvwTaGxdfSIOVDDZr45+lM/881kFg1GlFpFr5esf/6+R7Nqfr
	9JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Z3eDBW99iTcxkehNUiEGCiHj0oyQ/a0kG6xFUp+/J+E=;
	b=t/kAbz145AF5cZkJYqdDIcIj31UuWy1PslY5D7eg8+5fgNxOULyoqGs7XrSaWxJU7x
	LpntWeV2fYW08uMI1xZrWq7Ng6kP8f6Y61ap6HCvjuPV7H9xnHVY/LOW2C5w/A55hAjH
	BId+3Uh18ez+X1QVv8WfY8u+qz3ZgOTM25CVrV5vl3qB0qx+YeFFRKTmVlLqetq93h1e
	Qj+khR81v+OnI4kh8bhOF3/7rlOgy7vrfCkLsxxtKHtftwMH8z7etYrLdCjY6dTnIkqb
	jFsZ+TAmpNzPkeVIJDMhy3cSZnjve8srfxk5l3MTnnah5VRYLlzvVOlDPBfMvNA8vBij
	PQnQ==
X-Gm-Message-State: APjAAAUJNQHOFgx7Y1jGysZR5+MW4vZIBezCf65u9ijlg2CmJzY+Pz+u
	nW7X5NwGP8VF0/cboEermW4=
X-Google-Smtp-Source: APXvYqzvDXfTwzVSZXHSfeAW1m9+d2FInWqATLhw5U1NLXrdONalPQes6wKBh0trTnzl+7qb+Y5i4g==
X-Received: by 2002:aa7:949a:: with SMTP id z26mr5213988pfk.98.1579300886299; 
	Fri, 17 Jan 2020 14:41:26 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:450d:e003:9142:f492?
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	u1sm28945028pfn.133.2020.01.17.14.41.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jan 2020 14:41:25 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
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
Message-ID: <fce3863d-ddc4-a3f8-fd90-7e6c1c4168c6@gmail.com>
Date: Fri, 17 Jan 2020 14:41:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Re: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Fri, 17 Jan 2020 22:41:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I would like to thank you and Intel for taking up this task even thought
the community seemed to have issues with Centos7 being dropped.

Is there anything community can do at this point?

- armin

On 1/17/20 9:59 AM, Richard Purdie wrote:
> We've been discussing how we could: 
>
> a) build old releases on newer distros
>
> as well as 
>
> b) how we could build new releases on old distros.
>
> Our proposed answer has been "buildtools-extended-tarball" which
> includes nativesdk-gcc.
>
> We need b) so we can install this on Centos7 and stop having to work
> around its really old compiler. In general this should improve our
> ability to support stable branches in general.
>
> I wanted to stress test a) a bit, partly to prove that b) could work
> longer term.
>
> I did this by attempting to build buildtools-extended-tarball on pyro
> which has a gcc v6 and then using that to build morty on an Ubuntu
> 18.04 system.
>
> It wasn't plain sailing, I had to:
>
> * Upgrade the uninative in pyro
> * Switch to xz uninative to allow latest uninative to work
> * Patch binutils to fix an ld.so.conf relocation issue
> * Add an ld.so.conf to buildtools
> * Add the buildtools-extended-tarall recipe
>
> Patches are in:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/pyro
>
> (some need forward porting to master)
>
> Having got the output from the pyro build, in the morty build I added
> buildtools tarball to PATH before running the build. I had to disable
> uninative since it was going to get in the way and conflict:
>
> $ x86_64-buildtools-extended-nativesdk-standalone-2.3.4.sh 
>
> Extended Build tools installer version 2.3.4
> ============================================
> Enter target directory for SDK (default: /opt/poky/2.3.4): ./buildtools
> You are about to install the SDK to "/media/build1/poky-morty/buildtools". Proceed[Y/n]? 
> Extracting SDK...............done
> Setting it up...done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
>  $ . /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux
>
>
> $ .  /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux
> $ source oe-init-build-env
> $ mkdir classes
> $ touch classes/uninative.bbclas
> $ bitbake bash
>
>
>
>
>
>


