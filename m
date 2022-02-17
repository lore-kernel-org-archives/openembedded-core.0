Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4ABC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 09:54:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5694.1645091666673917688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 01:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OcklYoaN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u2so6842139wrw.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/fb7F74RrYHl0guSorSbRWlKFc3QzCe+gGaibltpP7w=;
        b=OcklYoaNFvTLBRtDr/ol4eAjKF+Gjqwz8gvIO3NDmPOMQzUQnMhv4fQhwk1Ev5aNVG
         u8y/XFCfi1pydzrWciftD81BZl6FB/oNiBfea4EfjX2ysXtADps1AoXlQlOMETN98Q8C
         oywlrDhb7H3oPpd3ksU0rWVISNEGG9WW1GEQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/fb7F74RrYHl0guSorSbRWlKFc3QzCe+gGaibltpP7w=;
        b=f6CJdC8CfpgEI2lA07an2j7UPjzFrPh4plc85ZsSF5pPv+TtsbGuAXyjmRFavo7aoP
         38lpMMCOlN9CpKSzrql6x4HOiYpfl+1yTzAkRosGOIXN4QDvr2YVZB9v8Yf9A/exP6Pn
         3WsbaFd+FguWtmz4PrVs4VlTbbnTYNTHRm3OpvpP2zJ9yCcah7MOBRCKNJOKYEOyuVPX
         ombmBzsrQ09YVWlhjdUSKMRqchPdQZZWvnB6h05r3Mpxc/j2z7Ig9RG0MElwSRTmY4Ku
         DAtsXPGp7guw5a7u0Cq6f7jQFsvJ8EK2YqU4Yfwo+1MDSgnYv9u6Ojr1PsyL95hPuT/H
         vzyQ==
X-Gm-Message-State: AOAM532wJYv5G6qGflhMz1gixyYZcp8E7HUOWyqxPFv3yPIROe74aDHp
	IIITM+oaTLS+dsSIm1rYvCR+yYa+RuMOSX72
X-Google-Smtp-Source: 
 ABdhPJxUxh1i8kBPX5hBGnmmX6owE0Hvl+RjU+Hrv9UsSl6MrvcoxsmjhpiKKJT9uIWp7LnwzAZUhQ==
X-Received: by 2002:adf:ce8e:0:b0:1e4:bb8b:d3e7 with SMTP id
 r14-20020adfce8e000000b001e4bb8bd3e7mr1696729wrn.53.1645091665128;
        Thu, 17 Feb 2022 01:54:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2892:510b:1ca1:ad61?
 ([2001:8b0:aba:5f3c:2892:510b:1ca1:ad61])
        by smtp.gmail.com with ESMTPSA id l6sm858826wms.24.2022.02.17.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 01:54:24 -0800 (PST)
Message-ID: 
 <51fc36f9df42fa914934406d6d422e64acf709a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Feb 2022 09:54:23 +0000
In-Reply-To: <20220217003248.581903-1-saul.wold@windriver.com>
References: <20220217003248.581903-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 09:54:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161795

On Wed, 2022-02-16 at 16:32 -0800, Saul Wold wrote:
> +def processfile(fn):
> +
> +    print(f"processing file '{fn}'")

The fact that someone took the original conversion scripts, dropped the
copyright header and then added f strings to it, which the project doesn't yet
officially support and are an issue of contention, *really* could annoy me.

Cheers,

Richard






