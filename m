Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.5349.1603751790686881328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 15:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H0wuF0r7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id h22so2993784wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Kp7l0654Ikr+jrkDKDXuHlXzaNAMBi5wxeh8ny6DRTM=;
        b=H0wuF0r7oZfbDCwPgbKkT+KNaQMQJtLAP5/2McTZGVu4O2/RHvkQC6cEnLZD74UWK4
         y+ZRmjcTcadigEjslbfYPrHQvfZBLcnopsb0Dp5CAGh6cjRiz5WlcSzMHAZsFsUPQWTQ
         ZvEyYUegFCvBL+KLyKXLjmhX+MoWmevBiJmXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Kp7l0654Ikr+jrkDKDXuHlXzaNAMBi5wxeh8ny6DRTM=;
        b=EkqoOs1SzIPs0NTVHw57PDCAHSF2l36w9XR/5otrKMVYCIQgUNX+5bGXHDUZ1aFKwh
         7IXr0aRFitUZRC7Ch4f1yEwI4UONrTSFaYULWPWiV6BQDmAUrHS9Y3aBEzZ6XjcQgaaW
         2d9m7NtTgosfnnI8Ruh7Oq7ReyIEwdQb5a1ksrx7r6DNDwPWPaNr0xkp46vci348SQMA
         95bFR+aU/Cjz6DAboMT9G/jt55n+IJkSdpqz3J3lRLux+MevRC1b1+KCxPJ8d0hO7jjw
         6iuAULwIUBicMpQSl/wg+z2A/fpIKMZORVc2z8TdFY/XiMNYmJv+OWxMVGtrpHF/LP5N
         Tt1w==
X-Gm-Message-State: AOAM531w7w05OSQcDSzIPwfVUnZLUJ+bw/Gjfjd68djT8Tlie8Q459Xn
	toc/YWZ6Z+shv7YqemnBZhEqVA==
X-Google-Smtp-Source: ABdhPJwjhxykCXXpys9jESjawToYPmXTqVH6ZNWswHoQ2bsi3s8Zpdug/FosOr3pf4Ej7LqV83r4fw==
X-Received: by 2002:a1c:e303:: with SMTP id a3mr13932203wmh.50.1603751789156;
        Mon, 26 Oct 2020 15:36:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id p21sm22377301wmc.28.2020.10.26.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 15:36:28 -0700 (PDT)
Message-ID: <6bc8b75acf70346af53db04dbb84284e4571ee8a.camel@linuxfoundation.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, 
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>, 
 "yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
 <apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
 <aaron.chun.yew.chan@intel.com>, "akuster808@gmail.com"
 <akuster808@gmail.com>,  "sjolley.yp.pm@gmail.com"
 <sjolley.yp.pm@gmail.com>, "Tummalapalli, Vineela"
 <vineela.tummalapalli@intel.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Date: Mon, 26 Oct 2020 22:36:26 +0000
In-Reply-To: <BYAPR11MB3624C502B36E80A6A1BBCB41E3190@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201020163538.0C38244D07F@centos7-ty-4.yocto.io>
	 <BYAPR11MB3624C502B36E80A6A1BBCB41E3190@BYAPR11MB3624.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 07:06 +0000, Jain, Sangeeta wrote:
> Hello all,
> 
> This is the full report for yocto-3.2.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No new defects are found.
> No high milestone defects.
> 
> glib-2.0 ptest failed (BUG id:14106)
>   
> Bugs verified:
> 
> BUG id:14050 - [QA 3.2 M3 RC1] failure in ptest : parted component
>    Verified Fixed.
> 
> Existing bugs observed in this release:
> 
> valgrind ptest failed (BUG id:14051)
>    Updated with 2 ptests passed and 3 new failures.
>   
> ======= Bugs ========
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14106
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14050
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14051

Thanks for this Sangeeta and team!

Since this is final 3.2 we're keen to ensure we sort out the issues we
can. There was a buildhistory issue that became apparent in the last
few days. Adding in the above two ptest issues and we probably can't
release rc1.

I've merged fixes for the buildhistory issue and both the glib-2.0 and
valgrind ptest issues along with some other small tweaks and have
triggered a build of rc2.

Cheers,

Richard



