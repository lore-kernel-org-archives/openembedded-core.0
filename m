Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.261.1585674204764438497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 10:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 48sFyg10qCz1rqBY;
	Tue, 31 Mar 2020 19:03:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 48sFyg07KRz1r0cG;
	Tue, 31 Mar 2020 19:03:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id PFEohuhdsjrO; Tue, 31 Mar 2020 19:03:20 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 31 Mar 2020 19:03:20 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id A3339454069A;
	Tue, 31 Mar 2020 19:03:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXPYFchJbfPp; Tue, 31 Mar 2020 19:03:18 +0200 (CEST)
Received: from [IPv6:2001:a61:61b7:b701:d97c:c5f5:7ce4:45bd] (paperino.fritz.box [IPv6:2001:a61:61b7:b701:d97c:c5f5:7ce4:45bd])
	by babic.homelinux.org (Postfix) with ESMTP id 08DC245400D4;
	Tue, 31 Mar 2020 19:03:18 +0200 (CEST)
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Stefano Babic <sbabic@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
 Tom Rini <trini@konsulko.com>
References: <20200331151645.1030603-1-otavio@ossystems.com.br>
 <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
 <CAP9ODKqVEmRYzj6OOcXMjeZq-LwZgAQmSOiJ5v67NRueFBOGKQ@mail.gmail.com>
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
Message-ID: <e7d00367-55ea-666b-2cd8-a9ab1fb3a09d@denx.de>
Date: Tue, 31 Mar 2020 19:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqVEmRYzj6OOcXMjeZq-LwZgAQmSOiJ5v67NRueFBOGKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 31.03.20 18:44, Otavio Salvador wrote:
> Hello Stefano,
> 
> On Tue, Mar 31, 2020 at 12:32 PM Stefano Babic <sbabic@denx.de> wrote:
>> On 31.03.20 17:16, Otavio Salvador wrote:
> ...
>>> - u-boot-initial-env on deploy
>>> - fw_env.config on deploy
>>
>> Why do we need both of them in deploy ? For making system functional, we
>> just need that both files are in /etc, that is ${PN}-env must be
>> installed (and then you set RRECOMMENDS). But why in deploy ? Am I
>> missing something ?
> 
> This is used externally, as well as the u-boot binary. In our case, we
> use this to add them to the UpdateHub package so we can upgrade the
> U-Boot environment during the update process. Something similar can be
> done using swupdate.
> 

Ah, ok - got it.

In your commit message, you stated that as side-effect after switching
to libubootenv is to put the initial environment in deploy. Fine with me
if this helps to add further fetaures or you need it in UpdateHub.


Best regards,
Stefano

> 
> 
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
