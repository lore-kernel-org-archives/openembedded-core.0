Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1A96BA72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 08:28:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2K8RaCR016313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 01:27:47 -0700
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 01:27:24 -0700
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5a4cb86b-1669-7dae-42e0-38dfcabc7bd5@windriver.com>
Date: Wed, 20 Mar 2019 16:25:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 08:28:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/20 下午3:42, Alexey Brodkin wrote:
> Hello Kai Kang,
>
> You recent changes in QEMU [1] lead to build failure:
> -------------------------------------->8-------------------------------------
> # bitbake qemu-system-native
> ...
> | .../build/tmp-glibc/work/x86_64-linux/qemu-system-native/3.1.0-r0/qemu-3.1.0/hw/rdma/rdma_backend.c:316:42: error: 'VENDOR_ERR_INV_NUM_SGE' undeclared (first use in this function)
> |          comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
> |                                           ^
> -------------------------------------->8-------------------------------------
>
> That's obviously because of meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch.
>
> I'm wondering if you tried to build QEMU yourself?

My fault. qemu & qemu-native has been verified but qemu-system-native 
not. I'll send fix ASAP.

Regards,
Kai


>
> [1] https://github.com/openembedded/openembedded-core/commit/489ece1aa90d8f76b4c1f009d837f82e38e11ba9
>
> -Alexey
>

-- 
Kai Kang


