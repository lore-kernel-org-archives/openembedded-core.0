Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.4719.1598318240987951794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 18:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07P1H3og011907
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 20:17:19 -0500
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFsbG93IFBSIFNlcnZpY2UgYW5kIGhhc2ggZXF1aXYgdG9nZXRoZXI=?=
To: openembedded-core@lists.openembedded.org
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
 <20200824233257.2264.50687@do>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <98703e89-ea80-6b38-3500-99d5d1f8cc48@kernel.crashing.org>
Date: Mon, 24 Aug 2020 20:17:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824233257.2264.50687@do>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/24/20 6:32 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Allow PR Service and hash equiv together
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/25758/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Patch            [master,2/5] hash equivalency and pr service
>  Issue             Shortlog does not follow expected format [test_shortlog_format] 
>   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

In this case, I think what I did was acceptable.  If reviewers disagree I'll
change the format.

> * Issue             Errors in your Python code were encountered [test_pylint] 
>   Suggested fix    Correct the lines introduced by your patch
>   Output           Please, fix the listed issues:
>                    meta/lib/oe/packagedata.py does not exist

Now this one is _confusing_, it absolutely exists:

https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/packagedata.py

Is the link engine broken?

> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.

DONE!

--Mark

> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
