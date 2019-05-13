Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44A897BD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 01:37:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4D1aHvq032017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 18:37:04 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 12 May 2019 18:36:48 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<ac6a82d6fb67ec8369434852cdcfba495966061b.1557628550.git.hongxu.jia@windriver.com>
	<20190512192026.GA27955@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <25af358e-1e29-178a-a7ac-2a3946e9428b@windriver.com>
Date: Mon, 13 May 2019 09:36:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512192026.GA27955@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/10] groff: upgrade 1.22.3 -> 1.22.4
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
X-List-Received-Date: Mon, 13 May 2019 01:37:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/13/19 3:20 AM, Adrian Bunk wrote:
> On Sun, May 12, 2019 at 04:16:28PM +0800, Hongxu Jia wrote:
>> ..
>> --- /dev/null
>> +++ b/meta/recipes-extended/groff/files/0001-support-musl.patch
>> @@ -0,0 +1,46 @@
>> +From f73df5196c35ef9c4531e4b6b26800c41954fd77 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Sat, 11 May 2019 20:00:29 +0800
>> +Subject: [PATCH] support musl
>> +
>> +...
>> +|./lib/math.h:2877:1: error: 'int signbit(float)' conflicts with a previous declaration
>> +| _GL_MATH_CXX_REAL_FLOATING_DECL_2 (signbit)
>> +| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +|In file included from recipe-sysroot/usr/include/c++/8.3.0/math.h:36,
>> +|                 from ./lib/math.h:27,
>> +|                 from ./src/include/driver.h:27,
>> +|                 from src/devices/grodvi/dvi.cpp:20:
>> +|recipe-sysroot/usr/include/c++/8.3.0/cmath:661:3: note: previous declaration 'constexpr bool std::signbit(float)'
>> +|   signbit(float __x)
>> +|   ^~~~~~~
>> +...
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + lib/math.in.h | 2 ++
>> + 1 file changed, 2 insertions(+)
>> ...
> The upstream fix seems to be different, the signbit.m4 part of
> http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=453ff940449bbbde9ec00f0bbf82a359c5598fc7

It's a long story, the git version groff is using submodule gnulib 
rather than itself

http://git.savannah.gnu.org/cgit/groff.git/commit/?id=5fec19d453983bc3127052e4f100110efda93786

Your suggestion works in this situation.

But we do not use git groff, we are building from the source as in 
distributed tarball files which

does not require gnulib any more, so your fix is not suitable for us

SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \

//Hongxu


> cu
> Adrian
>


