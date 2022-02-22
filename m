Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1D4C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 12:28:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.12018.1645532914625578609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 04:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QvnFmgtH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso1682251wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 04:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u7oaMLUnMa653JzkerwdRNpU5oQ+Usz650KBjttK3DA=;
        b=QvnFmgtHUENv7bZTK3j+wGUUn3ymOZtubFjarA7Sa/7eo+2dtmAZ1+86+QeIQAy9uX
         dLH9PIdIpfj1wdJoNefP9+wIq3vxA1ogrss6C39iwsUg8GwQklbLe8nGV+43oYKTCcZc
         +E4J1iGy+EuiCtoY7jVEgO4O53Dv+5ZMEB6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u7oaMLUnMa653JzkerwdRNpU5oQ+Usz650KBjttK3DA=;
        b=1Cwf6VwqC/UCkunHDhApxRRrZRYjcIE9DWL5MuMBWifaMW1/vWdVoMUc0WLNY4IqPN
         PM03BLH1FgmYl3lKlyCkQiUdW8rZK/i0kFyeREYnl7L5W2PRt112+K2Ni1CeKAJgL+0b
         Nj7woTopv26xnRRhv2mp/DFq7Rn3EdrYQOm17GkVsHYVjfKCCsfc/zdCH9cNrbKzynUF
         oH0zb/IcVVs1xBvO2/yhdVEwzu44AEJ+Dt2AAxTcMZawMDUELp3UWZJMZ4idpTAIGOd2
         6A+19bHPO51l8g4k8nJftVMSrYOFUbUJ4BR9svlMtiXlfSpC7+UZPUPJ42t9U1zHd22D
         COCQ==
X-Gm-Message-State: AOAM533twHM99QDc/lN1bVzMbHv7CrhM7q5tymxzadQHrbrO935IWsJa
	rS/xOLh3B2fU5EVKODShf19UYA==
X-Google-Smtp-Source: 
 ABdhPJy6B2nfpK6obcBb72d5J24s2Nci87NBjv8NyJVrEyuj0ZAIzHVWFqQXm7dRt55Hb5ITiNA1jQ==
X-Received: by 2002:a05:600c:ad0:b0:37b:b989:faaf with SMTP id
 c16-20020a05600c0ad000b0037bb989faafmr3160325wmr.167.1645532913041;
        Tue, 22 Feb 2022 04:28:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26ce:ff82:5c7d:d03e?
 ([2001:8b0:aba:5f3c:26ce:ff82:5c7d:d03e])
        by smtp.gmail.com with ESMTPSA id
 p7sm29579139wrr.95.2022.02.22.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 04:28:32 -0800 (PST)
Message-ID: 
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Andrew Jeffery
 <andrew@aj.id.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Feb 2022 12:28:31 +0000
In-Reply-To: 
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
	 <20220222035234.463162-8-andrew@aj.id.au>
	 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 12:28:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162130

On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
> I have to note that YP does not support ppc systems as build hosts;
> can this be kept in a bbappend?

It isn't official but there are obviously people using it. I think we should try
and do something in core but there is a question of how we maintain this given
our infrastructure/tests don't cover it :(

Cheers,

Richard


