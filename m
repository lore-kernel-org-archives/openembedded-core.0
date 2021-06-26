Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7208.1624717783091817510
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jun 2021 07:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LFwj5i2w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so7703136wma.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jun 2021 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pQO4iPx19DbtSRu33lpWU4nR4Til12FG2NhsluYtu5U=;
        b=LFwj5i2waIE1EEDo82WolCRjhAe0NOTIVk44e5LU5M9h2sjlUwY7NqAqoetedJjSmr
         U7HO+yrOSCO7TCZD8OqhgfAOcA8455m9M+sSDS37vrg2/Iy18jgFTiw4i0qA1S+bMcev
         ssDcw5GYiY73LFkOOsasiOPzTV1tRqwwl30P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pQO4iPx19DbtSRu33lpWU4nR4Til12FG2NhsluYtu5U=;
        b=abDpE2isP3rV8EtfnOafl3VISbz4Bbu2pD28I/gEAd1KWZQOUL30b/bxqMc7jKLZMI
         uWSJlDEtU8KQJt2XB56S6025zulgcDl8q7tLpcXMBQbstRz44Wu73tzh0dkhBZemOMF9
         wRsUkJW6AIxRpo+T4NiJNrqPEH5PHNTm8aRqyYltaQbB9hkvADY66HWrq/pL6r1gx4I8
         TagKpaRM7fDIRM3Cm5LDZanJyB6p1rJQMozbO8c6um83W3WgozONsJimX1RbmiBi1JBC
         HGHO2PqNBOex90DwJlDlvd6te2BQnO9/P3eWKheYIqsnJGuP+j52qek4umuPWIQAKFkr
         VGiA==
X-Gm-Message-State: AOAM533RJWikhxKDrUOw/vHHHiGSUXE3+LCXeImzJU5cayf6t8X8/9FZ
	AXD+dct/lJrmnPm5R6/xcia2FQ==
X-Google-Smtp-Source: ABdhPJyMzlA+tgqLWHn3yMKFOjPf5eCN95P7Hpnx8u2KO2NqGUYZhCv80qzTU+GPd4T0mlMGJL0HNA==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr16516690wma.94.1624717781791;
        Sat, 26 Jun 2021 07:29:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2? ([2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2])
        by smtp.gmail.com with ESMTPSA id 204sm8595545wma.30.2021.06.26.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 07:29:41 -0700 (PDT)
Message-ID: <401c402c541366ca9d58fed8e02d7fbf05843efd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH 00/13] review request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jun 2021 15:29:40 +0100
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-22 at 17:50 +0800, Anuj Mittal wrote:
> Please review these changes for hardknott. I have not included 5.10
> kernel update since that breaks build for -rt kernel.
> 
> Two ptests, for valgrind and lttng-tools, failed while testing on
> autobuilder. We already have bugs for these.

I'm a little worried about this as the lttng-tools upgrade you backport
here is likely causing the increased timeouts for that ptest, we were 
not seeing that issue previously :(.

Sadly I'm just lacking bandwidth to try and debug that and figure out
a fix other than increasing the ptest timeout which I'm reluctant to do.

Cheers,

Richard



