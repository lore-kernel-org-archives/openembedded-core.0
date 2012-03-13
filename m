Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UkJ-0003jf-P0
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:38:47 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77008008"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:30:02 -0700
Message-ID: <4F5F760A.3020607@linux.intel.com>
Date: Tue, 13 Mar 2012 09:30:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331241861-15372-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331241861-15372-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH v2] udev-164: fixup "don't hardcode path to pidof"
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
X-List-Received-Date: Tue, 13 Mar 2012 16:38:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2012 01:24 PM, Andreas Oberritter wrote:
> * Remove -e shell option, because pidof may return nonzero.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Of course I forgot to bump PR.
>
>   meta/recipes-core/udev/udev/init   |    2 +-
>   meta/recipes-core/udev/udev_164.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index f9e9014..d521685 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/sh
>
>   ### BEGIN INIT INFO
>   # Provides:          udev
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> index d661044..c5813ec 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
>   include udev.inc
>
> -PR = "r12"
> +PR = "r13"
>
>   SRC_URI += "file://udev-166-v4l1-1.patch"
>
Merged into OE-Core

Thanks
	Sau!


