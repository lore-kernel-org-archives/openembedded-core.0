Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B64A760762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 06:57:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V6vTxg014221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 23:57:29 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 23:57:28 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
	<e702a991cf06c5270d3b0c767beee8baa5ed4c36.1472480768.git.alexander.kanavin@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1e793cfe-71fd-fcea-c86c-86cb916ac939@windriver.com>
Date: Wed, 31 Aug 2016 14:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <e702a991cf06c5270d3b0c767beee8baa5ed4c36.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 09/15] kexec-tools: update to 2.0.13
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
X-List-Received-Date: Wed, 31 Aug 2016 06:57:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

It seems that this one causes build errors on arm AFAIK:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/933/steps/BuildImages/logs/stdio

// Robert

On 08/29/2016 10:30 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb} (88%)
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
> similarity index 88%
> rename from meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> rename to meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
> index 59376c8..338a7d9 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
> @@ -10,8 +10,8 @@ SRC_URI += " \
>              file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
>           "
>
> -SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
> -SRC_URI[sha256sum] = "cc7b60dad0da202004048a6179d8a53606943062dd627a2edba45a8ea3a85135"
> +SRC_URI[md5sum] = "b7595eb4705e482ee6fc1121a5b6131b"
> +SRC_URI[sha256sum] = "70df562d76213e54833228379710ada1afd98a86ee1ce5644eaa68c54e102e25"
>
>  PACKAGES =+ "kexec kdump vmcore-dmesg"
>
>

