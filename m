Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 772A3736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 09:45:57 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJH28545; Thu, 02 Apr 2015 17:45:57 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1; Thu, 2 Apr 2015
	17:45:52 +0800
Message-ID: <551D0FCB.5080603@huawei.com>
Date: Thu, 2 Apr 2015 17:45:47 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
	<34C00CB4-D932-4317-A2B6-E6C7346464A0@gmail.com>
In-Reply-To: <34C00CB4-D932-4317-A2B6-E6C7346464A0@gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Thu, 02 Apr 2015 09:45:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 2015/4/2 14:42, Bernhard Reutner-Fischer wrote:
> On April 1, 2015 12:00:25 PM GMT+02:00, Junling Zheng <zhengjunling@huawei.com> wrote:
>> The orign_path.patch introduced '_dl_strchr' into ldso/ldso/dl-elf.c,
> 
> Please fix the origin patch directly.
> Thanks,
> 
Hi, Bernhard

The orign_path.patch is backported from:

http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html

It's an individual. Should I still fix this patch directly?

BTW, should uclibc upstream need this patch to avoid the above problem too?

I had submitted a patch to the uclibc upstream, and expected your review:)

Thanks,

Junling


