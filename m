Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.10817.1613060047498461577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ThQhPyaN;
 spf=pass (domain: burtonini.com, ip: 209.85.167.48, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f48.google.com with SMTP id p21so8826857lfu.11
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WfSNsAfz+SX39mJbEEhEdlk5b5b/JBZNacHyP7UDZ8=;
        b=ThQhPyaNhAv7MJOzm3Vgd+2wGo5Vnbc3gQTneDwkDb0aRLuHmrw5Kn7jTyxJEQ1SD2
         1CM28xZtGhsPbDxhojX5qrrdEOp5Mcs31RHc9hcc9ge3b3CX33RktpBgrgEsBaj+qVEQ
         nDbVW9u52Vt+QuHb4kxi+E4qk199xrpLZ3kvcAC+ylDNzRFN35i9Z24jK3W8tofmmvNg
         q7XenvXGmvE7Gm0Xh9ZoHKD62w7/AOhwBooriIxlGb87AI6xwbGfFE9MU/Nb04PS9bc9
         BjkwB0HMhWSwQ2RZZUK9WsRThDrY5jSRhna2DNSFSWHS+pvZ3X4esOvcYfNUiC7fXJ9x
         CM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WfSNsAfz+SX39mJbEEhEdlk5b5b/JBZNacHyP7UDZ8=;
        b=eLXJSslUpRI9NHMaDr1s3Ge7q3xfbx/zxn6XNDla2TjOzk4VBxQbDNQAM883UhPGRa
         TRTncehgnlbAxfrJE3XwfvrPM+r19DcWv/AtPm7y0W5XZG0FhyCh9L/l4aYjFGNBICo+
         +t+NX4ekSd2WGN9h3rzieZ05QTJ0SEukj8QpGFeP5V6+CUnSf85/TKNhBxlGFvxYmqZ9
         qmbWdo7ycClYxFEvuFVTvBNJYhafuTwBaC229GurNpAMveWY3rcr+55pxlqJy6iZeIYL
         Qwa5DJ7J9DBZoQaVa1Jf2X3ZPoXiKFSMP92VLqyUYGPg9uPGtzrlLAYobIeLCQ35CsDd
         mIkg==
X-Gm-Message-State: AOAM530OtM0ELmghhYNTeQpiiaw+xKV8ZAZuX7Pynum/fJdK4teccTup
	EC4PQD8bK2WHyrXx9YNIDfldJGRwYYcYm0Kh4SCctg==
X-Google-Smtp-Source: ABdhPJzRSQlUOPiH1vlaURxtBce/iTCbDHAwCv9iEvWCCBKugJ54d+OfomSWtWhCz3MlKfPHeNGQCawCkQuVyUtNELU=
X-Received: by 2002:a19:5f51:: with SMTP id a17mr4764266lfj.553.1613060045523;
 Thu, 11 Feb 2021 08:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com>
In-Reply-To: <20210210111113.17318-1-raymsmithuk@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 11 Feb 2021 16:13:54 +0000
Message-ID: <CAAnfSTvb+utbrzMSnHRMvmzUnt7akBcVSR9RmRUY_TBTEOZM2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Ray Smith <raymsmithuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Feb 2021 at 11:12, Ray Smith <raymsmithuk@gmail.com> wrote:
> This has a desirable side-effect of enabling a build of mesa that
> supports only OpenGL ES and EGL, without having the rest of the
> distribution think that full OpenGL is available.

The 'opengl' DISTRO_FEATURE is deliberately vague and doesn't have any
implications regarding OpenGL vs OpenGL ES.

If Mesa won't build with just GLES without GL, then that's a
regression with OpenGL and should be taken up with them.

Ross
