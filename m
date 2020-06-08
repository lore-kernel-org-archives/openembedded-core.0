Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.26341.1591608781405978586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 02:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RTLWQX4T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id u26so13843462wmn.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3skns7cQBP5HT12HERGa0bkYzGYYsJS/1+YC7OyAPVU=;
        b=RTLWQX4T4WqeXtHmY+9vw3k5lzLexWPc33pNpVPqyuHpmdL3LyShXxC1YwkQECa+P4
         zS59BeFMjJaFOywZmG9XC9ydl+uNkUiDAcTgheCeKto35SqXLvqOL3UlN3aOpGK+7HlC
         K22yvqivBDEWQF4dnQzVO4LPSG4yryHMAb0L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3skns7cQBP5HT12HERGa0bkYzGYYsJS/1+YC7OyAPVU=;
        b=YuhUp/zecglUSnrgZ8g3Ze9iH6+nZDhVeaXvA0srO3mwRjUc2V22yp6Aq5+n/gveJ3
         e+/HoGBHAI9DWzORH2elVYQ3YeQJeM6cULuXF9iBGXUw+v5sy1Hkzi4LfwO32xAt40dI
         8zvfPDukCGrbrTbSEO2EfzDozyelAyosBU6e6SJJnsVaHpOq1B2npXaSuPOrREoqEEVQ
         wLU2mMGySyC/bqGXYgTf1yjtQZCWyiG1hjcclWznPqrInw3ju5vs5qR+n9AXS3kEFUq/
         mN7xOnT5nDxjLkbPYVt79JP8UHPX3Rf863dyYObk3rCjzM2KUBJhDI4CprGj5F36XWml
         Xk2w==
X-Gm-Message-State: AOAM531A9zlWF80TiOci1klymohMS6DfUSXTl4emRqxiGbYK1pF0KKez
	zq9V86sXyutBQK4uxkWSLDJ8mQ==
X-Google-Smtp-Source: ABdhPJxWRv3McFK0lzZ4WD7jydSqKeuz8WyAhaELlvvzEM1mwaorvPtjrcOVH62FRkrwkAimq7+vHQ==
X-Received: by 2002:a05:600c:2153:: with SMTP id v19mr15086411wml.47.1591608779895;
        Mon, 08 Jun 2020 02:32:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u9sm18920275wme.16.2020.06.08.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:32:58 -0700 (PDT)
Message-ID: <918d16ff5776f0a9991e46b5b4da3f5a0d286dc3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Jun 2020 10:32:57 +0100
In-Reply-To: <1591638879-97684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1591638879-97684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 01:54 +0800, zhengruoqin wrote:
> Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018.
> 
> Upstream-Status: Submitted
> [https://gitlab.com/gnutls/gnutls/-/merge_requests/1285].
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...license-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 88
> ++++++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.6.13.bb       |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-
> the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch

No, you simply cannot just do that.

If upstream takes the patch we can apply as a backport but until they
accept a license change we can and will not.

Just because the license file says something doesn't mean every file is
under that license if that file's header says differently.

I suspect upstream won't accept this patch either.

Cheers,

Richard

