Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 567F7745ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 22:52:34 +0000 (UTC)
Received: from [10.17.91.149] (rrcs-70-63-152-218.midsouth.biz.rr.com
	[70.63.152.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6BA77206B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537570355;
	bh=2kVwuADA0hF5NgR1AeaPUSZQA778fDQI+QcWuKhiNPw=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=K8VpPhCdA9MDm4hgD3juMTjzRJq3Y2UsjousRx6lfmCVDUFJ+VCY9AQk71mqZ30Ub
	I+wm6UjhLKyzIFqjNqj4nTTRxcKSNpjwXy/kAP4uUNMHSBdvD7dU531GHkGu4iyxnc
	qGTI3ZsJUDlgFke+0CQ10VzFxFzS9lEvfzkZJz/U=
To: openembedded-core@lists.openembedded.org
References: <20180921221553.23399-1-okaya@kernel.org>
	<20180921223301.29310.35097@do.openembedded.org>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <4c603f5b-d4b3-0a1d-42a5-4ed594953788@kernel.org>
Date: Fri, 21 Sep 2018 18:52:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921223301.29310.35097@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjFdIGJ1c3lib3g6IENWRS0yMDE3LTE1ODc0Li4uIiBhbmQgMiBtb3Jl?=
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
X-List-Received-Date: Fri, 21 Sep 2018 22:52:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/21/2018 6:33 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: "[v1] busybox: CVE-2017-15874..." and 2 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/14184/
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
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at 957a2f95b8)
> 

These patches do not apply to the master branch because they were intended
for the sumo branch as a security fix. Is there a way to specify what
particular branch this patch is targeting?

Another reason is that package versions on master branch are newer.

> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>    Suggested fix    Sign off the added patch file (meta/recipes-multimedia/libpng/files/CVE-2018-13785.patch)
> 

the original patch doesn't have a signed-off. What's the policy?

> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>    Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
>    Standard format  Upstream-Status: <Valid status>
>    Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]
> 

I'm fairly new to this. I believe I have this tag. Do I have a mistake?

commit b3761a1a9b05c97028034a44be27400114ccf526
Author: Sinan Kaya <okaya@kernel.org>
Date:   Fri Sep 21 04:20:44 2018 +0000

     busybox: CVE-2017-15874

     * CVE-2017-15874
     busybox: Integer underflow in archival/libarchive/decompress_unlzma.c

     (cherry picked from 9ac42c500586fa5f10a1f6d22c3f797df11b1f6b)

     Affects busybox <= 1.27.2

     Upstream-Status: Backport [ 
https://git.busybox.net/busybox/commit/?id=9ac42c500586fa5f10a1f6d22c3f797df11b1f6b]
     CVE: CVE-2017-15874
     Ref: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2017-15874
     Signed-off-by: Sinan Kaya <okaya@kernel.org>

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
> 


