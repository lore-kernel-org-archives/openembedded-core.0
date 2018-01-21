Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9E46FFD3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 05:57:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0L5vVbh015377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 20 Jan 2018 21:57:31 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 20 Jan 2018 21:57:30 -0800
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20180119155432.20848-1-otavio@ossystems.com.br>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3dd822da-8c20-6ac6-81a7-a20c1f3dca54@windriver.com>
Date: Sun, 21 Jan 2018 00:57:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180119155432.20848-1-otavio@ossystems.com.br>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH] mesa: Upgrade 17.3.2 -> 17.3.3 release
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
X-List-Received-Date: Sun, 21 Jan 2018 05:57:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-19 10:54 AM, Otavio Salvador wrote:
> The 17.3.3 release, published in January 18th, 2018. It fixes a number
> of issues since 17.3.2 release.
> 
> The release notes can be seen at:
> 
>    https://www.mesa3d.org/relnotes/17.3.3.html
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>   meta/recipes-graphics/mesa/{mesa-gl_17.3.2.bb => mesa-gl_17.3.3.bb} | 0
>   meta/recipes-graphics/mesa/{mesa_17.3.2.bb => mesa_17.3.3.bb}       | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/mesa/{mesa-gl_17.3.2.bb => mesa-gl_17.3.3.bb} (100%)
>   rename meta/recipes-graphics/mesa/{mesa_17.3.2.bb => mesa_17.3.3.bb} (88%)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> similarity index 88%
> rename from meta/recipes-graphics/mesa/mesa_17.3.2.bb
> rename to meta/recipes-graphics/mesa/mesa_17.3.3.bb
> index c2143ad32d..6e3f29a2c4 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> @@ -12,8 +12,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-anv_icd.py-improve-reproducible-builds.patch \
>              "
>   
> -SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
> -SRC_URI[sha256sum] = "e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6"
> +SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
> +SRC_URI[sha256sum] = "41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b"
>   
>   #because we cannot rely on the fact that all apps will use pkgconfig,
>   #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> 

We'll need this commit a well:
   Cherry-pick fix from mesa upstream:
        23ce168048 link mesautil with pthreads

I'll send commit once this is merged.

../Randy

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

