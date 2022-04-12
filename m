Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0360CC48BE8
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.9260.1649760777670632092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SyHySPtO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id i20so14010985wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BUDmz8O3lSkCvx12OhIT0IRsgPu3Auy1t2jZ80Gn17g=;
        b=SyHySPtOE3u0zKahmEZrzDkSoDT0SqvjBjJI9RQtJY2PB6BhOUPhegkTJBBNnWM6BH
         oYdm4r8po7mJaigZJk0wz9kzMku5K12oVN7dWWJyLzRrRrj7Yes5nLJoB7neFBoEKL0d
         pz5Qy3MkX+3wfAOWoqW/nZwVPtC18eLTcXCjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BUDmz8O3lSkCvx12OhIT0IRsgPu3Auy1t2jZ80Gn17g=;
        b=ptUFTH5+k/cWJjyOueva9+uvkK/q7YzwENkMP4v9MITCjoOFuwM06IxGes8tJruww6
         5+tDmK0IznLQgpFzN2BZNY0deX2/fHA/dHdtG3LP5xOC39Lyt6bKrwNIZdcHcsizLxDe
         Rs+baDZOM7+3UAq2IsshIwnn2FuHpTtDQ9GnYgcCBB8vC4WNfaWgowTpxyGnvgJBtEGb
         ITXuBSL2sUIq2Cir61frXySI0cPapOeCxk0TuhcDPcT9dWYtT1leA6+5LxcqNjxCJF44
         ak09fUjJyqze08Wm+YIryGXeSEQenjve9q3iri77jD4FFI+zvSrDpWJXF+i2VigM2MRM
         Sjhw==
X-Gm-Message-State: AOAM533V+Of9GlvBeAGexhDRk85BGNt7GeW1wQxQSaFyxPNEoXMeXys3
	IncMQceEtfnSNVx0lwK8CtdA1Q==
X-Google-Smtp-Source: 
 ABdhPJznicrz3ynMORrMxni3EZEtfqUdJ2XTo8DjdPKK06WKWR/Rlq8hP0jaAtxRBoCCugRr8FcQVw==
X-Received: by 2002:adf:d1e3:0:b0:204:7e76:8a70 with SMTP id
 g3-20020adfd1e3000000b002047e768a70mr29511494wrd.580.1649760776007;
        Tue, 12 Apr 2022 03:52:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b168:4a11:27d6:cd01?
 ([2001:8b0:aba:5f3c:b168:4a11:27d6:cd01])
        by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm2096323wmz.43.2022.04.12.03.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:52:55 -0700 (PDT)
Message-ID: 
 <e6b5684ec20a4c5c0cca18a5c443c28dfe15c69d.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 10 Apr
 2022 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Date: Tue, 12 Apr 2022 11:52:54 +0100
In-Reply-To: <20220410120234.AE7F69627FC@nuc.router0800d9.com>
References: <20220410120234.AE7F69627FC@nuc.router0800d9.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164263

I thought I'd update on a quick check through the status of the CVEs this is
reporting for master/kirkstone.

On Sun, 2022-04-10 at 02:02 -1000, Steve Sakoman wrote:
> Branch: master
> 
> Full list:  Found 12 unpatched CVEs
> CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *

Steve is questioning the version restrictions on this, we don't think it applies
to us.

> CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *

No movement upstream, not a priority for qemu maintainers.

> CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *

No movement upstream, not a priority for qemu maintainers.

> CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *

I believe this is fixed in lua 5.4.4, have requested a version restriction on
the CVE.

> CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *

RH bugs are restricted, no public patches to fix, not much we can do.

> CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *

Have sent a patch for this.

> CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *

Already fixed by patches we apply, have sent an update for our metadata.

> CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

This issue isn't particularly relevant to us, sent an ignore for it.

> CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *

Have merged an upgrade for this containing the fix.

> CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

No patches for 1.17.X and upgrading to 1.18 not an option for kirkstone.

Cheers,

Richard




