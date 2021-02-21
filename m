Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.18309.1613900482569976919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 01:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QkXkyQ/j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id a207so11673789wmd.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YMhixrSGORMR3dCm7yKhScyYcQiHGi1YkpR2HRVcQ2E=;
        b=QkXkyQ/jhqrt2Kc8jc4Z8mhnnp5kllVPyZA0kQUjVg+CkxJQQ4I38TEFVfsn44duLK
         qHT/KHWlVT+uza9Psza7pUxOEG9zF0k6qJtbUfxB+/43vzEiYcfEyLUa8WoBLRUlNJmM
         qmCJrJWjR970RkAcYLK+k7XUsR1uAPrTtrcr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YMhixrSGORMR3dCm7yKhScyYcQiHGi1YkpR2HRVcQ2E=;
        b=XKE3VmWyufHCTsY8SyZjkK/1QIPYpoP2BUeWOIAjVEAKODJWEK1xvVtnjre+5elUSS
         rYVlfh1xsXW0RkR47/mvWgY2CXXmX1bvFHEvbl4gVb1J5v+oVWfS5z8Bzg/L3nrHjML/
         dVNpdf8rIuFs3PROCBuw3Oq+pzVLCexMHA8EfEaaJLEX7IXUI0lUNkraItA3Od80Mewl
         degnCmeB/g/Px7O2H1r7MBETvsWRk/VPyBASi1dbAgzZFcS1o2Y9RyBcTwgm+EJnbFwY
         Iewoo7601RBGz0tAzPIk2Mz3DAV1Q/hyiJBTAEU8e8MRm1FdSv8iXRJ426j/VxLuXUaY
         adPA==
X-Gm-Message-State: AOAM531s2yjnhec3xIma3iVy7+1sEvYZR94AJAACqRSP4ntl7PeNd6Pe
	pHA6KESElgeljo/N97SFy31S5g==
X-Google-Smtp-Source: ABdhPJy1bhF6drfg9cBtXGaYlIljSRUtvqwA+4YbKkKn9vCcC79kImDKRzYip7ZRluL5T0x5O+3TPg==
X-Received: by 2002:a1c:7705:: with SMTP id t5mr8908600wmi.148.1613900480820;
        Sun, 21 Feb 2021 01:41:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:eeb2:36b3:1702:48df? ([2001:8b0:aba:5f3c:eeb2:36b3:1702:48df])
        by smtp.gmail.com with ESMTPSA id c6sm23011626wrt.26.2021.02.21.01.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 01:41:20 -0800 (PST)
Message-ID: <fa0bcadbb9013c437284cc4fce7cc8bd2eeee3da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libcap-ng:upgrade 0.7.10 -> 0.7.11
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Feb 2021 09:41:16 +0000
In-Reply-To: <CAMKF1srf5c-2OLrn16Q5miRqkAK0Brc0QGmRuWpWQkL8Z0DA=Q@mail.gmail.com>
References: <1598534184-115749-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
	 <1598534184-115749-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
	 <CAMKF1soedwQWkahytDeorwa1w4CnAcP-PwKAMf_2K5Wi83+kbA@mail.gmail.com>
	 <CAMKF1srf5c-2OLrn16Q5miRqkAK0Brc0QGmRuWpWQkL8Z0DA=Q@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-21 at 00:00 -0800, Khem Raj wrote:
> I think this is wrong thread, I replied to

Right, I have a libcap-ng-python patch in master which is causing 
issues. I won't merge that patch.

Cheers,

Richard

