Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A174F71A8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 16:07:17 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id k74so155797qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xE7XCfijPZMitqnZKZzYDYDar73KMfrCRv3NNuI3VO4=;
	b=Q5Ow4VNTw9T+gI46mq4g6zjOxdMwW/my/5Yt/CHd+lb44kdNfgsdSZB9EimcIV8kDf
	miUSJQmKxqSNzH1jPokThXQGFVdWUdEWFppnCrEwl9bAJz1Follch8uFKe1obP7I+frm
	xnT9oMSLjeJeFeLs8hF51Iskb8ByL9bOkuH/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xE7XCfijPZMitqnZKZzYDYDar73KMfrCRv3NNuI3VO4=;
	b=ou+H1txSFItnEs6yI0+2idBWqGn3dRypqmSfLzfZMXp714qIhywHpA17XmstutebFG
	rTcFh94zV9JVLrhRC456SKN2+nKPTpUFofYYDOVL60yP3sCbyOjPOx0+IRhhSKe0W9L4
	LfQwlJA49a8ttPK4IDkbKO5KUt4iOqct91Buwlm+qddD1R4Mx3eJzTNKc7ROxzHnqee8
	Vr0OdwPXUlPZeskrCW5D7ZodOFyYkdmKdpJA0XqI6FdMpAAgh4TAl9ExrGGX+rhg1trk
	JNm+Tjz0/8fXnca5y0qJSmHpOO7AJgdjmkfXZwxHq8pz5NSFJ6mJCVjO+ub1yzD5x1MO
	qHvw==
X-Gm-Message-State: AODbwcCclf/wPSzWQGrt73yX4hs/ERrvYt34nIkOzVHapYDcqUWO0nP/
	hGNw2NIDjvZF6QX02H/+hHAA7bZw7tPFZw5isw==
X-Received: by 10.55.74.214 with SMTP id x205mr6623195qka.231.1494432438921;
	Wed, 10 May 2017 09:07:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Wed, 10 May 2017 09:06:58 -0700 (PDT)
In-Reply-To: <1491999248-3509-1-git-send-email-dv@pseudoterminal.org>
References: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
	<1491999248-3509-1-git-send-email-dv@pseudoterminal.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 10 May 2017 18:06:58 +0200
Message-ID: <CAP71WjyY5Ze39FpMUd27QF_r9GLvv1hdWg43o_7PugOu3G6u3g@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmscube: add recipe
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
X-List-Received-Date: Wed, 10 May 2017 16:07:19 -0000
Content-Type: text/plain; charset=UTF-8

hi,

On Wed, Apr 12, 2017 at 2:14 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> This is a demo application that draws a three-dimensional spinning cube
> using EGL on top of KMS, via Mesa's GBM library. A rough counterpart to
> glxgears, it is a useful tool for BSP makers to try the 3D rendering
> functionality based on EGL and OpenGL ES in a KMS environment, without
> having to set up Wayland or X11.
>
> It is also interesting for Yocto-based  projects that do not need any
> windowing environment and instead render their visual output fullscreen
> to KMS directly, since they can use it as a reference.
>
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-graphics/kmscube/kmscube_git.bb
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
> new file mode 100644
> index 0000000..518c98e
> --- /dev/null
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Demo application to showcase 3D graphics using kms and gbm"
> +HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
> +LICENSE = "MIT"
> +SECTION = "graphics"
> +DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins-base"
> +
> +LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
> +
> +SRCREV = "e56980c28766ffb0bf8edee96b529a5b47f97137"
> +SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> --
> 2.7.4

FWIW, I tested this recipe on Dragonboard 410c and 820c, with a newer
upstream commit compared to what you have in this version:

-SRCREV = "e56980c28766ffb0bf8edee96b529a5b47f97137"
+SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"

it worked fine, including for video mode using Gstreamer and h/w video
codecs (vl42)

thanks for the recipe!

