Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 83D0271E10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 36E4A20AD6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:54:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id PPvpaa0Co617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:54:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E00620645
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:54:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 70F7816232A; Fri, 20 Jan 2017 01:54:45 -0500 (EST)
Date: Fri, 20 Jan 2017 01:54:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170120065445.GZ15833@denix.org>
References: <1484794373-111668-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20170119032342.23274.93140@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170119032342.23274.93140@do.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGJhc2ggNC4zLjMwIC0+IDQuNA==?=
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
X-List-Received-Date: Fri, 20 Jan 2017 06:54:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2017 at 03:23:42AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: bash 4.3.30 -> 4.4
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4836/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:

Wow, nice report from Patchwork!

May I suggest adding corresponding Wiki links to "Suggested fix" field? E.g.
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines


> * Patch            bash 4.3.30 -> 4.4
>  Issue             Shortlog does not follow expected format [test_shortlog_format] 
>   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
> 
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at a7cb408dd7)
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
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

