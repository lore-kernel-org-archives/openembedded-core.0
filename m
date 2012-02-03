Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RtMWa-0002xi-46
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 18:02:12 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Feb 2012 08:54:13 -0800
Received: by iabz7 with SMTP id z7so5343279iab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 08:54:12 -0800 (PST)
Received: by 10.50.208.1 with SMTP id ma1mr11505626igc.4.1328288052639;
	Fri, 03 Feb 2012 08:54:12 -0800 (PST)
Received: from [10.1.10.192] (c-71-236-172-220.hsd1.or.comcast.net.
	[71.236.172.220])
	by mx.google.com with ESMTPS id d15sm12141526ibf.7.2012.02.03.08.54.11
	(version=SSLv3 cipher=OTHER); Fri, 03 Feb 2012 08:54:11 -0800 (PST)
Message-ID: <4F2C1132.8090406@intel.com>
Date: Fri, 03 Feb 2012 08:54:10 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1328257913.git.raj.khem@gmail.com>
	<5407fb2fc93f7d28a0e5000834c7b3b548826392.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <5407fb2fc93f7d28a0e5000834c7b3b548826392.1328257913.git.raj.khem@gmail.com>
Subject: Re: [PATCH 13/14] runqemu-internal: qemuarm can handle 256M
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
X-List-Received-Date: Fri, 03 Feb 2012 17:02:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2012 12:36 AM, Khem Raj wrote:
> Raise the check for max RAM supported for QEMU/arm
> its 256M since we patched it to be so in OE
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

Thanks Khem.

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu-internal |   13 +++++++------
>   1 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 21fbce3..73b8b41 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -67,13 +67,14 @@ fi
>   # QEMU_MEMORY has 'M' appended to mem_size
>   QEMU_MEMORY="$mem_size"M
>
> -# Bug 433: qemuarm cannot use>  128 MB RAM
> +# Bug 433: qemuarm cannot use>  256 MB RAM
>   if [ "$MACHINE" = "qemuarm" ]; then
> -    if [[ -z "$mem_size" || $mem_size -gt 128 ]]; then
> -        echo "WARNING: qemuarm does not support>  128M of RAM."
> -        echo "Changing QEMU_MEMORY to default of 128M."
> -        QEMU_MEMORY="128M"
> -        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 128/" `
> +    if [[ -z "$mem_size" || $mem_size -gt 256 ]]; then
> +        echo "WARNING: qemuarm does not support>  256M of RAM."
> +        echo "Changing QEMU_MEMORY to default of 256M."
> +        QEMU_MEMORY="256M"
> +	mem_size="256"
> +        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 256/" `
>       fi
>   fi
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


