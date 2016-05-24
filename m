Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B15FB6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 15:51:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4OFp2lf011191
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 May 2016 08:51:02 -0700 (PDT)
Received: from server.local (128.224.20.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 24 May 2016 08:51:01 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <46101188-c23c-4136-963f-0e016c06396e@windriver.com>
Date: Tue, 24 May 2016 11:51:01 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464101499.9570.59.camel@linuxfoundation.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Tue, 24 May 2016 15:51:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-24 10:51 AM, Richard Purdie wrote:
> On Sun, 2016-05-15 at 08:03 +0100, Richard Purdie wrote:
>> On Fri, 2016-05-13 at 09:46 -0700, Khem Raj wrote:
>>> gcc 6.1, glibc 2.24, gdb 7.11
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> I'll merge most of this series however before we can move to gcc6 by
>> default there are some remaining issues:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
>> /b
>> uilds/788/steps/BuildImages/logs/stdio
>>
>> qt4-x11-free fails to compile
>> linux-yocto 4.1 also fails
>
> I just retested gcc6 and the above is still happening and has also been
> joined by a xdg-utils do_compile failure.

For the gcc6 include failure 4.1.23 and 4.1.24 have the compiler.h fix.
I have that pushed to linux-yocto-4.1 already and will send the SRCREV
bumps shortly.

Bruce

>
>> (on qemux86-64, qemux86, qemuppc, qemumips, qemuarm)
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
>> /7
>> 78/steps/BuildImages_1/logs/stdio
>>
>> linux-yocto 4.4 fails on ppc
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/b
>> ui
>> lds/768/steps/BuildImages/logs/stdio
>>
>> non-GPLv3 on elfutils and diffutils
>
> Khem fixed elfutils, thanks! diffutils still breaks though.
>
> I really can't merge the gcc upgrade until these get fixed one way or
> another...
>
> Cheers,
>
> Richard
>


