Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxj8-0004li-Fu
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:50:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 May 2012 09:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148463656"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2012 09:40:27 -0700
Message-ID: <4FBFB5FB.5090609@linux.intel.com>
Date: Fri, 25 May 2012 09:40:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
Cc: Steffen Sledz <builder@dresearch-fe.de>
Subject: Re: [PATCH] dropbear: fix include dependent PR generation
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
X-List-Received-Date: Fri, 25 May 2012 16:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 07:16 AM, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz<sledz@dresearch-fe.de>
> ---
>   meta/recipes-core/dropbear/dropbear.inc        |    2 ++
>   meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 2d6aeb2..2de442c 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -2,6 +2,8 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
>   HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>   SECTION = "console/network"
>
> +INC_PR = "r0"
> +
>   # some files are from other projects and have others license terms:
>   #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>   LICENSE = "MIT"
> diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
> index 4f0ef80..8323a33 100644
> --- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
> @@ -3,4 +3,4 @@ require dropbear.inc
>   SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
>   SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
>
> -PR = "r0"
> +PR = "${INC_PR}.0"

Merged into OE-Core

Thanks
	Sau!


