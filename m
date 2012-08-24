Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T4oSs-0001Uo-3K
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 09:37:58 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Aug 2012 00:25:47 -0700
Received: by pbcxa7 with SMTP id xa7so2867902pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 00:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=LFhDA0ixijGMh/1xA1/OArS7d5pYNsKVthbPejufUnM=;
	b=EBnbr93CGskKegEBwzVK4VSl9RGlA8aik9L5wqfjVDa4KCqivt9/aaImmCMVFGn9Xe
	kXeo0QD4PTKC7Wei4lytLf6xxiZO97qjKwD4OVkLsJ2jC0Z8vaaCa8tyLGfOWioaO4DT
	H57XwFI+Tiww4FrF6/VVkXMMhTXypw3Nnr3d4nGW+1U8PaDumXmVCNMkRzAGgAbJqxoL
	sCU0gbcUyTgntTlrhe5s5iD2gVRE3rtPEQkL8ltANr6iPvw67cgxOosBaR2EMF4pcMWv
	En6AzFP3GsoJ4l9tC4f8sR6hMzUNt7JjlnQ/PX1+vF9mWWX812sgJj+yLhNike700Cz0
	YOBw==
Received: by 10.68.234.6 with SMTP id ua6mr10703107pbc.117.1345793146917;
	Fri, 24 Aug 2012 00:25:46 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id iu10sm7741418pbc.45.2012.08.24.00.25.45
	(version=SSLv3 cipher=OTHER); Fri, 24 Aug 2012 00:25:46 -0700 (PDT)
Message-ID: <50372C8A.3030202@intel.com>
Date: Fri, 24 Aug 2012 00:26:02 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQmUQqwhbshxFAL3SMpqnGMdxF9vand2jp7uRwD5M75ygmahhWRMOr+ZaF9civIurxUbtAoM
Subject: Re: [PATCH 1/4] runqemu: Honor KERNEL and ROOTFS settings from environment
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
X-List-Received-Date: Fri, 24 Aug 2012 07:37:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 10:59 AM, Khem Raj wrote:
> Expand the usage to be able to specify KERNEL and ROOTFS
> on commandline. This helps in using the script for booting
> images that are essentially not part of OE-Core
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Sure, this looks okay.

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 90998ae..290f9cc 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -54,9 +54,9 @@ error() {
>   }
>
>   MACHINE=${MACHINE:=""}
> -KERNEL=""
> +KERNEL=${KERNEL:=""}
> +ROOTFS=${ROOTFS:=""}
>   FSTYPE=""
> -ROOTFS=""
>   LAZY_ROOTFS=""
>   SCRIPT_QEMU_OPT=""
>   SCRIPT_QEMU_EXTRA_OPT=""
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


