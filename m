Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.438.1594832132607604162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06FGsDDo016931
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Jul 2020 09:54:33 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Jul
 2020 09:54:09 -0700
Subject: Re: [OE-core][PATCH v8] expat: Added ptest
To: <oleksandr.s.popovych@globallogic.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>,
        Joshua Watt
	<JPEW.hacker@gmail.com>
References: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com>
 <9c6bfc2b37121a36c866bffff3f72efe91e847aa.camel@linuxfoundation.org>
 <CAKqUGW-3RDNU1SFmy9egAbPv8AEOfGBHWb9o34O0P2TxF3boMA@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <b4996474-6945-9542-0b73-1eeb1499250c@windriver.com>
Date: Wed, 15 Jul 2020 12:54:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKqUGW-3RDNU1SFmy9egAbPv8AEOfGBHWb9o34O0P2TxF3boMA@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-06-03 8:48 a.m., Oleksandr via lists.openembedded.org wrote:
> Hello Richard, Joshua,
> 
> On Mon, May 11, 2020 at 3:45 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> ...
>>
>> Thanks, this is definitely getting there. There was only one test
>> failure this time, with meta-mingw:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1884
>>
>> I've cc'd Joshua in case he has any insights on this.
> 
> I`ve tested my patch with meta-mingw layer on my host and it seems I
> have fixed the current compilation error, with making some changes to
> meta-mingw (by changing "CMAKE_SYSTEM_NAME" variable to "Windows"
> value during toolchain file generation in
> "recipes-core/expat/expat_%.bbappend" file using a
> "recipes-devtools/cmake/cmake_%.bbappend" file as template). However
> this is only part of a solution, because another error appears next to
> it: gdb-cross-canadian that depends on expat now fails to build,
> because it can not find a proper expat library. It seems that expat
> recipe, which was switched to build with CMake in my patch, does not
> generate output library in proper format (it compiles only
> "libexpat.dll.a", when the current version of expat recipe from
> upstream, that uses Autotools, generates both "libexpat.a" and
> "libexpat.dll.a"). This is such an error that I can not figure out how
> to solve it by myself, so I ask for help.

When I was cleaning up my inbox, I noticed this thread had gone idle.

Ugh, I have no idea about Windows, Joshua any ideas?

> 
> Additionally I would like to ask you: How should I send patches now
> when at least two separate patches with similar purposes should be
> sent to different layers (one for [OE-core] and other for
> [meta-mingw])? Should they be connected with some kind of cover-letter
> or is there another option?

I think that if you just CC the maintainers and mention the dependency
in the commit log or wrapper email, then things will work out.

Thanks for continuing to work on this Oleksandr.
Hopefully v9 will work well and be merged.

../Randy

> 
> Thanks for your attention.
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
