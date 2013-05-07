Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZlj9-0004g5-4w
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:31:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r47HCusK008449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 10:12:56 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 10:12:56 -0700
Message-ID: <51893613.40209@windriver.com>
Date: Tue, 7 May 2013 13:12:51 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemux86: disable paravirt guest in linux 3.4, causes test failures
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
X-List-Received-Date: Tue, 07 May 2013 17:31:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-07 01:08 PM, Ross Burton wrote:
> The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
> started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
> this can be root-caused and fixed in the kernel, disable paravirtualisation
> across all kernels and all qemu machines.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

(I also have pending updates to the latest 3.4 + LTSI, so it's worth
checking to see if they happen to help here. Or was it only when these
were applied that we started seeing this ?).

Bruce

>
> [ YOCTO #4196 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index b81b9ac..18d665a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>   KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>



