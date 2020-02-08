Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9EC60D27
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 07:46:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s10so4728075wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 23:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WEKzgmlbWEL9aFLPWVDipCWZXBQE5k63BTMYO6gt8eY=;
	b=AbPW0Nk3RwdmWe+UT/ndk/MiSyglRnFS01I6or7AibwL5Qoek0nWM1C+81xwb2CdGO
	duPS+3oaL3uluueo5TJa3xEcU9v9pDi0ok4JSmGN7GqCQhRyUVQc0OzNDQ4jM65Do70b
	1OLjPMHFMfrMHpQIkhu2irrnHbpfYdlpGXALM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WEKzgmlbWEL9aFLPWVDipCWZXBQE5k63BTMYO6gt8eY=;
	b=F4b9ztJi0D+iQHB7h2GYIwSSuSHvCMz9nBhqMWTd5E0KcFSoNBaY7m32OTiQNalLzz
	ld2uNdgVYRJHfqF6EPH2gkG2aeTL1ycoOMmUni1XLFFCGdYFULppwXJLj8VT7TCSVdbV
	6mP42ycuoenFMCsZc44TkEHtmuU68V9cpWoTzG760AM1PWcSOOkbv6O0Fy13QFUgZeLC
	G+NFgoJnm1BAVgTycZZgQW51jzuzCPdiyJSsww1yqYzG22+ctdeqBoGtoLy+WPyBbQ2W
	bQSi2V9ERv6Zt2OX4yfR74hk9/HPNJz+j4du1dMGWmJPacFrO7rn1kAPadtbHHtLzjJq
	nYQQ==
X-Gm-Message-State: APjAAAVzF7X9eJFgSaPw1BSZ94X6NFaUOTIsBkMeFJvVLPblUK1763YF
	zz4uskBLmCQ95uOKXKITVCuKSA==
X-Google-Smtp-Source: APXvYqyzEVd/Nycut1VVBUIjYEgvTFr+JByi35Vok6vLxOQH/+L7GIYqztD6VaS7qeb8KQpE53Ye8Q==
X-Received: by 2002:a05:600c:294:: with SMTP id
	20mr3126133wmk.135.1581147974077; 
	Fri, 07 Feb 2020 23:46:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y185sm6665496wmg.2.2020.02.07.23.46.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 23:46:13 -0800 (PST)
Message-ID: <91dffeba4f2b203b8fd53a0bfc50f85115644f41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Feb 2020 07:46:12 +0000
In-Reply-To: <1581107275-6540-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581107275-6540-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] pciutils: upgrade 3.6.2 -> 3.6.4
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
X-List-Received-Date: Sat, 08 Feb 2020 07:46:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-07 at 12:27 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../pciutils/{pciutils_3.6.2.bb => pciutils_3.6.4.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/pciutils/{pciutils_3.6.2.bb => pciutils_3.6.4.bb} (92%)
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
> similarity index 92%
> rename from meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> rename to meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
> index 413421cd8a..034bb63dc9 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
> @@ -11,8 +11,8 @@ DEPENDS = "zlib kmod"
>  SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
>             file://configure.patch"
>  
> -SRC_URI[md5sum] = "77963796d1be4f451b83e6da28ba4f82"
> -SRC_URI[sha256sum] = "db452ec986edefd88af0d222d22f6102f8030a8633fdfe846c3ae4bde9bb93f3"
> +SRC_URI[md5sum] = "4343b37e19f319ce8f3d59c30031790e"
> +SRC_URI[sha256sum] = "f67ff732976e2db2a5ccdf3960020796526ba6b05f6b1cdd24b7b206af706055"
>  
>  inherit multilib_header pkgconfig

Patches need refreshing:

WARNING: pciutils-3.6.4-r0 do_patch: Fuzz detected:
WARNING: pciutils-3.6.4-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Cheers,

Richard


