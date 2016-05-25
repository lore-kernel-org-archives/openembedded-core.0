Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F11265CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:31:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4PDVnYu018848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 25 May 2016 06:31:49 -0700
Received: from server.local (147.11.119.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 06:31:48 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
	<9a16a18f-9178-231d-6c78-ccdc4cdf51a2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <7091d7d0-b03c-2dfd-eee9-d160f3a944a2@windriver.com>
Date: Wed, 25 May 2016 09:31:48 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <9a16a18f-9178-231d-6c78-ccdc4cdf51a2@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 25 May 2016 13:31:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-25 8:32 AM, Bruce Ashfield wrote:
> On 2016-05-25 2:39 AM, Richard Purdie wrote:
>> Thanks to the patches from Bruce we're looking better, linux-yocto 4.1
>> works, just 4.4 has a couple of issues. I also removed a patch which
>> removed the xdg-utils failure. That leaves us with:
>>
>> qt4-x11-free:
>>
>> arm, mips, ppc, world-lsb, x86, x86_64:
>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
>> ds/767/steps/BuildImages/logs/stdio
>>
>> qt4-embedded:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/bu
>> ilds/520/steps/BuildImages/logs/stdio
>>
>> linux-yocto-4.4 mips:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/
>> 795/steps/BuildImages_1/logs/stdio
>>
>> linux-yocto-4.4 ppc:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
>> 07/steps/BuildImages_1/logs/stdio
>>
>> diffutils - non-gplv3:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
>> lds/797
>>
>> Bruce: Looks like 4.4 might also need a patch you merged to 4.1?
>
> I didn't see anything obvious missing from 4.4, and the existing patches
> posted for the build issues are part of:
>
> -----------------
>
> commit 574e9f4b4334807faad40a2d23c350f266d6febb
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Fri May 13 09:46:53 2016 -0700
>
>     linux-yocto/4.4: gcc6 build fixes (powerpc and mips)
>
>     Khem provided fixes to fix gcc6 build issues, these are safe for
>     all gcc versions, so we integrate them directly.
>
>     (From OE-Core rev: f1c75b93a4e11425e595c5ce043fbb0276a41931)
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---------------
>
> So I can't say why the two build failures that that commit addresses
> are popping up.
>
> I checked and the later 4.4-stable commit update I did has the right
> SRCREVs and encompasses that fix .. unless something ended up getting
> clobbered in the code itself.
>
> What's the right incantation to start a gcc6 based build on my own
> machine ? Just bump the preferred version of the compiler ? (I'll do
> that now, since I see the gcc6 recipe .. and that seems like the
> obvious thing).

Hmm. Are we somehow building different SRCREVs ? I'm able to build the
ppc kernel with gcc6:

yow-bashfiel-d4 [/home/bruc...dard-build]> ls -alF vmlinux
-rwxr-xr-x 1 bruce bruce 115353128 May 25 09:12 vmlinux*
yow-bashfiel-d4 [/home/bruc...dard-build]> pwd
/home/bruce/poky/build/tmp/work/qemuppc-poky-linux/linux-yocto/4.4.11+gitAUTOINC+6ec93aaa70_628bf62756-r0/linux-qemuppc-standard-build
yow-bashfiel-d4 [/home/bruc...dard-build]> ls -alF vmlinux
-rwxr-xr-x 1 bruce bruce 115353128 May 25 09:12 vmlinux*
yow-bashfiel-d4 [/home/bruc...dard-build]> strings vmlinux | grep "gcc 
version"
%s version %s (bruce@yow-bashfiel-d4) (gcc version 6.1.1 20160511 (GCC) ) %s
Linux version 4.4.11-yocto-standard (bruce@yow-bashfiel-d4) (gcc version 
6.1.1 20160511 (GCC) ) #1 PREEMPT Wed May 25 09:12:02 EDT 2016

Bruce

>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>


