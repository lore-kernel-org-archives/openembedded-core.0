Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4FD7F455
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:25:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9FGPMZg030814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2019 09:25:23 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 15 Oct 2019 09:25:21 -0700
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
References: <20190802023302.28370-1-bruce.ashfield@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9b6d2e15-1561-a13d-7337-afb4c8f63608@windriver.com>
Date: Tue, 15 Oct 2019 12:25:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190802023302.28370-1-bruce.ashfield@gmail.com>
X-Originating-IP: [172.25.44.5]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto-dev: bump to 5.3-rcX
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
X-List-Received-Date: Tue, 15 Oct 2019 16:25:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/1/19 10:33 PM, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb


> index 8c83620d39..96117ccf3f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   
> -LINUX_VERSION ?= "5.2-rc+"
> +LINUX_VERSION ?= "5.3-rc+"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>   
> 

Should this recipe be dropped from releas branches such as
warrior and zeus?

Doing so would ensure that users understand that the -dev kernel is
really only for development on the master branch.

-- 
# Randy MacLeod
# Wind River Linux

