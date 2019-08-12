Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 291096C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:48:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7CDmUrM000861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Aug 2019 06:48:30 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 12 Aug 2019 06:48:29 -0700
To: "Bedel, Alban" <alban.bedel@aerq.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <20190717141953.8267-1-alban.bedel@aerq.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1b8fa6dc-f6c2-0acd-9680-218c1a8b21da@windriver.com>
Date: Mon, 12 Aug 2019 09:48:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141953.8267-1-alban.bedel@aerq.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Mon, 12 Aug 2019 13:48:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 7/17/19 10:20 AM, Bedel, Alban wrote:
> Like for ARM bjam need some hints about the ABI to properly build on
> aarch64. While at it also enable context and coroutine as these are
> supported on aarch64.
> 
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>   meta/recipes-support/boost/boost.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 9be3717fd6..c2e2cbb352 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 = " context coroutine"
>   BOOST_LIBS_append_x86-64 = " context coroutine"
>   BOOST_LIBS_append_powerpc = " context coroutine"
>   BOOST_LIBS_append_arm = " context coroutine"
> +BOOST_LIBS_append_aarch64 = " context coroutine"
>   # need consistent settings for native builds (x86 override not applied for native)
>   BOOST_LIBS_remove_class-native = " context coroutine"
>   # does not compile
> @@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
>   
>   # cross compiling for arm fails to detect abi, so provide some help
>   BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
> +BJAM_OPTS_append_aarch64 = " abi=aapcs address-model=64 architecture=arm"
>   
>   do_configure() {
>   	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
> 


Seems simple enough.
Does anyone have any concerns about this patch?
It seems that it was overlooked.

-- 
# Randy MacLeod
# Wind River Linux

