Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TJGvb-0006R4-Fj
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 06:51:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q934cMfj007185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2012 21:38:22 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.23.54) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 2 Oct 2012 21:38:22 -0700
Message-ID: <506BC13D.9030909@windriver.com>
Date: Wed, 3 Oct 2012 00:38:21 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
In-Reply-To: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto-custom: Clarify defconfig usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 04:51:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-10-03 12:36 AM, Darren Hart wrote:
> It is necessary to supply file://defconfig to the SRC_URI when using
> a defconfig (it is not implicitly understood as the commentary might
> currently suggest).

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index 1f0b3a2..4115d2f 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -13,7 +13,8 @@
>   #
>   #   You must also provide a Linux kernel configuration. The most direct
>   #   method is to copy your .config to files/defconfig in your layer,
> -#   in the same directory as the bbappend.
> +#   in the same directory as the bbappend and add file://defconfig to
> +#   your SRC_URI.
>   #
>   #   To use the yocto kernel tooling to generate a BSP configuration
>   #   using modular configuration fragments, see the yocto-bsp and



