Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF88A6A8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:35:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5RGZjob027703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 09:35:46 -0700 (PDT)
Received: from [128.224.147.234] (128.224.147.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:35:45 -0700
Message-ID: <51CC69DA.3010406@windriver.com>
Date: Thu, 27 Jun 2013 12:35:38 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <51C963C0.5020009@windriver.com> <1810438.1YW5iENKFC@helios>
	<51CC47DA.8090905@windriver.com>
In-Reply-To: <51CC47DA.8090905@windriver.com>
X-Originating-IP: [128.224.147.234]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Could qt4.8 build on mips 64 bits platform?
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
X-List-Received-Date: Thu, 27 Jun 2013 16:35:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 13-06-27 10:10 AM, Kang Kai wrote:
> On 2013年06月25日 18:41, Paul Eggleton wrote:
>> On Tuesday 25 June 2013 17:32:48 Kang Kai wrote:
>>> Could qt4.8 build on mips 64 bits platform?
>>>
>>> I searched qt-project.org and no such related information.
>>> And then grep the source codethat no such mips64 keyword in file
>>> qmake.conf under directory mkspecs. In contrast there are mips32 related
>>> flags in mkspecs/qws/linux-mips-g++/qmake.conf.
>>>
>>> Does that mean we still can't build qt 4.8 on mips64?
>> I don't have any specific knowledge here; I'd suggest trying it. If
>> additional
>> patches are needed the best thing would be to try and get those merged
>> upstream.
>
> Thanks a lot. I'll try to build it on mips 64.

The background here is that we encountered many painful build problems
with qt-4.7 on mips64 in oe-core-1.2. We tried to fix them initially
but investigations from 6 months ago indicated that the qt upstream
did not support mips64. Kai will dig into the current situation
but I expect that little will have changed.

We ended up with horrid bbapends such as:
---
#Valid for all arches except mips64 with 64bit userspace
# mips64 with n32 has host: mips64-wrs-linux-gnun32
# mips64 with n64 has host: mips64-wrsmllib64-linux
# qemumips has host: mips-wrs-linux
# qemumips-64 has host: mips64-wrs-linux
COMPATIBLE_HOST = 
'((x86_64.*|i.86.*|powerpc.*|arm.*|mips-.*|mips32.*)-linux|mips64.*-linux-gnun32)'
---

so we'll likely need a clue on how to declare a host as incompatible
or introduce an INCOMPATIBLE_HOST variable.

// Randy

>
> Regards,
> Kai
>
>>
>> Cheers,
>> Paul
>>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

