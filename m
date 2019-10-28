Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 187207F9C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:44:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 22so9070289wms.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gWqMLOFoftUCA/JxeWwtm5RyCRHWRjL4PsNy0Z3C64k=;
	b=Sj+XJBvSMFsmWw4DY0k8fe/jpdnws1sZTosP5Z8Fghog29YtuEEFBMMaLKad20WYUY
	C9aXNcmaD8+DpErrTPXa9Rwz9cRRJ1PdYjNSFIpFYRRFMxfvIWkQZ+N8T9rd7zJWPNQ6
	fi89q3ZCPOkeDcG5Pht/PTI8/WLYajbxg/HAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gWqMLOFoftUCA/JxeWwtm5RyCRHWRjL4PsNy0Z3C64k=;
	b=hTAmbs8x8DVDdljoa1L8ako6daMze9tdWTR967FkfWFDTklUf04CqhFdQPUdv7hQyU
	bARC5muyhqWts+Uy04yegm8pmZHSC/E4ASaTb9Raz+JaRKx+CbiZI5ljHGf0Vh0FtRfL
	nCHKMIvlTSi6Tew4wT2k7WCA2pjB+7NYJ/zFHy/TKY6c8HlK/gn+DZDObZBMYUNegyss
	1e9aZ8iRfEVYHcIlDhB5SXLyDj2w/s73ZHv/zB8EM3T+RR2yXHS3djjmvzNx0vhw136h
	+/AEmO/5dRMFTRRtKkOS0jAu4bXrmY8FAASvaNDr9hqNZAknvcHXntgIzzj437g7bhJD
	jGog==
X-Gm-Message-State: APjAAAX4tdvsiw/h0u2RnR3cuaOHyhxtSHlIJoWkawBFNvdu4/yE+rwC
	jl3qz8McpFL7AsFPhbc2gvdycxgvAKD6bw==
X-Google-Smtp-Source: APXvYqzllLDuXe6WzYJq91jDKkj7MtVyZ2tQAQOr5if0nFMW+4sEHYX6sw2EoEAIKuV92NbNhkuX9w==
X-Received: by 2002:a05:600c:24cb:: with SMTP id
	11mr28594wmu.141.1572270289892; 
	Mon, 28 Oct 2019 06:44:49 -0700 (PDT)
Received: from hex (100.50.158.77.rev.sfr.net. [77.158.50.100])
	by smtp.gmail.com with ESMTPSA id
	y13sm16590805wrg.8.2019.10.28.06.44.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 06:44:49 -0700 (PDT)
Message-ID: <4c399ed0039fe394b53979bc52fb2f65d40664cf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 13:44:47 +0000
In-Reply-To: <20191027150425.13079-1-bunk@stusta.de>
References: <20191027150425.13079-1-bunk@stusta.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Mon, 28 Oct 2019 13:44:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-10-27 at 17:04 +0200, Adrian Bunk wrote:
> This LD_PRELOAD trick is not really suitable for busybox,
> so can be the only part of coreutils needed.
> 
> coreutils depends on the new package,
> so nothing changes when installing coreutils.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> v3: coreutils-native fixed
> ---
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

This is better but there look to be nativesdk warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1406

Cheers,

Richard


