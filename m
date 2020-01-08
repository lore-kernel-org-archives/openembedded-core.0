Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by mail.openembedded.org (Postfix) with ESMTP id 577587FCDF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 02:15:35 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9B3819115B48FE7D35EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 10:15:34 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 Jan 2020
	10:15:26 +0800
To: <openembedded-core@lists.openembedded.org>
References: <20200102105353.633-1-zhengjunling@huawei.com>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <7259933d-48a6-19e8-f5a2-6d7981d655a1@huawei.com>
Date: Wed, 8 Jan 2020 10:15:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200102105353.633-1-zhengjunling@huawei.com>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: Re: [PATCH] security_flags: Remove stack protector flags from LDFLAGS
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
X-List-Received-Date: Wed, 08 Jan 2020 02:15:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Ping...

On 2020/1/2 18:53, Junling Zheng wrote:
> The stack protector flag is a compile option, not a link option, so
> remove it from LDFLAGS.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index aaf04e9e59..5b79340be9 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
>  SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>  SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>  
> -SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
> -SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
> +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
>  
>  # powerpc does not get on with pie for reasons not looked into as yet
>  GCCPIE_powerpc = ""
> 



