Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8826.1631786575824435429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 03:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GUWo2/lQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id b21-20020a1c8015000000b003049690d882so6931058wmd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uhyHirJrHTej4JHtkkLKw9tlxw1PxlVbkR8jkaRawHg=;
        b=GUWo2/lQOjd1YApQZDk32BNxgSCZBUSCRkBkpQSZH5ykzrOcKzpzz2QXEAc+PdMuRU
         pLvPEMcd3Nc2B+/6L7MbfOxpaHhyvyv6d7kE8NEGE6QNdag0KXckhjIqXkNKYyvgLq5V
         OQe73RChUJlyWNn0vBR+sliZXCdPlNVk45dY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uhyHirJrHTej4JHtkkLKw9tlxw1PxlVbkR8jkaRawHg=;
        b=4gpHE0rAMjWm96QpUGo7j5z/o1EUkAbh1olYUl9bbm6l6s9Lv+z49muz+t/v8Z7GUy
         1BP9fIE7Cv/yYoPkuyE6m59lNnH7uxr+QBsz94T5bz/hrSGAps+3HyPViAifxAQDVCXA
         VJWeUmZnP2jS92+1bO5jx4dLJffTz9NqHCBZqPTVwZsujdUAnghryWx2OpNf07m4H9Tn
         FOH/IMWUxABd2+8brYVZSIsJdWn2kbxg5F/ssVcjKOsD0uox3upW/PqPCOUcsv3bthtd
         A75Hhwt8zRaHpH5pbzCW2mVB8JufS+uBvuyDA7LzTZXsXP8GnAz5tF+UVm3N0y/w/RSR
         nEzw==
X-Gm-Message-State: AOAM531R67cYGNAqXR5f9hUOVPfAkx7dcZIrGOl/qKEIUzs2g/x/Lau5
	vafimdNbjM1RMy7PlUg3wMWwQg==
X-Google-Smtp-Source: ABdhPJxRRD41diXcwPM7gY5MQwdpqoVYHSRsMyavkNVWihn8KsK6QfPTV6nq0pX82Rfua5UvA3mQhA==
X-Received: by 2002:a05:600c:1d03:: with SMTP id l3mr2439586wms.104.1631786574092;
        Thu, 16 Sep 2021 03:02:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id g1sm2853737wrr.2.2021.09.16.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 03:02:53 -0700 (PDT)
Message-ID: <e65e65ec0f8ac96b9de9d516a95c6f2ccaab376c.camel@linuxfoundation.org>
Subject: Re: [OE-core] Undeterministic expat fetching failure
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Sep 2021 11:02:46 +0100
In-Reply-To: <AM9PR09MB4642FDD64C962E816FA78DB6A8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB464214DEFF6D34CE649495DAA8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <61f59e11f840eead9ccc3700648a5d7a5edaf79c.camel@linuxfoundation.org>
	 <AM9PR09MB4642FDD64C962E816FA78DB6A8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-16 at 12:00 +0200, Konrad Weihmann wrote:
> 
> On 16.09.21 11:53, Richard Purdie wrote:
> > On Thu, 2021-09-16 at 11:31 +0200, Konrad Weihmann wrote:
> > > Hi all,
> > > 
> > > ERROR: expat-2.2.10-r0 do_fetch: Fetcher failure: Fetch command export
> > > PSEUDO_DISABLED=1; export
> > > PATH="/opt/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/opt/build/sources/poky/scripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin/x86_64-scatest-linux:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot/usr/bin/crossscripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/bin:/opt/build/sources/poky/bitbake/bin:/opt/build/build/tmp/hosttools";
> > > export HOME="/github/home"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
> > > --no-check-certificate -P
> > > /opt/build/build/tmp/work/core2-64-scatest-linux/expat/downloads
> > > 'https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2'
> > > --progress=dot -v failed with exit code 8, output:
> > > --2021-09-16 09:13:26--
> > > https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2
> > > Resolving downloads.sourceforge.net (downloads.sourceforge.net)...
> > > 204.68.111.105
> > > Connecting to downloads.sourceforge.net
> > > (downloads.sourceforge.net)|204.68.111.105|:443... connected.
> > > HTTP request sent, awaiting response... 404 Not Found
> > > 2021-09-16 09:13:26 ERROR 404: Not Found.
> > > 
> > > that one happens like every 100th attempt - and this seems to be an
> > > issue of sourceforge. (I got a hunch that actually not all mirrors of SF
> > > do still have the yanked version 2.2.10).
> > 
> > I suspect you're right and this is something to do with some mirrors deleting
> > removed files and some not.
> > 
> > > Also the projects moved to github a while ago - are there any reasons
> > > why the recipe still pulls it from sourceforge?
> > > 
> > > If not I could spin up a patch to fetch form GH with git
> > 
> > Tarball releases are a lot more efficient for the system. Git based recipes make
> > the versioning less obvious and easier to break, are harder to mirror and thrown
> > more data around causing more build IO. There are therefore pros and cons to
> > tarballs vs. git urls.
> > 
> > Sourceforge does appear to continue to store tarball releases.
> 
> How about pulling the release tarball from github instead?
> https://github.com/libexpat/libexpat/releases/download/R_2_2_10/expat-2.2.10.tar.bz2 
> should be fine IINM
> 

As long as those aren't dynamically built and vary their checksum, that should
be ok. We may need to test/check the upstream version check urls/regex.

Cheers,

Richard


