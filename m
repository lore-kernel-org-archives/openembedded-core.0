Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4FAE73199
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 23:38:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y134so5585482pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JbUF2Ki5pOqnHEfgovdUs3TKj7ujByW+eeZKaRlAl/U=;
	b=D+1pX0G1wDyaUfbnnK0vDqr5Gr1SZiA3qwI8pjuXZoZhh4sZZ3s4kRD0uNlOavtEAS
	YeXS5TNmKiymg7Ry1uE5cZG9rsOPTy8FMI/50Yxph1dPjT8u4hQkqQFjphC56g0XB+vT
	tM79iKIfwcy9+w8A+fagBqJS/ztu8QNVoPsBu9w0P/UUr9Cr7tyW0zmWEKgvvI1MWyP/
	40OCTqALljjbbkCr2S9JdLIl7waYJNrk9DBix3QgR/TOGzi+adQcarRAf/uLLlypsarg
	LwzmtAEUSzSa9FQTp8QSYvNBEVjtz8VYNaX0TQtzpMlUpjnK1Un42GA3DZkPBlYzE+Zj
	x7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=JbUF2Ki5pOqnHEfgovdUs3TKj7ujByW+eeZKaRlAl/U=;
	b=MG28WDVfmrlc/81rEUc8f6uXBKvXW0ld6G2EFX/2u6htyXhxSZGmNttFyktly9Fhmk
	UdfsAgtLEhtOAV/f/52d4e79sDZqWWikaiz1napPE6PmuDd/xZcVWHllUSKO1v5R0MhA
	OmTi2MJpj1n/yLC8w13Wp8a7+iUEtffo6+7HS/LVp8eojeSVxr2qGILmoLZvTWHsQGvC
	IsZRTKx440Jv3enQji7aOCGo6U5vUXyu5EU5YTZl+6BLHlxze0yZAavBocyoSzh4E776
	JhaA4XnEbvyGk1L1q+V/v34Z2np1sXXX7r5hfzS0R5mKCubX5S0RRwL1I39C7ZfXaDY4
	3D4w==
X-Gm-Message-State: AE9vXwM9THEO2rvLm4P+QscwdOTk9aOeNp3tL4K1rz2FZqEPvKG+fHRpqVSbHQVuDWrIxw==
X-Received: by 10.98.14.72 with SMTP id w69mr10289822pfi.119.1472254710638;
	Fri, 26 Aug 2016 16:38:30 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d8cc:d2a6:73a8:6faf])
	by smtp.gmail.com with ESMTPSA id
	18sm31274020pfn.33.2016.08.26.16.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 16:38:30 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <1472219341-21220-1-git-send-email-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <51219ed0-b8e7-4bdf-c3c3-7812dcc59cd0@gmail.com>
Date: Fri, 26 Aug 2016 16:39:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472219341-21220-1-git-send-email-nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add packageconfig for egl
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
X-List-Received-Date: Fri, 26 Aug 2016 23:38:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 8/26/16 6:49 AM, Nicolas Dechesne wrote:
> In commit 9c3a94aea1d (gstreamer1.0-plugins-bad: Move EGL requirement for
> Wayland), --enable-egl was explicitely added to the wayland packageconfig. While
> this is correct that enabling wayland requires egl, it should be possible to
> enable egl without wayland, even when using X11. For example, glimagesink can be
> used for GPU based color conversion using EGL/GLES.

the default PACKAGECONFIG coming out of recipe should append 'egl'
unconditionally, if wayland is set in DISTRO_FEATURES. otherwise it will
confuse the semantics if its hardcoded in packageocnfig for wayland

> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index d8c8179..1a94d1a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -32,6 +32,7 @@ PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
>  PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
>  PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
>  PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
> +PACKAGECONFIG[egl]             = "--enable-egl,--disable-egl,virtual/egl"
>  PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
>  PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
>  PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
> 

