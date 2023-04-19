Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F74DC6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:34:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.37891.1681911229671620316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=zQzLXI0p;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so1460008wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1681911228; x=1684503228;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISshav/y4iWSwoL7HKQ5w6L8una8aGE0u7TRIIvBenQ=;
        b=zQzLXI0pL4VzaJb6PdWtxAdMBMuUGvba+T9Httcw8BENGHLpBbsVwGsYuUZyZnAfIM
         oXeibMWiP5Ie4vrePKkLQatNVnK5Xrr8JI6PFiu6B5DmF2GsP/bKGRYiV5vJZKpNM012
         YPK0grEZFKlvcN8eFzv+1T91QI6Sw7MurW6n2mpTvYzKKxAKjgcSQsa7RIQ65yxNvIYg
         wfXMqkUhJTtYxzwRX1Cm5gpcQXs3KU6m6A/1zoP0Vkbh2LYwZUqXqa6OE8b+OEAEppkY
         KLijwprjnwzVgzGmOVx4Z5MbVZJROoyKiBGbJ8YQyXozHXZHG8eOKook5ASnnkx5MvJt
         Dq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681911228; x=1684503228;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISshav/y4iWSwoL7HKQ5w6L8una8aGE0u7TRIIvBenQ=;
        b=IvZ+o9KLalCK8htOvwm0pJEipnI5W/dAVv3Ptd6pg+TpOOrMX/8B5NSowxoY3p37Ii
         LNSEtf+rgVAFhYaM8jkDVet8qOy2sO4zC6UJyc4p/cX7FnHFkxGbWF3x/l8v12Qe+njA
         J05iTj7SaQvehQe6ujRbIqLNKi+xOueYTON+Yn31VUDWeSlIdkWZOSn0qOR/cCwhkMGu
         vIYuMj7urz4apMCdApC/KVvkvP2LPJXH3gb1sJe6luMUUemuCwitrA5DVzqgTULTxROO
         p6LTSj1Qzc+R2aTnzADUPh3KqFXkgWgGl87vAnj1SXgk3vHgxiEseXuiWqe8fdwd7AE+
         aQJg==
X-Gm-Message-State: AAQBX9cC8tsVTJdXOiqSCBWDIGImYGBx/HrfgsA6aLZMAG7FWSNpOs1+
	2n2pWxGEM0bcjtmSp5yNM6OqNw==
X-Google-Smtp-Source: AKy350buXAAtJ7WGryh84ZZEH7NrTuGWxnGuIlmyX209wi49ckmmSRun9GqfWAo3ZxoQ5hpEnwOdkQ==
X-Received: by 2002:a05:600c:3652:b0:3f1:7265:39f3 with SMTP id y18-20020a05600c365200b003f1726539f3mr9121775wmq.4.1681911227726;
        Wed, 19 Apr 2023 06:33:47 -0700 (PDT)
Received: from [192.168.0.25] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b003ede3f5c81fsm2274683wmo.41.2023.04.19.06.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 06:33:47 -0700 (PDT)
Message-ID: <45b37966-6c49-7677-1312-6d7bce4614b3@smile.fr>
Date: Wed, 19 Apr 2023 15:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] icu: upgrade 72-1 -> 73-1
Content-Language: en-US
To: florian.cathelineau@smile.fr, openembedded-core@lists.openembedded.org
References: <oKZ6.1681910120290537896.AdPN@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <oKZ6.1681910120290537896.AdPN@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 13:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180220

On 4/19/23 15:15, florian.cathelineau@smile.fr wrote:
> # FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> # The following is the difference between the old and the new license text.
> # Please update the LICENSE value if needed, and summarize the changes in
> # the commit message via 'License-Update:' tag.
> # (example: 'License-Update: copyright years updated.')
> #
> # The changes:
> #
> # --- ../LICENSE
> # +++ ../LICENSE
> # @@ -13,7 +13,7 @@
> #
> #  COPYRIGHT AND PERMISSION NOTICE
> #
> # -Copyright © 1991-2022 Unicode, Inc. All rights reserved.
> # +Copyright © 1991-2023 Unicode, Inc. All rights reserved.
> #  Distributed under the Terms of Use in https://www.unicode.org/copyright.html.
> #
> #  Permission is hereby granted, free of charge, to any person obtaining
> #
> #
> 
> SUMMARY = "International Component for Unicode libraries"
> DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> portable set of C/C++ and Java libraries for Unicode support, software \
>        rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
>        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
>    fi
> 	
> 
> 	# Remove build host references...
> 	sed -i  \
> 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> 
> BBCLASSEXTEND = "native nativesdk"
> 
> LIC_FILES_CHKSUM = "file://../LICENSE;md5= a89d03060ff9c46552434dbd1fe3ed1f "
> LIC_FILES_CHKSUM = "file://../LICENSE;md5= 80c2cf39ad8ae12b9b9482a1737c6650 "
> 
> def icu_download_version(d):
>    pvsplit = d.getVar('PV').split('-')
> SRC_URI:append:class-target = "\
>           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>          "
> SRC_URI[code.sha256sum] = "a 2d2d38217092a7ed56635e34467f92f976b370e20182ad325edea6681a71d68 "
> SRC_URI[data.sha256sum] = " ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea "
> SRC_URI[code.sha256sum] = "a 457431de164b4aa7eca00ed134d00dfbf88a77c6986a10ae7774fc076bb8c45 "
> SRC_URI[data.sha256sum] = " 07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e "
> 
> UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
> GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"

Hi Florian,

Well, this is not a patch...

Let's see internally how we can cleanup this. ;)
-- 
Yoann Congal
Smile ECS - Tech Expert

