Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1928966091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 18:21:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2014 11:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1036,1389772800"; d="scan'208";a="539085714"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2014 11:19:43 -0700
Message-ID: <537110BF.3000109@linux.intel.com>
Date: Mon, 12 May 2014 11:19:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Drew Moseley <drew@moseleynet.net>, 
	openembedded-core@lists.openembedded.org
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
	<1399912450-27861-1-git-send-email-drew@moseleynet.net>
In-Reply-To: <1399912450-27861-1-git-send-email-drew@moseleynet.net>
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 18:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2014 09:34 AM, Drew Moseley wrote:
> From: Drew Moseley <drew_moseley@mentor.com>
>
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>   meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> index d6e6fbc..7cda19e 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> @@ -33,7 +33,7 @@ PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
>   PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
>   PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
>   PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
> -PACKAGECONFIG[glut] = "--with-glut,--without-glut,"
> +PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
>   PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
>   PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
>   PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
>

Seems the first version was merged already, so we could revert it or if 
you want to rebase this change against master, which would remove the 
configure patch and update the PACKAGECONFIG as above.

Thanks
	Sau!


