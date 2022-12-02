Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D07DC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:09:31 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.71656.1669975763364848393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 02:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uplANykC;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id j4so6726266lfk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSERA0OHed6wOFr5tdlF7cuDjrq/mmTNZtGnA690lC8=;
        b=uplANykCvM4dQYVGPX4Sz78myf6pwVxpFhN9Nzu/jPTXXAjg98WH+ag2ouF1iCJuPi
         Xbq9LyRITM1BQNpXzxdFI1GpLVrSnFqIDm5R2etR1Yn0D0Mdk+V1DwEMPdG2GIX5/5Df
         i5it7rL8mseSrLsYv1Z7o1Cfhv6WXBI6nvWjoTecTwMMMgOUc0DMA70V+Sadq/ltvaao
         hlzD8OL29XU4BgBLmPyCF/CJRugU8RMABjkpGLv1SzjlCcYj8VgOfYyNhBR6mDfGrk7k
         YBCt5b9wj7/VgvBwg8xA5CZPCnMBjkU3VReiSuzBjzS9kMk86V6kaHwULgad5H4i3N8f
         O4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSERA0OHed6wOFr5tdlF7cuDjrq/mmTNZtGnA690lC8=;
        b=I7we73E3uS0UF8SbODWUvA3bJd1QhW2kjBdpwtHolUfL4iWuG0DWtwAXqzXlucTHd1
         mXBajOymaY7Cv+m1Qv6cXb1e5wNEPNL9kvDT77s5PlT8SRvbc3TNEcNNmAbYQrwu8cWX
         aZ/wHM1jJAv7ZOb3Nd05VnFJ49/uM36U0fIeHFGXfubCISmEwHEdJU1C+Y1DPvz15u6o
         9syaRyMakkc8I4INjZZ6M/IIN4+Tehd9b6svN//RkEgQkwTWjbjnXFeGXgWEZt/XebiR
         6r3vU58VWtltn5iSTaRJh1FLWjXfUwI0j0nRI2i67AxsMzC1BIry46SpmiV63DHI4ogq
         M9eg==
X-Gm-Message-State: ANoB5pnuMT/673MTCyS6O2yHZff1Nju/8QQh8S62PWGOC8i9iNBsjjzr
	xAP7/jNDgaDnMPBxpIBNFtmRpw==
X-Google-Smtp-Source: AA0mqf7xqFhV4K5jB+bgvTIsst9VolbuUEObjZRvdtQF2EQO1FGM6Kq76D8n0kqSk5Lmex8zuz+gAQ==
X-Received: by 2002:a19:f610:0:b0:4b4:a536:f866 with SMTP id x16-20020a19f610000000b004b4a536f866mr21936250lfe.262.1669975761359;
        Fri, 02 Dec 2022 02:09:21 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id v7-20020ac25927000000b004ab4ebb5d92sm973365lfi.5.2022.12.02.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:09:20 -0800 (PST)
Date: Fri, 2 Dec 2022 12:09:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: "'openembedded-core@lists.openembedded.org'" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] About the judgment result of the CVE check tool
Message-ID: <Y4nOz23Uq6/Efg8v@nuoska>
References: <TY2PR01MB328952DEF46146B2AF44F25292179@TY2PR01MB3289.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PR01MB328952DEF46146B2AF44F25292179@TY2PR01MB3289.jpnprd01.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 10:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174234

Hi,

On Fri, Dec 02, 2022 at 09:55:37AM +0000, Matsunaga-Shinji wrote:
> Hi, I'm Shinji.
> 
> I have a question about the judgment result of the CVE check tool.
> 
> If the version of the package "pv" cannot be compared to the version retrieved from NVD("version_start" or "version_end"),
> there is a vulnerability for which the judgment result is "Patched".(e.g. CVE-2020-15117)
> 
> If you can't compare versions, I think it should be judged as "Unpatched"
> Why does the CVE check tool judge "Patched"?
> 
> Examples of judgment results:
> 
> 　LAYER: meta-qti-base-prop
> 　PACKAGE NAME: synergy
> 　PACKAGE VERSION: git
> 　CVE: CVE-2020-15117
> 　CVE STATUS: Patched

And, status "Pached" should mean that a .patch file to fix the issue is
applied, or if CVE_CHECK_REPORT_PATCHED is set. If that is not the case,
then something is indeed wrong.

Cheers,

-Mikko
> 
> Examples of logs:
> 
> "WARNING: synergy: Failed to compare git < 1.12.0 for CVE-2020-15117"
> 
> log output location:
> 
> 　https://github.com/openembedded/openembedded-core/blob/master/meta/classes/cve-check.bbclass#L346
> 
> 
> 富士通(株) ISS事本
> Linuxソフトウェア事業部 アプライアンス技術部
> 松永 慎司 / Matsunaga Shinji
> e-mail：shin.matsunaga@fujitsu.com<mailto:shin.matsunaga@fujitsu.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174231): https://lists.openembedded.org/g/openembedded-core/message/174231
> Mute This Topic: https://lists.openembedded.org/mt/95403021/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


