Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.16461.1621244022882454906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OClBRxy2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r12so5643765wrp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ak2flo7po8SC1uJhkKZTtPsMuIp7FmwNmb3Fns+uZj4=;
        b=OClBRxy20DvPCK39E5gkHIeRBZS5Nl2G5iBSxm9hh9FRg6QBmE+JHcstTPGSi9H5Wh
         fqCeXCTTv86za/UJaywsb9Rky/qgsV4WM/xdsKtTTJ/uFF/O4NgYYLPCBS7AnrgMhA0I
         dAnzIyuYkQDHzRHCft4HFVv1rZ7gwQXNCKNe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ak2flo7po8SC1uJhkKZTtPsMuIp7FmwNmb3Fns+uZj4=;
        b=rlSZalf2zEhSvZI0AQJAv2TxvJM20yEDPbJcG8Dt+D1Z4wySroxeYyeP98OuhELzdJ
         g1mMN/h9KvNaOlLzRv6T9f6C0imyDgQVFywpLhFSUzv1nM02dXQgT8+63ZxvPupR9mmj
         mW/LGL5RgMo64+u/iPy/xIQd1Vf/2jTZNMkrKa/jrQxdPR85OWkN+FKXgrRuD/DT3/Ra
         CnwjIdm4LWyBlOsnBvxBxnqRprBIwIyvvCKfVF5jxJGRJamF2clXeepZFSVzNA4gCqSW
         ZjA6cjja2Nsdi1vudSZXupdK66e/GRpPdIe7wVh7IqteEOG6507l4Pij1Gatac+pnYd8
         YEdA==
X-Gm-Message-State: AOAM53181+SjaV4f9SUownWBRRcW3saXCMdy9QsTt2A/8Mp1zwPvM345
	HsKA9KJIoOVsde8u082HQDuRWqJVsFgBjg==
X-Google-Smtp-Source: ABdhPJygpTKK/sx5iOhO6fvptWsUpXXQ8DHrgI63u5DIYcA9xn2O48JX0Jn07AWEU9q1RXtjniarjg==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr38509739wrs.394.1621244021345;
        Mon, 17 May 2021 02:33:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id x11sm16617073wrl.13.2021.05.17.02.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:33:41 -0700 (PDT)
Message-ID: <46cc4b2f35f37e9d6caf83745db1b46723d41d1b.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 16 May 2021 04:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 17 May 2021 10:33:40 +0100
In-Reply-To: <20210516140505.04552960384@nuc.router0800d9.com>
References: <20210516140505.04552960384@nuc.router0800d9.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

To update on where we're at with these:

On Sun, 2021-05-16 at 04:05 -1000, Steve Sakoman wrote:
> Full list:  Found 18 unpatched CVEs
> CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *

Plan to add to cve-extra-exclusions.inc

> CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *

Pending CPE update.

> CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *

Plan to add to cve-extra-exclusions.inc

> CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *

CPE update pending, may not help us in which case recipe whitelist, patch in -next.

> CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *

Plan to add to cve-extra-exclusions.inc

> CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *

Pending CPE update.

> CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *

Still being worked upstream, no fix.

> CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
> CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *

Plan to add both to cve-extra-exclusions.inc

> CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *

Needs investigation.

> CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *

Still being worked upstream, no fix (available patch is wrong).

> CVE-2021-20266: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20266 *
> CVE-2021-25214: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25214 *
> CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
> CVE-2021-25216: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25216 *

All need investigation.

> CVE-2021-25317: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25317 *

Needs investigation.

> CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *

Needs investigation.

> CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *

No upstream response yet, no fix.

Cheers,

Richard

