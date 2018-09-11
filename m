Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D48AB71A0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 03:15:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8B3FVcu016832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 20:15:31 -0700 (PDT)
Received: from server.local (128.224.20.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 10 Sep 2018 20:15:30 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180909104450.11900-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <bdb5a4f9-4982-8472-e063-e005a846c748@windriver.com>
Date: Mon, 10 Sep 2018 23:15:30 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180909104450.11900-1-hongzhi.song@windriver.com>
Subject: Re: [PATCH] linux-yocto-rt: Add paravirt_kvm support for qemux86-64
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
X-List-Received-Date: Tue, 11 Sep 2018 03:15:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-09 6:44 AM, Hongzhi.Song wrote:
> This feature includes paravirtualized KVM guest support, including
> KVMCLOCK for enhancing clock accuracy of guest OS.
> 

This is fine with me. I'll pull it into my queue. I expect my next pull
request to be on Wednesday.

Bruce

> Signed-off-by: He Zhe <zhe.he@windriver.com>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb | 2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
> index d9953c32be..ab088f4d18 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
> @@ -38,4 +38,4 @@ KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/ta
>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> index 5b102069f1..de3b538b5d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> @@ -40,4 +40,4 @@ KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/ta
>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> 


