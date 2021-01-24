Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.28947.1611530452197379993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 15:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VSA5v3Yt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q7so10471039wre.13
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 15:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VY5lPtLIY3Qw+Q/mwG6t2UeHn3Q0p80o5ltOzt3tOr4=;
        b=VSA5v3YtSV+U3NSD5yFxbQOq4W0Q6wL+y2BzPvTNaf29f7zWzhFROB8grzH0AgcOWI
         t2WnmxanT/R2I9xgeKhDDUWjDJzd3YlJblcnmlfZBjRg2OiFGY0MwnqQh/pyjCQv4r5n
         FsPvtN+A+opYr8wkwwC7p4Eqk+5xwkWu0TWZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VY5lPtLIY3Qw+Q/mwG6t2UeHn3Q0p80o5ltOzt3tOr4=;
        b=YvrzoYldHwYv3DHy1kU/A27PDRoN5pavfNpjJAP48x/gL3hsEiqpQixpWHF0Pts3SE
         jag5/e54fqeeteaNjSjxZ8/oehd32VyctSQvAtR1PnZZXDJPfIbn2L2wc7fcD8czr6ai
         beQ+w+mbTEJlp/MO2prsluaH687+aDj/wQElzm03cyRj37co7iet5tGQn6DmWXKK+bnj
         VeKRi0PUuNa6ayVj+zwa1eairZyf4xqQJF+pySLY9s3a1ywNbKL9EdhN0FZSxUHZlNxm
         9LkzbyxLEmR2hg2FKYQkZllN6W7db8ikzvHJrgd8ezo+vOiTY94OyMcI23yqXvx701Hh
         X7yQ==
X-Gm-Message-State: AOAM531cvCVFoL2ywPN/SIzdJg9QfSQ1V+gjF9DZnFgOBa4H0C/d2JK1
	MEDDJ3XlKP6uh+0NWOiROYTSZw==
X-Google-Smtp-Source: ABdhPJzfy6WKZhUk5divwv4LGcQtMwMmy4Qh0bqn4KQUgCmkGT1xA4TxYMD5sSeJGWIzWBDBgd+lzQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id g9mr2743380wrx.230.1611530450561;
        Sun, 24 Jan 2021 15:20:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cbb3:266e:4b67:be20? ([2001:8b0:aba:5f3c:cbb3:266e:4b67:be20])
        by smtp.gmail.com with ESMTPSA id s19sm22987615wrf.72.2021.01.24.15.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 15:20:50 -0800 (PST)
Message-ID: <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>
Date: Sun, 24 Jan 2021 23:20:46 +0000
In-Reply-To: <20210124171809.D838F960256@nuc.router0800d9.com>
References: <20210124171809.D838F960256@nuc.router0800d9.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-01-24 at 07:18 -1000, Steve Sakoman wrote:
> Branch: master
> 
> New this week:
> CVE-2013-0800: pixman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
> CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
> CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
> CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
> CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
> CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
> CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
> CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
> CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
> CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *

Adding Chee Yang, did the recent cve-check change mean some version
comparisons regressed and exposed CVEs that shouldn't be in this list,
or were we making some we need to fix? Or did some other change expose
these?

Cheers,

Richard



