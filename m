Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41927784F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 01:14:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w111E32j012668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 17:14:03 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 17:14:02 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<2966cc751ff78de85ebac9776f78204c3cea0267.1517383469.git.hongxu.jia@windriver.com>
	<CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
	<8b00918e-df88-20ef-6d44-f3850021039d@linux.intel.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <a2bad4ee-7a6d-3f31-0a19-b3ae91439c55@windriver.com>
Date: Thu, 1 Feb 2018 09:17:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8b00918e-df88-20ef-6d44-f3850021039d@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gpgme: 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 01 Feb 2018 01:14:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年01月31日 21:27, Alexander Kanavin wrote:
> On 01/31/2018 02:28 PM, Burton, Ross wrote:
>> On 31 January 2018 at 07:48, Hongxu Jia <hongxu.jia@windriver.com 
>> <mailto:hongxu.jia@windriver.com>> wrote:
>>
>>     1. Disable test at build time to workaround corss-compile
>>
>>
>> Looks like more tests need to be disabled:
>>
>> | Making all in tests
>> | make[4]: Entering directory 
>> '/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests'
>> | echo no-force-v3-sigs > ./gpg.conf
>> | echo pinentry-program 
>> /data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/../gpgme-1.10.0/tests/gpg/pinentry 
>>  >gpg-agent.conf
>> | gpgconf --kill all
>> | echo ignore-invalid-option agent-program >> ./gpg.conf
>> | /bin/bash: gpgconf: command not found
> ....
>
> I think this set of failures in particular can be fixed by adding 
> gnupg-native to dependencies (which is better than creating yet 
> another 'Inappropriate' patch that we have to carry forever).
>

I've tried to add gnupg-native before disable it, but still failure.

//Hongxu

> I'd be however interested to see the successful build log from the 
> submitter because I'm bit puzzled how it could succeed (probably host 
> gpg was used, but I want to see details).
>
>
> Alex



