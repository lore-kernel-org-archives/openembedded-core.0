Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F202E6DCE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:46:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rARDkvu3018472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Nov 2013 05:46:57 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 27 Nov 2013 05:46:56 -0800
Message-ID: <5295F7CF.2000506@windriver.com>
Date: Wed, 27 Nov 2013 08:46:55 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1385559942.11222.1.camel@ted>
In-Reply-To: <1385559942.11222.1.camel@ted>
Subject: Re: [PATCH] module-base: Fix misleading comment
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
X-List-Received-Date: Wed, 27 Nov 2013 13:46:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-27 08:45 AM, Richard Purdie wrote:
> The comment was originally written for module.bbclass and is now
> slightly misleading. This updates it to match the current code.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 9dbb4b4..1589a90 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -11,11 +11,8 @@ KERNEL_OBJECT_SUFFIX = ".ko"
>   # kernel modules are generally machine specific
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -#
> -# Ensure the hostprogs are available for module compilation. Modules that
> -# inherit this recipe and override do_compile() should be sure to call
> -# do_make_scripts() or ensure the scripts are built independently.
> -#
> +# Function to ensure the kernel scripts are created. Expected to
> +# be called before do_compile. See module.bbclass for an exmaple.
>   do_make_scripts() {
>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>   	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>
>


