Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEEF960169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 16:26:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t14GQnJp023201
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Feb 2015 08:26:49 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Feb 2015 08:26:49 -0800
Message-ID: <54D2482F.9060500@windriver.com>
Date: Wed, 4 Feb 2015 11:26:23 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1423066973-7809-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1423066973-7809-1-git-send-email-sgw@linux.intel.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH] linux-yocto-tiny_3.17: Update to actually use 3.17 git repo
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
X-List-Received-Date: Wed, 04 Feb 2015 16:27:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-02-04 11:22 AM, Saul Wold wrote:
> The named release was still using the -dev git repo which did not contain
> the SRCREV referenced in the numbered/named version.

Argh yes. I'm surprised that slipped by for so long.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> index 1a4f9a8..bf2076f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> @@ -13,7 +13,7 @@ SRCREV_meta ?= "b81030f9ec2de3dc6c048e142dcbff62e305cc40"
>
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
>   COMPATIBLE_MACHINE = "(qemux86)"
>
>


