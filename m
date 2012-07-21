Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNe0-0005Zg-Br
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:34:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2012 17:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="169161847"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 17:22:39 -0700
Message-ID: <5009F64F.9020508@linux.intel.com>
Date: Fri, 20 Jul 2012 17:22:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120628191246.GA5532@localhost.jama.net>
	<1342781343-16277-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1342781343-16277-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] util-linux: register reset u-a to bindir like busybox does
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
X-List-Received-Date: Sat, 21 Jul 2012 00:34:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 03:49 AM, Martin Jansa wrote:
> * fixes http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/024586.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 688a5be..00e5d7c 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -136,7 +136,8 @@ ALTERNATIVE_${PN} += "setsid chrt flock hwclock"
>   ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>   ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
>   ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
> -ALTERNATIVE_LINK_NAME[reset] = "${base_bindir}/reset"
> +ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
> +ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
>   ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
>   ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>   ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 7f2c2a9..0f5fdc6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r0"
> +PR = "r1"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>

Merged into OE-Core

Thanks
	Sau!


