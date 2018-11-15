Return-Path: <sbabic@denx.de>
X-Greylist: delayed 395 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Nov 2018 10:48:02 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BD1706C19A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 10:48:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42wdFg1MBgz1r3Jv;
	Thu, 15 Nov 2018 11:41:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42wdFg0Vpfz1qsK5;
	Thu, 15 Nov 2018 11:41:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 1JODskNIMbws; Thu, 15 Nov 2018 11:41:23 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu, 15 Nov 2018 11:41:23 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 87EF34540403;
	Thu, 15 Nov 2018 11:41:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id Nnm8G9uvgiW2; Thu, 15 Nov 2018 11:41:19 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id C175245402A8;
	Thu, 15 Nov 2018 11:41:18 +0100 (CET)
To: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<c060af96f5e55e4808e4cccde2bc8c7a3633ff8f.camel@synopsys.com>
From: Stefano Babic <sbabic@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
	xsDiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
	ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
	LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
	/iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
	8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
	yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
	knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
	7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj80eU3RlZmFubyBC
	YWJpYyA8c2JhYmljQGRlbnguZGU+wmMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
	gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
	R1ofs2wGLHNtXousyL3OwU0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
	N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
	SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
	bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
	Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
	kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
	jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
	wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
	XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
	bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
	tMfCSQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
	qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <ce245b3f-083a-fda4-a35b-96525dcc4e83@denx.de>
Date: Thu, 15 Nov 2018 11:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <c060af96f5e55e4808e4cccde2bc8c7a3633ff8f.camel@synopsys.com>
Cc: "marex@denx.de" <marex@denx.de>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 10:48:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 15/11/18 06:05, Alexey Brodkin wrote:
> Hi Khem,
> 
> On Wed, 2018-11-14 at 20:57 -0800, Khem Raj wrote:
>> On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
>> <alexey.brodkin@synopsys.com> wrote:
>>> This utility is used for creation of images containing
>>> usable in run-time U-Boot environment.
>>>
>>> As of today this utility is added per-board like here [1]
>>> for Intel Edison board, here [2] for Altera's SoCFPGA and
>>> I may guess there're others so instead of adding another one for
>>> ARC why don't we package it for each and everyone.
>>>
>>> [1] 
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=U0I6P-1P3vft6mR4soZ9Y6ptJqYWloOoS0ogvO2Rzv4&s=WEknmJT4TnByCWMMzh4D-2sDrYv5_kx2V1Qk8SYtJY8&e=
>>> [2] 
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kraj_meta-2Daltera_blob_master_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dmkenvimage-5Fv2016.11.bb&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=U0I6P-1P3vft6mR4soZ9Y6ptJqYWloOoS0ogvO2Rzv4&s=OiXy88hL3o5z9JN0O88EUo3ttvvgFQnC2LnDc_xhGyY&e=
>>
>> If this is applicable/works for all u-boot based machines then I think it makes
>> sense to have it on OE-core.
> 
> Well "mkenvimage" is one of standard U-Boot tools so it has nothing
> specific for any architecture or board whatsoever.
> 
> It is not used that often as "mkimage" probably because people
> mostly depends on default U-Boot env settings which are compiled-in
> U-Boot binary with help of CONFIG_EXTRA_ENV_SETTINGS="..."
> but IMHO it is rather useful as we may prepare fine-tuned environment
> setups for a particular use-case from pure text-based input.

It is useful, but I think it is better to include it into current recipe
(as Martin suggest) instead of adding a new one.

Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

