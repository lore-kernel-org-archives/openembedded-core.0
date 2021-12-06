Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E97C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 23:03:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.59554.1638831779263874743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fnkm7NXt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id t18so1644538wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SFXKOG5L3d3ks5eclT9jlOCFy13Na94E5AQLcEBsMY0=;
        b=Fnkm7NXtS0HC96WwNtlao/zCIzAhEJmxA37sQMIgp/yJysDJlqE+aeCrLhl66JULVa
         5i0wzLg+/Civ/Y108BE2ckKF7NAk5ZhOti2j8Peyth692UkRtHt5ybAOby56JWECLMxH
         srE7EsTLtOANHHZfCMFnTcUp1s8t/DBtPdUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SFXKOG5L3d3ks5eclT9jlOCFy13Na94E5AQLcEBsMY0=;
        b=CneWk6T/Bhj5G4wzp0EdIF3FUWQH6VkTJcadfXGf2G34XuCwgjeo723MOb4HStUxde
         WJP5FrqE2HDX2HfgLapppgk5tOg69mlMIdH5DYqmNGRd6r7FiOG2nc4a+XSJWVm/cCcC
         UAPjH3uAHHxJcDXt9WNr67w8o+QZ8MkQWUrE/W2ZoZY0DfjKOm6OXYev12gPoyXIxnkf
         7f3J8FYVKtgjFt5pFyW5Hd8B6DFrvN/gXX6uyNoVVP3RgYLOA6kPBJtwo9IajGlwZNIs
         v2hyWbCNjq/R4g7WUFHQdl9AgHlwirhdPiJo7WD/YgpEVp0xFvz9VPjfCTahsCawVM++
         hkYQ==
X-Gm-Message-State: AOAM532+/+gaf8KpGl/bzDsnPHst/RKP8ZJKtGRZgbO9Ix/UTsx15ofr
	7EnpyU8YKQzzv2P5Bj59WGJteQ==
X-Google-Smtp-Source: 
 ABdhPJyTITjFwVM61L0Nvvs/8PnfXzItvwrD9EkDxvWz3IAWVDzBMPgZhDYx5n4KlDKcQ+6vQM+W6A==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr47442762wrf.383.1638831777683;
        Mon, 06 Dec 2021 15:02:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 l22sm646210wmp.34.2021.12.06.15.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:02:57 -0800 (PST)
Message-ID: 
 <28acc0703f62f57105e9d007ffe60c9546570f44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] blacklist/blocklist and master/golden
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 06 Dec 2021 23:02:55 +0000
In-Reply-To: <20211206153511.34838-1-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 23:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159273

On Mon, 2021-12-06 at 16:35 +0100, Quentin Schulz wrote:
> Hi all,
> 
> It seems some changes are not too invasive and can be made to be a bit
> more inclusive, so I'll make the autobuilder try those patches and tell
> me whether I broke something somewhere I wasn't aware of.
> 
> In other words: I did not test those changes.
> 
> Those changes warrant some notes in the migration guide once they
> are merged.
> 
> Cheers,
> Quentin
> 
> Quentin Schulz (4):
>   rename core-image-testmaster* to core-image-testgolden
>   core: initrdscripts: init-install{-efi,}-testfs.sh: rename masterimage
>     into goldenimage
>   oeqa: rename masterimage into goldenimage
>   core: udev: udev-extraconf: rename mount.blacklist* to
>     mount.blocklist.*

I'm sitting wondering what core-image-testmaster actually is. I don't remember
anything being done with this for a long time so it may be a good candidate for
deletion. I should check with QA but...

Cheers,

Richard


