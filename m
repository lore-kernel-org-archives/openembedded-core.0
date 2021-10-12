Return-Path: <zboszor@pr.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2791C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 09:36:17 +0000 (UTC)
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.11427.1634031375444646584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 02:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=WB4q+Ocp;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1maECh-0007qt-AX; Tue, 12 Oct 2021 11:36:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mE4jUR0EqnSiAwNAYLgEYeRHoVy0JDgLa9+1R+FjzDA=; b=WB4q+OcpB17MZK9k2ZSkJ1SZD3
	78830y1rbQjNPg+ONbDVwkITBMVppbhqYSG/y9r2LjiWq3BI/nUIIo851Q+y1m56ovt2Qrjyigc0D
	WYVbEB0erqjkACJgxbRHOtpufMSlyQwtSBF6dQ/8hwA9EgERciB1XgMVs3i1B4SdObaEFHpEEOu1/
	wUPaN7ck/lXILI+rEFtYK7hvDiPVq6ejPRXnylN/URceKPlnhEr2j/fOvDrDMIBUPygBQo3jwTkYx
	oJd6zPfxUabWTrIdIBouXudvpZwgwDTnXEDLcGh25EXe2KTxgqW2+qwlqd5hz0V+wGveXk/iXbUd/
	+YTXde8w==;
Received: from host-87-242-33-29.prtelecom.hu ([87.242.33.29]
 helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1maECc-0007Jm-B1; Tue, 12 Oct 2021 11:36:09 +0200
Message-ID: <a56da552-d10f-904d-0899-053959eca33e@pr.hu>
Date: Tue, 12 Oct 2021 11:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [OE-core] [PATCH 1/2] python3-setuptools: update to 58.0.4
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org
References: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
In-Reply-To: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scan-Signature: bac636d383641ecc82643dbc9c1f3bb5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 09:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156862

This version broke at least python3-jsmin 2.2.2.

I am hitting this issue:

https://github.com/tikitu/jsmin/issues/33
"error in jsmin setup command: use_2to3 is invalid."

setuptools 58 removed support for use_2to3.
python3-jsmin must be upgraded to 3.0.0 as a result.

There be other fallouts, too.

On 2021. 09. 19. 0:18, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   ...ython3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-devtools/python/{python3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> index ae45936c39..2000d355a9 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> @@ -10,7 +10,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>   
>   SRC_URI += "file://0001-change-shebang-to-python3.patch"
>   
> -SRC_URI[sha256sum] = "6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465"
> +SRC_URI[sha256sum] = "f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e6e237b"
>   
>   DEPENDS += "${PYTHON_PN}"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156151): https://lists.openembedded.org/g/openembedded-core/message/156151
> Mute This Topic: https://lists.openembedded.org/mt/85708588/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@pr.hu]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


