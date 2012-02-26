Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S1TNe-0006g3-0P
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 02:58:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2012 17:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111897532"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2012 17:49:04 -0800
Message-ID: <4F498F90.80309@linux.intel.com>
Date: Sat, 25 Feb 2012 17:49:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330116316-3304-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1330116316-3304-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] layer.conf: use += for SIGGEN_EXCLUDERECIPES_ABISAFE and split to multiple lines
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
X-List-Received-Date: Sun, 26 Feb 2012 01:58:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 12:45 PM, Martin Jansa wrote:
> * += is important, because if oe-core is in BBLAYERS after some other
>    layers with SIGGEN_EXCLUDERECIPES_ABISAFE it overwrites their entries
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/conf/layer.conf |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index c0c2930..dac9c97 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -18,4 +18,13 @@ PATH := "${PATH}:${COREBASE}/scripts"
>
>   QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
>
> -SIGGEN_EXCLUDERECIPES_ABISAFE = "sysvinit-inittab shadow-securetty opkg-config-base netbase formfactor xserver-xf86-config pointercal base-files"
> +SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> +  sysvinit-inittab \
> +  shadow-securetty \
> +  opkg-config-base \
> +  netbase \
> +  formfactor \
> +  xserver-xf86-config \
> +  pointercal \
> +  base-files \
> +"
Merged into OE-core

Thanks
	Sau!


