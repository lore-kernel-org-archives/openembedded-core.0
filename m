Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15EDC7E3DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 01:49:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4N1mGdp028338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 May 2019 18:48:26 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 22 May 2019 18:48:05 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<alex.kiernan@gmail.com>, <raj.khem@gmail.com>
References: <20190521092249.175461-1-kai.kang@windriver.com>
	<20190521092249.175461-2-kai.kang@windriver.com>
	<e82f3bf27fdc19d7fc434d4be43661dc166dd8aa.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ad75951d-7da6-8183-768b-127fa94d398a@windriver.com>
Date: Thu, 23 May 2019 09:47:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e82f3bf27fdc19d7fc434d4be43661dc166dd8aa.camel@linuxfoundation.org>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Thu, 23 May 2019 01:49:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/21 下午8:09, Richard Purdie wrote:
> On Tue, 2019-05-21 at 05:22 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add a configure file for systemd.networkd to configure wired network
>> interfaces with dhcp. It works with common network interfaces such
>> eth0
>> and eno1.
>>
>> Refer to
>> https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
>>
>> [YOCTO #13057]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
>>   meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
>>   2 files changed, 14 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd-
>> conf/dhcp.network
> This seems to result in the failures in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/617

Sorry, there was something wrong during my verify build and test. v3 
will be sent.

Regards,
Kai


>
> Cheers,
>
> Richard
>
>

-- 
Kai Kang


