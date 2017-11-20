Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39CBE784F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 06:57:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAK6vBOR001291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Nov 2017 22:57:11 -0800 (PST)
Received: from [128.224.162.152] (128.224.162.152) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 19 Nov 2017 22:57:10 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
	<CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
	<c46b6cd7-cf25-8fd6-789f-c9cfbcbf9026@windriver.com>
	<726d845f-268e-0f27-bcd7-c6b2fd9f4c53@windriver.com>
	<CAJ86T=UMd9D-_WZ3um3Yg6+yKRFJyToLhNjZw90U0LUujTGfgg@mail.gmail.com>
	<9dabcc17-148f-a0d9-d9d6-3abcd2836ea0@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c6cfdf1e-010a-0257-b1f9-465159db5a1d@windriver.com>
Date: Mon, 20 Nov 2017 14:56:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9dabcc17-148f-a0d9-d9d6-3abcd2836ea0@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Mon, 20 Nov 2017 06:57:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年11月17日 09:46, Kang Kai wrote:
> On 2017年11月16日 18:27, Andre McCurdy wrote:
>> On Fri, May 26, 2017 at 8:24 PM, Kang Kai <Kai.Kang@windriver.com> 
>> wrote:
>>> On 2017年05月23日 17:58, Kang Kai wrote:
>>> On 2017年05月19日 19:47, Burton, Ross wrote:
>>> On 19 May 2017 at 09:52, <kai.kang@windriver.com> wrote:
>>>> Build without threads for bind is inherited from legacy openembedded.
>>>> All libc's support proper threading on Linux now, so enable threads
>>>> support for bind.
>>>>
>>>> It is also need to disable static library build which cause package 
>>>> dhcp
>>>> fail to build after enable bind threads support.
>> It seems this change was made without taking into account the advice 
>> given in:
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=f28757a4b89447ea528cba987f0396b92aa0bbfe
>>
>> "If and when we ship bind's shared libraries we should ensure that the
>> libraries go into a separate package."

Libraries are packaged to bind-libs which has been created by :

http://git.openembedded.org/openembedded-core/commit/?id=d74ebc91388941295a2321a295cdb06ee87fc38b


Regards,
Kai

>>
>> In rocko builds I see "named" running on port 53 and dnsmasq fails to 
>> start...
>
> Thanks. I'll check that.
>
> --Kai
>
>>
>>>> Options devpoll and epoll are configured to choose most preferable
>>>> multiplex method for unix socket. The priorities are: epoll > poll >
>>>> select. When set '--enable-epoll', it just defines a var and include
>>>> header file that is available for cross compile. So use epoll for 
>>>> bind.
>>>>
>>>> Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random 
>>>> device.
>>>>
>>>> Update file/directory ownerships to fix daemon start failure.
>
>

-- 
Regards,
Neil | Kai Kang


