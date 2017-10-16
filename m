Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E60C271D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 18:39:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9GIdkkR019338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 11:39:47 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 11:39:45 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20171016150045.25323-1-Randy.MacLeod@windriver.com>
	<20171016160029.2787.48040@do.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4d40ce95-4159-5197-ebca-af1f30f25a6f@windriver.com>
Date: Mon, 16 Oct 2017 14:39:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171016160029.2787.48040@do.openembedded.org>
X-Originating-IP: [172.25.44.7]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJSRUFETUUucWVtdTogcWVtdXBwYzY0IGlzIG5vdCAuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Mon, 16 Oct 2017 18:39:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-10-16 12:00 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: "README.qemu: qemuppc64 is not ..." and 1 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9358/
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
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
>    Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
> 

I have:
    Upstream-status: Inappropriate [build rules rewrite in progress]

patchtest rules should be case insensitive most of the time and
particularly for the first character of words in a labels so
  [Uu]pstream-[Ss]tatus: is okay but not uPsTrEaM-sTaTuS:

Also is there a list server for privately reviewing a patch by email?
I looked at setting up patchtest locally but got distracted when the
setup seemed to take more than a few minutes. Maybe I just need
to focus for longer...


../Randy

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
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

