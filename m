Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.10349.1617706532584491047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 03:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6EHYuS6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id a76so3932246wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mnyIOobAxA8GxQlWFDqt9A30xoxSUYEyMt6Fium6GBs=;
        b=F6EHYuS6XAMx1zdXOpTNqCSYTCQKXnHdMWi0CMyorMRN1mavwVXIRLfUHGYhpW/UcP
         dHTcfTPgrGbo/LqSKtjY9lbbCEks2TPEtJdhWy4o/+19dYlpbxG3HQvS4btwAofgR1AG
         TVvfOcMHIz8+Y2Kb2dHOIye0AlXGy55oYzlyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mnyIOobAxA8GxQlWFDqt9A30xoxSUYEyMt6Fium6GBs=;
        b=mN1h5w4tpGLCpj/g2NyeuQBxl6OL8JmCJ0hAcYC20Si4Zx+65Ro/XH/GJethI0LHQX
         7oZmou4TJAlaMZXfPkTLDAUoh5nVaSu1PEFhQ4I0tsbQ08F5PUEp1/sRqXAuVnR8GF+4
         LcIi5YT5nKkYOsckGgpt66O+3oi6trTeqXclb48RSLKZBiwNZTcrHOPgfobiT18Hlh+b
         GGumuj53rh8AbeqdXlAu69QM6hkMDk/3lNDJMRSK8BEmERdHU6ZMXSouiXx7XdQmJup+
         iUillad7T/aSTwZD1F+iOmJdOkUWZMqLd+70Wyh+z3dRBDRg00wwdMQF8MRfMQOW5SsO
         4Ekg==
X-Gm-Message-State: AOAM533sH5XjYdEMYGgdzbLrYr4BVBwVE0QmvZs+5Q1nCSkXzYSKc37f
	timLKFor+pai8MV6u8AgeWuFLQ==
X-Google-Smtp-Source: ABdhPJxU2UdueAOPMDAnYzEy5bxxPcZhEVgB0yC8GUYWXO+BHYOas65EIw7LiN9uIXolV5xHIQwGyg==
X-Received: by 2002:a1c:df55:: with SMTP id w82mr3563105wmg.162.1617706531051;
        Tue, 06 Apr 2021 03:55:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id e10sm15107276wrw.14.2021.04.06.03.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:55:30 -0700 (PDT)
Message-ID: <17cca677895e4c1f7478ee2fdd96eb211e567f38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Neetika.Singh" <Neetika.Singh@kpit.com>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Date: Tue, 06 Apr 2021 11:55:29 +0100
In-Reply-To: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
References: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-29 at 20:12 +0530, Neetika.Singh wrote:
> From: Neetika Singh <Neetika.Singh@kpit.com>
> 
> Added refreshed patch for CVE issue CVE-2020-12825
> Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61593003b4c31f25
> 
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>  .../libcroco/libcroco/CVE-2020-12825.patch         | 192 +++++++++++++++++++++
>  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
>  2 files changed, 214 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
>  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

As Khem mentions, libcroco_0.6.13.bb already exists in master in OE-Core
yet this patch tries to add it. The patch doesn't therefore apply. It looks
like there is some kind of issue with the patch creation and sending as this
can't be on top of master.

Cheers,

Richard

