Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D886F79D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 01:57:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA81v5Yx027240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 17:57:06 -0800 (PST)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 7 Nov 2018 17:57:05 -0800
To: Nathan Rossi <nathan@nathanrossi.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181107084701.5939-1-nathan@nathanrossi.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0f67d75a-7a06-8cc3-3f46-886ca11582a0@windriver.com>
Date: Thu, 8 Nov 2018 10:03:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181107084701.5939-1-nathan@nathanrossi.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 01:57:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This patch causes the following failure on autobuilder.
https://autobuilder.yoctoproject.org/typhoon/#/builders/32/builds/183/steps/7/logs/step1c

Best Regards,
Chen Qi

On 11/07/2018 04:47 PM, Nathan Rossi wrote:
> Setup the COMPATIBLE_HOST variable with all supported hosts based on the
> provided objarch.h files. This inverts the existing pattern where
> unsupported hosts (e.g. 'arc.*') are explicitly set.
>
> This suppresses the warning message generated on hosts that are not
> supported but were not listed explicitly.
>
>    WARNING: .../ghostscript_9.25.bb: Unable to get checksum for
>    ghostscript SRC_URI entry objarch.h: file could not be found
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>   meta/recipes-extended/ghostscript/ghostscript_9.25.bb | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> index 35eaaeb2fa..8b69170458 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> @@ -121,5 +121,4 @@ do_install_class-native () {
>   
>   BBCLASSEXTEND = "native"
>   
> -# ghostscript does not supports "arc"
> -COMPATIBLE_HOST = "^(?!arc).*"
> +COMPATIBLE_HOST = "(aarch64|arm|i586|i686|microblaze|mipsarch|nios2|powerpc|x86-64).*"
> ---
> 2.19.1



