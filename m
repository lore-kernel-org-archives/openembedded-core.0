Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.27429.1628534262012053320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 11:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gK4YLciK;
 spf=pass (domain: linaro.org, ip: 209.85.160.172, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f172.google.com with SMTP id w10so13308831qtj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zPfAOaJkbs1ZrRJzUjynLb1b252jJupFT/z/xVgbW2o=;
        b=gK4YLciK7mNRqjc2968qN84syR8sH2WdxmzklbheTMN7pVgzhBxp36u8OchYE+iNXK
         2DKHjUMAgkv/1Ps3qkcA+z2uaES3Upt8XjuLUnyW2483JPkHEdRgx1bTjEXBIoc94541
         PFNRHXBpf1EUhlH49PcZ056q0InseKrV+fRXgvIJwSmZnrjln309yngZLrB2qB2a9woO
         V39l5qYFlrF4pOE0BUvEwuRttfx0WB/xcPrsRK+b3RLJThcnCM7T6Qg7VDZcTtJzXAQf
         UNb9Ah4EmN/d9ZReCjYDz+n4B3F3lb1AWqeAL/MZs0tu8NM8M5XZamx8nNgIdd5tjAIa
         Gddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zPfAOaJkbs1ZrRJzUjynLb1b252jJupFT/z/xVgbW2o=;
        b=eTR5PyXVesnUcK7cIgjutCnyeloU5nXbwf/Qb366dO2A6E7EgUtp11eG2iaX8mBSVK
         MVDFAchaB+Fz/wjulv663M7GrVVJeEpF8kwHQZla3x71PF+WnVQsvhahwS0+E+U/EkM6
         BmJteUo7VS9FdQH6n/cAlNg4GE1N4agZoRH6Cx+l7uf3++Eh4PLFYLhjFvpKGEVPIOp9
         sLqG/E18fn5a0xJa4Bc5e31svy/lVPoPjgZzogbYmpGxpc48E3tKC9QOdx2Leu7zRkFl
         VIuH8k/N2jD3Qo+X/SYNebNoh/o8CCzCDpWsQQUaNckz2FxKhCxFrGeM1yDhEMdHlVvK
         vT0w==
X-Gm-Message-State: AOAM5300K+bYdGW3juS/kjoThOEmK7YcmeyWTajUKjhh+eJmcgeqoUeB
	Sv2rLVE+27vGl2bQXMof62q43g==
X-Google-Smtp-Source: ABdhPJyPCn/KvTyJYXE+k2si46IcPsF37YUSC4Q6EkL2Chn4nDFxuyCy2kcMeWF9qHW9YFQhtYNJTg==
X-Received: by 2002:ac8:7515:: with SMTP id u21mr21440377qtq.80.1628534261180;
        Mon, 09 Aug 2021 11:37:41 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id a24sm7414084qtj.43.2021.08.09.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 11:37:40 -0700 (PDT)
Date: Mon, 9 Aug 2021 14:37:40 -0400
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Aug 2021 04:30:01 AM HST
Message-ID: <20210809183740.GA373236@maple.netwinder.org>
References: <20210808143359.6E9409602DA@nuc.router0800d9.com>
MIME-Version: 1.0
In-Reply-To: <20210808143359.6E9409602DA@nuc.router0800d9.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, Aug 08, 2021 at 04:33:59AM -1000, Steve Sakoman wrote:
>Branch: dunfell
>
>New this week: 3 CVEs
>CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
>CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
>CVE-2021-35942: glibc 
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *

It looks like the glibc one is already fixed in the dunfell branch:

commit e1e89ff7d75c3d22 ("glibc: update to lastest 2.31 release HEAD")

Includes the following fixes:

4f0a61f753 wordexp: handle overflow in positional parameter number (bug 
28011)

which fixes the CVE, although it isn't mention in the commit:

https://sourceware.org/git/?p=glibc.git;a=commit;h=4f0a61f75385c9a5879cbe7202042e88f692a3c8

So I think all that's needed is CVE_CHECK_WHITELIST += "CVE-2021-35942"
I can submit a patch for this if you wish...

Regards,
Ralph
