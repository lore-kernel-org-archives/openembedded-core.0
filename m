Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.9914.1588261587321268394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 08:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R2MxQWEl;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id d3so2922066pgj.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9M2a2xAF/ztM/nJALV3aw9ZonQ55P5OxAdixZG11Swg=;
        b=R2MxQWEl520jQN5O5G4Mk7+mPl752rVqH1qFL8CGIY10HomLoLiRcpogxtJBPtdGJS
         7fbdJiGPLKeZjdLdw9DJZWen3zg0qhKChTl2KD4qk6Oz8tYgPK32S+HeU3GL0nGHDxL2
         vZ46i9KAbpdG4JJl0coohVHnixt2n0vWcCdAEUPkQsnWyANfBADxe0OkpUyN+APxLD89
         fugsaR+gjnxCuqMTSfjHaPYBqetMoient/zKA5wjlWzlc2jqpaxlsuSv4bNszq45GjpR
         B785lArJMafQggEBnU317AMDJoAjw/RimMkd6HpG04CT6CTbzX1Z8MrUTqv30h2mP78g
         Zf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9M2a2xAF/ztM/nJALV3aw9ZonQ55P5OxAdixZG11Swg=;
        b=s89XvS+0pSWWb5QrHZn5639TR8dgCZRh5j1wgBGhMHAs4uaF3FAGqiDFNcs8+Ohm3y
         /x4fKUOKAWD0kE6mU0Ro7ADqgZatzYICJHh4H9+LPk7U+PDFDSBZEe8XxO1CB7M9YgTL
         aaY75oNnY4QUGrTsFhSqpJjnHdoNXore7tFAzY6+/ljnQnBZlqGKYEqdMSczX1YuYWAC
         r9vzVJeZQ3mLtiHa/Zfu5mon5gAHwJHHBAYMsJLg0WtZq2cCnx3OEMqyg2ZT8/HVYhSk
         8QEMfyz7QaJ6fb0ClqT617TXT0+9CD77KgwVt3OTH8fm1craSHnWmBRPQ73eWI8yOomt
         73eA==
X-Gm-Message-State: AGi0PubA/ayyBf5+4nbnd0JbzxLAmenVSZo6U+1QiXSKGKWLZ73Vqylr
	iM8tOXuP2lc49dxgJnb5BrQ=
X-Google-Smtp-Source: APiQypIZDvD9lDkVVEgAVCJbsUrXEDnqhNqxBqTrE8ITFMwKP/NqRowKpaClnUPlXp9L6ph0BSH9LA==
X-Received: by 2002:a63:df0c:: with SMTP id u12mr3615337pgg.387.1588261586639;
        Thu, 30 Apr 2020 08:46:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e02c:9432:3945:4d16? ([2601:646:9200:4e0:e02c:9432:3945:4d16])
        by smtp.gmail.com with ESMTPSA id q7sm198112pgs.13.2020.04.30.08.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:46:25 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
 <20200430095815.2824-5-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com>
Date: Thu, 30 Apr 2020 08:46:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430095815.2824-5-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/30/20 2:58 AM, Alexander Kanavin wrote:
> Drop a mali-specific patch that was never ported to meson or accepted
> upstream.
> 

Does this mean it wont work with systems with mali gpu drivers any more?

if so, then its a regression, we should not drop patches just like that 
perhaps.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...bo_map-_unmap-and-use-it-or-avoid-it.patch | 117 ------------------
>   meta/recipes-graphics/kmscube/kmscube_git.bb  |   5 +-
>   2 files changed, 2 insertions(+), 120 deletions(-)
>   delete mode 100644 meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
> 
> diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
> deleted file mode 100644
> index a7a08f14e6..0000000000
> --- a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From a91c588b5a4122506e7fe949c37d530621bdd997 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
> -Date: Tue, 11 Jul 2017 14:50:37 -0500
> -Subject: [PATCH] Detect gst_bo_map/_unmap and use it (or avoid it)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Those functions are not available on libMali, thus breaking
> -builds and creating havoc.
> -
> -Removing the specific parts of the code that deal with
> -gbm_bo_map() and gbm_bo_unmap() renders the kmscube utility
> -a little less useful, but still valuable.
> -
> -Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> -Cc: Rob Clark <robdclark@gmail.com>
> -Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
> -
> -Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2017-July/163020.html]
> -Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@solution57.com>
> ----
> - Makefile.am   | 5 ++++-
> - configure.ac  | 3 +++
> - gst-decoder.c | 7 ++++++-
> - kmscube.c     | 4 ++++
> - 4 files changed, 17 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index ba064e4..3a0a50b 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -43,7 +43,6 @@ kmscube_SOURCES = \
> - 	common.c \
> - 	common.h \
> - 	cube-smooth.c \
> --	cube-tex.c \
> - 	drm-atomic.c \
> - 	drm-common.c \
> - 	drm-common.h \
> -@@ -68,3 +67,7 @@ texturator_SOURCES = \
> - 	drm-common.c \
> - 	drm-legacy.c \
> - 	texturator.c
> -+
> -+if ENABLE_GBM_MAP
> -+kmscube_SOURCES += cube-tex.c
> -+endif
> -diff --git a/configure.ac b/configure.ac
> -index 6be6541..3d20121 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -49,5 +49,8 @@ if test "x$HAVE_GST" = "xyes"; then
> - fi
> - AM_CONDITIONAL(ENABLE_GST, [test "x$HAVE_GST" = "xyes"])
> -
> -+AC_CHECK_LIB([gbm], [gbm_bo_map], [HAVE_GBM_BO_MAP=yes], [])
> -+AM_CONDITIONAL(ENABLE_GBM_MAP, [test "x$HAVE_GBM_BO_MAP" = "xyes"])
> -+
> - AC_CONFIG_FILES([Makefile])
> - AC_OUTPUT
> -diff --git a/gst-decoder.c b/gst-decoder.c
> -index 5431014..0aa7a55 100644
> ---- a/gst-decoder.c
> -+++ b/gst-decoder.c
> -@@ -332,6 +332,7 @@ set_last_frame(struct decoder *dec, EGLImage frame, GstSample *samp)
> - 	dec->last_samp = samp;
> - }
> -
> -+#if HAVE_GBM_BO_MAP
> - // TODO this could probably be a helper re-used by cube-tex:
> - static int
> - buf_to_fd(const struct gbm *gbm, int size, void *ptr)
> -@@ -357,6 +358,7 @@ buf_to_fd(const struct gbm *gbm, int size, void *ptr)
> -
> - 	return fd;
> - }
> -+#endif
> -
> - static EGLImage
> - buffer_to_image(struct decoder *dec, GstBuffer *buf)
> -@@ -410,12 +412,15 @@ buffer_to_image(struct decoder *dec, GstBuffer *buf)
> -
> - 	if (is_dmabuf_mem) {
> - 		dmabuf_fd = dup(gst_dmabuf_memory_get_fd(mem));
> --	} else {
> -+	}
> -+#if HAVE_GBM_BO_MAP
> -+	else {
> - 		GstMapInfo map_info;
> - 		gst_buffer_map(buf, &map_info, GST_MAP_READ);
> - 		dmabuf_fd = buf_to_fd(dec->gbm, map_info.size, map_info.data);
> - 		gst_buffer_unmap(buf, &map_info);
> - 	}
> -+#endif
> -
> - 	if (dmabuf_fd < 0) {
> - 		GST_ERROR("could not obtain DMABUF FD");
> -diff --git a/kmscube.c b/kmscube.c
> -index 81803be..e93da67 100644
> ---- a/kmscube.c
> -+++ b/kmscube.c
> -@@ -166,7 +166,11 @@ int main(int argc, char *argv[])
> - 	else if (mode == VIDEO)
> - 		egl = init_cube_video(gbm, video, samples);
> - 	else
> -+#if HAVE_GBM_BO_MAP
> - 		egl = init_cube_tex(gbm, mode, samples);
> -+#else
> -+		printf("gbm_bo_map() support missing\n");
> -+#endif
> -
> - 	if (!egl) {
> - 		printf("failed to initialize EGL\n");
> ---
> -2.22.0
> -
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index a1a295f660..c72fbc61a9 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -6,9 +6,8 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
>   
>   LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
>   
> -SRCREV = "76bb57d539cb43d267e561024c34e031bf351e04"
> -SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
> -    file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
> +SRCREV = "4660a7dca6512b6e658759d00cff7d4ad2a2059d"
> +SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
>   UPSTREAM_CHECK_COMMITS = "1"
>   
>   S = "${WORKDIR}/git"
> 
> 
> 
> 
