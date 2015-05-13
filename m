Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1796074069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 14:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4DEPJiW021982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 May 2015 07:25:19 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 13 May 2015 07:25:19 -0700
Message-ID: <55535ECE.4040605@windriver.com>
Date: Wed, 13 May 2015 10:25:18 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1431350446.30971.56.camel@linuxfoundation.org>
	<5552FFAD.4070306@windriver.com>
In-Reply-To: <5552FFAD.4070306@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
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
X-List-Received-Date: Wed, 13 May 2015 14:25:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I'll do an explicit round of gcc5 support in master for the
kernels we have there in the not to distant future. To throw
the switch for gcc5, we'll obviously want all the architectures
to build and boot.

To keep things practical, I'll start from the -dev kernel, then
back to the LTSI kernels we still have in master.

In the meantime, if anyone has patches, sending them to the linux-yocto
mailing list is appreciated. Since everyone has eyes and ears
on different lists it makes the effort that much easier if we collect
changes in advance on a single list.

Bruce

On 2015-05-13 03:39 AM, Robert Yang wrote:
>
> I think that I met another problem when MACHINE = qemuarm64 with gcc5:
> linux-yocto_3.19.bb:
>
> /tmp/ccWk2lM2.s: Assembler messages:
> /tmp/ccWk2lM2.s:42: Error: .err encountered
> /tmp/ccWk2lM2.s:43: Error: .err encountered
> /tmp/ccWk2lM2.s:44: Error: .err encountered
> /tmp/ccWk2lM2.s:103: Error: .err encountered
> /tmp/ccWk2lM2.s:104: Error: .err encountered
> /tmp/ccWk2lM2.s:105: Error: .err encountered
> make[3]: *** [arch/arm64/kernel/psci.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
>    CC      mm/mmzone.o
>    CC      mm/vmstat.o
>    CC      mm/backing-dev.o
>    CC      net/socket.o
> make[2]: *** [arch/arm64/kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> // Robert
>
> On 05/11/2015 09:20 PM, Richard Purdie wrote:
>> Hi Bruce,
>>
>> One of the things we're looking at in 1.9 is gcc 5.x support by default.
>> One of the areas this has significant impact is on the kernels,
>> linux-yocto in particular. I'm starting to see a potential problem here
>> since the kernels don't appear to work well with gcc 5.x:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
>>
>>
>> (this is a test build I ran just to see how bad things were).
>>
>> Are we going to be in a position to get 5.x support backported into 3.14
>> (and maybe 3.10)? Or was we going to have to wait for later versions?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>


