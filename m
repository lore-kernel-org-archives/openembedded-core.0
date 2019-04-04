Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE9A7D451
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w10so2807328wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=b4yD2k6lDeBc4wdPqkonzOkyPg4RbJySG0gPpDCMaVc=;
	b=gOa+0hkjBbLHQhylrcv2TfjS5PM2C1A1AtQzap2zoUg2EaFmIwoUYMN1gX8jHGxau8
	HYhnn56g0knJWr2EZov3AIP+6/QrDyqCfEXbsnjp9JbccQd3/ZZsRKpY4pCt3JtMDxzb
	1VFVW4v92vdzbGM95KXBpTm5ltMspyS4G8eLzhFRnN1/K6mlOWX93NIxxCI4Gy3Du+lm
	/BePr2EK3wZQslnN2oJ9KNILszbR91jaMH9XonrLFVvis9pX92pkC5lSHwSokNOa2tof
	sOUEehf9fRhgJA+ri7Gt8p/Xqfk4YDFik01iyqoUjSY/GfDSOwCX3PaEYL40c/DYssU0
	vzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=b4yD2k6lDeBc4wdPqkonzOkyPg4RbJySG0gPpDCMaVc=;
	b=kpGFjl4icZEQfjyjK0TS5YtM9Ln5sPJHl3VvWsKOQy1rwJJnZBkPMazMfXbqah8sdz
	j5Wle1GwlZ6Tq3UrGAlzJ3+mxzHxQTokiWD1kdUhP//hxCH37GizymuF/UBxffSLx4kK
	vMYuWCvEcVgrYAL/BcXd/UucRyHWL8CXLfs/Xdw4ZIVakAwFox24syBe5k8v9Yeb34m8
	Wf+3+7f8pL6OaahMUhWJb3Pl58ofm0kbdY/dq2BWNScuueebM6PYu5v3/vtIqq2nmnGj
	qWIQ1sWVsU1UCGCNyF9AZlRdFlAmSSn55G455gglrthXCm7GT0lBT2C/bzHkawiHzh8P
	IFNA==
X-Gm-Message-State: APjAAAWvsmJjcYnA9VKCQAH2T9oBGCR3l6GzwsZx4I7qWAwj+ilMX0Uw
	mHlwEl7b0GvjJRM7uMJk7cQ=
X-Google-Smtp-Source: APXvYqzDLKJlxn5J8UFtCUcjAZZfcz4ruA+rzIB7iBihUO6jFmDfNPiRLTVFVELt2mooVfjGFGUsiw==
X-Received: by 2002:a5d:634c:: with SMTP id b12mr3245383wrw.203.1554369591411; 
	Thu, 04 Apr 2019 02:19:51 -0700 (PDT)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	o12sm16325753wrx.92.2019.04.04.02.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 02:19:49 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <D71C89FE-B1F1-45EE-A831-41B1F3E51B60@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Thu, 4 Apr 2019 11:19:48 +0200
In-Reply-To: <cf7e013e8ca40525e6738bf318e85f299535f2d8.camel@linuxfoundation.org>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
References: <20190403131822.19503-1-sno@netbsd.org>
	<089f9da0ec7f175fcf327994f31e0728f75313a0.camel@linuxfoundation.org>
	<CCFDEF2A-61E0-493B-AF4B-8A8EA5D6A551@netbsd.org>
	<cf7e013e8ca40525e6738bf318e85f299535f2d8.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.104.8)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:51 -0000
X-Groupsio-MsgNum: 123045
Content-Type: multipart/signed;
	boundary="Apple-Mail=_60952324-12FD-4457-92D0-AC353DF7F2FB";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_60952324-12FD-4457-92D0-AC353DF7F2FB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> Am 03.04.2019 um 19:10 schrieb richard.purdie@linuxfoundation.org:
> 
> On Wed, 2019-04-03 at 19:05 +0200, Jens Rehsack wrote:
>> 
>> 
>>> Am 03.04.2019 um 15:58 schrieb Richard Purdie <
>>> richard.purdie@linuxfoundation.org>:
>>> 
>>> On Wed, 2019-04-03 at 15:18 +0200, Jens Rehsack wrote:
>>>> In case, kernel config enables compressed modules, support of
>>>> splitting via split_kernel_module_packages won't find any module.
>>>> So, first expand module pattern regex to recognize compressed
>>>> modules and then objcopy on temporary extacted to extract module
>>>> information.
>>>> 
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>> ---
>>>> meta/classes/kernel-module-split.bbclass | 36 +++++++++++++++++
>>>> -----
>>>> --
>>>> 1 file changed, 26 insertions(+), 10 deletions(-)
>>> 
>>> There is a lot of whitespace noise in this, could you clean that up
>>> and
>>> resend please?
>> 
>> It's because of <tab>s were replaced with spaces - which is
>> reasonable when python code is mixed in.
>> Sure that you want keep the tab's?
> 
> Rightly or wrongly, the style convention for OE-Core is tabs in shell,
> spaces in python (I'd prefer not to open that can of worms again right
> now).

That wasn't the intension - I just wanted to be sure.

> Whitespace changes need to be in a separate patch to code changes
> regardless.

Understood.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_60952324-12FD-4457-92D0-AC353DF7F2FB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlylzDQACgkQRJmWrtzl
Cp32lw/+MG86XHEyp2DcNBZzyDM8B+yqRo3IRdBSlxiOVJWcn9jL7luh0TNbWcWI
NGQpc/p+oCEo14rL+bh3LxpcVkECkaxKGpBp8zpgFTW24osjcB5YYnNpWuoUX94t
x6oWoB+r8yYwA4kZAqceSFBXbYazfeQOeD/RPxwv9ae+CGUrGdsLWv8ZqhCgbV97
Cl7kKwIAlTMIIzFduVQUGMGP8huLLY3Saeo5nSe4lZ/1paZUMponrt2soX0F4sA4
PI6shIxp4q8zjLeAHcyKJxRO0KLDaotSLKXaWcwgZz4sxhox7Bxr0ROhGz3T8MLm
DfTx1oFj0UFb+RmW13O1re+HgKm/q7jHdEf3u91gpqzpV1kBYgP+1cjtJaxoB7Hs
AdsOHu3v8tEVCl0u8AeG799M2G1rUjF756ei0WvLaOIB+OuT5SuIz0baJEdIuajf
//7nf8NxrAa/yjRCF0u+POpmcFCqDF0ved7S+DuHmr6xaGrYpIgLo0TqojJLba9r
fQDQtBo090NG/m7bKcsj3S6uMCMbVk7HEfpcFYOos8jfrdkOj9P+x+TnnGt7o40A
setvBW1DwOyG8iXCxHz3ASdaO/p3b+BCqmRhyOS3Z6zo+v7UIx80QiECpnDzIPGe
oaMohzQHYnMKMj4SdKz1mhkYg/L2HAHrCwGyRgJd8etQPLqWGKM=
=CSZn
-----END PGP SIGNATURE-----

--Apple-Mail=_60952324-12FD-4457-92D0-AC353DF7F2FB--
