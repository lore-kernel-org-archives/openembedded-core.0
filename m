Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 884F57F95D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:00:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47xmD35rsdz1rsY2;
	Tue, 14 Jan 2020 11:00:19 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47xmD35T50z1qwyg;
	Tue, 14 Jan 2020 11:00:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id Wt-yaVibN5jG; Tue, 14 Jan 2020 11:00:17 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 14 Jan 2020 11:00:17 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 1B94F4540494;
	Tue, 14 Jan 2020 11:00:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id ntciAlRsvK-p; Tue, 14 Jan 2020 11:00:15 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 1837845401B4;
	Tue, 14 Jan 2020 11:00:15 +0100 (CET)
To: ChenQi <Qi.Chen@windriver.com>, Stefano Babic <sbabic@denx.de>,
	openembedded-core@lists.openembedded.org
References: <20200103123322.8396-1-sbabic@denx.de>
	<33870edb-953c-0b64-d7b9-884a53395749@windriver.com>
	<1a30e3ce-0931-57f2-130d-17c24372ef50@denx.de>
	<01dd1ae4-751b-15dc-5408-fb5afe44aa24@windriver.com>
From: Stefano Babic <sbabic@denx.de>
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
Message-ID: <34dd85e0-dd1d-e5d0-3510-f628d4d66c08@denx.de>
Date: Tue, 14 Jan 2020 11:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <01dd1ae4-751b-15dc-5408-fb5afe44aa24@windriver.com>
Subject: Re: [PATCH V4] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Tue, 14 Jan 2020 10:00:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Hi Chen,

On 14/01/20 06:57, ChenQi wrote:
> On 01/09/2020 05:31 PM, Stefano Babic wrote:
>> Hi Chen,
>>
>> On 09/01/20 02:29, ChenQi wrote:
>>> Resend as previous email forgets to add Stefano.
>>>
>>> In case of multilib, the do_package fails with
>>>
>>> ERROR: libubootenv-0.2-r0 do_package: QA Issue: libubootenv:
>>> Files/directories were installed but not shipped in any package:
>>>    /usr/lib/libubootenv.so
>>>    /usr/lib/libubootenv.so.0.2
>>>
>> Thanks for reporting this - I will take care of the error in next days.
>>
>> Regards,
>> Stefano
> 
> I've just sent out a patch to fix this problem.
> 

Thanks for this - I have fixed it, too, fast exactly in the same way you
did, but directly into libubootenv. This avoids to track the patch into OE:

	http://patchwork.ozlabs.org/patch/1222627/

Regards,
Stefano

> Regards,
> Chen Qi
> 
>>> Regards,
>>> Chen Qi
>>>
>>> On 01/03/2020 08:33 PM, Stefano Babic wrote:
>>>> libubootenv is a replacement for u-boot-fw-utils. It is
>>>> hardware-independent and provides fw_printenv and fw_setenv tools that
>>>> are full compatible with the ones provided by U-Boot. A library is
>>>> provided to access the environment from an own application.
>>>> License is LGPL-2.1 and this allow to link the library to proprietary
>>>> code. The user of the tools should install the configuration file
>>>> "fw_env.config", as he is already used to with u-boot-fw-utils. The
>>>> configuration file is compatible with u-boot-fw-utils.
>>>> A full discussion about issues on current u-boot-fw-utils can be
>>>> read on
>>>> U-Boot's ML at:
>>>>
>>>> http://u-boot.10912.n7.nabble.com/SWUpdate-U-Boot-environment-library-dependency-tt340530.html#none
>>>>
>>>>
>>>>
>>>> Signed-off-by: Stefano Babic <sbabic@denx.de>
>>>> ---
>>>> Changes since V3:
>>>>      - Update maintainers.inc (R. Purdie)
>>>>      - Add link to U-Boot's ML in commit message (R. Purdie)
>>>> Changes since V2:
>>>>      - drop .inc file (R. Burton)
>>>> Changes since V1:
>>>>      - drop PACKAGE_ARCH (M. Jansa)
>>>>
>>>>    meta/conf/distro/include/maintainers.inc   |  1 +
>>>>    meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 26
>>>> ++++++++++++++++++++++
>>>>    2 files changed, 27 insertions(+)
>>>>    create mode 100644 meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>>
>>>> diff --git a/meta/conf/distro/include/maintainers.inc
>>>> b/meta/conf/distro/include/maintainers.inc
>>>> index 39eee9475c..09453e7343 100644
>>>> --- a/meta/conf/distro/include/maintainers.inc
>>>> +++ b/meta/conf/distro/include/maintainers.inc
>>>> @@ -398,6 +398,7 @@ RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield
>>>> <bruce.ashfield@gmail.com>"
>>>>    RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin
>>>> <alex.kanavin@gmail.com>"
>>>>    RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling
>>>> <timothy.t.orling@linux.intel.com>"
>>>>    RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
>>>> +RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
>>>>    RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>>>>    RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal
>>>> <anuj.mittal@intel.com>"
>>>>    RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
>>>> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> new file mode 100644
>>>> index 0000000000..23230d132e
>>>> --- /dev/null
>>>> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>>>> @@ -0,0 +1,26 @@
>>>> +SUMMARY = "U-Boot libraries and tools to access environment"
>>>> +DEPENDS += "mtd-utils"
>>>> +
>>>> +DESCRIPTION = "This package contains tools and libraries to read \
>>>> +and modify U-Boot environment. \
>>>> +It provides a hardware-independent replacement for fw_printenv/setenv
>>>> utilities \
>>>> +provided by U-Boot"
>>>> +
>>>> +HOMEPAGE = "https://github.com/sbabic/libubootenv"
>>>> +LICENSE = "LGPL-2.1"
>>>> +LIC_FILES_CHKSUM =
>>>> "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
>>>> +SECTION = "libs"
>>>> +
>>>> +SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
>>>> +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +inherit cmake
>>>> +
>>>> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
>>>> +
>>>> +PROVIDES += "u-boot-fw-utils"
>>>> +RPROVIDES_${PN} += "u-boot-fw-utils"
>>>> +
>>>> +BBCLASSEXTEND = "native"
>>>
>>
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

