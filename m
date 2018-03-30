Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0927459E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:26:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U7QbqR015445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Mar 2018 00:26:37 -0700
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 30 Mar 2018 00:26:30 -0700
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
	<20180330070529.2394.14955@do.openembedded.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <77cd677d-8c26-9eac-1dae-22afa985f447@windriver.com>
Date: Fri, 30 Mar 2018 15:26:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180330070529.2394.14955@do.openembedded.org>
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
X-List-Received-Date: Fri, 30 Mar 2018 07:26:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年03月30日 15:05, Patchwork wrote:
> == Series Details ==
>
> Series: Upgrade 7 packages
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/11622/
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
> * Issue             LIC_FILES_CHKSUM changed on target libgpg-error but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
>    Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
>    Current checksum file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1                     file://src/gpg-error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc
>    New checksum     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1                     file://src/gpg-error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc

It already includes "License-Update: <description>":
...
1. License-Update: update years from 2003-2004 to 2001-2018,
    and add a new line 'SPDX-License-Identifier: LGPL-2.1+'
...

Should I remove the starting "1. "?

> * Issue             Patches not removed from tree [test_src_uri_left_files]
>    Suggested fix    Amend the patch containing the software patch file removal
>    Patch            avoid-host-contamination.patch
>    Patch            mkdir-p.patch
>    Patch            do-not-check-local-libpng-source.patch
>    Patch            ghostscript-9.02-genarch.patch
>    Patch            ghostscript-9.21-prevent_recompiling.patch
>    Patch            ghostscript-9.16-Werror-return-type.patch
>    Patch            cups-no-gcrypt.patch
>    Patch            ghostscript-9.15-parallel-make.patch

It already removes them from tree.
Should I git format-patch without "-M"?

//Hongxu

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


