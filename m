Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1561073D13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 11:09:31 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so100082548wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Aug 2015 04:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4GpwsiV6//gJjx0fLdJuQnxkUs2T0AwNYnXrVtcJ2ZI=;
	b=Ugd4ux/j/YCtAkvocw0yxSSQCgFqtPkBIYNR6AV+PLwIrwl+NFCOxRLRWW+ppYBnyT
	FLSP/mfUsoY6RO4GnvR03OCqU8lAb0LVTunwHTpt5XpFNm9gETefaFdwxtQiOwNgHUC8
	Nb4QIMhMy1FvuvCFkTHpefWT+YTBn/p4SxwRPahUlxNj+SFy04c3aGNPiFtTWuxftZmQ
	RHsLrzPWsQI6Hxe8jCl3CDcozTKqKveCu6yhzNVLztdjig3bKBh9VIyvFKEh+7Dfx1pZ
	jMQp0gqZgFeDawq/ZHSOPAN9ogN3dASm2coiA3wrpF69F1vxYubmmwYGxHrWoyGZSzZO
	zKdw==
X-Gm-Message-State: ALoCoQlrKjRMz1NxxxybOceRGyQL/5FzsvbGsLA0LwDrzT35CiSSGhhvCfQzST8btJoZTtfCyW2S
X-Received: by 10.194.20.196 with SMTP id p4mr32817887wje.86.1438600170780;
	Mon, 03 Aug 2015 04:09:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.87.1 with HTTP; Mon, 3 Aug 2015 04:09:01 -0700 (PDT)
In-Reply-To: <1438330132-1599-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1438330132-1599-1-git-send-email-nicolas.dechesne@linaro.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 3 Aug 2015 14:09:01 +0300
Message-ID: <CAHiDW_HqkrxoeB5_Xu6wJBZ=cRo3vRC3GddeiM16qp1Ui4-JTw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: patches@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Mon, 03 Aug 2015 11:09:32 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2015 at 11:08, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> Tested with X11 :
>
> * xf86-video-freedreno (and w/ XA) on IFC6410 and DragonBoard 410c
> * softpipe on DragonBoard 410c
> * using meta-qualcomm BSP

Hi Nicolas,

I believe OpenVG support has been removed in 10.6: Could you remove
the unnecessary references from the recipe (PACKAGECONFIG, PACKAGES
and FILES).

Thanks,
  Jussi

> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} | 0
>  meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb}       | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb} (78%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_10.5.8.bb
> rename to meta/recipes-graphics/mesa/mesa_10.6.3.bb
> index 072cde9..8c55064 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
> @@ -2,8 +2,8 @@ require ${BPN}.inc
>
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "5332a3576c5e3a0c3947ee6668dd4157"
> -SRC_URI[sha256sum] = "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663da2b54"
> +SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
> +SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

