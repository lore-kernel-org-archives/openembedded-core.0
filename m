Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.10763.1598443413289196248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 05:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QC3TgA018549
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 26 Aug 2020 07:03:30 -0500
Subject: Re: [OE-core] [master][PATCH v2 4/6] package.bbclass: Move package_get_auto_pr to packagedata.bbclass
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
 <20200826112733.52492-5-mark.hatle@kernel.crashing.org>
 <636477d3d55d52f18448d041669d2d6c590572aa.camel@linuxfoundation.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <c1495e62-46e9-b530-6f9c-d8c550341974@kernel.crashing.org>
Date: Wed, 26 Aug 2020 07:03:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <636477d3d55d52f18448d041669d2d6c590572aa.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/26/20 6:44 AM, Richard Purdie wrote:
> On Wed, 2020-08-26 at 06:27 -0500, Mark Hatle wrote:
>> Running package_get_auto_pr during do_package is 'too early' when we
>> need to evaluate the do_package output to get it's unihash to look up
>> the right value in the PR database.
>>
>> Move this function packagedata.bbclass (no changes yet), as 
> 
> The "no changes yet" isn't true as the new function is using
> BB_TASKDEPDATA?

Sorry, that's a merge error on my part.  I'll get that fixed.  That move to
taskdepdata was supposed to be in the final patch.

--Mark

> Cheers,
> 
> Richard
> 
