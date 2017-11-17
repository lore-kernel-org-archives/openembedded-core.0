Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 875AC78862
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 23:50:04 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 6D60A5C00E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 00:44:41 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 18 Nov 2017 00:45:40 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20171117225320.2784.57738@do.openembedded.org>
References: <20171117175142.2642-1-stefan@agner.ch>
	<20171117225320.2784.57738@do.openembedded.org>
Message-ID: <07e9238986ee6a3ef330b5962f336013@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510962281; bh=LoMO7jLE4i7E9ZFAOYvmp3ZScbJZpCUZg3tDBCoCkkQ=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Subject:In-Reply-To:References:Message-ID;
	b=kycrUEKZzIVP98Sns59dTphsA8tm8kKR+YABzuszMiGJPyR+XHbPWwoGHNdTx7+IsQ7OZXOQHPmUYTdlfFqKXhjsJMf6C9Z+LcUmB/TyTKy52qZb/n5CFRYM3g+8NBvPTBnDi+AHXsdRG1MPMn5JA/v41oqbccyMUYiFPMFJQUU=
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbcm9ja29dIG9wZW5zc2wxMDogVXBncmFkZSAxLjAuLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Fri, 17 Nov 2017 23:50:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-17 23:53, Patchwork wrote:
> == Series Details ==
> 
> Series: "[rocko] openssl10: Upgrade 1.0..." and 3 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9855/
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
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at a17f3ec910)
> 
> * Patch            [rocko,1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
>  Issue             Missing or incorrectly formatted CVE tag in
> included patch file [test_cve_tag_format]
>   Suggested fix    Correct or include the CVE tag on cve patch with
> format: "CVE: CVE-YYYY-XXXX"
> 
> * Issue             A patch file has been added, but does not have a
> Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file
> (meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch)

The patch is a backport from upstream and does not have a Signed-off
line there.. Should I still add one?

Ack on the other two.

--
Stefan

> 
> * Issue             Added patch file is missing Upstream-Status in the
> header [test_upstream_status_presence_format]
>   Suggested fix    Add Upstream-Status: <Valid status> to the header
> of
> meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
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
> Guidelines:    
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe

