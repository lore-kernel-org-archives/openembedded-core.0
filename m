Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC4427317E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 19:05:44 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fl4so2780075pad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 11:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=MfnZkzqvGv+OzAMdW3lx7Bh5fWdymKcUN+x7C0VCQng=;
	b=DFs6REsKBoW7ml1paLkNL/kDnBPnYam7APLfcLTroyHzule0fBzRz5xTQ0M8ReTETt
	23S7HIw4wVNP6JxCpvyQDDCo8NaGjZd7UxjqsENrG3A0s8HDNX7G3R7+yRK1PNhzXr/G
	3P6CCB/l+X1+MJHxp30E77nxzJBOLX3KidUsoYED2UeMQ2rWW+TACW76xB02dHhkYABB
	VkaZ5TaF+dDiROP9PDD/Elq+T8SIVsU9/bvgpVtOEnv6MkPRqxnyJDVcVV0FLfA6fArJ
	8XkzXZUweLs/XjvGUocXRrSS7ZEHGf5UCLqdpkzlf9UCp3q+szNj0HRg/dtvW/I6GYKx
	0IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MfnZkzqvGv+OzAMdW3lx7Bh5fWdymKcUN+x7C0VCQng=;
	b=dguLDtMcSZS1FryGMrc6iv/tfYpGiuXLz5+9w+KUj4x52o0Dos7CfPrTxaP5Mw7GOQ
	zBlSoA2gu7f5A4t2GdtjA6Uaps0Tuh1UxEv1yXO4Rz7sDE8v6dEbqnzbPbRrWiV6Sob5
	ZBUulKQvTNYLWf+eVcohQQGXiigRguO39pLgFh7MVvKxkcG9+iQ3TlbikUASzDGq+SdG
	ZeE8qge4GIMQ6h3Yl9U64UWhqsQ/nKEo+7Eq7ZOl/BF9m4pQ7Tpy4N0Ru3JoMVwNZBZy
	3EyQfbRx8oAj01XLzB6ahpI40MGptHD/YiO6Gr6g8gCeZnI0XcWegG+ZedapubDIYY8Z
	W4xA==
X-Gm-Message-State: AG10YOTTghyGQddbT5+uKZVcKHcY7lJV7d6GIxBCyk1K2ChKQrQvpVi0LpTkK1WYGqlHKA==
X-Received: by 10.66.122.36 with SMTP id lp4mr69552215pab.31.1455217545530;
	Thu, 11 Feb 2016 11:05:45 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:2cc3:4239:40ed:fb52?
	([2601:202:4000:1239:2cc3:4239:40ed:fb52])
	by smtp.googlemail.com with ESMTPSA id
	ah10sm14025445pad.23.2016.02.11.11.05.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 11:05:44 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56BCDB81.5010208@gmail.com>
Date: Thu, 11 Feb 2016 11:05:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Thu, 11 Feb 2016 19:05:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

This update includes  CVE-2016-2213

Fixes out of array read
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=0aada30510d809bccfd539a90ea37b61188f2cb4


On 02/10/2016 04:42 AM, Alexander Kanavin wrote:
> Add libxv dependency only when libavdevice is enabled (as nothing else needs it).
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb}                   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb} (94%)
> 
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> similarity index 94%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> index 7107803..72393b3 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> @@ -15,19 +15,19 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
>  
> -SRC_URI[md5sum] = "b34164bd181f4f81c21da3dd131d919d"
> -SRC_URI[sha256sum] = "76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7"
> +SRC_URI[md5sum] = "0cff5dae51375f0a31a651f986ed1534"
> +SRC_URI[sha256sum] = "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa"
>  
>  # Should be API compatible with libav (which was a fork of ffmpeg)
>  # libpostproc was previously packaged from a separate recipe
>  PROVIDES = "libav libpostproc"
>  
> -DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
> +DEPENDS = "alsa-lib zlib libogg yasm-native"
>  
>  inherit autotools pkgconfig
>  
>  PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> -PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
> +PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
>  PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
>  PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
> 

