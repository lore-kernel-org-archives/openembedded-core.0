Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web08.1554.1612553651815337381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 11:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 115JY1Rj021806
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 5 Feb 2021 13:34:07 -0600
Subject: Sudo CVE-2021-3156 -- was Re: [yocto-security] OE-core CVE metrics for master on Sun 31 Jan 2021 07:15:01 AM HST
To: Steve Sakoman <steve@sakoman.com>,
        openembedded-core@lists.openembedded.org,
        yocto-security@lists.yoctoproject.org
References: <20210131171832.20803962C18@nuc.router0800d9.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <c57a44ac-de75-9046-e652-791a4dc06738@kernel.crashing.org>
Date: Fri, 5 Feb 2021 13:34:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131171832.20803962C18@nuc.router0800d9.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I didn't see Sudo issue CVE-2021-3156 in any of the unpatched lists.

From a quick look, it appears to be that Master is patched (package is new
enough), but Gatesgarth and older are not.

So with the next set, we should check if it shows up in the unpatched set.

--Mark

On 1/31/21 11:18 AM, Steve Sakoman wrote:
> Branch: master
> 
> New this week:
> 
> Removed this week:
> 
> Full list:  Found 59 unpatched CVEs
