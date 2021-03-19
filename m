Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.3777.1616112610001625381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 17:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZfWqfW0a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id d191so4534813wmd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FuDtCuo4PU0ENe+g4XvtTExdJtwGU/GkmlRxVF5isSE=;
        b=ZfWqfW0aJ3XcgCBjOtmxZERtL0XfqIknnxzTIzmHPgHUXjl2ax9hqGYuGLkgvpeCqq
         5BEv1AUnjOfSI7k8ZZP/TXhTBiqobEfp+fTVqO9Rz1epb3y9OvehV2RN8WB5EvLV49/W
         +uhxmOUV/ZDZywgCS5pKulZgCoqifbBOR0YCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FuDtCuo4PU0ENe+g4XvtTExdJtwGU/GkmlRxVF5isSE=;
        b=uB9CR7NP3JALpkNUAamR4D5yYvUPL90w7kHc0oYvYVmFOHjRNoiBYMrkabAgGNIZSs
         HNyHueyLolLh97k6JoReCIIjYHB6zagAvDstvvMDrksHg1ppWpYytUadEEDjiqvHfXZi
         6CwnN8O+55XdDDBzAsnMZpDkKmijwdwe9Wd586Cgv6U44cheiijTttmyGf2wuo/MQ+Dv
         xaV/62IOWdxXtFSAgBSrCMt7Hd6kkoMTTP8Nm2l144uBmEmX4cTaNVE9eiNMJIIeJBOQ
         6P5KcyzoS6WAUrQ006Qz3J5KhuKfP4B72Pyj89Ku+mEY8MFZWF9VG07vgMH7CSusUHe4
         s0Ug==
X-Gm-Message-State: AOAM53238CKA90M6F1sKxNy9GBa+o8siImMDjd+ah7843r+Hz74nkYS0
	LRxe4p5xYkd2zdfkzD4bjpHU3w==
X-Google-Smtp-Source: ABdhPJz/POnNIATy6TBuX2oC1BTFTGoOoDXyxFpgctPReSGrfh+dpcvVRSFjTuNHhOcHlOSrVDaceA==
X-Received: by 2002:a05:600c:4fcb:: with SMTP id o11mr1270653wmq.117.1616112608513;
        Thu, 18 Mar 2021 17:10:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id x11sm4648412wme.9.2021.03.18.17.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 17:10:08 -0700 (PDT)
Message-ID: <0e6c640aef43ca95e19962068023b57cfc061479.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Mar 2021 00:10:07 +0000
In-Reply-To: <OSBPR01MB1845649EA478FC756B4890C1DC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
	 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
	 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
	 <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
	 <OSBPR01MB1845649EA478FC756B4890C1DC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-03-19 at 00:03 +0000, wangmy@fujitsu.com wrote:
> I intend to make the following changes to specify BSD, is it OK?
> 
> Before:
> BSD & ISC & MIT
> 
> After:
> BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & BSD & ISC & MIT

Yes, as a separate change to the version upgrade which needs
amending to explain the license change.

Cheers,

Richard

