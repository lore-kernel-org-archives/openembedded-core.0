Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.21717.1589719761901101382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 05:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fRP6sz4r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f13so6554851wmc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BRF4HitqMrE/wDIVa7xlbJYKP627AQSVrtj1O3A51rQ=;
        b=fRP6sz4r+wcjZvh2yrwyuNuWIvHfh+sTlNyJ57DAhkWolOGePD8SVD6SSv4FxFV0XS
         g62G7s/hSJB+aBspC4WJQzkYRCPUUuQ6dPh6zImu/B1dYjFuQ8qz3CczdNKf0VgsPE0O
         g5Lqsj1N63AllNwat/vc7GBup+0yqyQ0TIxZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BRF4HitqMrE/wDIVa7xlbJYKP627AQSVrtj1O3A51rQ=;
        b=qtVI8oNpT1h8IIqacq8kJBrwfVQ3Gq6XBisA9KKfNCeFjGtNU1DE0q4SSfR2axFTQw
         ACzLKab0ccrLR2Bax48UWC+Moa0utJXa/LmJM9NmXxxchZxw69eMVpLivyucFZFCVHlS
         xooFKJeROPzI6eZ0UM9LPm4wWORU+2pckvz4vouPz7w74tF7+JwfmyTVdbkfWsAMcGFb
         kT0xbdxMobu/pn/AwPv4/rMlQPMVC+YGhO3x2+J3cuQWpRM2kgRz6xz9b0ccRe6S7VY7
         ecDFzqGORtE2MZ//xgD6snmEBRayRtsfmo3CEfIl+tNvCZ4R5C5UkcRjc5lUHOhxRQmT
         1ZoA==
X-Gm-Message-State: AOAM5305KKHMsAY98qyJwVN3Kf0mGgo+g7cd7NG08mOZLAF/VGEjRVhp
	1CxgvVSLLTEQlGkFdLmfIXTcTQ==
X-Google-Smtp-Source: ABdhPJwXU6p7agnqvsOWWCEONwz6nce+B1hu3qqovxTIjRQcX6yEBOGOS6M/0Y+pVP5ABBnnGmpSNQ==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr14399887wmc.149.1589719760369;
        Sun, 17 May 2020 05:49:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n7sm11916168wro.94.2020.05.17.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 05:49:19 -0700 (PDT)
Message-ID: <15e68da0ebb3284ab7b21ddc5f893a22e7216882.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] lttng-tools: upgrade to 2.12.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ovidiu Panait <ovidiu.panait@windriver.com>, 
	openembedded-core@lists.openembedded.org, Jonathan Rajotte
	 <jonathan.rajotte-julien@efficios.com>
Date: Sun, 17 May 2020 13:49:18 +0100
In-Reply-To: <20200515121106.27860-3-ovidiu.panait@windriver.com>
References: <20200515121106.27860-1-ovidiu.panait@windriver.com>
	 <20200515121106.27860-3-ovidiu.panait@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-15 at 15:11 +0300, Ovidiu Panait wrote:
> Upgrade lttng-tools 2.11.2 -> 2.12.0:
> * drop x32 patch, as it was merged upstream
> * License-Update: licenses were moved under LICENSES directory and changed in
>   upstream commit [1]
> 
> [1] https://github.com/lttng/lttng-tools/commit/ab5be9fa2eb5ba9600a82cd18fd3cfcbac69169a
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  .../lttng/lttng-tools/x32.patch               | 36 -------------------
>  ...-tools_2.11.2.bb => lttng-tools_2.12.0.bb} | 11 +++---
>  2 files changed, 5 insertions(+), 42 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.12.0.bb} (94%)

Fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1913

In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
                 from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
   17 |  TP_ARGS(ino_t, ns_ino),
      |          ^~~~~
../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
   17 |  TP_ARGS(ino_t, ns_ino),
      |          ^~~~~
../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
   17 |  TP_ARGS(ino_t, ns_ino),
      |  ^~~~~~~
../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
   17 |  TP_ARGS(ino_t, ns_ino),
      |  ^~~~~~~

Cheers,

Richard

