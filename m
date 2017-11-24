Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3D78A71A50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 19:58:21 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id o41so26511339lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=llH4Ta6pQOrXZJRH9sjKwnmA88dHa8eAIGO5T7ySvoU=;
	b=RdJVjdu0EFvu8VFRCyLtz8EIDj6jjxfB0KQ2uDIxF3a4WVDJDNy8gWZTm14MAoZOb/
	OY42X2E2LQMe6Mu49f/Jf+sad5Y3xs66Hjib4pHLFO+6zbHgaresMmSVgxMnTzvrzVK+
	c0Lx5NehrPUzirRkgDFeC0965kd888i022j6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=llH4Ta6pQOrXZJRH9sjKwnmA88dHa8eAIGO5T7ySvoU=;
	b=JiAaJCGqk/21AgctBM69+m03VC+2l6F3mqoJ96NDyNIscGp8lke+mYucnMWB6bNDrP
	tLM/59SW0e/YUaXeL2goAKTrjxtprtHp3awqfRsxDTFrKw2i39cSjKhwUteDraE1Bbra
	Z9VSGT0GNlv25zkpmlaeymBPCYdtXLjbNlkDmGsL+y98RamV5w/MbFq55LHv29GaArIn
	4vK5L1drdC+yg/jxFQ9N1FYwiUbAl5QqBEhmNPWX7YSPuvCxf5fOIjU9BGKJvm4iYkbc
	VuInPHivAIrbS893K9oajMjpO/RFTM+Pla2DAyq7xEh/hoadQi0RyVhA9jRgCIe7RDfU
	zJ6g==
X-Gm-Message-State: AJaThX5KpVJ5oU5FtsCzh1WY0iJhdvddW8Ul/2FwgeIMoe/JsJllRA5o
	04M/haj6pRLr/ukIcb0OmpfWQA==
X-Google-Smtp-Source: AGs4zMYRiBcv+Wf2IcMGunRs5XkM17d1UXJmuJjH26eKn9h3/6+RTtVa07ac8+2cKXvtTr5u/+1Oew==
X-Received: by 10.46.41.25 with SMTP id u25mr12225332lje.130.1511553502690;
	Fri, 24 Nov 2017 11:58:22 -0800 (PST)
Received: from [10.5.20.18] ([62.117.114.130])
	by smtp.googlemail.com with ESMTPSA id
	t76sm3850811lff.84.2017.11.24.11.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 11:58:21 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <3c7c379d-44d8-162a-d941-a7d13ba48460@linaro.org>
Date: Fri, 24 Nov 2017 22:58:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
Subject: Re: [rocko][PATCH] weston: add patch to set pitch correctly for subsampled textures
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
X-List-Received-Date: Fri, 24 Nov 2017 19:58:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

This exact patch also applies to pyro.
Should I send the separate "[OE-core][pyro][PATCH] weston: add patch to set pitch correctly for subsampled textures" email,
or just asking to merge it into pyro as well is enough?

Thanks,
Andrey

On 24.11.2017 22:47, Andrey Konovalov wrote:
> This fixes display issue with YUV420/I420 and NV12 formats, that
> can result in crash of weston.
> 
> The master branch has this fix as part of commit 148920f3971d "weston:
> Bump version to 3.0.0". The patch has been rebased to apply cleanly
> to weston 2.0.0.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>   ...t-pitch-correctly-for-subsampled-textures.patch | 55 ++++++++++++++++++++++
>   meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 +
>   2 files changed, 56 insertions(+)
>   create mode 100644 meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> 
> diff --git a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> new file mode 100644
> index 0000000..c188018
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> @@ -0,0 +1,55 @@
> +Multi-plane sub-sampled textures have partial width/height, e.g.
> +YUV420/I420 has a full-size Y plane, followed by a half-width/height U
> +plane, and a half-width/height V plane.
> +
> +zwp_linux_dmabuf_v1 allows clients to pass an explicit pitch for each
> +plane, but for wl_shm this must be inferred. gl-renderer was correctly
> +accounting for the width and height when subsampling, but the pitch was
> +being taken as the pitch for the first plane.
> +
> +This does not match the requirements for GStreamer's waylandsink, in
> +particular, as well as other clients. Fix the SHM upload path to
> +correctly set the pitch for each plane, according to subsampling.
> +
> +Tested with:
> +  $ gst-launch-1.0 videotestsrc ! waylandsink
> +
> +Upstream-Status: Backport [https://patchwork.freedesktop.org/patch/180767/]
> +
> +Signed-off-by: Daniel Stone <daniels@collabora.com>
> +Fixes: fdeefe42418 ("gl-renderer: add support of WL_SHM_FORMAT_YUV420")
> +Reported-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> +Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=103063
> +
> +---
> + libweston/gl-renderer.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
> +index 244ce309..40bf0bb6 100644
> +--- a/libweston/gl-renderer.c
> ++++ b/libweston/gl-renderer.c
> +@@ -1285,14 +1285,13 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> + 		goto done;
> + 	}
> +
> +-	glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch);
> +-
> + 	if (gs->needs_full_upload) {
> + 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> + 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> + 		wl_shm_buffer_begin_access(buffer->shm_buffer);
> + 		for (j = 0; j < gs->num_textures; j++) {
> + 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> ++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> + 			glTexImage2D(GL_TEXTURE_2D, 0,
> + 				     gs->gl_format[j],
> + 				     gs->pitch / gs->hsub[j],
> +@@ -1317,6 +1316,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> + 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, r.y1);
> + 		for (j = 0; j < gs->num_textures; j++) {
> + 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> ++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> + 			glTexSubImage2D(GL_TEXTURE_2D, 0,
> + 					r.x1 / gs->hsub[j],
> + 					r.y1 / gs->vsub[j],
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> index 54b07bd..063494c 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> @@ -12,6 +12,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>              file://0001-configure.ac-Fix-wayland-protocols-path.patch \
>              file://xwayland.weston-start \
>              file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> +           file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
>   "
>   SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
>   SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
> 


