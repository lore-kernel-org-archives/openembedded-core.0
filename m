Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wat-0000jy-3B
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:02:47 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 08:57:17 -0700
Received: by yxm34 with SMTP id 34so13812162yxm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 08:57:15 -0700 (PDT)
Received: by 10.236.182.135 with SMTP id o7mr56736046yhm.48.1317225435506;
	Wed, 28 Sep 2011 08:57:15 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id 13sm89638994ans.9.2011.09.28.08.57.14
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 08:57:15 -0700 (PDT)
Message-ID: <4E8343D9.8080807@intel.com>
Date: Wed, 28 Sep 2011 08:57:13 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316403317.2404.15.camel@elmorro>
In-Reply-To: <1316403317.2404.15.camel@elmorro>
Subject: Re: [PATCH 2/2] sysprof: update to version 1.1.8
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
X-List-Received-Date: Wed, 28 Sep 2011 16:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2011 08:35 PM, Tom Zanussi wrote:
> Also removes unused SCR_URI checksums.
>
> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   meta/recipes-kernel/sysprof/sysprof_git.bb |    9 +++------
>   1 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
> index 1af5822..10bde04 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>   DEPENDS = "gtk+ libglade"
>
> -SRCREV = "38a6af1f0a45e528fd2842983da71e0f23c70d6a"
> -PR = r1
> -PV = "1.1.6+git${SRCPV}"
> +SRCREV = "4692f85f625f4fd969cef4ab5dc47cc4655c87f9"
> +PR = "r2"
> +PV = "1.1.8+git${SRCPV}"
>
>   SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
>              file://define-NT_GNU_BUILD_ID.patch \
> @@ -16,9 +16,6 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
>   SRC_URI_append_mips = " file://rmb-mips.patch"
>   SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
>
> -SRC_URI[md5sum]    = "80902a7b3d6f7cb83eb6b47e87538747"
> -SRC_URI[sha256sum] = "1c6403278fa4f3b37a1fb9f0784e496dce1703fe84ac03b2650bf469133a0cb3"
> -
>   S = "${WORKDIR}/git"
>
>   inherit autotools

Merged into OE-Core

Thanks
	Sau!


