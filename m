Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web11.47141.1590484027834808554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 02:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WSlF3Xxcz1rvRj;
	Tue, 26 May 2020 11:07:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WSlF2x81z1r3lD;
	Tue, 26 May 2020 11:07:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id X5Uex0Fl9qix; Tue, 26 May 2020 11:07:04 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 26 May 2020 11:07:04 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id B040E4540528;
	Tue, 26 May 2020 11:07:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kER9nNC-NXaR; Tue, 26 May 2020 11:07:01 +0200 (CEST)
Received: from [192.168.178.64] (paperino.fritz.box [192.168.178.64])
	by babic.homelinux.org (Postfix) with ESMTP id 120074540515;
	Tue, 26 May 2020 11:07:01 +0200 (CEST)
Subject: Re: [OE-core][dunfell 09/17] libubootenv: Depend on zlib
To: Paul Barker <pbarker@konsulko.com>, Adrian Bunk <bunk@stusta.de>
Cc: Steve Sakoman <steve@sakoman.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>, Stefano Babic <sbabic@denx.de>
References: <cover.1590445868.git.steve@sakoman.com>
 <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
 <CAM9ZRVt4dKEefgQF8xnGVoEbm4hFiPOzc106YPai0D5-DpuWoQ@mail.gmail.com>
 <20200526085644.GA15031@localhost>
 <CAM9ZRVsmbfB4YzFa_kOdt-+QocRGz=uMjP0iw2a-5MMVJhaFrg@mail.gmail.com>
From: "Stefano Babic" <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
 mQGiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
 ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
 LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
 /iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
 8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
 yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
 knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
 7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj7QeU3RlZmFubyBC
 YWJpYyA8c2JhYmljQGRlbnguZGU+iGMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
 gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
 R1ofs2wGLHNtXousyL25Ag0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
 N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
 SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
 bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
 Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
 kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
 jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
 wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
 XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
 bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
 tMeISQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
 qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <8d101a43-0795-2d0e-2abf-1098292ecb4b@denx.de>
Date: Tue, 26 May 2020 11:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsmbfB4YzFa_kOdt-+QocRGz=uMjP0iw2a-5MMVJhaFrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 26.05.20 10:57, Paul Barker wrote:
> On Tue, 26 May 2020 at 09:56, Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Tue, May 26, 2020 at 09:24:59AM +0100, Paul Barker wrote:
>>> On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
>>>>
>>>> From: Marek Vasut <marex@denx.de>
>>>>
>>>> The libubootenv depends on zlib as it calls at least crc32() from
>>>> there and links against it. Add the DEPENDS entry.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Stefano Babic <sbabic@denx.de>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> (cherry picked from commit db513f9ec59b7ac526b2cdc42b0eb2573e134bc4)
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> ---
>>>>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> index 3251d0f05b..fa90a12bf8 100644
>>>> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> @@ -1,5 +1,5 @@
>>>>  SUMMARY = "U-Boot libraries and tools to access environment"
>>>> -DEPENDS += "mtd-utils"
>>>> +DEPENDS += "mtd-utils zlib"
>>>>
>>>>  DESCRIPTION = "This package contains tools and libraries to read \
>>>>  and modify U-Boot environment. \
>>>> --
>>>> 2.17.1
>>>
>>> Is this actually needed for the u-boot version in dunfell? My
>>> understanding when I saw the original patch was that this is a new
>>> requirement of the latest u-boot.
>>
>> libubootenv (not u-boot) uses zlib also in dunfell,
>> and a direct dependency looks correct to me.
>>
>> I assume the breaking case involves a layer shipping an own mtd-utils
>> recipe that does not pull in zlib.
> 

Yes, it is exactly the case. dunfell builds without issues
libubootenv-bin (fw_setenv / fw_printenv). Users of library have
doscovered the issue because they have not zlib in their own recipe.

> Thanks for the confirmation, I understand now. Looks good for dunfell.
> 

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
