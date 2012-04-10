Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHd6i-0006PM-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:35:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 08:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127351983"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:26:20 -0700
Message-ID: <4F84511C.3050807@linux.intel.com>
Date: Tue, 10 Apr 2012 08:26:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333672315-13193-1-git-send-email-josh@linux.intel.com>
In-Reply-To: <1333672315-13193-1-git-send-email-josh@linux.intel.com>
Subject: Re: [PATCH] mesa-common: package gl.pc in libgl-dev
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
X-List-Received-Date: Tue, 10 Apr 2012 15:35:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 05:31 PM, josh@linux.intel.com wrote:
> From: Joshua Lock<josh@linux.intel.com>
>
> gl.pc should be packaged in libgl-dev not the mesa-dev package
>
> Fixes [YOCTO #2059]
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa-common.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index 59e8e64..2b90aed 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -46,7 +46,7 @@ FILES_libglu = "${libdir}/libGLU.so.*"
>   FILES_libosmesa = "${libdir}/libOSMesa.so.*"
>
>   FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
> -FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
> +FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
>   FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
>   FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
>

Merged into OE-Core

Thanks
	Sau!


