Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.7087.1610019277250136752
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 03:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=faBxlc/V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id r4so5222504wmh.5
        for <Openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=04Y1NOOAorxXR44JFAjoMzuToS0vD7e4zVpabqcTis8=;
        b=faBxlc/VtqWZp4d0/GhbOSMeE1Cj1r7lB6mXTEmcAXfUTmpZ4ehxqpme2LPK/9MuMA
         VbKBbE4a8ngEcvrErhvbWBJEXq1+GT8XytEyisPvPtFE1lhu+YVbYmUuHOxqcJvRSn1B
         xafn73rry4K801oznW90LUoaVkH6CoeepYYJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=04Y1NOOAorxXR44JFAjoMzuToS0vD7e4zVpabqcTis8=;
        b=YudKjdaWmwv8X4dTT00B5Nl+uW1EOMhBJfzXNIV+XxBW21lhWoHoRgpNxnED1SOA1v
         /plTSvvWrTQaLUDnfxqLgfh1gXmr+esYa6jRCOxTqezh5MPRQi78pwwCtd/nuoB4aHJa
         WP1q2lZ3T/aQTZnZj7cgACMVTHSATOIw0naqvQBNCF5ynIDx+5+Ya+rMwe4t/m2kwqZh
         Fuz5tjhRwSAAveErR+tWNT14Ndx8PRvi3XQ8PzPkcZN3rVUISKD6GDpfb2vXIFaX6UDQ
         8SGL3KA7HOyu6o3GyAWMHftR/DdBUOtPS+I0PKl2k9toJRrEgXViWZhrEc5VLQCEBUqG
         et+g==
X-Gm-Message-State: AOAM531N5SFdVf05aEm+AcqOgR39rXH3E1j464n0TNCWiG6q6GXgdie7
	qz9EAu7HnPmvssFXIx5igjbOVw==
X-Google-Smtp-Source: ABdhPJxxAIEFYJFSgps91x9i/CsL7VyevrOnJ5FtQzsgOVc/Md4qt+HIjQD+r6K3NV8f4RRbsuVzoQ==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr7649935wmi.113.1610019275918;
        Thu, 07 Jan 2021 03:34:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id m14sm7673406wrh.94.2021.01.07.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 03:34:35 -0800 (PST)
Message-ID: <39c99b8315d520565f0f8ab99af8b8b037c3910b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][sumo][PATCH 4/4] libsndfile1: fix CVE-2019-3832
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Sana Kazi
	 <Sana.Kazi@kpit.com>
Cc: Openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
 nisha.parrakat@kpit.com, Aditya.Tayade@kpit.com,
 Harpritkaur.Bhandari@kpit.com
Date: Thu, 07 Jan 2021 11:34:34 +0000
In-Reply-To: <20210107102124.whs2taob6gt3losh@qschulz>
References: <20210107101101.31004-1-sanak@kpit.com>
	 <20210107102124.whs2taob6gt3losh@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-07 at 11:21 +0100, Quentin Schulz wrote:
> Hi Sana,
> 
> Unless I'm mistaken, sumo is EOL and not supported anymore.
> 
> The latest version that is still maintained by the community is zeus
> (3.0). The latest version officially maintained is dunfell (3.1),
> meaning this one will still receive dot releases, not the community one
> though commits can be pushed to the "community-maintained" branch.
> 
> Please stop sending patches for sumo. Maintain it on your own, ask to
> become a community maintainer or upgrade to current/maintained versions.

I think if someone wanted to step up and collect sumo patches, we'd be
ok with that. There is nobody who's doing that at present though.

We did go through some effort to get sumo building again on the
infrastructure too but again, nobody stepped forward to look after it
and I suspect it would be broken again now. To be clear, we cannot
merge patches without testing and we need builds on the infrastructure
to do that which is why it was important.

It would be good to understand why the patches are being posted.

Cheers,

Richard

