Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD46C74669
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:57:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U7vIxv016005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Mar 2018 00:57:18 -0700
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 30 Mar 2018 00:57:18 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
	<20180330070529.2394.14955@do.openembedded.org>
	<77cd677d-8c26-9eac-1dae-22afa985f447@windriver.com>
	<1522395841.11431.108.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <408c4fb3-a44f-5ea5-1bf3-ac671a61b53c@windriver.com>
Date: Fri, 30 Mar 2018 15:57:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522395841.11431.108.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVwZ3JhZGUgNyBwYWNrYWdlcw==?=
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
X-List-Received-Date: Fri, 30 Mar 2018 07:57:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年03月30日 15:44, Richard Purdie wrote:
> On Fri, 2018-03-30 at 15:26 +0800, Hongxu Jia wrote:
>> On 2018年03月30日 15:05, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: Upgrade 7 packages
>>> Revision: 1
>>> URL   : https://patchwork.openembedded.org/series/11622/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>>
>>> Thank you for submitting this patch series to OpenEmbedded Core.
>>> This is
>>> an automated response. Several tests have been executed on the
>>> proposed
>>> series by patchtest resulting in the following failures:
>>>
>>>
>>>
>>> * Issue             LIC_FILES_CHKSUM changed on target libgpg-error
>>> but there is no "License-Update" tag in commit message
>>> [test_lic_files_chksum_modified_not_mentioned]
>>>     Suggested fix    Include "License-Update: <description>" into
>>> the commit message with a brief description
>>>     Current checksum
>>> file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552
>>>       file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1
>>>                file://src/gpg-
>>> error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c
>>>              file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2
>>> b91225afbc
>>>     New
>>> checksum     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552
>>>                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206
>>> a5b0a1                     file://src/gpg-
>>> error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b
>>>              file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2
>>> b91225afbc
>> It already includes "License-Update: <description>":
>> ...
>> 1. License-Update: update years from 2003-2004 to 2001-2018,
>>      and add a new line 'SPDX-License-Identifier: LGPL-2.1+'
>> ...
>>
>> Should I remove the starting "1. "?
> Yes, the "1. " is why its not understanding what you added.
>

OK, V2 incoming

>>> * Issue             Patches not removed from tree
>>> [test_src_uri_left_files]
>>>     Suggested fix    Amend the patch containing the software patch
>>> file removal
>>>     Patch            avoid-host-contamination.patch
>>>     Patch            mkdir-p.patch
>>>     Patch            do-not-check-local-libpng-source.patch
>>>     Patch            ghostscript-9.02-genarch.patch
>>>     Patch            ghostscript-9.21-prevent_recompiling.patch
>>>     Patch            ghostscript-9.16-Werror-return-type.patch
>>>     Patch            cups-no-gcrypt.patch
>>>     Patch            ghostscript-9.15-parallel-make.patch
>> It already removes them from tree.
>> Should I git format-patch without "-M"?
> To be clear, these patches are all renamed. I think patchtest is
> failing to understand the rename. Please continue to send with -M but
> lets file a bug against patchtest to see if we can fix this issue.

Got it, file YOCTO #12636 to trace the issue
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12636

//Hongxu

> We could avoid the issue by not renaming patches.
>
> Cheers,
>
> Richard



