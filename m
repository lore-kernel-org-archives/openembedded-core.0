Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuyuU-0005Ly-T2
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:13:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Feb 2012 20:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64289385"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 20:05:30 -0800
Message-ID: <4F31F48A.2000603@linux.intel.com>
Date: Tue, 07 Feb 2012 20:05:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com> <4F2FE7E4.9040902@mentor.com>
	<4F2FE80D.30600@mentor.com>
In-Reply-To: <4F2FE80D.30600@mentor.com>
Subject: Re: [PATCH v4 1/3] systemtap: bump SRCREV to grab version 1.7
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
X-List-Received-Date: Wed, 08 Feb 2012 04:13:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 06:47 AM, Wade Farnsworth wrote:
> Bump SRCREV to the latest stable version of systemtap.
>
> Signed-off-by: Wade Farnsworth<wade_farnsworth@mentor.com>
> ---
>   meta/recipes-kernel/systemtap/systemtap_git.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index ebacc43..dff08ee 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>   DEPENDS = "elfutils sqlite3"
>
> -SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
> -PR = "r2"
> -PV = "1.6+git${SRCPV}"
> +SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
> +PR = "r0"
> +PV = "1.7+git${SRCPV}"
>
>   SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
>

Merged v4 into OE-core

Thanks for your support

	Sau!


