Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643FFC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 16:54:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.767.1659977669131124113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QhC+5F3U;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 130so8559848pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=K4bfLx2gHq/j778Us1R8krJljoZMz5lDUAf9OTLgs4c=;
        b=QhC+5F3UqdILsL4ksTxVlD8aEqyrZcPlis2NdvyRNJGDe5dtN1iGZU76X5drCy+luq
         9RlWh0j1ySlSDWBV0WMkBYn1PJRNDnoqi/PPzgFf3R1LPUOgutOkgImDWIT2g1G7Vc4B
         +XeeBNZdT9IjdjACGqw89ZK8vTc67qzL8iwH24eB/zrlSxP0SRRdMhC+WtRak9X1R8Pf
         zZrHrgUbqD/2Q9afEb8Nlc6wE11G9GHPO4MwLkCUYB3EcVWkK560vJe8536uuXJr6S5+
         Lie4oV+yVFdNLEY7A803PWaFQDvxoUEGzAex/H+sqRWWCH9iUNhK83KSdzPzpZ7bXMZi
         xbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=K4bfLx2gHq/j778Us1R8krJljoZMz5lDUAf9OTLgs4c=;
        b=KW/R4zgM4FMGjR7qC/I9p/eJRZa9ezV5Umu6FbqLrH3DM0UQu4FhlOfajiQRsQAN/S
         DvtIGwbsGPzxZY5PFsPeGFSIazy7W3J2+hxlpT5fy3WZaMBoS22TUXDsnjIf5ubp8qm3
         6ySUBLvuhqfOdf9dytn46M3yizVt74W5RpDMLFWIsjI8PSs3e6qIYMqj48o/VCA8+uR3
         Mr094Kd9RHDerTWAasQJRsSygP6s4o5uSKpm2Llio08MDnQtiOjKtUNhO7OJmv72re6u
         Fb28LPkE+YAnwpi92J9TwZ+iKfQ1cjGrPiPGYBOoqyOSVgWRVNtVdZQ9KRHA4gEPT+IH
         2XwA==
X-Gm-Message-State: ACgBeo3YB2YZh+K+Nbx4VDe84xN0V5AQaQd+20xdhnyfDq7lu8D6eOL9
	onfT5m/+0nD3XchhLmNpSNc=
X-Google-Smtp-Source: 
 AA6agR5GIpUkots63fxUzzX+DonHq31uj4DR5ZHExDbp+qXqOq9Dr+rrm59oIGiF+C8XRC2+4BnYig==
X-Received: by 2002:a63:3646:0:b0:41c:f56d:fff6 with SMTP id
 d67-20020a633646000000b0041cf56dfff6mr14740485pga.475.1659977668301;
        Mon, 08 Aug 2022 09:54:28 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 d8-20020aa797a8000000b00528c8ed356dsm9086473pfq.96.2022.08.08.09.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 09:54:27 -0700 (PDT)
Message-ID: <19f519e2-c632-da23-6132-664f2c53d311@gmail.com>
Date: Mon, 8 Aug 2022 09:54:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 03/44] dropbear: use git to get sources as
 the website is down
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-3-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-3-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 16:54:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169099

it seems to back up again. However, if its a site flakiness issue 
perhaps finding a good mirror might be nice.

On 8/7/22 11:41 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-core/dropbear/dropbear_2022.82.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
> index e170587d08..cff2e6c024 100644
> --- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
> @@ -14,7 +14,7 @@ RCONFLICTS:${PN} = "openssh-sshd openssh"
>   
>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   
> -SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
> +SRC_URI = "git://github.com/mkj/dropbear.git;branch=master;protocol=https \
>              file://0001-urandom-xauth-changes-to-options.h.patch \
>              file://init \
>              file://dropbearkey.service \
> @@ -23,6 +23,8 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>              file://dropbear.default \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
>              ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
> +SRCREV = "b8669b063bd2fc1906a13fb4b50c8b4697bf49ce"
> +S = "${WORKDIR}/git"
>   
>   PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
>                  file://0006-dropbear-configuration-file.patch \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169027): https://lists.openembedded.org/g/openembedded-core/message/169027
> Mute This Topic: https://lists.openembedded.org/mt/92886998/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

