Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5686BF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:41:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS9f87B013179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:41:18 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Dec 2018 01:40:51 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1545987662.git.liezhi.yang@windriver.com>
	<20181228093314.2331.95571@do>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f326097b-655a-e37e-107c-e13a467ca221@windriver.com>
Date: Fri, 28 Dec 2018 17:45:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181228093314.2331.95571@do>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHZhbGdyaW5kL2JsdWV6NS9wZXJsOiBGaXggcmFjZSBpc3N1ZXMgd2hlbiBwYXJhbGxlbCBidWlsZA==?=
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
X-List-Received-Date: Fri, 28 Dec 2018 09:41:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/28/18 5:33 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: valgrind/bluez5/perl: Fix race issues when parallel build
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/15481/
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
>    Targeted branch  master (currently at 65c419b8c4)

Seems that something is wrong with patchtest, the current master branch should be:

commit caa776bdcf8ea34c857f45970370bf771075f4bc
Author: Kai Kang <kai.kang@windriver.com>
Date:   Tue Dec 25 04:39:43 2018 -0500

     testimage.bbclass: remove boot parameter systemd.log_target


But patchtest says it is 65c419b8c4, I can't find it in my repo.

// Robert

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
> 

