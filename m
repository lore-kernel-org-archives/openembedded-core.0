Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.17692.1631463715345548034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 09:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iQINQU9q;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 18so6576764pfh.9
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ZNqFygHXmhpcPPHEP4E+Cn82/kapAIz/q6bNAEZTqIQ=;
        b=iQINQU9qdP24Qf7LB2tp9aY2066/tUB9jHXahspdKHMXoFKUF9ejEsJaNNUST7AIZA
         HpFTs4YUwG09UJ3EpMolkipsvteimiP2e/iEVoEr6rPfIAicIPBd0prwkNsLlOGdaybR
         XY1/A9klkzdyo/sOQ2dx4G//kNmfg+HuXq1frAehiD8+zIx8DiquVs2OrXMNZOd0IpEa
         JVgdT29HejuUvUpbpfwHrNcTp1GMWz/bzKEkO6MwSXUXumwXLtPjJefBa4ATUKAfTc8d
         JWaLsQXdgrWwgjSqAf690XbNcoUwgeD4FoHboPOFVEgdONiaXG4NnoNB00H5jMDjaZT9
         IQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZNqFygHXmhpcPPHEP4E+Cn82/kapAIz/q6bNAEZTqIQ=;
        b=ucSvyhZHoiWqWCXnft6LgMxVdbXwJZOaWJYiNuHxffeauFmXlGa8goRKJ+uWP2xxp+
         ZUyXD7og9Vi46QRKxi02ukkrsMtO/khzjHq9fPb54W0V3uQJW/iffEBOMYbxYHpKkCcU
         bEnZdPRgPqp2vxuLcAlS+wYFEg+FhOU+GeUrruurqTM0g/nAlZZMKkkkBrCUf8itnC0Q
         70n+T0E6alrDqKBezf8/2pQminyBzcGd9a4VugdVfWht2+wswCqZx+aUlpdh4RdnOkLT
         jQvn0QTwevTuhKf/N+CPHHgBEv0XHfWM9Ws1xT7oiFkNObxk2WbWtzWBGbU/dYpWbjGn
         HUig==
X-Gm-Message-State: AOAM531v9eSsTwKVJdZ0Wnl6ZMq0nf5nbRQsregtRWDnalo9hJEv6T1V
	Kph+PPbcXKZq1DM1fzAHC1Q=
X-Google-Smtp-Source: ABdhPJzR7qJA8oCjSTfcirznRZOMmZVuJpoKOp9lJ9h+yQlXqrh94EIJYe+m/SgJya4aSMj67VjZ3A==
X-Received: by 2002:a63:5914:: with SMTP id n20mr7211892pgb.164.1631463714736;
        Sun, 12 Sep 2021 09:21:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb? ([2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb])
        by smtp.gmail.com with ESMTPSA id u9sm5094737pgp.83.2021.09.12.09.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 09:21:54 -0700 (PDT)
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 12 Sep 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20210912140327.D9A0896032A@nuc.router0800d9.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <b73acf36-9790-77d9-a289-6c142e7bd523@gmail.com>
Date: Sun, 12 Sep 2021 09:21:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912140327.D9A0896032A@nuc.router0800d9.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/12/21 7:03 AM, Steve Sakoman wrote:
> Branch: master
>
> New this week: 8 CVEs
> CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
> CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
> CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
> CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
> CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
> CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
> CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
>
> Removed this week: 2 CVEs
> CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
>
> Full list:  Found 14 unpatched CVEs
> CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
> CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
> CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
> CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
> CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
> CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
> CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
> CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
> CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
> CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
Three above Tar are against node-tar

-armin
> CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
>
> 
>

