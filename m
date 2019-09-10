Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7604C7F334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:23:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8ALNJAZ025214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:23:50 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 14:23:39 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190910204445.21958-1-Randy.MacLeod@windriver.com>
	<20190910210149.2334.78895@do>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <33a08ee5-31aa-3c9d-51b6-7effc3a66500@windriver.com>
Date: Tue, 10 Sep 2019 17:23:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910210149.2334.78895@do>
X-Originating-IP: [172.25.44.5]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJ2YWxncmluZDogZW5hYmxlIH41MDAgbW9yZSBwdGUuLi4iIGFuZCAzIG1vcmU=?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2019 21:23:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/10/19 5:01 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: "valgrind: enable ~500 more pte..." and 3 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/19821/
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
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>    Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch

Ah right, I had the status info but not the prefix.
Fixed locally and I'll send a v2 in a bit.

../Randy

>    Standard format  Upstream-Status: <Valid status>
>    Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]
> 
> 
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


-- 
# Randy MacLeod
# Wind River Linux

