Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 68FC47F956
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:27:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so991707wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2X73yeXmC/zPXesX7nOM7XVbS3VtTSrB1QyNEAUNM38=;
	b=GhymOsnRiutkvJ4S0BFue95jpuUrGc3L3GniwayFzT65YcdacSAtlk1/QTpNWRFOxJ
	IWF50KcihRoyO1XhuA0qQLP52HG9C83Qp7UJIp85dqObybuq9aeYIkMu2zzXu+B3uIJz
	Nrjp+PlU1l/ApqYwHRgPh7YfoCl9okpIhskfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2X73yeXmC/zPXesX7nOM7XVbS3VtTSrB1QyNEAUNM38=;
	b=WBI12YkLI4Fr9SoIJbnBNIC17kasytfF1TAvrFvcmTPWgmkCq8hvzvdNosZ7JqHXSy
	zD+GqbxapqncJ7BGpPyWtEW3k9LHQH3yyUw+fhx0nm1H7gh7FIoW+Ci8J8WHBxy/cjbi
	9TU1rOswK+T3If37LYN/7EjMg/3q7wkSi0xAKIMqF3DveTUMscmnt/nNSkNwyJ6Nx9hi
	2tkIQzKr7ONG12lY+Ntpz+ot5lMqYJBw1bvUtwufP5qiODFd9Ji6lIaoV7JIVywNW8oY
	LKj7TcB06x0duNWPoy3RoebECzWXtxHb/Y9RT38exwUpZFeNHdWct2uu6909k53gHsEs
	Xw3g==
X-Gm-Message-State: APjAAAWMlZ1Ygr0/IAROGoV1NXY6anss254JUtsKTvn09jsuoWFvphkI
	/6O2v85hhKPR2wTBORL56jyhxw==
X-Google-Smtp-Source: APXvYqwScXmbBqHmDkkmO12xdcrXYX1MZc2HNgCzVaCBHqMPhUgcHbhVkT71L1AMGjjj/Yesq29CPQ==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr825511wmh.74.1568672868195;
	Mon, 16 Sep 2019 15:27:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q15sm429631wrg.65.2019.09.16.15.27.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 15:27:47 -0700 (PDT)
Message-ID: <85c976042f32c1ddf1a3384ac31c946573087bbe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Andrew F. Davis" <afd@ti.com>, Denys Dmytriyenko <denys@ti.com>, 
	Gowtham Tammana <g-tammana@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Mon, 16 Sep 2019 23:27:46 +0100
In-Reply-To: <20190913193614.4882-3-afd@ti.com>
References: <20190913193614.4882-1-afd@ti.com>
	<20190913193614.4882-3-afd@ti.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gtk+3: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Mon, 16 Sep 2019 22:27:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-13 at 15:36 -0400, Andrew F. Davis via Openembedded-core wrote:
> The dependency is for EGL and GLES2 libraries. On some systems these
> are not provided by Mesa, list what is actually needed so the system
> can choose the correct provider.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 77b6c31536..7ec40dcbf5 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -52,7 +52,7 @@ PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fon
>  # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
>  PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
> -PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
> +PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/gles2 wayland-native"
>  PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
>  
>  prepare_gtk_scripts() {

This breaks things:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/1037

step1b: ERROR: Nothing PROVIDES 'virtual/gles2' (but /home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb DEPENDS on or otherwise requires it). Close matches:

Cheers,

Richard




