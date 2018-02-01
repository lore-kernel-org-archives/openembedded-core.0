Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8A2578681
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 19:21:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 11:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="14340204"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 01 Feb 2018 11:21:42 -0800
To: openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<20180201183307.15542.76641@do.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1fd8cf8d-e131-7864-201f-fa3487445640@linux.intel.com>
Date: Thu, 1 Feb 2018 21:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180201183307.15542.76641@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJvZS1zZWxmdGVzdDogYWRkIGEgdGVzdCBmb3IgcmUuLi4iIGFuZCAxOSBtb3Jl?=
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
X-List-Received-Date: Thu, 01 Feb 2018 19:21:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/01/2018 08:33 PM, Patchwork wrote:
> * Issue             LIC_FILES_CHKSUM changed on target rpm but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
>    Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
>    Current checksum file://COPYING;md5=f5259151d26ff18e78023450a5ac8d96
>    New checksum     file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a

Actually, there is :) I just sent Leo a fix for this.


> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>    Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
>    Standard format  Upstream-Status: <Valid status>
>    Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

Fixed in branch:
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates


Alex

