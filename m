Return-Path: <peteasa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4916D6AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:21:04 +0000 (UTC)
Received: by wgbgs4 with SMTP id gs4so98276249wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 14:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=f3RPFfYFWOhPzEDHXaYhLDQWCVrqC/MuqKX1hXt+ec8=;
	b=bSQhcB67cckgTvy7vYDMslcKvWnkpDZolL1HBWZt5lwmHpcJ8R+0ezAtybbpV6UgXG
	2Tw3+a3tfi/ARKFQPEfQfVJAJjc/aw/AZk5j3/LghSyTud+oTCOOQcmuopuisDoFu2yT
	GbZDYPd3CgyZP8+vaP6XBe3Ud+G9idtfWGDedM3LoFM9UDMGvUif21NAZdU8tMotIPlb
	vqUp9zy4nMD49yxXdyBxm5wVaQFhRFYU56dS2WKAUbd3Ijo/X6sEjvPjGXE8FEH0M3sb
	2TL1r+StelKGYsNkbNyj9wOFy3k8lnGYveqtcVVipY3AEiHVwbgeiC8pegUZXCjTs3Sm
	0oBA==
X-Received: by 10.180.98.98 with SMTP id eh2mr3013346wib.31.1427750465528;
	Mon, 30 Mar 2015 14:21:05 -0700 (PDT)
Received: from [192.169.0.118] (cpc18-heme10-2-0-cust113.9-1.cable.virginm.net.
	[81.96.152.114]) by mx.google.com with ESMTPSA id
	lg18sm17988675wic.23.2015.03.30.14.21.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 14:21:04 -0700 (PDT)
Message-ID: <5519BE3E.6010302@gmail.com>
Date: Mon, 30 Mar 2015 22:21:02 +0100
From: Peter Saunderson <peteasa@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Nathan Rossi <nathan@nathanrossi.com>
References: <1427656660-8637-1-git-send-email-peteasa@gmail.com>
	<CA+aJhH252qR4YePVWDoXVJ3Qrjsi_QUTxde-czT25QoaHTX3gQ@mail.gmail.com>
	<5519BCA9.70401@gmail.com>
In-Reply-To: <5519BCA9.70401@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] insane.bbclass: Added Epiphany machine definitions
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
X-List-Received-Date: Mon, 30 Mar 2015 21:21:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Updated subject line.

On 30/03/15 22:14, Peter Saunderson wrote:
> On 30/03/15 03:11, Nathan Rossi wrote:
>> On Mon, Mar 30, 2015 at 5:17 AM, Peter Saunderson <peteasa@gmail.com> 
>> wrote:
>> You have [meta-oe] in your subject, I believe you are after just
>> oe-core with this patch correct?
> Yes, sorry wrong subject line.  oe-core only.
>> Adding machine definitions for the epiphany 
>> (http://www.adapteva.com/) chip.
>> using https://github.com/adapteva/epiphany-binutils-gdb.
>> For binutils implementation that defines TARGET_ARCH MACHINE 
>> "epiphany": 4643 See 
>> https://github.com/adapteva/epiphany-binutils-gdb/blob/epiphany-binutils-2.24/bfd/elf32-epiphany.c
>> Epiphany is in upstream binutils with the matching ID,
>> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=25cfef2d6b1ae8e3f976f1e55576d0fbaff79027;hb=HEAD#l408 
>>
>>
>>> For example layer that uses these defines see 
>>> https://github.com/peteasa/meta-epiphany.git
>>>
>>> Epiphany cross compile is confused by package_qa_check_arch so this 
>>> check is also skipped.
>>> ---
>>>   meta/classes/insane.bbclass | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>>> index c6dea22..9cdb382 100644
>>> --- a/meta/classes/insane.bbclass
>>> +++ b/meta/classes/insane.bbclass
>>> @@ -52,6 +52,9 @@ def package_qa_get_machine_dict():
>>>               "darwin9" : {
>>>                           "arm" :       (40,     0, 0,          
>>> True,          32),
>>>                         },
>>> +            "e-os" :  {
>> I assume 'e-os' is short hand for 'epiphany-os'?
>>
>> Is there are reason for using e-os? I noticed in your layer that your
>> toolchains are actually target os 'elf' (e.g. epiphany-elf-gcc), in
>> which case it should be 'elf' that goes into the TARGET_OS variable.
>> This might be the reason for the issues that you see when compiling?
> Perhaps the best way to understand my need to skip the 
> package_qa_check_arch is to comment out the FIXME lines for cross, 
> nativesdk and cross-canadian and run bitbake.  The files created with 
> cross compile etc are designed to execute on one machine and produce 
> run time files for another so the package_qa_check fails if you 
> include the check for builds that inherit from cross, nativesdk and 
> cross-canadian.  Thus the FIXME for cross, nativesdk and 
> cross-canadian allows gcc-cross-arm etc to build and be packaged.
>
> Now the tag e-os started as a shorthand for epiphany-os but actually 
> the os of the end product in this case does not matter and should not 
> be important to this check.  The package_qa_check_arch check is 
> designed to ensure that the right kind of file gets packaged and 
> eventually installed on the end product, in this case a linux system 
> running on arm.  The check is not run for packages that get installed 
> on linux running on x86_64 that are cross compilers for the linux arm 
> system.  Now with the epiphany case all the packages get installed on 
> a system that they do not run on!  They get installed in the poky sdk 
> so that I can cross compile and create an elf file that I can download 
> and run on the epiphany chip.  They also get installed on the linux 
> arm product and again get run eventually on the epiphany chip.  So if 
> the package_qa_check_arch is run on any of the packages tagged with 
> e-os then it would fail because they always get installed on a 
> architecture that is not compatible because the linux arm system is 
> acting as a host for the epiphany system.
>
> Perhaps it would be better to re-name this tag exotic-os because any 
> chip like epiphany or avr could have an entry in this group. At some 
> time in the future it would be possible to implement separate checks 
> for any of these exotic packages, however I am not sure that there is 
> value in spending the effort.
>>
>> Regards,
>> Nathan
>>
>>> +                        "epiphany":   ( 4643,  0,    0,          
>>> True,          32),
>>> +                      },
>>>               "linux" : {
>>>                           "aarch64" :   (183,    0, 0,          
>>> True,          64),
>>>                           "aarch64_be" :(183,    0, 0,          
>>> False,         64),
>>> @@ -445,6 +448,10 @@ def package_qa_check_arch(path,name,d, elf, 
>>> messages):
>>>       provides = d.getVar('PROVIDES', True)
>>>       bpn = d.getVar('BPN', True)
>>>
>>> +    # FIXME: epiphany cross compile confuses this check
>>> +    if (target_os == 'e-os'):
>>> +        return
>>> +
>>>       # FIXME: Cross package confuse this check, so just skip them
>>>       for s in ['cross', 'nativesdk', 'cross-canadian']:
>>>           if bb.data.inherits_class(s, d):
> Try to comment these two lines out and then do a bitbake for your 
> target and for the sdk and analyse the results to see the failures 
> induced by including the package_qa_check_arch for gcc- cross, 
> nativesdk and cross-canadian.
>
>
> Regards,
>
> Peter
>>> -- 
>>> 2.1.0
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


