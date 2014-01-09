Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id D38B7610CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 13:58:21 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id w5so2973166qac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 05:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SoAe8qEpV80sWVI7Z8rEJI543yBqtSCj3I5yCVSy+Xg=;
	b=Kbr/9li6agsPi91pORlqNYsbZkF2rWcmvAVOr59ImGChMUXtW4xsfM78UQzD/o8a3H
	HK/quVHOQ5wf2qGsx0Z7i8UazFa32OUEzh1bNSCB8nqtYvgMzgC/dQfyXaxJx17DhD/l
	aguKJMDEcvD3SvnfFY4sqfo0iaHxR7iNP/y9CR3nc+YUTjfcAQOiIUVSftotVlajEXtn
	bUD5CB7uHIkmo+AbUC1Zi7JGnS+VrZwd5D50O7T9p4pd1iD/O7xTNkEITjSAHcUWkGUb
	XkK6vSTMjyufkE6lJ08Zyjx64EMHS5mUgnzd/qAT541is8fvsU6lPEwUC+SEj0dj74I3
	D4tA==
X-Gm-Message-State: ALoCoQmW3e+jBRjo9XWZtoOlS3SuG7FMwvJcZRDjX+OXDFKtvtgUhPnKjaKvE9FvvX3ozz9vtvCe
X-Received: by 10.49.127.205 with SMTP id ni13mr8010587qeb.40.1389275902478;
	Thu, 09 Jan 2014 05:58:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Thu, 9 Jan 2014 05:58:02 -0800 (PST)
In-Reply-To: <1389275573-45886-1-git-send-email-yasir_khan@mentor.com>
References: <1389275573-45886-1-git-send-email-yasir_khan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jan 2014 13:58:02 +0000
Message-ID: <CAJTo0Lbi2kkcBy-iLjJHrZ3r7Wqv12Q=vOZxmmhfV3Wq5TVrGw@mail.gmail.com>
To: Yasir Khan <yasir_khan@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Fix application demo2
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
X-List-Received-Date: Thu, 09 Jan 2014 13:58:22 -0000
Content-Type: text/plain; charset=UTF-8

The patch is missing signed-off and more importantly upstream-status tags.

Ross

On 9 January 2014 13:52, Yasir Khan <yasir_khan@mentor.com> wrote:
> From: Yasir-Khan <yasir_khan@mentor.com>
>
> Simple fix for demo2 application. Pass color array to glColorPointer.
>
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  .../mesa/mesa-demos/fix-demo2-color.patch          |   13 +++++++++++++
>  meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |    3 ++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch
>
> diff --git a/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch b/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch
> new file mode 100644
> index 0000000..34e9994
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch
> @@ -0,0 +1,13 @@
> +diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c
> +index 71a1a31..505b474 100644
> +--- a/src/egl/opengl/demo2.c
> ++++ b/src/egl/opengl/demo2.c
> +@@ -35,7 +35,7 @@ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
> +    }
> +
> +    glVertexPointer(2, GL_FLOAT, 0, v);
> +-   glColorPointer(4, GL_FLOAT, 0, v);
> ++   glColorPointer(4, GL_FLOAT, 0, c);
> +    glEnableClientState(GL_VERTEX_ARRAY);
> +    glEnableClientState(GL_COLOR_ARRAY);
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> index 4bb92f4..225d466 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
> @@ -14,7 +14,8 @@ DEPENDS = "virtual/libgl glew"
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
>          file://glut.patch \
>          file://egl-mesa-screen-surface-build-fix.patch \
> -        file://egl-mesa-screen-surface-query.patch"
> +        file://egl-mesa-screen-surface-query.patch \
> +       file://fix-demo2-color.patch"
>
>  SRC_URI[md5sum] = "9df33ba69a26bbfbc7c8148602e59542"
>  SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a87a828"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

