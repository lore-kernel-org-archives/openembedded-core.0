Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72D0F6B8D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:47:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI7lNEa010184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:47:24 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:47:23 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
	<20181218073454.2332.69667@do>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <77a37ebd-b90a-b88f-353b-f9cef3860df9@windriver.com>
Date: Tue, 18 Dec 2018 15:52:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181218073454.2332.69667@do>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGNjYWNoZS5iYmNsYXNzOiBSZWZhY3RvciBpdCB0byBtYWtlIGl0IG1vcmUgcmVsaWFibGUgKHJldjMp?=
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
X-List-Received-Date: Tue, 18 Dec 2018 07:47:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fixed in the repo:

     ccache: 3.4.2 -> 3.5

     License-Update: Copyright year and zlib version are changed, others are the
     same.

     This version supports CCACHE_DEBUG which will make the debug easier.


// Robert

On 12/18/18 3:34 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: ccache.bbclass: Refactor it to make it more reliable (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/15276/
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
> * Issue             LIC_FILES_CHKSUM changed on target ccache but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
>    Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
>    Current checksum file://LICENSE.adoc;md5=2722abeaf1750dbf175b9491112374e1
>    New checksum     file://LICENSE.adoc;md5=39f34d6ff4df51ed718fd7d243fc4e51
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

