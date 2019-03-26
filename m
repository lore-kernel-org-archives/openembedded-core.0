Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32B4C6BF38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 03:17:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2Q3HW7S016003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2019 20:17:32 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 25 Mar 2019 20:17:32 -0700
Message-ID: <5C999A06.9000207@windriver.com>
Date: Tue, 26 Mar 2019 11:18:30 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>	
	<1553138356-85237-3-git-send-email-liwei.song@windriver.com>
	<d0fe7249917de2139a9d8d577984a8476b1ce395.camel@linuxfoundation.org>
In-Reply-To: <d0fe7249917de2139a9d8d577984a8476b1ce395.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/8] mdadm: add udev rules to create by-partuuid for MD devices
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
X-List-Received-Date: Tue, 26 Mar 2019 03:17:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 03/25/2019 07:55 PM, Richard Purdie wrote:
> On Wed, 2019-03-20 at 23:19 -0400, Liwei Song wrote:
>> installer use partuuid for boot and swap partition,
>> But the udev rules for MD devices do not have rules to create
>> by-partuuid under /dev/disk/, this will take 90s to wait until failed
>> add the rules to create by-partuuid to support boot from raid
>> disk with "root=PARTUUID=XXX"
>>
>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>> ---
>>  ...ev.rules-create-by-partuuid-for-md-device.patch | 29
>> ++++++++++++++++++++++
>>  meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
>>  2 files changed, 30 insertions(+)
>>  create mode 100644 meta/recipes-extended/mdadm/files/0001-
>> udev.rules-create-by-partuuid-for-md-device.patch
>>
>> diff --git a/meta/recipes-extended/mdadm/files/0001-udev.rules-
>> create-by-partuuid-for-md-device.patch b/meta/recipes-
>> extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-
>> device.patch
>> new file mode 100644
>> index 000000000000..c1f7b1cf8736
>> --- /dev/null
>> +++ b/meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-
>> partuuid-for-md-device.patch
>> @@ -0,0 +1,29 @@
>> +From 7d1fa6afba936edb3e211f0ccdb58b1472b4bbf4 Mon Sep 17 00:00:00
>> 2001
>> +From: Liwei Song <liwei.song@windriver.com>
>> +Date: Tue, 26 Feb 2019 07:05:42 +0000
>> +Subject: [PATCH] udev.rules: create by-partuuid for md device
>> +
>> +Create by-partuuid for every md devices.
>> +
>> +Upstream-Status: sent to linux-raid@vger.kernel.org(
>> https://www.spinics.net/lists/raid/msg62373.html)
>> +
>> +Signed-off-by: Liwei Song <liwei.song@windriver.com>
>> +---
>> + udev-md-raid-arrays.rules | 1 +
>> + 1 file changed, 1 insertion(+)
> 
> It looks like upstream had concerns about this so I'd like to hold off
> on this until those are resolved.

No problem, let's wait if other folks have more concern before it is applied.

https://www.spinics.net/lists/raid/msg62379.html

Thanks,
Liwei.


> 
> https://www.spinics.net/lists/raid/msg62376.html
> 
> Cheers,
> 
> Richard
> 
> 
> 

