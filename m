Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SkhYQ-0004KH-So
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:12:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5TK1aXi003421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jun 2012 13:01:36 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jun 2012 13:01:36 -0700
Message-ID: <4FEE0990.8000301@windriver.com>
Date: Fri, 29 Jun 2012 16:01:20 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<d697333d49c6b34a127b728e60708e6c34435070.1340998763.git.dvhart@linux.intel.com>
In-Reply-To: <d697333d49c6b34a127b728e60708e6c34435070.1340998763.git.dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] linux-yocto-custom: Remove linux-tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 20:12:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-29 03:54 PM, Darren Hart wrote:
> Remove the linux-tools include as perf is now packaged independently.
> Without this, including meta-skeleton in bblayers.conf results in a
> build failure as linux-tools.inc cannot be found.

Good catch. Since I created the recipe, and deleted linux-tools .. you'd
think I would have noticed this myself :)

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
> CC: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index 1438ad8..55f0c38 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -42,5 +42,3 @@ PR = "r0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
> -
> -require recipes-kernel/linux/linux-tools.inc



