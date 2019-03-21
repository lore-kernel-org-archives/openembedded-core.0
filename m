Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEB326BA22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L3SVo6019225
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 20:28:31 -0700 (PDT)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:28:28 -0700
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
References: <20190320131619.58439-1-kai.kang@windriver.com>
	<4881796E12491D4BB15146FE0209CE6468225794@de02wembxa.internal.synopsys.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d6711f3c-f4d6-d469-3aa3-47691d02b605@windriver.com>
Date: Thu, 21 Mar 2019 11:26:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468225794@de02wembxa.internal.synopsys.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixup! qemu: backport patches to fix cves
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
X-List-Received-Date: Thu, 21 Mar 2019 03:28:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/21 上午5:34, Alexey Brodkin wrote:
> Hi Kai Kang,
>
>> -----Original Message-----
>> From: kai.kang@windriver.com <kai.kang@windriver.com>
>> Sent: Wednesday, March 20, 2019 4:16 PM
>> To: richard.purdie@linuxfoundation.org
>> Cc: alexey.brodkin@synopsys.com; openembedded-core@lists.openembedded.org
>> Subject: [PATCH] fixup! qemu: backport patches to fix cves
> Just wondering if you were able to reproduce mentioned problem
> on your side before fixing it?
>
> Given Richard's input this problem was supposed to be caught
> before your previous commit hit OE master branch but somehow it
> slipped through the cracks...
>
> Or otherwise my setup should be somehow very special if it only
> happens for me.

I can reproduce the build failure with default configure:

$ . poky/oe-init-build-env
$ bitbake qemu-system-native

It should be covered by autobuilder. :(

And there is no error to build qemu and qemu-native  that 
hw/rdma/rdma_backend.c is not even compiled because:

* CONFIG_PCI is not set for qemu-native

* CONFIG_PVRDMA is not set for qemu


Regards,
Kai




>
> -Alexey
>
>

-- 
Kai Kang


