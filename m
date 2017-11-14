Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 864507854F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:41:45 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id t69so6176616pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VWuPqrbDLO0mfRifodjA/1HNeLWL48bXb9sQgDsL9UM=;
	b=XqVoQlRc7HtUPH2bsR594DgvQ39WKMD/a7sitBJiPWq+a2lmWFQBH46mBJT5YYowAQ
	12MCSfhJMFNNM6OYxKsurFsGDn9ET4OByoJjj2KP4DsYYleDWyIqDFcqBPGpmFajhPkb
	vf1ln3Vke498YJcxSdL8eV3FuT6piHMTuLturwIrO/PsVcH09XScppPdTtXo2fZ4jYcC
	EfEDK+RJYBGlS8Y6GQ0A72dJvtFZC4cQcr6uQNnvFH0Iyr4WPVaafRXbRI+KYXKwmeRh
	DEaTTw/G9rICu4pvRPbcubck4CM+GsOGBn65xUk2w1gqx1gQlPpbKSHKrwpNABxWq6It
	kq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VWuPqrbDLO0mfRifodjA/1HNeLWL48bXb9sQgDsL9UM=;
	b=ltfuJFmpSDeIP8vRjXKDtTaqVjfr2AVN9Pqmy4XcxatnmegeUoG0C4d9yEXMv53MR7
	M2vGdhlCnq8hJLsqifLTTpuUSX+O31k8EQOl38vLGRS9Jp/RSnORZKzHkb+zyARUA56a
	RNBzOxk4KUbvf+VI1sAwPmtqXwGWVjgr2RkW0SBOUfO0ULhv1dAwucWMEJqxcWqZozEY
	DhphWINNKmmQTS0cCQ1cDbqMWXAc1ZKhHHszAzdj6xWuw+w1bYXG3TApBWADZ5UJjvJ9
	hGO6sU/dqrruHqVIgR06pbBt9/WSgWVyFzgd3yXwUWVJAr5y3fV5OS+Rq2uSIYOjKyEc
	LRkg==
X-Gm-Message-State: AJaThX4Zvrn7ppGNxQHPMzHVS6OAJkQO8u5HsfwFyUGumwrZe0rqsGtm
	GtJaDzREKcSkG3AIcq9nY4ReZ29lsnJ4IhkDWDY=
X-Google-Smtp-Source: AGs4zMZhv+mSF84y6DDZcwCN/lZFVWtyL9xfbMWsIh/ZNGYUJ3I3VKkIxfJslr68NIFuvHa0ImLI1oUJ2Cv7YYNDh6E=
X-Received: by 10.159.207.147 with SMTP id z19mr13365181plo.441.1510688506792; 
	Tue, 14 Nov 2017 11:41:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Tue, 14 Nov 2017 11:41:16 -0800 (PST)
In-Reply-To: <20171114145754.9643-26-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
	<20171114145754.9643-26-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2017 11:41:16 -0800
Message-ID: <CAMKF1spFf70gSgvNsNsFZjQUFW64fw4mfeCQZHjMWTrzrXKO1A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/27] ffmpeg: update to 3.4
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
X-List-Received-Date: Tue, 14 Nov 2017 19:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 6:57 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Schroedinger support has been dropped:
> https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/220b24c7c9
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
> similarity index 95%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
> index 57e0ac04115..42dbe5582f3 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
> @@ -25,10 +25,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://mips64_cpu_detection.patch \
> -           file://0001-build-fix-for-mips.patch \
> -          "

This patch is not deleted along with this omission. Perhaps an oversight ?

> -SRC_URI[md5sum] = "e14a0200c78ce5c918427e57cd406a0d"
> -SRC_URI[sha256sum] = "98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957"
> +           "
> +SRC_URI[md5sum] = "c64ba7247bb91e516f6a5789348fd5b5"
> +SRC_URI[sha256sum] = "aeee06e4d8b18d852c61ebbfe5e1bb7014b1e118e8728c1c2115f91e51bffbef"
>
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>  ARM_INSTRUCTION_SET = "arm"
> @@ -64,7 +63,6 @@ PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
>  PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
>  PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
>  PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
> -PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
>  PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
>  PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
>  PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

