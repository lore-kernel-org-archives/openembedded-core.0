Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.4199.1622066913966116202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 15:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NXJbkCjB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 16so1563217wmj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3wY+4o7ISyDa3DRvWxz0gGLrTy+gwvfp7sPzrrVVWy8=;
        b=NXJbkCjBkNwZoSTexh66O/uSCJTo74u8X8MBbj6znIB8zgpvJ9git8ChY0ForrtuqO
         j4godx8SsPcQhhzRGB5EITytzhQ5eyldJSVvwSViz3bGiBGcrUDTQzCLRHH7IcEU2aNE
         nnYUleXYJZWAoLkpkIUdooiNuDhTcnu1oBdjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3wY+4o7ISyDa3DRvWxz0gGLrTy+gwvfp7sPzrrVVWy8=;
        b=okwQkpu8CuAyV2WFo7xZB0CJJgkQ1OeIFmhUajSncYpnYwS4wEsYCXPzCD1WNqWv50
         C4UInsBoNa3qD801LtNVxj6D+yABMoawqkOyIJ/Bu3/yWymmL+wWd6P7TzQ1yR009w5D
         PSazLRUfTZSM5vmCerVBlS/YeyoimRGs13T7KMwHTDgiBjFLOeiMCyTgnuvhp0Jy6/5h
         0gujKe2X62emjb2LXD6b4UgquAA2C/P7Cp5EGc/nT0pl6ATltWslMetabL3Z5SxvzI5k
         bo+ejpnOILGqwCd/ihiEtpJK7BTBGIzJES6WRHmGjImP4Z3fctSENAsspL5GOm2FZn2c
         QSWg==
X-Gm-Message-State: AOAM530BFBtKjiMiojhDdtpvC3k+TOW9EleG2D1p0kZlfFcnPkqajn9H
	c1reTO5li8gMPO/hxvXKJI7W9w==
X-Google-Smtp-Source: ABdhPJw/us87jcha0N1X94vEoaaXJ7t1oZ/jInw59iB7TZfRQoG+5tclGyF5vT98dLYIv06oHWjJRg==
X-Received: by 2002:a05:600c:22cf:: with SMTP id 15mr5279469wmg.81.1622066912389;
        Wed, 26 May 2021 15:08:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46? ([2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46])
        by smtp.gmail.com with ESMTPSA id h15sm423407wmq.1.2021.05.26.15.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 15:08:32 -0700 (PDT)
Message-ID: <1cda2f133faff4948af66319d90f4817ea390e65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] images: add ptest images based on core-image-minimal
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 May 2021 23:08:29 +0100
In-Reply-To: <20210526204018.496352-3-alex.kanavin@gmail.com>
References: <20210526204018.496352-1-alex.kanavin@gmail.com>
	 <20210526204018.496352-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-26 at 22:40 +0200, Alexander Kanavin wrote:
> This greatly reduces build times needed for those images, as
> they no longer need anything graphical, or -dev packages for
> everything.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../images/core-image-minimal-ptest-all.bb    | 25 +++++++++++++++++++
>  .../images/core-image-minimal-ptest-fast.bb   | 24 ++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-core/images/core-image-minimal-ptest-all.bb
>  create mode 100644 meta/recipes-core/images/core-image-minimal-ptest-fast.bb

Since we're renaming, can these become "core-image-ptest"? The base 
image is an implementation detail we probably don't need to care about
and would make any changes easier in future...

Other patches look good, thanks!

Cheers,

Richard

