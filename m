Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2A7D708FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:18:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V8Ixc6005687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:18:59 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 31 Jul 2014 01:18:58 -0700
Message-ID: <53D9FBF1.3050900@windriver.com>
Date: Thu, 31 Jul 2014 16:18:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1406794207.git.liezhi.yang@windriver.com>
	<989bf32313d1405858f7839e5474fe9be93fd182.1406794207.git.liezhi.yang@windriver.com>
In-Reply-To: <989bf32313d1405858f7839e5474fe9be93fd182.1406794207.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/2] local.conf.sample.extended: update for preferred ABI
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
X-List-Received-Date: Thu, 31 Jul 2014 08:19:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/31/2014 04:15 PM, Robert Yang wrote:
> [YOCTO #4073]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/conf/local.conf.sample.extended |   15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> index 89b80a6..8ad7b6f 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -145,6 +145,13 @@
>   #MULTILIBS = "multilib:lib32"
>   #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
> +# Set RPM_PREFER_COLOR to configure preferred ABI when using rpm packaging
> +# backend to generate a rootfs, choices are:
> +# 1: ELF32 wins
> +# 2: ELF64 wins
> +# 3: ELF64 N32 wins (for mips64 or mips64el only)
> +#RPM_PREFER_COLOR ?= "2"
> +
>   # The network based PR service host and port
>   # Uncomment the following lines to enable PRservice.
>   # Set PRSERV_HOST to 'localhost:0' to automatically
> @@ -354,3 +361,11 @@
>   # feed layout is used where package files are placed in <outdir>/<arch>/.
>   #
>   #IPK_HIERARCHICAL_FEED = "1"


I removed the lines below in the git repo, they should be in another patch.

> +
> +# Checks the kernel image size against KERNEL_IMAGE_MAXSIZE (The unit is
> +# Kbytes)
> +#KERNEL_IMAGE_MAXSIZE = "8192"
> +#
> +# Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (The unit is
> +# Kbytes)
> +#IMAGE_ROOTFS_MAXSIZE = "65536"
>

// Robert

