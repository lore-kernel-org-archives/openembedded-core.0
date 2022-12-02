Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2825C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:06:40 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.71616.1669975597103886269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 02:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Xm2hj1k0;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id l8so4844969ljh.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qfjjCDHs0gvyiOFyppsbPqqrF3K/wtibRdUPSu0k764=;
        b=Xm2hj1k0p+DXOjmgRfNPqaU7Shub0CurHdtrtlllsOh5OYxPdoXhYhjBRirxlhnUoN
         nIabzAqu6MWXwf2Y8EbHiWRhoQKZvrYRTo+ndp0bTuI2LkzESiL6j/MByldDV1tLiye8
         kQ6C/WHu5M6Vfd0p88o+8x1/vj4JjlYGmcG+u3kRfNC2osNDD/wsmsXU88zBNFxOYkf5
         LWjEtrlU3ojCFFio/Pn2xscVyCoeKzckzMgfdiZ2uJ7Yyo2Ks8o0OP4thsTP+v7V4i9B
         o4ml2UtExcyk6hbVQOo1/bcKHGfMg9lcaXyoQQNRjzUYxbKWr0bGSF0PnHsMJr5wNih/
         Wf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfjjCDHs0gvyiOFyppsbPqqrF3K/wtibRdUPSu0k764=;
        b=WBWzklzp17/3mW6cfn7TwXbKoCeIubNwiH9MtJBq/vs+1ziLg0pQdA/2ixHzrvK4MG
         450Du98atQgtLFCC4BnGuqehKUNlbnqSKWJLwE+pQ/lOMon1h0y7yXOgPVjaSMqBweQ1
         s3UIzEYDO1iqQBZgdoeHOY//hiJ5bYrUkzft6MGhbeH7TyLh5RrxZdj/rMHR/dUg51uQ
         zIFFrR6K+MX1OvlsYL92Ccz3tkwGd+zqjzOeh4P29iwWJE/ftMYgrGLLBBtkAQA+ckGX
         3QJ/FcF4oL0GpLtjhXnGEfq3HyLP/U+owYoyP9jt+VuXfRB4qohx7woQUU8iUVCQzbUY
         Vuaw==
X-Gm-Message-State: ANoB5plfUHQQhtJefhdpoGdknRe9/9jqGSI3dfN8vWz6kBeXiuKsklFS
	7aHTehmpUomU3j5VJ6zIRkUpfw==
X-Google-Smtp-Source: AA0mqf5Eho4Pjr2+Bllr/c/Hgm1n/XbPsvE0WCdwxhKSQpuOf8lA1MX347l0p4yxSO4DONLFk2Hf5g==
X-Received: by 2002:a2e:8888:0:b0:279:ca3e:69f5 with SMTP id k8-20020a2e8888000000b00279ca3e69f5mr3623183lji.391.1669975594909;
        Fri, 02 Dec 2022 02:06:34 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id u11-20020a2e9b0b000000b0027712379ec8sm580751lji.28.2022.12.02.02.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:06:34 -0800 (PST)
Date: Fri, 2 Dec 2022 12:06:32 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: "'openembedded-core@lists.openembedded.org'" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] About the judgment result of the CVE check tool
Message-ID: <Y4nOKM0flT4HTGsR@nuoska>
References: <TY2PR01MB328952DEF46146B2AF44F25292179@TY2PR01MB3289.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PR01MB328952DEF46146B2AF44F25292179@TY2PR01MB3289.jpnprd01.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 10:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174233

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

"git" is just as valid for a version number as "1.1.12". Both can
contain both numbers and letters. There are some rules how to compare
them to get "greater than", "equal" and "less than" results so I assume
that "git" is considered greater than "1.1.12".

For example Debian dpkg says that "git" is greater than "1.1.12":

$ dpkg --compare-versions "git" gt "1.0.2a"
dpkg: warning: version 'git' has bad syntax: version number does not start with digit
$ echo $?
0

So the tool does work correctly, though the version "git" is wrong and
recipe maintainer should fix this to be based on the upstream release
version numbers, and if not possible, set the upstream and CVE database
compatible version number via CVE_VERSION variable.

Setting PV to "git" is not wrong, but just bad, really bad practice
which breaks among other things yocto cve-check.bbclass.

Cheers,

-Mikko

> Examples of judgment results:
> 
> 　LAYER: meta-qti-base-prop
> 　PACKAGE NAME: synergy
> 　PACKAGE VERSION: git
> 　CVE: CVE-2020-15117
> 　CVE STATUS: Patched
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


