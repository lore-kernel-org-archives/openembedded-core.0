Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454BDCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 17:19:06 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.836.1758907144312502012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 10:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bf/yewcJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so4433182a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758907143; x=1759511943; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA42XuDwh2XYKusvMv7P2YKuhm7bt2dmTWeltn2xqZI=;
        b=bf/yewcJBL4G2wlpLhvOgE5BZf8ql+d/SBgwX/kAvveq9CQcoc3qDzRoN4qtckaGDW
         ebbAYqAqIzZ02DvNbvz7H2MqaZ83iE91q8L7Lx13AD6SzQAVPJPq3VaI2EGleORlU93D
         /ux5O2xQhvznFN6QzutY+IK38TKL0ZzJBhP1mc8Y/itW68rVZny8qOImWPA2mYVM5ZJI
         AdyoBrU9UefafO730774+Jq0zGHA16KY8wUrvx0KCnpbG066e7pGAp6Pmf/PKbqOHufL
         Rob1Q6H/by4Gehj8tCSM7AVIV1yjrt/in0YknEla9p/9wd5uwAgyoAbjJ8O3Xio5iSJO
         WkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758907143; x=1759511943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA42XuDwh2XYKusvMv7P2YKuhm7bt2dmTWeltn2xqZI=;
        b=DZm9IABv1xDHcXb4hs7RnBT2tphRQEvHvzOy9vQAEDQ12BO+5YEtXUJwgpkvGx5EYx
         Kt7KwY40aUkXbxwdmUMvWifYNZjB6cl/hxdAQaSqNc9EsNBiOgayFrQ8TeEMiGLunl5+
         PWZecxhK2DmiGCUt5oq4Yfs5bZqiojkvSn4gE+wNcMF9zx13AYE7RvClf2rCsqEymITX
         5xv3hZYg+GhQHw6mZo0FC0N6Dcgu3/7IGaUrUtfAQT2olWirf1KsC8GPyhaDYGtA9/Mi
         snSAlExJgAmZqzo+LIoCtbW34vE4UmHxu2luUvMMhrHboGnfJxLrnR1crp8JTla27K9/
         KEpw==
X-Forwarded-Encrypted: i=1; AJvYcCX+61P1D2OWSke3XGh265eCQTEvgC8f0huQE4E5Y3+lqAIHkNXEidctwMnhHcICwJQJhaw3tpn1ZLEpMZWLE+SzWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjxqOZuutKmQDoQSkNYmJGTo5HrHgbUKCY0q/zxzO7Oxe9XISD
	f4E/HOmkpeM22BcNE7sAXl+FDKFdsyDmkIqFGTydgRcqrQU3giP3aPNRw98Lpg==
X-Gm-Gg: ASbGncusWZTOsp9Y86l3nJzTzpHGS28MdBDJ2bTDg2EotIvVsr9zWQulid9cckLnqtL
	JoC5kXK8AhRcjSdMDyALQqwjgyGIpOhNXABgs79Fxyuf1ZKqmqkbWHoOjjSwTRNbJpfxrO3z7Pi
	esJxrPeQYDXzfPD4KEXaiIhhuO1RbtjtHwqFcjp96F1kicmj54npnYHatWzAVIDkiTMmPEYjhDl
	pbBO3s0lIK8061aaut34zHDJ+99cj+p2M+B3dfcixQP3BlcHd4RNnssc2wSX1WC3fENkmQ+kb/X
	Og14/BHMAdZAZvUTsBu+xKD+WygeWFDeJt6usrRz3gx+IYQZ0GMqCq61w4eXz7nGn/oYrr2kU/O
	//uZ49ndE+7+A1UN8BMw72wCVLvszQ6Q=
X-Google-Smtp-Source: AGHT+IFy4cnC8aIjC0C07PQtUNRi4UDi7LTrmQvDwi+VGANtf/PRyD3ROKVHiClPjhc6r2MLsB08YA==
X-Received: by 2002:a05:6402:14d2:b0:632:d9b:271e with SMTP id 4fb4d7f45d1cf-6349fa7f9e3mr5983184a12.22.1758907142178;
        Fri, 26 Sep 2025 10:19:02 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634c1ca9ac9sm860157a12.38.2025.09.26.10.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 10:19:01 -0700 (PDT)
Message-ID: <04553a26-5d53-406f-b230-c3474d969322@gmail.com>
Date: Fri, 26 Sep 2025 19:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap 09/11] glibc: fix CVE-2025-8058
To: Jinfeng.Wang.CN@windriver.com, openembedded-core@lists.openembedded.org
References: <c2b63f171719e2b1c12ba049cbe776adf9e0244b.1753910853.git.steve@sakoman.com>
 <21409.1758873962886905830@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <21409.1758873962886905830@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 17:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224089

On 9/26/25 10:06, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> Hi all,
>  
> With this patch, after I add INHERIT += "buildhistory" in
> conf/local.conf, I found the following build errors:
>   ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package
> version for package ldconfig went backwards which would break package
> feeds (from 0:2.39+git0+cff1042cce-r0.wr2408.0 to  
> 0:2.39+git0+b027d5b145-r0.wr2413.0) [version-going-backwards]
>   ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package
> version for package ldd went backwards which would break package feeds
> (from 0:2.39+git0+cff1042cce-r0.wr2408.0 to
> 0:2.39+git0+b027d5b145-r0.wr2413.0) [version-going-backwards]
>   ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package
> version for package ldso went backwards which would break package
> feeds (from 0:2.39+git0+cff1042cce-r0.wr2408.0 to 
> I found in the buildhistory.bbclass, bb.utils.vercmp((pkge, pkgv,
> pkgr), (last_pkge, last_pkgv, last_pkgr)) will compare the version,
> the hash is part of the version.
> The commit(d9b992de0da6be8e9bc26c39c4e5aa7bb9c2049e) in oe-core glibc,
> upgrade from cff1042cce to b027d5b145. c < b, so it is thought as
> version-going-backwards. How to deal with this situation?

I think this is more like a general behavior with all packages using the
+git PV postfix. I suspect using buildhistory has an implied requirement
of using pr service too? That supposed set an increasing number in the
"git0" part (instead of the static 0), which should ensure that it's a
monotonic sequence.


