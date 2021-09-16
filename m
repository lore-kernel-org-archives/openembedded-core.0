Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.8973.1631785992963187780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYyoXPh4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id y132so4359099wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 02:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Uv+IjrSW82nSjMzrTU9QrURg8NYgfSN4SRAi+rSan2w=;
        b=YYyoXPh4qjXCeWkyDdHkBkyhlhU8vHirpqtCwUwkUlZCVfY+eWT0i/695Pzx2SaAV3
         eTu23TSqItAmVZiTIJHpCwpYEjpIpPj9k9GAe3RPtL1qs+O6f1ywgCrgKITJk31iWIIH
         5233oDb3atqwjZGgn9QvWNvPssfdtM9XnKT5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Uv+IjrSW82nSjMzrTU9QrURg8NYgfSN4SRAi+rSan2w=;
        b=YLivO0I8/z3L4hbz+DrG3m+Wbw9raU1wusjyyKeNqMNJpdKirVRVHLQGaku7j2QoOd
         Y47iWzJ5KQI4V2JutQZgjMM+0IlvFrXaCCuktEZp9b/LqtdUPM6TdzJT/t+oNs97pZZu
         8MNAnJujYcapHDf4pKS0yQaslQB9QYIAS2UHGp6pLLrgCYBfnEQZmXXn8l/s0mRiufNe
         HESdIPyFd3xAsuWtf19LZpDqBaW04m8OtRtH8e9oBV6evjtDgumbLreoWv59RGIUaK0h
         CqC+N3Y1qS2ixHu+9OFpJy1/trn6tg3GQ3olv5a/Wqq3DTOCuf71l8nYuO0WgyY4BXjX
         y30g==
X-Gm-Message-State: AOAM5303R8DONiU00AV6UOExPimO41fvPBm9Mm8RJE8GeLclTggyv4WL
	I+V+geZ57TTTRAw/sxEiqwnG+Q==
X-Google-Smtp-Source: ABdhPJyZmaDOvfchGBaGVDMfpwvUv+B0OOrp6quDRJXjJWegn/xcMXBBIdVCwF81hNaZMj/QrXvQXw==
X-Received: by 2002:a05:600c:1c93:: with SMTP id k19mr8922164wms.80.1631785991304;
        Thu, 16 Sep 2021 02:53:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id o26sm6857052wmc.17.2021.09.16.02.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:53:11 -0700 (PDT)
Message-ID: <61f59e11f840eead9ccc3700648a5d7a5edaf79c.camel@linuxfoundation.org>
Subject: Re: [OE-core] Undeterministic expat fetching failure
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Sep 2021 10:53:10 +0100
In-Reply-To: <AM9PR09MB464214DEFF6D34CE649495DAA8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB464214DEFF6D34CE649495DAA8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-16 at 11:31 +0200, Konrad Weihmann wrote:
> Hi all,
> 
> ERROR: expat-2.2.10-r0 do_fetch: Fetcher failure: Fetch command export 
> PSEUDO_DISABLED=1; export 
> PATH="/opt/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/opt/build/sources/poky/scripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin/x86_64-scatest-linux:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot/usr/bin/crossscripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/bin:/opt/build/sources/poky/bitbake/bin:/opt/build/build/tmp/hosttools"; 
> export HOME="/github/home"; /usr/bin/env wget -t 2 -T 30 --passive-ftp 
> --no-check-certificate -P 
> /opt/build/build/tmp/work/core2-64-scatest-linux/expat/downloads 
> 'https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2' 
> --progress=dot -v failed with exit code 8, output:
> --2021-09-16 09:13:26-- 
> https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2
> Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 
> 204.68.111.105
> Connecting to downloads.sourceforge.net 
> (downloads.sourceforge.net)|204.68.111.105|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2021-09-16 09:13:26 ERROR 404: Not Found.
> 
> that one happens like every 100th attempt - and this seems to be an 
> issue of sourceforge. (I got a hunch that actually not all mirrors of SF 
> do still have the yanked version 2.2.10).

I suspect you're right and this is something to do with some mirrors deleting
removed files and some not.

> Also the projects moved to github a while ago - are there any reasons 
> why the recipe still pulls it from sourceforge?
> 
> If not I could spin up a patch to fetch form GH with git

Tarball releases are a lot more efficient for the system. Git based recipes make
the versioning less obvious and easier to break, are harder to mirror and thrown
more data around causing more build IO. There are therefore pros and cons to
tarballs vs. git urls.

Sourceforge does appear to continue to store tarball releases.

Cheers,

Richard



