Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 628A572E8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:07:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 6so1855037pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 12:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DjfdnfubP1R04uD/0//ZdzkuS2m1DuStytxaWdyiFYU=;
	b=ZrwnwfAE0S5tAyXpsz2f5zMM2HHqK5DXbuKauscauFKy8Q5OBSocLPu6hic2GbcCw4
	NfQSg0MaE4s2xdKOTmZ3g2RvZswXWVfVs6gy8e4yFSy0ahe0X/R4bKPyPR4VbJ5EKK3v
	f3eciN0LReWFCsB0gbbPG4rOtqEOxn84aohsGt6iJjxHjglA17OLKm84xcoE4do/bggn
	/gtFBdAAB2Rp4WhPJviyJe8icRgv0QtNw9FW32Wh2OkgcINTlW1+ypVyBPFJAzfUi9eO
	FkJzx5aJ7VOz8VxV67/eX09ezYTFdMVRfVd8kd9hP7Plp/xATSIq047zRhuqGPqwICr9
	aUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DjfdnfubP1R04uD/0//ZdzkuS2m1DuStytxaWdyiFYU=;
	b=ArxldpfCfijsyjyKfRucW6DHwAIGGEzl8KXmCrUADaiHd7xmaMlnY7p2f0jDQSUKXQ
	KZVlg4tUA2VUQgOfikOYqaeUUGE3MfT8kRjV3Biem7uDQP9ZU1LfTCrb0j+n5a5TrOY0
	+jKBW/5KSSShZJWQF++918+1832qbuHKet2JWzy5065hMmr85EBou9Fv5gPgDhp1EkFz
	DSTCxCDfpHXFylzuSLTYAREEIHYr2yc3u6evk0o3ubuS4iwNY2LMIe/pErREpNJbJLnd
	BtrLaQI7d4Fkgr5Yqi+kh9kK/3SEql45+uJ1ikiSEjsoKTnCVbpC56drz3jvP2iC96bO
	+vag==
X-Gm-Message-State: APjAAAUVekDY6qvzR5NKqxAlsvhYQZ62F3cMx6cIZrOHIO3UtPyFSb7m
	OEzIiU0VDTYMbZa/duZpKLJx5mw6+RU=
X-Google-Smtp-Source: APXvYqw7qwCT5jKliFWQsqHDpSI0Owt6nwBgkvh+nHtKCrXHdsd1Ica2zmFiF6CE8cmrF5Lv5mCLSg==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr5192179pgi.128.1576699660212; 
	Wed, 18 Dec 2019 12:07:40 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:9da4:8d1c:e983:1af6?
	([2601:202:4180:a5c0:9da4:8d1c:e983:1af6])
	by smtp.gmail.com with ESMTPSA id q9sm4286115pgc.5.2019.12.18.12.07.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2019 12:07:39 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
	<fa2bc2d58f4a1cf9de5322b6aacf1362aa47e044.1576677592.git.bruce.ashfield@gmail.com>
	<8722bcef-d607-b061-394e-5585bfde7dab@gmail.com>
	<CADkTA4Pc1Q7c-zW1udQryVOsvgga74wfQd=O=sc_jiDmdyzA4w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <41b44fed-0739-cd1a-6fc1-070e73c50e98@gmail.com>
Date: Wed, 18 Dec 2019 12:07:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Pc1Q7c-zW1udQryVOsvgga74wfQd=O=sc_jiDmdyzA4w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] linux-yocto-dev: bump to v5.4+
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
X-List-Received-Date: Wed, 18 Dec 2019 20:07:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 12/18/19 11:48 AM, Bruce Ashfield wrote:
> On Wed, Dec 18, 2019 at 2:11 PM akuster808 <akuster808@gmail.com> wrote=
:
>>
>>
>> On 12/18/19 6:07 AM, bruce.ashfield@gmail.com wrote:
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/reci=
pes-kernel/linux/linux-yocto-dev.bb
>>> index 163f280560..3b5c9ddc59 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> @@ -30,7 +30,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto=
-dev.git;branch=3D${KBRANCH};name
>>>  SRCREV_machine ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_vir=
tual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8=
c43dcc53970c60e", d)}'
>>>  SRCREV_meta ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_virtua=
l/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43=
dcc53970c60e", d)}'
>>>
>>> -LINUX_VERSION ?=3D "5.3-rc+"
>>> +LINUX_VERSION ?=3D "5.4-rc+"
>> Why is this not 5.5 ? 5.4 is the next stable and @ 5.4.5
> Check the date on the commit ;) I had sent this much earlier in the
> year and it fell through the cracks.
so it has. My apologies.

>
> -dev will be 5.5 shortly, once I've sorted out the mips64 boot issue
Not sure if its related but when I updated thuds 4.18 kernel to the
latest and it failed on mips too. So something between 4.18.33 to .45
introduced an issue.

I have not had the time to dig into it.

- armin
> with 5.4 (and if you check linux-yocto-dev, it is already 5.4.5)
>
> Bruce
>
>> - armin
>>>  LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
>>>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>>
>



