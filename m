Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web10.1012.1590561639217462941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
IronPort-SDR: IktWFNyuzFv+haN4J+maik+wktAXxccVNEeJKMWRtXoNRDlUe6rddqbE8m1HoiV1rgZvKJwkjq
 GNHVGAs44kVU1LxP/+WgC30cWiWJJeDUbGfKKPjN2ksyO7QvVvypR11q9YOU1f+RzMmtBhalYe
 oRZHDrDeTKo+ZM332ZbQp/XX/d6jLCdJEkTD9EbI6hpGWD6VoZ3acB9NVFaT2agcHns/mlwjui
 QbX5CulHykQBNSBzBv7MnbaA34V/pUB1MfvlTF4ZanaD+PhYTrlSM+UbDtu/pqKuvSvpvuuI1m
 2v8=
X-IronPort-AV: E=Sophos;i="5.73,440,1583186400"; 
   d="scan'208";a="280426074"
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBhIG5ldyBiYmNsYXNzIHRoYXQgYWJzdHJhY3RzIHRoZSBnZW5lcmF0aW9uIG9mIEZJVCBibG9icyAocmV2OCk=?=
To: openembedded-core@lists.openembedded.org
References: <cover.1590559408.git.nandor.han@vaisala.com>
 <20200527063242.20801.78082@do>
From: "Nandor Han" <nandor.han@vaisala.com>
Message-ID: <d60d3491-d008-e5ff-caa1-d7dc78f8da7a@vaisala.com>
Date: Wed, 27 May 2020 09:40:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200527063242.20801.78082@do>
Return-Path: nandor.han@vaisala.com
X-OriginalArrivalTime: 27 May 2020 06:40:32.0211 (UTC) FILETIME=[B80EA230:01D633F1]
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-05-27 09:32, Patchwork wrote:
> == Series Details ==
> 
> Series: Add a new bbclass that abstracts the generation of FIT blobs (rev8)
> Revision: 8
> URL   : https://patchwork.openembedded.org/series/23431/
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
> * Issue             Errors in your Python code were encountered [test_pylint]
>    Suggested fix    Correct the lines introduced by your patch
>    Output           Please, fix the listed issues:
>                     meta/lib/oeqa/selftest/cases/fit_image.py does not exist
> 
> 

I don't know how to fix this issue. The file is part of the patchset:

   create mode 100644 meta/lib/oeqa/selftest/cases/fit_image.py

Any suggestions

> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
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

