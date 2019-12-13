Return-Path: <sbabic@denx.de>
X-Greylist: delayed 459 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Dec 2019 15:18:01 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7B68B7F485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 15:18:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47ZDcb1lhTz1rrLR;
	Fri, 13 Dec 2019 16:10:23 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47ZDcb14zGz1rYZm;
	Fri, 13 Dec 2019 16:10:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 59WLe0ZZq7p1; Fri, 13 Dec 2019 16:10:21 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri, 13 Dec 2019 16:10:21 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 9C0664540435;
	Fri, 13 Dec 2019 16:10:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id AZO5aqCKdjxZ; Fri, 13 Dec 2019 16:10:18 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 89F2A4540419;
	Fri, 13 Dec 2019 16:10:18 +0100 (CET)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <20191126061534.23817-1-zangrc.fnst@cn.fujitsu.com>
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
Message-ID: <dc7dd805-8966-c8df-83b0-697f538b51bb@denx.de>
Date: Fri, 13 Dec 2019 16:10:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191126061534.23817-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [PATCHv3] cronie:upgrade 1.5.4 -> 1.5.5
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
X-List-Received-Date: Fri, 13 Dec 2019 15:18:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Zang,

On 26/11/19 07:15, Zang Ruochen wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
> 
> -Added PACKAGECONFIG to solve compilation problems with musl.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} (93%)
> 
> diff --git a/meta/recipes-extended/cronie/cronie_1.5.4.bb b/meta/recipes-extended/cronie/cronie_1.5.5.bb
> similarity index 93%
> rename from meta/recipes-extended/cronie/cronie_1.5.4.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.5.bb
> index d35c667..82cd428 100644
> --- a/meta/recipes-extended/cronie/cronie_1.5.4.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.5.bb
> @@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
>  PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>  
> -SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
> -SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
> +SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
> +SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
>  
>  inherit autotools update-rc.d useradd systemd
>  
> @@ -34,6 +34,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  
>  PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
>  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
> +PACKAGECONFIG[anacron] = "--enable-anacron,--disable-anacron,anacron"
>  
>  INITSCRIPT_NAME = "crond"
>  INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
> 

Between V2 and V3 the fix for the SRC_URI is lost :


-SRC_URI =
"https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz
\
+SRC_URI =
"https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz
\

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

