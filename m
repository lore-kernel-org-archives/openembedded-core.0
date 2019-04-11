Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 102417D985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:01:46 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w3so6315201edu.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ulJhywV0VxsbUKCWOvTbvXTfEwC36h2gQN3u88AbdGc=;
	b=Llfmsf/mmiasH8RkX6MLxqL0wGBFAvhbcRkSJ1xtN1/q7LbPqRKyJRI1w2k0nVfEBd
	j7IbjtWBTE8FxAkavc8u8QNr7/WtLMZ3qCy5B9DwqZS992YKpB2O5PyR4FLg3cIt1WBc
	Set6DUVhyPEDmtaGU00nZm8NHksuFlzgIJvvNqjcMFPA7gzFgMh1NT4C75W+WuLczXBr
	soVjJxkI+7tweXGjDbELxh4niHZ84lfO/Qj5Gjp7lH2acUeU458ZR1jH7Cq3qXABMXrH
	iN039TCZbjG5ukEci0QsoGd1TiM3RCLIQnBJDOUKfMGAcMgeOThD2HGEJRzOP9IvU0XD
	9tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ulJhywV0VxsbUKCWOvTbvXTfEwC36h2gQN3u88AbdGc=;
	b=WgXJ1tIHxD1Chg2k4B8iSAm5zkjCE+zrqVH2SoMRx9gM8Y/G31Cs0DiPYmEv5zAY/Q
	g743dZs9Fe3ZMz3d+lwUpcvHTAzXFCr4muBA3uqR84HkMaTMajbJyu+JYtJLbilYwZI9
	v2oR85413f33klZWqENV3RL1HoSrc2DhfZ0mkvJvYDoZ6DbPaEz3Lz3zcz5KkRrW4RKQ
	/+Y6rILw6JKB0vDSRhMF9J1HQYgjj/6D08nroC1ecyhOOICOYwVMD7brk563C4YkoA8N
	BnrLf02gxrhCeKYglLE9/whqK0gb/FXSrFBN6Zcazg2oqpaz08yHOKcNCcsplfNyPrEu
	3npg==
X-Gm-Message-State: APjAAAUQ+5e1K6j/UUjMTuzEnDacVS8A4C6aE+EJWauOXhGPq8kBLH4w
	NOFj7y4EDhS006L9MfepC1A=
X-Google-Smtp-Source: APXvYqwQIQIFAXGaAnJ68VEosVQMiZ98AYUEyrc0ZOxID/TQih51ULwzLJR3QAbrSmZBxZiMwToLUw==
X-Received: by 2002:a50:8985:: with SMTP id g5mr11812067edg.65.1555012907756; 
	Thu, 11 Apr 2019 13:01:47 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:8cdf:e2b6:b1cf:d0f0?
	([2a02:8109:b5c0:1267:8cdf:e2b6:b1cf:d0f0])
	by smtp.gmail.com with ESMTPSA id i8sm11427540eda.1.2019.04.11.13.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 13:01:46 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <89f9a01cf5b0e87afe338360dda5057f34a60747.camel@linuxfoundation.org>
Date: Thu, 11 Apr 2019 22:01:45 +0200
Message-Id: <2E6EA27D-9294-4354-819B-5CD771285CBC@gmail.com>
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
	<CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
	<847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
	<CANNYZj9k0qM+O9+mVmHf1JM6MR3Cd5xbuhfZFWTqXcW+DnXb2w@mail.gmail.com>
	<6cb9ab41-778b-5e87-dfd2-88d38fec279a@windriver.com>
	<89f9a01cf5b0e87afe338360dda5057f34a60747.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 20:01:47 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Yes, I agree.

Alex

> On 11 Apr 2019, at 21.59, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
>=20
>> On Thu, 2019-04-11 at 11:36 -0500, Jason Wessel wrote:
>>> On 4/11/19 10:35 AM, Alexander Kanavin wrote:
>>> On Thu, 11 Apr 2019 at 17:25, Jason Wessel <
>>> jason.wessel@windriver.com> wrote:
>>>>> Generally because generating introspection data is disabled for
>>>>> native
>>>>> packages, as a matter of policy (do not build something which
>>>>> is
>>>>> unused and untested).
>>>>>=20
>>>>> If you could add
>>>>> EXTRA_OEMESON_append_class-native =3D " ${GI_DISABLE_FLAG}"
>>>>>=20
>>>>> to the gdk-pixbuf recipe, and re-test (without your fix, to be
>>>>> extra
>>>>> sure) that g-ir-scanner is not invoked and nothing shows up in
>>>>> its
>>>>> cache, I would appreciate.
>>>>=20
>>>> Thank you for the explanation.  I think the problem is more
>>>> widespread than just gdk-pixbuf, now that I have a slightly
>>>> better idea about what we are looking for.  My build is not even
>>>> complete and I can see there are three additional places the g-
>>>> ir-scanner is creating .cache entries.
>>>>=20
>>>> /poky/build% grep -r /usr/bin/g-ir-scanner tmp/work/*/*/*/temp
>>>> |awk -F/ '{print $4}' |sort -u
>>>> atk-native
>>>> at-spi2-core-native
>>>> pango-native
>>>>=20
>>>>=20
>>>> Is it the case the bbclass file should be altered to set this
>>>> variable for the -native, or does each package need to be
>>>> modified individually?
>>>=20
>>> I think Andreas's patchset that was recently posted (and is
>>> currently
>>> in master-next) takes care of this in a general way, where you
>>> don't
>>> have to go and fix every recipe. The unfortunate bit is that meson
>>> does not have a standard flag for enabling/disabling introspection,
>>> but we found a way to deal with this that is as generic as
>>> possible.
>>>=20
>>> If you try with master-next, would be good to know.
>>>=20
>>=20
>> It all appears to work fine without the need to patch anything in
>> master-next. =20
>>=20
>> Thank you for the explanation.
>=20
> This is starting to look like something we probably want to pull into
> the warrior release given the problems with meson converted recipes
> otherwise?
>=20
> Cheers,
>=20
> Richard
>=20

